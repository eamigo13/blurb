module Blurb
  class Report < BaseResource
    CAMPAIGNS = "campaigns"
    AD_GROUPS = "adGroups"
    KEYWORDS = "keywords"
    PRODUCT_ADS = "productAds"
    SPONSORED_PRODUCTS = "sp"
    SPONSORED_BRANDS = "hsa"

    def self.create(params = {}, opts = {})
      # required argument checks
      raise ArgumentError.new("params hash must contain a recordType") unless params["recordType"]

      # If no metrics are passed in, use the default metrics
      metrics = params["metrics"] || get_default_metrics(params["recordType"],params["campaignType"])

      api_params = {
        "reportDate" => params["reportDate"],
        "metrics" => metrics
      }

      api_params["segment"] = params["segment"] if params["segment"]

      post_request("/v2/#{params["campaignType"]}/#{params["recordType"]}/report", api_params)
    end

    def self.status(report_id, opts = {})
      get_request("/v2/reports/#{report_id}")
    end

    def self.download(location, opts = {})
      opts.merge!({:full_path => true, :gzip => true, :no_token => true})
      get_request(location, opts)
    end

    private

    def self.get_default_metrics(record_type, campaign_type)
      if campaign_type == SPONSORED_BRANDS
        return [
          "campaignId",
          "impressions",
          "clicks",
          "cost",
          "attributedSales14d",
          "attributedSales14dSameSKU",
          "attributedConversions14d",
          "attributedConversions14dSameSKU"
        ].join(",") if record_type == CAMPAIGNS
        return [
          "adGroupId",
          "campaignId",
          "impressions",
          "clicks",
          "cost",
          "attributedSales14d",
          "attributedSales14dSameSKU",
          "attributedConversions14d",
          "attributedConversions14dSameSKU"
        ].join(",") if record_type == AD_GROUPS
        return [
          "keywordId",
          "keywordText",
          "matchType",
          "adGroupId",
          "campaignId",
          "impressions",
          "clicks",
          "cost", 
          "attributedSales14d",
          "attributedSales14dSameSKU",
          "attributedConversions14d",
          "attributedConversions14dSameSKU"
        ].join(",") if record_type == KEYWORDS
      elsif campaign_type == SPONSORED_PRODUCTS
        return [
          "campaignName",
          "campaignId",
          "campaignStatus",
          "campaignBudget",
          "impressions",
          "clicks",
          "cost",
          "attributedConversions1d",
          "attributedConversions7d",
          "attributedConversions14d",
          "attributedConversions30d",
          "attributedConversions1dSameSKU",
          "attributedConversions7dSameSKU",
          "attributedConversions14dSameSKU",
          "attributedConversions30dSameSKU",
          "attributedUnitsOrdered1d",
          "attributedUnitsOrdered7d",
          "attributedUnitsOrdered14d",
          "attributedUnitsOrdered30d",
          "attributedSales1d",
          "attributedSales7d",
          "attributedSales14d",
          "attributedSales30d",
          "attributedSales1dSameSKU",
          "attributedSales7dSameSKU",
          "attributedSales14dSameSKU",
          "attributedSales30dSameSKU"
        ].join(",") if record_type == CAMPAIGNS
        return [
          "campaignName",
          "campaignId",
          "adGroupName",
          "adGroupId",
          "impressions",
          "clicks",
          "cost",
          "attributedConversions1d",
          "attributedConversions7d",
          "attributedConversions14d",
          "attributedConversions30d",
          "attributedConversions1dSameSKU",
          "attributedConversions7dSameSKU",
          "attributedConversions14dSameSKU",
          "attributedConversions30dSameSKU",
          "attributedUnitsOrdered1d",
          "attributedUnitsOrdered7d",
          "attributedUnitsOrdered14d",
          "attributedUnitsOrdered30d",
          "attributedSales1d",
          "attributedSales7d",
          "attributedSales14d",
          "attributedSales30d",
          "attributedSales1dSameSKU",
          "attributedSales7dSameSKU",
          "attributedSales14dSameSKU",
          "attributedSales30dSameSKU"
        ].join(",") if record_type == AD_GROUPS
        return [
          "campaignName",
          "campaignId",
          "keywordId",
          "keywordText",
          "matchType",
          "impressions",
          "clicks",
          "cost",
          "attributedConversions1d",
          "attributedConversions7d",
          "attributedConversions14d",
          "attributedConversions30d",
          "attributedConversions1dSameSKU",
          "attributedConversions7dSameSKU",
          "attributedConversions14dSameSKU",
          "attributedConversions30dSameSKU",
          "attributedUnitsOrdered1d",
          "attributedUnitsOrdered7d",
          "attributedUnitsOrdered14d",
          "attributedUnitsOrdered30d",
          "attributedSales1d",
          "attributedSales7d",
          "attributedSales14d",
          "attributedSales30d",
          "attributedSales1dSameSKU",
          "attributedSales7dSameSKU",
          "attributedSales14dSameSKU",
          "attributedSales30dSameSKU"
        ].join(",") if record_type == KEYWORDS
        return [
          "campaignName",
          "campaignId",
          "adGroupName",
          "adGroupId",
          "impressions",
          "clicks",
          "cost",
          "currency",
          "asin",
          "sku",
          "attributedConversions1d",
          "attributedConversions7d",
          "attributedConversions14d",
          "attributedConversions30d",
          "attributedConversions1dSameSKU",
          "attributedConversions7dSameSKU",
          "attributedConversions14dSameSKU",
          "attributedConversions30dSameSKU",
          "attributedUnitsOrdered1d",
          "attributedUnitsOrdered7d",
          "attributedUnitsOrdered14d",
          "attributedUnitsOrdered30d",
          "attributedSales1d",
          "attributedSales7d",
          "attributedSales14d",
          "attributedSales30d",
          "attributedSales1dSameSKU",
          "attributedSales7dSameSKU",
          "attributedSales14dSameSKU",
          "attributedSales30dSameSKU"
        ].join(",") if record_type == PRODUCT_ADS
      end
    end
  end
end
