using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.MortgageCalculator
{
    /// <summary>
    /// Query options for the Mortgage Calculator API
    /// </summary>
    public class MortgageCalculatorQueryOptions
    {
        /// <summary>
        /// The loan amount
        /// </summary>
        [JsonProperty("amount")]
        public string Amount { get; set; }

        /// <summary>
        /// The interest rate (percentage)
        /// </summary>
        [JsonProperty("rate")]
        public string Rate { get; set; }

        /// <summary>
        /// The loan term in years
        /// </summary>
        [JsonProperty("years")]
        public string Years { get; set; }

        /// <summary>
        /// The down payment amount
        /// </summary>
        [JsonProperty("downpayment")]
        public string Downpayment { get; set; }

        /// <summary>
        /// The annual property tax amount
        /// </summary>
        [JsonProperty("annual_propertytax")]
        public string Annual_propertytax { get; set; }

        /// <summary>
        /// The annual home insurance amount
        /// </summary>
        [JsonProperty("annual_homeinsurance")]
        public string Annual_homeinsurance { get; set; }

        /// <summary>
        /// The annual HOA amount
        /// </summary>
        [JsonProperty("annual_hoa")]
        public string Annual_hoa { get; set; }
    }
}
