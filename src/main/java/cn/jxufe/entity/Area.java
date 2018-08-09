package cn.jxufe.entity;

import java.io.Serializable;

/**
 * T_Area
 * @author 
 */
public class Area implements Serializable {
    /**
     * 地区id
     */
    private Integer areaid;

    /**
     * 地区编码
     */
    private Integer areacode;

    /**
     * 地区名称
     */
    private String areaname;

    /**
     * 地区级别（1：省份，2：市，3：区县）
     */
    private Integer level;

    /**
     * 地区父节点
     */
    private Integer parentid;

    private static final long serialVersionUID = 1L;

    public Integer getAreaid() {
        return areaid;
    }

    public void setAreaid(Integer areaid) {
        this.areaid = areaid;
    }

    public Integer getAreacode() {
        return areacode;
    }

    public void setAreacode(Integer areacode) {
        this.areacode = areacode;
    }

    public String getAreaname() {
        return areaname;
    }

    public void setAreaname(String areaname) {
        this.areaname = areaname;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
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
            && (this.getParentid() == null ? other.getParentid() == null : this.getParentid().equals(other.getParentid()));
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
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}