<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
<head>
	<link name="NotoSans" type="font" subtype="truetype" src="${nsfont.NotoSans_Regular}" src-bold="${nsfont.NotoSans_Bold}" src-italic="${nsfont.NotoSans_Italic}" src-bolditalic="${nsfont.NotoSans_BoldItalic}" bytes="2" />
	<#if .locale == "zh_CN"><link name="NotoSansCJKsc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKsc_Regular}" src-bold="${nsfont.NotoSansCJKsc_Bold}" bytes="2" />
	<#elseif .locale == "zh_TW"><link name="NotoSansCJKtc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKtc_Regular}" src-bold="${nsfont.NotoSansCJKtc_Bold}" bytes="2" />
	<#elseif .locale == "ja_JP"><link name="NotoSansCJKjp" type="font" subtype="opentype" src="${nsfont.NotoSansCJKjp_Regular}" src-bold="${nsfont.NotoSansCJKjp_Bold}" bytes="2" />
	<#elseif .locale == "ko_KR"><link name="NotoSansCJKkr" type="font" subtype="opentype" src="${nsfont.NotoSansCJKkr_Regular}" src-bold="${nsfont.NotoSansCJKkr_Bold}" bytes="2" />
	<#elseif .locale == "th_TH"><link name="NotoSansThai" type="font" subtype="opentype" src="${nsfont.NotoSansThai_Regular}" src-bold="${nsfont.NotoSansThai_Bold}" bytes="2" />
	</#if>

    <macrolist>
      <macro id="nlheader">
        <table class="header" style="width: 100%; font-size: 10pt;">
          <tr>
            <td rowspan="2" style="height: 141px; font-size: 12px;"><#if companyInformation.logoUrl?length != 0><img src="${companyInformation.logoUrl}" style="float: left; margin: 0px" /> </#if><br/><br/><br/><br/><br/><br/>${record.custbody_subsidiary_address}<br/>Telephone: ${record.custbody_rnr_rsl_telephone}<br/>Fax: ${record.custbody_rnr_sub_fax}<br/>Customer service email: ${record.custbody_rnr_rsl_cs_email_pdf}<br/>Website: ${record.custbody_rnr_sub_url}</td>
            <td align="right"><span class="title">Packing Slip</span></td>
          </tr>
          <tr>
            <td align="right">
              <table width="100%">
                <tr><td style="padding:2px;" width="33%"><b>Order #</b></td><td style="padding:2px;">${salesorder.tranid}</td></tr>
                <tr><td style="padding:2px;"><b>Order Date</b></td><td style="padding:2px;" width="56%">${salesorder.trandate}</td></tr>
                <tr><td style="padding:2px;"><b>Delivery Terms</b></td><td style="padding:2px;">${salesorder.terms}</td></tr>
                <tr><td style="padding:2px;"><b>Acct No.</b></td><td style="padding:2px;">${record.entity}</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </macro>
      <macro id="nlfooter">
        <table class="footer" width="100%">
          <tr><td align="left">&nbsp;</td></tr>
          <tr><td align="left"><b>Return Address: <#list subsidiary.returnaddress_text?split(r"<br />", "r") as sa>${sa} </#list></b></td></tr>
          <tr>
            <td align="left">
              VAT REGISTRATION No 197 3362 32<br/>
              Title in the goods described above shall not pass to the customer until Rayner has received payment in full.<br/>
              Risk in the goods shall pass to the customer on delivery by Rayner to the carrier.<br/>
              Prices and specifications subject to change at any time without prior notification.<br/>
              Our terms and conditions apply and are available on request or on our website www.rayner.com<br/>
              <b>Registered Office</b><br/>
              <b>10 Dominion Way, Worthing, West Sussex, BN14 8AQ United Kingdom</b><br/>
              <b>Reg. No. 615539.</b>
            </td>
          </tr>
          <tr>
            <td align="right"><pagenumber/> of <totalpages/></td>
          </tr>
        </table>
      </macro>
    </macrolist>

    <style type="text/css">
      * {
		<#if .locale == "zh_CN">font-family: NotoSans, NotoSansCJKsc, sans-serif;
		<#elseif .locale == "zh_TW">font-family: NotoSans, NotoSansCJKtc, sans-serif;
		<#elseif .locale == "ja_JP">font-family: NotoSans, NotoSansCJKjp, sans-serif;
		<#elseif .locale == "ko_KR">font-family: NotoSans, NotoSansCJKkr, sans-serif;
		<#elseif .locale == "th_TH">font-family: NotoSans, NotoSansThai, sans-serif;
		<#else>font-family: NotoSans, sans-serif;
		</#if>
      }
      table { font-size: 9pt; table-layout: fixed; }
      th { font-weight: bold; font-size: 8pt; vertical-align: middle; padding: 5px 6px 3px; background-color: #e3e3e3; color: #333333; }
      td { padding: 4px 6px; }
      td p { align:left }
      b { font-weight: bold; color: #333333; }
      table.header td { padding: 0; font-size: 10pt; }
      table.footer td { padding: 0; font-size: 8pt; }
      table.itemtable th { padding-bottom: 10px; padding-top: 10px; }
      table.body td { padding-top: 2px; }
      td.addressheader { font-size: 8pt; font-weight: bold; padding-top: 6px; padding-bottom: 6px; }
      td.address { padding-top: 0; }
      span.title { font-size: 28pt; }
      span.number { font-size: 16pt; }
      span.itemname { font-weight: bold; line-height: 150%; }
      div.returnform { width: 100%; height: 200pt; page-break-inside: avoid; page-break-after: avoid; }
      hr { border-top: 1px dashed #d3d3d3; width: 100%; color: #ffffff; background-color: #ffffff; height: 1px; }
    </style>
</head>

<body header="nlheader" header-height="18%" footer="nlfooter" footer-height="8%" padding="0.5in 0.5in 0.5in 0.5in" size="A4">
  <table style="width: 100%; margin-top: 0px;">
    <tr>
      <td class="addressheader">Ship To</td>
      <td class="addressheader">Bill To</td>
	</tr>
	<tr>
      <td class="address">
        <#assign x = record.shippingaddress_text>
        <#escape x as x?html></#escape>
        <#list x?split('<br />') as y>
          <#if y?is_last>
            <#if record.custbody_rnr_custom_ship_country != "">${record.custbody_rnr_custom_ship_country}<#else>${y}</#if>
          <#else>
            ${y}<br/>
          </#if>
        </#list>
      </td>
      <td class="address">${salesorder.billaddress}<br/>
        <#assign a = salesorder.billingaddress_text>
        <#escape a as a?html></#escape>
        <#list a?split('<br />') as b>
          <#if b?is_last>
            <#if salesorder.custbody_rnr_custom_bill_country != "">${salesorder.custbody_rnr_custom_bill_country}<#else>${b}</#if>
          <#else>
            ${b}<br/>
          </#if>
        </#list>
      </td>
	</tr>
  </table>

  <table class="body" style="width: 100%; margin-top: 10px;">
    <tr>
      <th width="12%">Ship Date</th>
      <th>Customer PO</th>
      <th>Tracking</th>
      <th align="right" width="20%">Total Package Weight</th>
      <th align="right" width="14%">Total Packages</th>
	</tr>
	<tr>
      <#assign pw = 0>
      <#assign pc = 0>
      <#assign pt = ''>
      <#assign pd = ''>
      <#if record.package?has_content>
        <#list record.package as p>
          <#assign pw += p.packageweight?string("##0.00")?number>
          <#assign pc += 1>
          <#assign pt += p.packagetrackingnumber>
          <#assign pt += ", ">
          <#assign pd += p.packagedescr>
          <#assign pd += ", ">
        </#list>
      </#if>
      <td>${record.trandate}</td>
      <td>${salesorder.custbodycustomer_po}</td>
      <td>${pt?remove_ending(", ")}</td>
      <td align="right">${pw}</td>
      <td align="right">${pc}</td>
	</tr>
    <tr><td>&nbsp;</td></tr>
  </table>


    <#if record.item?has_content>
      <#assign totalqtyshipped = 0>
      <table width="100%">
        <tr>
          <th align="left" width="7%">Box ID</th>
          <th align="left">Item</th>
          <th align="left">Description</th>
          <th align="right" width="9%">Ordered</th>
          <th align="right" width="6%">Units</th>
          <th align="left" width="16%">Serial/Lot Number</th>
          <th align="left" width="11%">Expiry Date</th>
          <th align="right" width="12%">Qty Shipped</th>
        </tr>
        <#list record.item as i>
          <#if i.inventorydetail?has_content>
            <#assign lot = i.inventorydetail?keep_before(",")>
            <#if lot?has_content>
              <#list i.inventorydetail?split("<br />") as inv>
                <tr>
                  <td align="left">${pd?remove_ending(", ")}</td>
                  <td align="left">${i.item}<br/>${i.custcol_rnr_commodity_code}</td>
                  <td align="left">${i.description}</td>
                  <#assign orderline = i.orderline?number>
                  <#assign qtyordered = 0>
                  <#list salesorder.item as itm>
                    <#if itm.line?number == orderline>
                      <#assign qtyordered = itm.quantityordered>
                    </#if>
                  </#list>
                  <td align="right"><#if inv_index == 0>${qtyordered}</#if></td>
                  <td align="right">${i.unitsdisplay}</td>
                  <td align="left">${inv?keep_before(",")}</td>
                  <td align="left">
                    <#list i.custcol_acs_expiration_date?split("<br />") as e>
                      <#if inv_index == e_index>${e}</#if>
                    </#list>
                  </td>
                  <td align="right">
                    <#assign d = 0>
                    <#assign qTxt = "">
                    <#list inv?split("") as char>
                      <#if char == "(">
                        <#assign d += 1>
                      <#elseif char == ")">
                        <#assign d += 1>
                      <#else>
                        <#if d == 1 && (char == "0" || char == "1" || char == "2" || char == "3" || char == "4" || char == "5" || char == "6" || char == "7" || char == "8" || char == "9")>
                          <#assign qTxt += char>
                        <#else>
                          <#if d == 3>
                            <#assign qTxt += char>
                          </#if>
                        </#if>
                      </#if>
                    </#list>
                    ${qTxt}
                    <#assign totalqtyshipped += qTxt?number>
                  </td>
                </tr>
              </#list>
            </#if>
          </#if>
        </#list>
        <tr><td>&nbsp;</td></tr>
        <tr>
          <td colspan="5"></td>
          <td colspan="2" align="left"><b>Total Qty Shipped</b></td>
          <td align="right">${totalqtyshipped}</td>
        </tr>
      </table>
    </#if>

</body>
</pdf>