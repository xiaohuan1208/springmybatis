package cn.jxufe.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * T_Admin
 * @author 
 */
public class Admin implements Serializable {
    /**
     * 管理员id（主键）
     */
    private Integer id;

    /**
     * 管理员账号
     */
    private String account;

    /**
     * 密码
     */
    private String password;

    /**
     * 登录次数
     */
    private Integer logcount;

    /**
     * 是否为超级管理员 1代表是， 0 代表不是
     */
    private Boolean issuper;

    /**
     * 是否禁用 1代表是， 0 代表不是
     */
    private Boolean isdisabled;

    /**
     * 登陆状态
     */
    private String logstatus;

    /**
     * 录入时间
     */
    private Date createtime;

    /**
     * 更新时间
     */
    private Date updatetime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getLogcount() {
        return logcount;
    }

    public void setLogcount(Integer logcount) {
        this.logcount = logcount;
    }

    public Boolean getIssuper() {
        return issuper;
    }

    public void setIssuper(Boolean issuper) {
        this.issuper = issuper;
    }

    public Boolean getIsdisabled() {
        return isdisabled;
    }

    public void setIsdisabled(Boolean isdisabled) {
        this.isdisabled = isdisabled;
    }

    public String getLogstatus() {
        return logstatus;
    }

    public void setLogstatus(String logstatus) {
        this.logstatus = logstatus;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
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
        Admin other = (Admin) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getAccount() == null ? other.getAccount() == null : this.getAccount().equals(other.getAccount()))
            && (this.getPassword() == null ? other.getPassword() == null : this.getPassword().equals(other.getPassword()))
            && (this.getLogcount() == null ? other.getLogcount() == null : this.getLogcount().equals(other.getLogcount()))
            && (this.getIssuper() == null ? other.getIssuper() == null : this.getIssuper().equals(other.getIssuper()))
            && (this.getIsdisabled() == null ? other.getIsdisabled() == null : this.getIsdisabled().equals(other.getIsdisabled()))
            && (this.getLogstatus() == null ? other.getLogstatus() == null : this.getLogstatus().equals(other.getLogstatus()))
            && (this.getCreatetime() == null ? other.getCreatetime() == null : this.getCreatetime().equals(other.getCreatetime()))
            && (this.getUpdatetime() == null ? other.getUpdatetime() == null : this.getUpdatetime().equals(other.getUpdatetime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getAccount() == null) ? 0 : getAccount().hashCode());
        result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
        result = prime * result + ((getLogcount() == null) ? 0 : getLogcount().hashCode());
        result = prime * result + ((getIssuper() == null) ? 0 : getIssuper().hashCode());
        result = prime * result + ((getIsdisabled() == null) ? 0 : getIsdisabled().hashCode());
        result = prime * result + ((getLogstatus() == null) ? 0 : getLogstatus().hashCode());
        result = prime * result + ((getCreatetime() == null) ? 0 : getCreatetime().hashCode());
        result = prime * result + ((getUpdatetime() == null) ? 0 : getUpdatetime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", account=").append(account);
        sb.append(", password=").append(password);
        sb.append(", logcount=").append(logcount);
        sb.append(", issuper=").append(issuper);
        sb.append(", isdisabled=").append(isdisabled);
        sb.append(", logstatus=").append(logstatus);
        sb.append(", createtime=").append(createtime);
        sb.append(", updatetime=").append(updatetime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}