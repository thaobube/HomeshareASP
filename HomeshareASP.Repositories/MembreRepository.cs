using Handcraft.DAL.Repositories;
using HomeshareASP.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeshareASP.Repositories
{
    public class MembreRepository : BaseRepository<MembreEntity>, IConcreteRepository<MembreEntity>
    {
        public MembreRepository(string ConnectionString) : base(ConnectionString)
        {

        }

        public List<MembreEntity> Get()
        {
            throw new NotImplementedException();
        }

        public MembreEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(MembreEntity toInsert)
        {
            string requete = @"INSERT INTO [Membre] (Nom, Prenom, [Email], [Login], [Password], Salt, Pays, [Telephone])
                               VALUES (@Nom, @Prenom, @Email, @Login, @Password, @Salt, @Pays, @Telephone)";
            return base.Insert(toInsert, requete);
        }

        public bool Update(MembreEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(MembreEntity toDelete)
        {
            throw new NotImplementedException();
        }

        public MembreEntity GetMembreEntityFromLogin(string login)
        {
            Dictionary<string, object> parameter = new Dictionary<string, object>();
            parameter.Add("login", login);
            string requete = "SELECT * FROM [Membre] WHERE Login = @login";
            return base.Get(requete, parameter).FirstOrDefault();
        }
    }
}
