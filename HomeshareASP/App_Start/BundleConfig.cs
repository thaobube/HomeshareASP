using System.Web;
using System.Web.Optimization;

namespace HomeshareASP
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            //bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
            //            "~/Scripts/jquery.validate*"));

            //// Use the development version of Modernizr to develop with and learn from. Then, when you're
            //// ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            //bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            //            "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new ScriptBundle("~/bundles/script").Include(
                        "~/js/script.js"));

            bundles.Add(new ScriptBundle("~/bundles/owl-carousel").Include(
                     "~/js/owl.carousel.js"));

            bundles.Add(new ScriptBundle("~/bundles/slitslider").Include(
                    "~/js/slitslider/modernizr.custom.79639.js",
                    "~/js/slitslider/jquery.ba-cond.min.js",
                    "~/js/slitslider/jquery.slitslider.js"
                    ));


            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/css/style.css"
                      ));

            bundles.Add(new StyleBundle("~/Content/owl-carousel").Include(
                      "~/css/owl-carousel/owl.carousel.css",
                      "~/css/owl-carousel/owl.theme.css"
                      ));

            bundles.Add(new StyleBundle("~/Content/slitslider").Include(
                "~/css/slitslider/style.css",
                "~/css/slitslider/custom.css"
                      
          ));
        }
    }
}
