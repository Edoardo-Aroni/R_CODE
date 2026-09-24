<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
<head>
    <link name="NotoSans" type="font" subtype="truetype" src="${nsfont.NotoSans_Regular}" src-bold="${nsfont.NotoSans_Bold}" src-italic="${nsfont.NotoSans_Italic}" src-bolditalic="${nsfont.NotoSans_BoldItalic}" bytes="2" />
    <#if .locale == "zh_CN">
        <link name="NotoSansCJKsc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKsc_Regular}" src-bold="${nsfont.NotoSansCJKsc_Bold}" bytes="2" />
    <#elseif .locale == "zh_TW">
        <link name="NotoSansCJKtc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKtc_Regular}" src-bold="${nsfont.NotoSansCJKtc_Bold}" bytes="2" />
    <#elseif .locale == "ja_JP">
        <link name="NotoSansCJKjp" type="font" subtype="opentype" src="${nsfont.NotoSansCJKjp_Regular}" src-bold="${nsfont.NotoSansCJKjp_Bold}" bytes="2" />
    <#elseif .locale == "ko_KR">
        <link name="NotoSansCJKkr" type="font" subtype="opentype" src="${nsfont.NotoSansCJKkr_Regular}" src-bold="${nsfont.NotoSansCJKkr_Bold}" bytes="2" />
    <#elseif .locale == "th_TH">
        <link name="NotoSansThai" type="font" subtype="opentype" src="${nsfont.NotoSansThai_Regular}" src-bold="${nsfont.NotoSansThai_Bold}" bytes="2" />
    </#if>
    <macrolist>
        <macro id="nlheader">
            <table class="header" style="width: 100%;"><tr>
    <td rowspan="3" style="height: 191px;"><#if companyInformation.logoUrl?length != 0></#if>${record.custbody_alf_subsidiary_address}<br /><br /><br /><br /><br /><br />&nbsp;<br /><br />${record.billaddress}</td>
    <td align="right"><img src="${companyInformation.logoUrl}" style="float: left; margin: 7px" /></td>
    </tr>
    <tr>
    <td align="right" style="height: 67px;"><span style="font-size:22px;">Sales Invoice</span></td>
    </tr>
    <tr>
    <td align="right" style="height: 75px;"><span style="font-size:16px;"><span id="cke_bm_344S" style="display: none;">&nbsp;</span><span style="font-size:16px;">${record.trandate?string["MM/dd/yyyy"]}</span></span><span class="number">&nbsp;- #</span><span style="font-size:16px;">${record.tranid}</span></td>
    </tr></table>
        </macro>
        <macro id="nlfooter">
            <table class="footer" style="width: 100%;"><tr>
    <td style="height: 100px;">${record.custbody_alf_bank_det_to_print}<br /><br />EIN :&nbsp;${subsidiary.federalidnumber}<br /><barcode codetype="code128" showtext="true" value="${record.tranid}"/></td>
    <td align="right" style="height: 100px;"><pagenumber/> of <totalpages/></td>
    </tr></table>
        </macro>
    </macrolist>
    <style type="text/css">* {
        <#if .locale == "zh_CN">
            font-family: NotoSans, NotoSansCJKsc, sans-serif;
        <#elseif .locale == "zh_TW">
            font-family: NotoSans, NotoSansCJKtc, sans-serif;
        <#elseif .locale == "ja_JP">
            font-family: NotoSans, NotoSansCJKjp, sans-serif;
        <#elseif .locale == "ko_KR">
            font-family: NotoSans, NotoSansCJKkr, sans-serif;
        <#elseif .locale == "th_TH">
            font-family: NotoSans, NotoSansThai, sans-serif;
        <#else>
            font-family: NotoSans, sans-serif;
        </#if>
        }
        table {
            font-size: 9pt;
            table-layout: fixed;
        }
        th {
            font-weight: bold;
            font-size: 8pt;
            vertical-align: middle;
            padding: 5px 6px 3px;
            background-color: #e3e3e3;
            color: #333333;
        }
        td {
            padding: 4px 6px;
        }
        td p { align:left }
        b {
            font-weight: bold;
            color: #333333;
        }
        table.header td {
            padding: 0px;
            font-size: 10pt;
        }
        table.footer td {
            padding: 0px;
            font-size: 8pt;
        }
        table.itemtable th {
            padding-bottom: 10px;
            padding-top: 10px;
        }
        table.itemtable tr {
            page-break-inside: avoid;
        }
        table.body td {
            padding-top: 2px;
        }
        table.total {
            page-break-inside: avoid;
        }
        tr.totalrow {
            background-color: #e3e3e3;
            line-height: 200%;
        }
        td.totalboxtop {
            font-size: 12pt;
            background-color: #e3e3e3;
        }
        td.addressheader {
            font-size: 8pt;
            padding-top: 6px;
            padding-bottom: 2px;
        }
        td.address {
            padding-top: 0px;
        }
        td.totalboxmid {
            font-size: 28pt;
            padding-top: 20px;
            background-color: #e3e3e3;
        }
        td.totalboxbot {
            background-color: #e3e3e3;
            font-weight: bold;
        }
        span.title {
            font-size: 28pt;
        }
        span.number {
            font-size: 16pt;
        }
        span.itemname {
            font-weight: bold;
            line-height: 150%;
        }
        hr {
            width: 100%;
            color: #d3d3d3;
            background-color: #d3d3d3;
            height: 1px;
        }
</style>
</head>
<body header="nlheader" header-height="20%" footer="nlfooter" footer-height="100pt" padding="0.5in 0.25in 0.5in 0.75in" size="Letter">
    &nbsp;
<table style="width: 100%; margin-top: 10px;"><tr>
    <td class="addressheader" colspan="3"><b>${record.shipaddress@label}</b></td>
    <td class="totalboxtop" colspan="5"><b>${record.total@label?upper_case}</b></td>
    </tr>
    <tr>
    <td class="address" colspan="3" rowspan="2">${record.shipaddress}</td>
    <td align="right" class="totalboxmid" colspan="5">${record.total}</td>
    </tr>
    <tr>
    <td align="right" class="totalboxbot" colspan="5"><b>${record.duedate@label}:</b> ${record.duedate?has_content?then(record.duedate?date?string("MM/dd/yyyy"), "-")}</td>
    </tr></table>

<table class="body" style="width: 100%; margin-top: 10px;"><tr>
    <th>Customer Number</th>
    <th>${record.terms@label}</th>
    <th>${record.duedate@label}</th>
    <th>${record.otherrefnum@label}</th>
    <th>${record.salesrep@label}</th>
    </tr>
    <tr>
    <td>${record.entity}</td>
    <td>${record.terms}</td>
    <td>${record.duedate?has_content?then(record.duedate?date?string("MM/dd/yyyy"), "-")}</td>
    <td>${record.otherrefnum}</td>
    <td>${record.salesrep}</td>
    </tr></table>

<#if record.item?has_content>
<table class="itemtable" style="width: 100%; margin-top: 10px;">
    <thead>
        <tr>
            <th align="center" style="width: 10%;">Quantity</th>
            <th style="width: 25%;">Item</th>
            <th style="width: 25%;">Serial Number</th>
            <th style="width: 20%;">Expiration Date</th>
            <th align="right" style="width: 10%;">Unit Price</th>
            <th align="right" style="width: 10%;">Amount</th>
        </tr>
    </thead>
    <tbody>
        <#list record.item as item>
            <#-- Replace HTML break tags with newlines before splitting -->
            <#assign serials = (item.custcol_invdetail! "")?replace("<br />", "\n")?replace("<br>", "\n")?split("\n")>
            <#assign expDates = (item.custcol_acs_expiration_date! "")?replace("<br />", "\n")?replace("<br>", "\n")?split("\n")>
            
            <#if serials?has_content && (serials?size gt 1 || serials[0]?has_content)>
                <#list serials as serial>
                    <tr>
                        <td align="center"><#if serial_index == 0>${item.quantity}</#if></td>
                        <td><#if serial_index == 0><span class="itemname">${item.item}</span><br />${item.description}</#if></td>
                        <td>${serial?trim}</td>
                        <td>${expDates[serial_index]?default("")?trim}</td>
                        <td align="right"><#if serial_index == 0>${item.rate}</#if></td>
                        <td align="right"><#if serial_index == 0>${item.amount}</#if></td>
                    </tr>
                </#list>
            <#else>
                <tr>
                    <td align="center">${item.quantity}</td>
                    <td><span class="itemname">${item.item}</span><br />${item.description}</td>
                    <td>${item.custcol_invdetail!""}</td>
                    <td>${item.custcol_acs_expiration_date!""}</td>
                    <td align="right">${item.rate}</td>
                    <td align="right">${item.amount}</td>
                </tr>
            </#if>
        </#list>
    </tbody>
</table>
<hr />
</#if>

<table class="total" style="width: 100%; margin-top: 10px;"><tr>
    <td colspan="4">&nbsp;</td>
    <td align="right"><b>${record.subtotal@label}</b></td>
    <td align="right">${record.subtotal}</td>
    </tr>
    <tr>
    <td colspan="4">&nbsp;</td>
    <td align="right"><b>${record.taxtotal@label} <#if record.subtotal gt 0>(${(record.taxtotal/record.subtotal*100)?string("0.##")}%)<#else>(${(record.taxtotal*100)?string("0.##")}%)</#if></b></td>
    <td align="right">${record.taxtotal}</td>
    </tr>
    <tr class="totalrow">
    <td background-color="#ffffff" colspan="4">&nbsp;</td>
    <td align="right"><b>${record.total@label}</b></td>
    <td align="right">${record.total}</td>
    </tr></table>
</body>
</pdf>