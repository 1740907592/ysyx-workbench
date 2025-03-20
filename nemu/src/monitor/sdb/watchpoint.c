/***************************************************************************************
* Copyright (c) 2014-2024 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include "sdb.h"

#define NR_WP 32
//监视点池是为了像数组一样,管理监视点结构,链表是为了连接到每一个节点进行思考?

static WP wp_pool[NR_WP] = {};
static WP *head = NULL, *free_ = NULL;

void init_wp_pool() {
  int i;
  for (i = 0; i < NR_WP; i ++) {
    wp_pool[i].NO = i;
    wp_pool[i].next = (i == NR_WP - 1 ? NULL : &wp_pool[i + 1]);
  }

  head = NULL;
  free_ = wp_pool;
}
//用池子管理,根据需要分配,返回时候进行添加,但是
/* TODO: Implement the functionality of watchpoint */
WP* getHead() {
  return head;
}
WP* new_wp() {
  if (free_ == NULL) {
    assert(0);
  }
  WP *now = free_;
  free_ = now->next;
  now->next = head;
  head = now;
  return head;

}
void free_wp(WP *wp) {
  if (wp == NULL) return;
  if (wp == head) {
    head = head->next;
  } else {
    WP *pre = head;
    while (pre != NULL && pre->next != wp) {
      pre = pre->next;
    }
    if (pre == NULL) return;
    pre->next = wp->next;
  }
  wp->next = free_;
  free_ = wp;
}