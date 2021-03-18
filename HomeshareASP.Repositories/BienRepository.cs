using Handcraft.DAL.Repositories;
using HomeshareASP.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeshareASP.Repositories
{
    class BienRepository : BaseRepository<BienEntity>, IConcreteRepository<BienEntity>
    {
        public BienRepository(string ConnectionString) : base(ConnectionString)
        {

        }

        public List<BienEntity> Get()
        {
            throw new NotImplementedException();
        }

        public BienEntity GetOne(int PK)
        {
            throw new NotImplementedException();
        }

        public List<BienEntity> GetFeaturedBienEntity(int number)
        {
            string requete = $"EXEC [sp_GetFeaturedBien] {number}";
            return base.Get(requete);
        }

        public List<BienEntity> GetFiveNewestBienEntity()
        {
            string requete = "Select * from Vue_CinqDernierBiens";
            return base.Get(requete);
        }
        public List<BienEntity> GetBestNoteBienEntity()
        {
            string requete = "Select * from [Vue_MeilleursAvis]";
            return base.Get(requete);
        }

        public bool Insert(BienEntity toInsert)
        {
            throw new NotImplementedException();
        }

        public bool Update(BienEntity toUpdate)
        {
            throw new NotImplementedException();
        }
        public bool Delete(BienEntity toDelete)
        {
            throw new NotImplementedException();
        }
    }
}
