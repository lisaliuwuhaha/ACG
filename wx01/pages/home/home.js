// pages/home/home.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list:[],
    infoList:[],
    pageIndex: 0,//商品分页页码
    pageSize: 2,//页大小
    hasMore: true,//是否还有更多数据
  },
  
  getImageList: function () {
    wx.request({
      url: 'http://127.0.0.1:3000/imagelist',
      success: (res) => {
        this.setData({
          list: res.data
        })
      }
    })
  },
  loadMore: function () {
    //加载更多的数据
    //判断是否有下一页数据
    if (this.data.hasMore == false) {
      return
    };
    //1发送ajax请求
    //当前页
    wx.request({
      url: 'http://127.0.0.1:3000/infolist',
      data: { pno: ++this.data.pageIndex, pageSize: this.data.pageSize },
      success: (res) => {
        //2获取返回数据 
        //总页数
        var pageCount = res.data.pageCount;
        var pno = this.data.pageIndex;
        var data = res.data.data
        var flag = pno < pageCount;
        //追加
        var arr = this.data.infoList.concat(data);
        this.setData({
          infoList: arr,
          hasMore: flag
        })
        console.log(this.data.infoList)
        //3保存list列表
      }
    })
    //显示加载动画 
    wx.showLoading({
      title: '正在加载数据',
    })
    //1秒后隐藏动画
    setTimeout(function () {
      wx.hideLoading()
    }, 1000)

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    this.getImageList()
    this.loadMore()
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
    
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    //上拉显示下一页
    this.loadMore()
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})