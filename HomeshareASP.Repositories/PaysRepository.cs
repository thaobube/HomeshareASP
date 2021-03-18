using Handcraft.DAL.Repositories;
using HomeshareASP.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeshareASP.Repositories
{
    public class PaysRepository : BaseRepository<PaysEntity>, IConcreteRepository<PaysEntity>
    {
        public PaysRepository(string ConnectionString) : base(ConnectionString)
        {

        }

        public List<PaysEntity> Get()
        {
            string requete = "Select * from Pays";

            return base.Get(requete);
        }

        public PaysEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public bool Insert(PaysEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(PaysEntity toUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(PaysEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
