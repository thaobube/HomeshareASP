using HomeshareASP.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HomeshareASP.Models
{
    public class MembreAddHomesharingViewModel
    {
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        
        private List<PaysModel> _paysList;
        private BienModel _bien;
        public MembreAddHomesharingViewModel()
        {
            // Countries
            PaysList = uow.GetAllPaysModel();
        }

        public List<PaysModel> PaysList
        {
            get
            {
                return _paysList;
            }

            set
            {
                _paysList = value;
            }
        }

        public BienModel Bien
        {
            get
            {
                return _bien;
            }

            set
            {
                _bien = value;
            }
        }
    }
}