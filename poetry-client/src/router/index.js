import Vue from 'vue'
import Router from 'vue-router'

import Index from '../views/Index'
import Login from '../views/Login'
import Detail from '../views/front/Detail'
import List from '../views/front/List'
import Cart from '../views/front/Cart'
import User from '../views/front/User'
import Order from '../views/front/Order'
import Address from '../views/front/Address'
import Register from '../views/Register'
import Posts from '../views/front/Posts'
import PostsDetail from '../views/front/PostsDetail'

import AdminIndex from '../views/admin/Index'
import AdminLogin from '../views/admin/Login'
import AdminMember from '../views/admin/member/Member'
import AdminGoods from '../views/admin/goods/Goods'
import AdminOrder from '../views/admin/order/Order'
import AdminAdvert from '../views/admin/advert/Advert'
import AdminCategory from '../views/admin/category/Category'
import AdminEvaluation from '../views/admin/order/Evaluation'
import AdminUser from '../views/admin/sys/User'

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'Index',
            component: Index
        },
        {
            path: '/register',
            name: 'Register',
            component: Register
        },
        {
            path: '/login',
            name: 'Login',
            component: Login
        },
        {
            path: '/cart',
            name: 'Cart',
            component: Cart
        },
        {
            path: '/detail',
            name: 'Detail',
            component: Detail
        },
        {
            path: '/list',
            name: 'List',
            component: List
        },
        {
            path: '/user',
            name: 'User',
            component: User
        },
        {
            path: '/order',
            name: 'Order',
            component: Order
        },
        {
            path: '/posts',
            name: 'Posts',
            component: Posts
        },
        {
            path: '/posts_detail',
            name: 'PostsDetail',
            component: PostsDetail
        },
        {
            path: '/address',
            name: 'Address',
            component: Address
        },
        {
            path: '/admin_index',
            name: 'AdminIndex',
            component: AdminIndex
        },
        {
            path: '/admin_login',
            name: 'AdminLogin',
            component: AdminLogin
        },
        {
            path: '/admin_member',
            name: 'AdminMember',
            component: AdminMember
        },
        {
            path: '/admin_goods',
            name: 'AdminGoods',
            component: AdminGoods
        },
        {
            path: '/admin_order',
            name: 'AdminOrder',
            component: AdminOrder
        },
        {
            path: '/admin_evaluation',
            name: 'AdminEvaluation',
            component: AdminEvaluation
        },
        {
            path: '/admin_category',
            name: 'AdminCategory',
            component: AdminCategory
        },
        {
            path: '/admin_advert',
            name: 'AdminAdvert',
            component: AdminAdvert
        },
        {
            path: '/admin_user',
            name: 'AdminUser',
            component: AdminUser
        }
    ]
})