<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setBundle basename="org.akaza.openclinica.i18n.words" var="resword"/>
<fmt:setBundle basename="org.akaza.openclinica.i18n.notes" var="restext"/>
<span class="table_title_extract"><fmt:message key="subject_attributes" bundle="${resword}"/></span>
<div style="width: 600px">
<div class="box_T"><div class="box_L"><div class="box_R"><div class="box_B"><div class="box_TL"><div class="box_TR"><div class="box_BL"><div class="box_BR">
<div class="textbox_center" align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
 <td class="table_header_column_top"><fmt:message key="subject_status" bundle="${resword}"/></td>
</tr>
<tr>
 <td class="table_cell"><c:choose>
   <c:when test="${newDataset.showSubjectStatus}">
     <input type="checkbox" checked name="subj_status" value="yes">
   </c:when>
   <c:otherwise>
     <input type="checkbox" name="subj_status" value="yes">
   </c:otherwise>
  </c:choose>
 </td>
</tr>
</table>
</div>
</div></div></div></div></div></div></div></div>
</div>

<span class="table_title_extract"><fmt:message key="event_attributes" bundle="${resword}"/></span>
<div style="width: 600px">
<div class="box_T"><div class="box_L"><div class="box_R"><div class="box_B"><div class="box_TL"><div class="box_TR"><div class="box_BL"><div class="box_BR">
<div class="textbox_center" align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
 <td class="table_header_column_top"><fmt:message key="start_date" bundle="${resword}"/></td>
 <td class="table_header_column_top"><fmt:message key="end_date" bundle="${resword}"/></td>
 <td class="table_header_column_top"><fmt:message key="status" bundle="${resword}"/></td>
 </tr>
 <tr>

   <td class="table_cell">
   <c:choose>
     <c:when test="${newDataset.showEventStart}">
       <input type="checkbox" checked name="start" value="yes">
     </c:when>
     <c:otherwise>
       <input type="checkbox" name="start" value="yes">
     </c:otherwise>
    </c:choose>
   </td>
   <td class="table_cell">
     <c:choose>
     <c:when test="${newDataset.showEventEnd}">
       <input type="checkbox" checked name="end" value="yes">
     </c:when>
     <c:otherwise>
       <input type="checkbox" name="end" value="yes">
     </c:otherwise>
    </c:choose>
   </td>
 <td class="table_cell">
 <c:choose>
     <c:when test="${newDataset.showEventStatus}">
       <input type="checkbox" checked name="event_status" value="yes">
     </c:when>
     <c:otherwise>
       <input type="checkbox" name="event_status" value="yes">
     </c:otherwise>
   </c:choose>
 </td>
</tr>
</table>
</div>
</div></div></div></div></div></div></div></div>
</div>

<span class="table_title_extract"><fmt:message key="CRF_attributes" bundle="${resword}"/></span>
<div style="width: 600px">
<div class="box_T"><div class="box_L"><div class="box_R"><div class="box_B"><div class="box_TL"><div class="box_TR"><div class="box_BL"><div class="box_BR">
<div class="textbox_center" align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
 <td class="table_header_column_top"><fmt:message key="CRF_version" bundle="${resword}"/></td>
 <td class="table_header_column_top"><fmt:message key="CRF_status" bundle="${resword}"/></td>
 </tr>
 <tr>
 <td class="table_cell"><c:choose>
     <c:when test="${newDataset.showCRFversion}">
       <input type="checkbox" checked name="crf_version" value="yes">
     </c:when>
     <c:otherwise>
       <input type="checkbox" name="crf_version" value="yes">
     </c:otherwise>
    </c:choose>
   </td>
 <td class="table_cell">
 <c:choose>
     <c:when test="${newDataset.showCRFstatus}">
       <input type="checkbox" checked name="crf_status" value="yes">
     </c:when>
     <c:otherwise>
       <input type="checkbox" name="crf_status" value="yes">
     </c:otherwise>
   </c:choose>
 </td>
</tr>
</table>
</div>
</div></div></div></div></div></div></div></div>
</div>




<br>
<span class="table_title_extract"><fmt:message key="CRF_data" bundle="${resword}"/></span>

<div class="box_T"><div class="box_L"><div class="box_R"><div class="box_B"><div class="box_TL"><div class="box_TR"><div class="box_BL"><div class="box_BR">
<div class="textbox_center" align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr>
    <td class="table_header_column_top">&nbsp;</td>
    <td class="table_header_column_top"><fmt:message key="name" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="description" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="event" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="CRF" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="version2" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="data_type" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="units" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="response_label" bundle="${resword}"/></td>
    <td class="table_header_column_top"><fmt:message key="PHI" bundle="${resword}"/></td>

  </tr>
<c:set var="count" value="0"/>
<c:forEach var='item' items='${allSelectedItems}'>
  <tr>
   <td class="table_cell">
   <c:choose>
    <c:when test="${item.selected}">
      <input type="checkbox" checked name="itemSelected<c:out value="${count}"/>" value="yes">
    </c:when>
    <c:otherwise>
      <input type="checkbox" name="itemSelected<c:out value="${count}"/>" value="yes">
    </c:otherwise>
   </c:choose>
   </td>
   <td class="table_cell"><a href="javascript: openDocWindow('ViewItemDetail?itemId=<c:out value="${item.id}"/>&itemName=<c:out value="${item.name}"/>')"><c:out value="${item.name}"/></a></td>
   <td class="table_cell"><c:out value="${item.description}"/>&nbsp;</td>
   <td class="table_cell">
    <input type="hidden" name="itemDefName<c:out value="${count}"/>" value="<c:out value="${item.defName}"/>">
   <c:out value="${item.defName}"/>&nbsp;
   </td>
   <td class="table_cell">
   <input type="hidden" name="itemCrfName<c:out value="${count}"/>" value="<c:out value="${item.crfName}"/>">
   <c:out value="${item.crfName}"/>&nbsp;
   </td>
   <td class="table_cell">
      <c:forEach var="meta" items="${item.itemMetas}" varStatus="status">
        <c:choose>
          <c:when test="${status.last}">
           <c:out value="${meta.crfVersionName}"/>
          </c:when>
          <c:otherwise>
           <c:out value="${meta.crfVersionName}"/>,<br>
          </c:otherwise>
        </c:choose>
      </c:forEach>&nbsp;
    </td>
   <td class="table_cell"><c:out value="${item.dataType.name}"/>&nbsp;</td>
   <td class="table_cell"><c:out value="${item.units}"/>&nbsp;</td>

    <td class="table_cell">
      <c:forEach var="meta" items="${item.itemMetas}" varStatus="status">
        <c:choose>
          <c:when test="${status.last}">
           <c:out value="${meta.responseSet.label}"/>
          </c:when>
          <c:otherwise>
            <c:out value="${meta.responseSet.label}"/>,<br>
          </c:otherwise>
        </c:choose>
      </c:forEach>&nbsp;
    </td>
    <td class="table_cell">
     <c:choose>
      <c:when test="${item.phiStatus}">
        <fmt:message key="yes" bundle="${resword}"/>
      </c:when>
      <c:otherwise>
        <fmt:message key="no" bundle="${resword}"/>
      </c:otherwise>
    </c:choose>
   </td>

  </tr>
  <c:set var="count" value="${count+1}"/>
</c:forEach>
</table>
</div>

</div></div></div></div></div></div></div></div>
