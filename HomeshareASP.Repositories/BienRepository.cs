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
            string requete = "Select * from BienEchange where isEnabled <> 0";
            return base.Get(requete);
        }

        public BienEntity GetOne(int PK)
        {
            string requete = "Select * from BienEchange where IdBien =@id";
            return base.GetOne(PK, requete);
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
        public List<BienEntity> GetBienEntityFromOwner(int idMembre)
        {
            string requete = $"EXEC [sp_RecupBienMembre] {idMembre}";
            return base.Get(requete);
        }

        public List<BienEntity> GetBienEntityByPage(string searchString, int page)
        {
            string requete = $@"SELECT * FROM BienEchange ";

            if (!String.IsNullOrEmpty(searchString))
            {
                requete += " WHERE Titre LIKE '%" + searchString + "%' and isEnabled <> 0 ";   
            }

            int nbPerPage = 3;
            int skip = (page - 1) * nbPerPage;
            requete += $@" ORDER BY Titre OFFSET {skip} ROWS 
                        FETCH NEXT {nbPerPage} ROWS ONLY ";
            return base.Get(requete);
        }

        public List<BienEntity> GetBienEntityAllPage(string searchString, int page)
        {
            string requete = $@"SELECT * FROM BienEchange ";

            if (!String.IsNullOrEmpty(searchString))
            {
                requete += " WHERE Titre LIKE '%" + searchString + "%' and isEnabled <> 0 ";
            }
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
