using Handcraft.DAL.Repositories;
using HomeshareASP.Entities;
using HomeshareASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tools;

namespace HomeshareASP.Repositories
{
    public class UnitOfWork
    {
        IConcreteRepository<MembreEntity> _membreRepo;

        public UnitOfWork(string connectionString)
        {
            _membreRepo = new MembreRepository(connectionString);
        }


        #region Login
        public MembreModel MembreVefif(LoginModel lm)
        {
            MembreEntity me = ((MembreRepository)_membreRepo).GetMembreEntityFromLogin(lm.Login);
            if (me == null)
            {
                return null;
            }
            else
            {
                SecurityHelper sh = new SecurityHelper();
                if (sh.VerifyHash(lm.Password, me.Password, me.Salt))
                {
                    return new MembreModel()
                    {
                        // Mapping
                        IdMembre = me.IdMembre,
                        Nom = me.Nom,
                        Prenom = me.Prenom,
                        Email = me.Email,
                        Telephone = me.Telephone,
                        Login = me.Login,
                        Pays = me.Pays
                    };
                }
                else
                {
                    return null;
                }
            }
        }
        #endregion
    }
}
