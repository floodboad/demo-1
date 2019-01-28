package com.wangsong;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.util.HtmlUtils;

import java.beans.PropertyEditorSupport;


public class BaseController {

    Whitelist whitelist = Whitelist.relaxed().addAttributes("span","style").addAttributes("p","style");

    /**
     * 普通文本href xss处理
     *
     * @param str
     * @return
     */
    public String isHrefXSS(String str) {
        String prefix = "<a href=\"";
        String suffix = "\"></a>";
        String make = prefix + str + suffix;
        String clean = HtmlUtils.htmlUnescape(Jsoup.clean(make, whitelist));
        return clean.replace(prefix,"").replace(suffix,"").replace("<a></a>","");
    }

    /**
     * 富文本xss，href xss处理
     *
     * @param str
     * @return
     */
    public String isHtmlXSS(String str) {
        return Jsoup.clean(str, whitelist);
    }

    /**
     * 普通文本xss处理
     *
     * @param str
     * @return
     */
    public String isTextXSS(String str) {
        return HtmlUtils.htmlUnescape(Jsoup.clean(str, Whitelist.none()));
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
        //富文本
        if ("user".equals(binder.getObjectName())) {
            // String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
            binder.registerCustomEditor(String.class, "name", new PropertyEditorSupport() {
                @Override
                public void setAsText(String text) {
                    setValue(text == null ? null : isHtmlXSS(text));
                }
            });
        }

        //超链接
        binder.registerCustomEditor(String.class, "sign", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(text == null ? null : isHrefXSS(text));
            }
        });

        //非富
        // String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
        binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(text == null ? null : isTextXSS(text));
            }
        });


    }
}

