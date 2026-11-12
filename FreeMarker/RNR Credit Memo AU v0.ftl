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
        <table class="header" style="width: 100%;">
          <tr>
            <td rowspan="3">
              <#if companyInformation.logoUrl?length != 0>
                <@filecabinet nstype="image" src="${companyInformation.logoUrl}" style="float: left; margin: 7px"/><br/><br/><br/><br/><br/><br/>
              </#if>
              <span class="nameandaddress">${companyInformation.companyName}</span><br/>
              <span class="nameandaddress">${companyInformation.addressText}</span><br/>
              Telephone: ${subsidiary.custrecord_rsl_telephone}<br/>
              Fax: ${subsidiary.fax}<br/>
              Customer service email: ${subsidiary.custrecord_rsl_cs_email_pdf}<br/>
              Website: ${record.custbody_rnr_website}<br/>
              Vat Number: ${subsidiary.custrecord_sta_einvoicing_payee_vat}
            </td>
            <td align="right"><span class="title">${record@title}</span></td>
          </tr>
          <tr>
            <td align="right"><span class="number">#${record.tranid}</span></td>
          </tr>
          <tr>
            <td>
              <table width="100%">
                <tr><td width="35%">&nbsp;</td><td>&nbsp;</td></tr>
                <tr><td class="top"><b>Date</b></td><td class="top">${record.trandate}</td></tr>
                <tr><td class="top"><b>Acct No.</b></td><td class="top">${record.entity?keep_before(" ")}</td></tr>
                <tr><td class="top"><b>Customer Vat No.</b></td><td class="top">${record.custbody_cls_customer_vatregnumber}</td></tr>
                <tr><td class="top"><b>Currency</b></td><td class="top">${record.currency}</td></tr>
                <tr><td class="top"><b>Subsidiary</b></td><td class="top">${record.subsidiary}</td></tr>
                <#if record.subsidiary == "Rayner Pty Ltd (Australia)">
                <tr><td class="top"><b>ABN</b></td><td class="top">${subsidiary.federalidnumber}</td></tr>
                <tr><td class="top"><b>PO</b></td><td class="top">${record.otherrefnum}</td></tr>
                <tr><td class="top"><b>Memo</b></td><td class="top">${record.memo}</td></tr>
                </#if>
              </table>
            </td>
          </tr>
        </table>
      </macro>
      <macro id="nlfooter">
        <table class="footer" width="100%">
          <tr>
            <td>Title in the goods described above shall not pass to the customer until Rayner has received payment in full. Risk in the goods shall pass to the customer on delivery by Rayner to the carrier. Prices and specifications subject to change at any time without prior notification. Our terms and conditions apply and are available on request or on our website www.rayner.com</td>
          </tr>
        </table>
        <table class="footer" width="100%">
          <tr><td width="20%">&nbsp;</td><td>&nbsp;</td><td width="20%">&nbsp;</td></tr>
          <tr><td>&nbsp;</td><td align="center"><b>Registered Office</b></td><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td><td align="center"><b>10 Dominion Way, Worthing, West Sussex, BN14 8AQ United Kingdom</b></td><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td><td align="center"><b>Reg. No. 615539.</b></td><td align="right"><pagenumber/> of <totalpages/></td></tr>
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
      td.top { padding: 2px 2px 2px 2px; text-align: left; }
      span.title { font-size: 28pt; }
      span.number { font-size: 16pt; }
      span.itemname { font-weight: bold; line-height: 150%; }
      div.returnform { width: 100%; height: 200pt; page-break-inside: avoid; page-break-after: avoid; }
      hr { border-top: 1px dashed #d3d3d3; width: 100%; color: #ffffff; background-color: #ffffff; height: 1px; }
    </style>
</head>

<body header="nlheader" header-height="20%" footer="nlfooter" footer-height="5%" padding="0.5in 0.5in 0.5in 0.5in" size="A4">

  <table style="width: 100%; margin-top: 10px;">
    <tr><td class="addressheader"><b>Bill To</b></td><td class="addressheader"><b>Ship To</b></td></tr>
	<tr>
      <td class="address">
        <#assign a = record.billingaddress_text>
        <#escape a as a?html></#escape>
        <#list a?split('<br />') as b>
          <#if b?is_last>
            <#if record.custbody_rnr_custom_bill_country != "">${record.custbody_rnr_custom_bill_country}<#else>${b}</#if>
          <#else>
            ${b}<br/>
          </#if>
        </#list>
      </td>
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
    </tr>
  </table>

  <table class="body" style="width: 100%; margin-top: 10px;">
    <tr><th>Customer PO</th><th>Original Invoice</th><th>Payment Terms</th></tr>
	<tr><td>${record.otherrefnum}</td><td>${record.createdfrom}</td><td>${record.custbody_rnr_customer_terms}</td></tr>
  </table>

  <#assign linecount = 0>
  <#assign totalqty = 0>
  <#assign shipping = 0>
  <#if record.item?has_content>
    <table class="itemtable" style="width: 100%; margin-top: 10px;">
      <#list record.item as item>
        <#if item.item == "2nd Day Air"><#assign shipping = item.amount></#if>
        <#if item.item == "Airborne"><#assign shipping = item.amount></#if>
        <#if item.item == "FedEx"><#assign shipping = item.amount></#if>
        <#if item.item == "FedEx Express"><#assign shipping = item.amount></#if>
        <#if item.item == "FedEx Express 2 Day (by 4:30 pm)"><#assign shipping = item.amount></#if>
        <#if item.item == "FedEx Express International Priority-Cor (Next day)"><#assign shipping = item.amount></#if>
        <#if item.item == "FedEx Express Priority Overnight (by 10:30 am)"><#assign shipping = item.amount></#if>
        <#if item.item == "FedEx Express Priority Overnight – Sat"><#assign shipping = item.amount></#if>
        <#if item.item == "FedEx Express Standard Overnight (by 3:00 pm)"><#assign shipping = item.amount></#if>
        <#if item.item == "FedEx Ground"><#assign shipping = item.amount></#if>
        <#if item.item == "Ground"><#assign shipping = item.amount></#if>
        <#if item.item == "Next Day Air"><#assign shipping = item.amount></#if>
        <#if item.item == "Next Day Air - Early AM"><#assign shipping = item.amount></#if>
        <#if item.item == "Shipping items - test UKK"><#assign shipping = item.amount></#if>
        <#if item.item == "UPS"><#assign shipping = item.amount></#if>
        <#if item.item == "UPS International"><#assign shipping = item.amount></#if>
        <#if item_index==0>
          <thead>
              <tr>
              <th align="right" width="5%">Qty</th>
              <th align="left" width="47%">Item</th>
              <th align="left" width="10%">UM</th>
              <th align="right" width="9%">Rate</th>
              <th align="right" width="9%">Vat</th>
              <th align="right" width="20%">Amount</th>
              </tr>
          </thead>
        </#if>
        <tr>
          <#assign linecount += 1>
          <#if item.quantity?is_nan>
               <#assign totalqty = 0>
          <#else>
               <#assign totalqty += item.quantity>
          </#if>
          <td align="right">${item.quantity}</td>
          <td align="left"><b>${item.item}</b><br/>${item.description}</td>
          <td align="left">${item.units}</td>
          <#if item.item?starts_with("Price Correction")>
               <td align="right"></td>
          <#else>
               <td align="right">${item.rate}</td>
          </#if>
          <td align="right">${item.taxrate1}</td>
          <td align="right">${item.amount}</td>
        </tr>
      </#list>
    </table>
    <hr />
    <table class="total" style="width: 100%; margin-top: 10px;">
      <tr>
        <td width="17%" align="left">&nbsp;</td><td width="5%" align="left">&nbsp;</td>
        <td width="19%" align="left">&nbsp;</td><td width="5%" align="left">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="10%" align="right"><b>Freight</b></td>
        <td width="20%" align="right">${shipping?string.currency}</td>
      </tr>
      <tr>
        <td width="17%" align="left">&nbsp;</td><td width="5%" align="left">&nbsp;</td>
        <td width="19%" align="left">&nbsp;</td><td width="5%" align="left">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="10%" align="right"><b>Sales VAT</b></td>
        <td width="20%" align="right">${record.taxtotal}</td>
      </tr>
      <tr class="totalrow">
        <td width="17%" align="left"><b>Number of lines: </b></td><td width="5%" align="left">${linecount}</td>
        <td width="19%" align="left"><b>Total Qty Credited: </b></td><td width="5%" align="left">${totalqty}</td>
        <td>&nbsp;</td>
        <td align="right" width="9%"><b>Total</b></td>
        <td align="right" width="20%">${record.total}</td>
      </tr>
      <tr><td>&nbsp;</td></tr>
      <tr>
        <td><b>Memo:</b></td>
        <td colspan="6">${record.memo}</td>
      </tr>
      <tr>
        <td><b>Surgeon:</b></td>
        <td colspan="6">${record.createdfrom.custbody_rsl_surgeon}</td>
      </tr>
    </table>
    <br/>
    <table width="100%">
      <tr>
        <th>Item</th>
        <th>Lot number or Serial number</th>
      </tr>
      <#list record.item as i>
        <#if i.inventorydetail?has_content>
          <#assign lot = i.inventorydetail?keep_before(",")>
          <#if lot?has_content>
            <#list i.inventorydetail?split("<br />") as inv>
              <tr>
                <td>${i.item}</td>
                <td>${inv?keep_before(",")}</td>
              </tr>
            </#list>
          </#if>
        </#if>
      </#list>
    </table>
  </#if>


</body>
</pdf>