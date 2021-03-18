using HomeshareASP.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HomeshareASP.Models
{
    public class SignupViewModel
    {
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        private MembreModel _membre;
        private List<PaysModel> _paysList;
        public SignupViewModel()
        {
            // Countries
            PaysList = uow.GetAllPaysModel();
        }

        public MembreModel Membre
        {
            get
            {
                return _membre;
            }

            set
            {
                _membre = value;
            }
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
    }
}