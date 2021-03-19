using HomeshareASP.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HomeshareASP.Models
{
    public class HomeDetailViewModel
    {
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        private BienModel _targetBien;

        #region Properties
        public BienModel TargetBien 
        {
            get
            {
                return _targetBien;
            }

            set
            {
                _targetBien = value;
            }
        }
        #endregion

        public HomeDetailViewModel()
        {

        }
    }
}