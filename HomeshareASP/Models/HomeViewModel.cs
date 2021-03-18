using HomeshareASP.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HomeshareASP.Models
{
    public class HomeViewModel
    {
        private UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        private List<BienModel> _featuredBannerBien;
        private List<BienModel> _bestBien;
        private List<BienModel> _fiveNewestBien;

        #region Properties
        public List<BienModel> FeaturedBannerBien
        {
            get
            {
                return _featuredBannerBien;
            }

            set
            {
                _featuredBannerBien = value;
            }
        }

        public List<BienModel> BestBien
        {
            get
            {
                return _bestBien;
            }

            set
            {
                _bestBien = value;
            }
        }

        public List<BienModel> FiveNewestBien
        {
            get
            {
                return _fiveNewestBien;
            }

            set
            {
                _fiveNewestBien = value;
            }
        }
        #endregion

        public HomeViewModel()
        {
            // Home Banner Slider - Random Bien
            FeaturedBannerBien = uow.GetFeaturedBienModel(5);

            // Best Biens - with the highest notes
            BestBien = uow.GetBestNoteBienModel();

            // Five Newest Bien
            FiveNewestBien = uow.GetFiveNewestBienModel();

        }
    }
}