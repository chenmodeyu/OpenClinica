package org.akaza.openclinica.view.tags;

import core.org.akaza.openclinica.bean.submit.DisplaySectionBean;
import core.org.akaza.openclinica.bean.submit.EventCRFBean;
import core.org.akaza.openclinica.domain.datamap.Study;
import org.akaza.openclinica.view.form.PrintHorizontalFormBuilder;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * A tag class that is designed to generate a printable group table. The String
 * value formInvolvesDatabaseData maps to an attribute value indicating whether
 * the form involves an event or data. User: bruceperry Date: Feb 11, 2008
 */
public class PrintTableTag extends SimpleTagSupport {

    private String involvesDatabaseData;

    /**
     * This JSP Tag API method creates a instance of PrintHorizontalFormBuilder,
     * then generates that class's XHTML output into the web page. The tag shows
     * all sections of a CRF.
     *
     * @throws JspException
     * @throws IOException
     */
    @Override
    public void doTag() throws JspException, IOException {

        JspContext context = getJspContext();
        JspWriter tagWriter = context.getOut();
        // This request attribute is generated by the PrintCRf or PrintDataEntry
        // servlets
        List<DisplaySectionBean> listOfDisplayBeans = (ArrayList) context.findAttribute("listOfDisplaySectionBeans");
        Study studyBean = (Study) context.findAttribute("study");
        // EventCRFBean
        EventCRFBean eventCRFBean = (EventCRFBean) context.findAttribute("EventCRFBean");

        String isInternetExplorer = (String) context.findAttribute("isInternetExplorer");

        if (listOfDisplayBeans != null) {
            PrintHorizontalFormBuilder printFormBuilder = new PrintHorizontalFormBuilder();
            // Provide the form-building code with the list of display section
            // beans
            printFormBuilder.setDisplaySectionBeans(listOfDisplayBeans);

            // The body content of the tag contains 'true' or 'false', depending
            // on whether the
            // printed CRF involves data entry (and possible saved data) or not.
            JspFragment fragment = this.getJspBody();
            Writer stringWriter = new StringWriter();
            fragment.invoke(stringWriter);
            if ("true".equalsIgnoreCase(stringWriter.toString())) {
                printFormBuilder.setInvolvesDataEntry(true);
            }

            printFormBuilder.setEventCRFbean(eventCRFBean);

            if ("true".equalsIgnoreCase(isInternetExplorer)) {
                printFormBuilder.setInternetExplorer(true);
            }
            if (studyBean != null) {
                printFormBuilder.setStudyBean(studyBean);
            }
            if ("true".equalsIgnoreCase(stringWriter.toString())) {
            tagWriter.println(printFormBuilder.createMarkup());
            }
            else
                tagWriter.println(printFormBuilder.createMarkupNoDE());
        } else {
            tagWriter.println("The application could not generate the markup for the printable form.<br />"
                + "This error may have been caused by the altering of the web page's URL; the URL needs "
                + "an 'id' or an 'ecId' value in its query string at the URL end.");
        }
    }

    public String getInvolvesDatabaseData() {
        return involvesDatabaseData;
    }

    public void setInvolvesDatabaseData(String involvesDatabaseData) {
        this.involvesDatabaseData = involvesDatabaseData;
    }
}