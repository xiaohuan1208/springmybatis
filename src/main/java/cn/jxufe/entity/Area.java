package cn.jxufe.entity;

import java.io.Serializable;

/**
 * T_Area
 * @author 
 */
public class Area implements Serializable {
    /**
     * 地区Id
     */
    private Integer areaid;

    /**
     * 地区编码
     */
    private String areacode;

    /**
     * 地区名
     */
    private String areaname;

    /**
     * 地区级别（1:省份province,2:市city,3:区县district,4:街道street）
     */
    private Byte level;

    /**
     * 地区父节点
     */
    private Integer parentid;

    /**
     * 首字母
     */
    private String pinyin;

    /**
     * 是否是热门城市（1：是，0：否）
     */
    private Integer ishot;

    private static final long serialVersionUID = 1L;

    public Integer getAreaid() {
        return areaid;
    }

    public void setAreaid(Integer areaid) {
        this.areaid = areaid;
    }

    public String getAreacode() {
        return areacode;
    }

    public void setAreacode(String areacode) {
        this.areacode = areacode;
    }

    public String getAreaname() {
        return areaname;
    }

    public void setAreaname(String areaname) {
        this.areaname = areaname;
    }

    public Byte getLevel() {
        return level;
    }

    public void setLevel(Byte level) {
        this.level = level;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    public Integer getIshot() {
        return ishot;
    }

    public void setIshot(Integer ishot) {
        this.ishot = ishot;
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
        Area other = (Area) that;
        return (this.getAreaid() == null ? other.getAreaid() == null : this.getAreaid().equals(other.getAreaid()))
            && (this.getAreacode() == null ? other.getAreacode() == null : this.getAreacode().equals(other.getAreacode()))
            && (this.getAreaname() == null ? other.getAreaname() == null : this.getAreaname().equals(other.getAreaname()))
            && (this.getLevel() == null ? other.getLevel() == null : this.getLevel().equals(other.getLevel()))
            && (this.getParentid() == null ? other.getParentid() == null : this.getParentid().equals(other.getParentid()))
            && (this.getPinyin() == null ? other.getPinyin() == null : this.getPinyin().equals(other.getPinyin()))
            && (this.getIshot() == null ? other.getIshot() == null : this.getIshot().equals(other.getIshot()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getAreaid() == null) ? 0 : getAreaid().hashCode());
        result = prime * result + ((getAreacode() == null) ? 0 : getAreacode().hashCode());
        result = prime * result + ((getAreaname() == null) ? 0 : getAreaname().hashCode());
        result = prime * result + ((getLevel() == null) ? 0 : getLevel().hashCode());
        result = prime * result + ((getParentid() == null) ? 0 : getParentid().hashCode());
        result = prime * result + ((getPinyin() == null) ? 0 : getPinyin().hashCode());
        result = prime * result + ((getIshot() == null) ? 0 : getIshot().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", areaid=").append(areaid);
        sb.append(", areacode=").append(areacode);
        sb.append(", areaname=").append(areaname);
        sb.append(", level=").append(level);
        sb.append(", parentid=").append(parentid);
        sb.append(", pinyin=").append(pinyin);
        sb.append(", ishot=").append(ishot);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}