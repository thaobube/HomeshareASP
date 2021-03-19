using HomeshareASP.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HomeshareASP.Models
{
    public class MyHomesharingViewModel
    {
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        private MembreModel _currentMembre;
        private List<BienModel> _myBienList;

        #region Properties
        public MembreModel CurrentMembre
        {
            get
            {
                return _currentMembre;
            }

            set
            {
                _currentMembre = value;
            }
        }

        public List<BienModel> MyBienList
        {
            get
            {
                return _myBienList;
            }

            set
            {
                _myBienList = value;
            }
        }
        #endregion

        public MyHomesharingViewModel()
        {

        }

        public void GetBienListOfOwner()
        {
            // Get the list of member's properties
            MyBienList = uow.GetBienModelFromOwner(CurrentMembre.IdMembre);
        }
    }
}