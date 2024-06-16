// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/5/26 10:46:00
// @Desc
package initialize

import (
	"github.com/casbin/casbin/v2"
	"github.com/casbin/casbin/v2/model"
	gormadapter "github.com/casbin/gorm-adapter/v3"
	"gorm.io/gorm"
	"meng-admin-gin/global"
	"sync"
)

var (
	enforcer *casbin.SyncedEnforcer
	once     sync.Once
)

var text = `
[request_definition]
r = sub, obj, act

[policy_definition]
p = sub, obj, act

[policy_effect]
e = some(where (p.eft == allow))

[matchers]
m = r.sub == p.sub && (keyMatch2(r.obj, p.obj) || keyMatch(r.obj, p.obj)) && (r.act == p.act || p.act == "*")
`

func InitCasbin(db *gorm.DB) *casbin.SyncedEnforcer {
	once.Do(func() {
		Apter, err := gormadapter.NewAdapterByDB(global.MA_DB)
		if err != nil && err.Error() != "invalid DDL" {
			panic(err)
		}

		m, err := model.NewModelFromString(text)
		if err != nil {
			panic(err)
		}
		enforcer, err = casbin.NewSyncedEnforcer(m, Apter)
		if err != nil {
			panic(err)
		}
		err = enforcer.LoadPolicy()
		if err != nil {
			panic(err)
		}

		//log.SetLogger(&Logger{})
		//enforcer.EnableLog(true)
	})

	return enforcer
}
