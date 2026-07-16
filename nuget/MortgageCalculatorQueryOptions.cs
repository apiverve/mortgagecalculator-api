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
        public double Amount { get; set; }

        /// <summary>
        /// The interest rate (percentage)
        /// </summary>
        [JsonProperty("rate")]
        public double Rate { get; set; }

        /// <summary>
        /// The loan term in years
        /// </summary>
        [JsonProperty("years")]
        public int Years { get; set; }

        /// <summary>
        /// The down payment amount
        /// </summary>
        [JsonProperty("downpayment")]
        public double? Downpayment { get; set; }

        /// <summary>
        /// The annual property tax amount
        /// </summary>
        [JsonProperty("annual_propertytax")]
        public double? Annual_propertytax { get; set; }

        /// <summary>
        /// The annual home insurance amount
        /// </summary>
        [JsonProperty("annual_homeinsurance")]
        public double? Annual_homeinsurance { get; set; }

        /// <summary>
        /// The annual HOA amount
        /// </summary>
        [JsonProperty("annual_hoa")]
        public double? Annual_hoa { get; set; }
    }
}
