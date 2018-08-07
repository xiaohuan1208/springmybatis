package cn.jxufe.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * T_Search
 * @author 
 */
public class Search implements Serializable {
    /**
     * 手机号（主键）
     */
    private String telphone;

    /**
     * 搜索内容
     */
    private String content;

    /**
     * 搜索时间
     */
    private Date cretetime;

    private static final long serialVersionUID = 1L;

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCretetime() {
        return cretetime;
    }

    public void setCretetime(Date cretetime) {
        this.cretetime = cretetime;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Search other = (Search) that;
        return (this.getTelphone() == null ? other.getTelphone() == null : this.getTelphone().equals(other.getTelphone()))
            && (this.getContent() == null ? other.getContent() == null : this.getContent().equals(other.getContent()))
            && (this.getCretetime() == null ? other.getCretetime() == null : this.getCretetime().equals(other.getCretetime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getTelphone() == null) ? 0 : getTelphone().hashCode());
        result = prime * result + ((getContent() == null) ? 0 : getContent().hashCode());
        result = prime * result + ((getCretetime() == null) ? 0 : getCretetime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", telphone=").append(telphone);
        sb.append(", content=").append(content);
        sb.append(", cretetime=").append(cretetime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}