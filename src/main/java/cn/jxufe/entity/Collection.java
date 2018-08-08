package cn.jxufe.entity;

import java.io.Serializable;

/**
 * T_Collection
 * @author 
 */
public class Collection implements Serializable {
    private Integer id;

    /**
     * 商品ID
     */
    private Integer goodsid;

    /**
     * 手机号（账号）
     */
    private String telphone;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
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
        Collection other = (Collection) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getGoodsid() == null ? other.getGoodsid() == null : this.getGoodsid().equals(other.getGoodsid()))
            && (this.getTelphone() == null ? other.getTelphone() == null : this.getTelphone().equals(other.getTelphone()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getGoodsid() == null) ? 0 : getGoodsid().hashCode());
        result = prime * result + ((getTelphone() == null) ? 0 : getTelphone().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", goodsid=").append(goodsid);
        sb.append(", telphone=").append(telphone);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}