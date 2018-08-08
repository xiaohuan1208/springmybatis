package cn.jxufe.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * T_Order
 * @author 
 */
public class Order implements Serializable {
    /**
     * 订单编号
     */
    private Integer orderid;

    /**
     * 手机号（用户）
     */
    private String telphone;

    /**
     * 订单备注
     */
    private String orderremarks;

    /**
     * 创建日期
     */
    private Date createtime;

    /**
     * 订单状态
     */
    private String orderstate;

    /**
     * 订单总价格
     */
    private Double totalprice;

    /**
     * 用户地址（收货地址）
     */
    private String address;

    private static final long serialVersionUID = 1L;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getOrderremarks() {
        return orderremarks;
    }

    public void setOrderremarks(String orderremarks) {
        this.orderremarks = orderremarks;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getOrderstate() {
        return orderstate;
    }

    public void setOrderstate(String orderstate) {
        this.orderstate = orderstate;
    }

    public Double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
        Order other = (Order) that;
        return (this.getOrderid() == null ? other.getOrderid() == null : this.getOrderid().equals(other.getOrderid()))
            && (this.getTelphone() == null ? other.getTelphone() == null : this.getTelphone().equals(other.getTelphone()))
            && (this.getOrderremarks() == null ? other.getOrderremarks() == null : this.getOrderremarks().equals(other.getOrderremarks()))
            && (this.getCreatetime() == null ? other.getCreatetime() == null : this.getCreatetime().equals(other.getCreatetime()))
            && (this.getOrderstate() == null ? other.getOrderstate() == null : this.getOrderstate().equals(other.getOrderstate()))
            && (this.getTotalprice() == null ? other.getTotalprice() == null : this.getTotalprice().equals(other.getTotalprice()))
            && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getOrderid() == null) ? 0 : getOrderid().hashCode());
        result = prime * result + ((getTelphone() == null) ? 0 : getTelphone().hashCode());
        result = prime * result + ((getOrderremarks() == null) ? 0 : getOrderremarks().hashCode());
        result = prime * result + ((getCreatetime() == null) ? 0 : getCreatetime().hashCode());
        result = prime * result + ((getOrderstate() == null) ? 0 : getOrderstate().hashCode());
        result = prime * result + ((getTotalprice() == null) ? 0 : getTotalprice().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", orderid=").append(orderid);
        sb.append(", telphone=").append(telphone);
        sb.append(", orderremarks=").append(orderremarks);
        sb.append(", createtime=").append(createtime);
        sb.append(", orderstate=").append(orderstate);
        sb.append(", totalprice=").append(totalprice);
        sb.append(", address=").append(address);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}