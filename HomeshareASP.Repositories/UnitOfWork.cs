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
        IConcreteRepository<PaysEntity> _paysRepo;

        public UnitOfWork(string connectionString)
        {
            _membreRepo = new MembreRepository(connectionString);
            _paysRepo = new PaysRepository(connectionString);
        }

        #region Pays
        public List<PaysModel> GetAllPaysModel()
        {
            // Get the number of the classes from DB
            List<PaysEntity> allPaysfromDB = ((PaysRepository)_paysRepo).Get();
            List<PaysModel> allPaysforController = new List<PaysModel>();
            //Mapping
            foreach (PaysEntity item in allPaysfromDB)
            {
                PaysModel cm = new PaysModel();
                cm.IdPays = item.IdPays;
                cm.Libelle = item.Libelle;
                allPaysforController.Add(cm);
            }
            return allPaysforController;
        } 
        #endregion

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

        #region SignUp
        public bool CreateMembre(MembreModel mm)
        {
            SecurityHelper sh = new SecurityHelper();
            // Mapping
            MembreEntity me = new MembreEntity();
            me.IdMembre = mm.IdMembre;
            me.Nom = mm.Nom;
            me.Prenom = mm.Prenom;
            me.Email = mm.Email;
            me.Login = mm.Login;
            me.Pays = mm.Pays;
            me.Telephone = mm.Telephone;

            byte[] newSalt = sh.GenerateLongRandomSalt();
            me.Salt = Convert.ToBase64String(newSalt);

            string hashPwd = sh.createHash(mm.Password, newSalt);
            me.Password = hashPwd;
            return _membreRepo.Insert(me);
        }
        #endregion
    }
}
