package cn.jxufe.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * T_Advertisement
 * @author 
 */
public class Advertisement implements Serializable {
    /**
     * 广告id
     */
    private Integer advertiseid;

    /**
     * 广告序号
     */
    private Integer advsequence;

    /**
     * 广告图片
     */
    private String advimg;

    /**
     * 广告链接地址
     */
    private String linkurl;

    /**
     * 创建时间
     */
    private Date createtime;

    private static final long serialVersionUID = 1L;

    public Integer getAdvertiseid() {
        return advertiseid;
    }

    public void setAdvertiseid(Integer advertiseid) {
        this.advertiseid = advertiseid;
    }

    public Integer getAdvsequence() {
        return advsequence;
    }

    public void setAdvsequence(Integer advsequence) {
        this.advsequence = advsequence;
    }

    public String getAdvimg() {
        return advimg;
    }

    public void setAdvimg(String advimg) {
        this.advimg = advimg;
    }

    public String getLinkurl() {
        return linkurl;
    }

    public void setLinkurl(String linkurl) {
        this.linkurl = linkurl;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
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
        Advertisement other = (Advertisement) that;
        return (this.getAdvertiseid() == null ? other.getAdvertiseid() == null : this.getAdvertiseid().equals(other.getAdvertiseid()))
            && (this.getAdvsequence() == null ? other.getAdvsequence() == null : this.getAdvsequence().equals(other.getAdvsequence()))
            && (this.getAdvimg() == null ? other.getAdvimg() == null : this.getAdvimg().equals(other.getAdvimg()))
            && (this.getLinkurl() == null ? other.getLinkurl() == null : this.getLinkurl().equals(other.getLinkurl()))
            && (this.getCreatetime() == null ? other.getCreatetime() == null : this.getCreatetime().equals(other.getCreatetime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getAdvertiseid() == null) ? 0 : getAdvertiseid().hashCode());
        result = prime * result + ((getAdvsequence() == null) ? 0 : getAdvsequence().hashCode());
        result = prime * result + ((getAdvimg() == null) ? 0 : getAdvimg().hashCode());
        result = prime * result + ((getLinkurl() == null) ? 0 : getLinkurl().hashCode());
        result = prime * result + ((getCreatetime() == null) ? 0 : getCreatetime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", advertiseid=").append(advertiseid);
        sb.append(", advsequence=").append(advsequence);
        sb.append(", advimg=").append(advimg);
        sb.append(", linkurl=").append(linkurl);
        sb.append(", createtime=").append(createtime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}