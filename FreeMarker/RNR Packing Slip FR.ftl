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

    <#assign langEnglish = false>

    <macrolist>
      <macro id="nlheader">
        <table class="header" style="width: 100%; font-size: 10pt;">
            <tr>
                <td rowspan="2" style="height: 141px; font-size: 12px;"><#if companyInformation.logoUrl?length != 0><img src="${companyInformation.logoUrl}" style="float: left; margin: 0px" /> </#if><br/><br/><br/><br/><br/><br/>${record.custbody_subsidiary_address}<br/></td>
                <#if langEnglish == true>
                    <td align="right"><span class="title">Packing Slip</span></td>
                <#elseif langEnglish == false>
                    <td align="right"><span class="title">Bon de livraison</span></td>
                </#if>
            </tr>
            <tr>
            <td align="right">
              <table width="80%">
                <#if langEnglish == true>
                  <tr><td style="padding:2px;" width="33%"><b>Order #</b></td><td style="padding:2px;">${salesorder.tranid}</td></tr>
                  <tr><td style="padding:2px;"><b>Order Date</b></td><td style="padding:2px;" width="56%">${salesorder.trandate}</td></tr>
                <#elseif langEnglish == false>
                  <tr><td style="padding:2px;" width="33%"><b>Commande</b></td><td style="padding:2px;">${salesorder.tranid}</td></tr>
                  <tr><td style="padding:2px;"><b>Date de Commande</b></td><td style="padding:2px;" width="56%">${salesorder.trandate}</td></tr>
                </#if>
              </table>
            </td>
          </tr>
        </table>
      </macro>
      <macro id="nlfooter">
        <table class="footer" width="100%">
          <tr><td align="left">&nbsp;</td></tr>
          <tr>
            <td align="left">><barcode codetype="code128" showtext="true" value="${record.createdfrom}"/></td>
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
  <table style="width: 60%; margin-top: 0px;">
    <tr>
      <#if langEnglish == true>
        <td class="addressheader">Ship To</td>
      <#elseif langEnglish == false>
        <td class="addressheader">Adresse de Livraison</td>
      </#if>
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
	</tr>
  </table>

  <table class="body" style="width: 100%; margin-top: 10px;">
    <tr>
      <#if langEnglish == true>
        <th width="12%">Ship Date</th>
        <th>PO#</th>
        <th>Tracking #</th>
        <th align="right" width="20%">Ship Via</th>
        <th align="right" width="14%">Notes</th>
      <#elseif langEnglish == false>
        <th width="17%">Date d'expédition</th>
        <th>PO#</th>
        <th>N° de suivi</th>
        <th align="right" width="20%">Envoyé par</th>
        <th align="right" width="14%">Commentaires</th>
      </#if>
	</tr>
	<tr>
      <#assign pw = 0>
      <#assign pc = 0>
      <#assign pt = ''>
      <#assign pd = ''>
      <#if record.package?has_content>
        <#list record.package as p>
          <#assign pc += 1>
          <#assign pt += p.packagetrackingnumber>
          <#assign pt += ", ">
          <#assign pd += p.packagedescr>
          <#assign pd += ", ">
        </#list>
      </#if>
      <td>${record.trandate}</td>
      <!--td>${salesorder.custbodycustomer_po}</td-->
      <td>${(salesorder.custbodycustomer_po?has_content)?then(salesorder.custbodycustomer_po, salesorder.otherrefnum!"")}</td>
      <td>${pt?remove_ending(", ")}</td>
      <td align="right">${salesorder.shipmethod}</td>
      <td align="right">${salesorder.custbodynotes}</td>
	</tr>
    <tr><td>&nbsp;</td></tr>
  </table>

  <table class="body" style="width: 100%; margin-top: 10px;">
    <tr>
      <#if langEnglish == true>
        <th>Country for Billing</th>
        <th>Country for Shipping</th>
      <#elseif langEnglish == false>
        <th>Pays de Facturation</th>
        <th>Pays de livraison</th>
      </#if>
	</tr>
	<tr>
      <td>${salesorder.custbody_rnr_custom_bill_country}</td>
      <td>${salesorder.custbody_rnr_custom_ship_country}</td>
	</tr>
    <tr><td>&nbsp;</td></tr>
  </table>


    <#if record.item?has_content>
      <#assign totalqtyshipped = 0>
      <table width="100%">
        <tr>
          <#if langEnglish == true>
            <th align="left">Item</th>
            <th align="left">Description</th>
            <th align="right" width="9%">Ordered</th>
            <th align="right" width="6%">Units</th>
            <th align="left" width="16%">Serial/Lot Number</th>
            <th align="left" width="17%">Expiry Date</th>
            <th align="right" width="12%">Qty Shipped</th>
          <#elseif langEnglish == false>
            <th align="left">Article</th>
            <th align="left">Description</th>
            <th align="right" width="9%">Qté Cdée</th>
            <th align="right" width="8%">Unités</th>
            <th align="left" width="16%">Numéro de série</th>
            <th align="left" width="17%">Date d'expiration</th>
            <th align="right" width="12%">Qté expéd</th>
          </#if>
        </tr>
        <#list record.item as i>
          <#if i.inventorydetail?has_content>
            <#assign lot = i.inventorydetail?keep_before(",")>
            <#if lot?has_content>
              <#list i.inventorydetail?split("<br />") as inv>
                <tr>
                  <td align="left">${i.item}<br/>${i.custcol_rnr_commodity_code}</td>
                  <td align="left">${i.itemdescription}</td>
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
      </table>
    </#if>

</body>
</pdf>