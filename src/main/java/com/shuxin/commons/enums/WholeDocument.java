package com.shuxin.commons.enums;

/**
* @ClassName: WholeSingle
* @Description: TODO(整单规则 列表)
* @author LiuYang
* @date 2017年11月16日
*
*/
public enum WholeDocument {

    doc1("1012","单次处方药品种类异常"), 
    doc2("1013","单次处方费用超限"), 
    doc3("1014","频繁取药 "), 
    doc4("3001","分解住院"), 
    doc5("3002","不合理入院"),
    doc6("3003","门诊频次审核 "), 
    doc7("3004","门规病种费用总额审核"),
    doc8("3005","门规综合病种费用总额审核"), 
    doc9("3006","费用明细数据异常"), 
    doc10("3007","就诊信息数据异常"), 
    doc11("3008","省医保单次处方费用超限审核"), 
    doc12("3009","省医保单词处方种类异常"), 
    doc13("4001","疾病诊断合理性审核");
    ;

    private String key;

    private String value;

    WholeDocument(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public static String getEnumValue(String key) {
        for (WholeDocument c : WholeDocument.values()) {
            if (c.getKey().equals(key)) {
                return c.value;
            }
        }

        return null;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

}
