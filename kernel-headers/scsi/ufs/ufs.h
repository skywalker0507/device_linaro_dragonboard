/****************************************************************************
 ****************************************************************************
 ***
 ***   This header was automatically generated from a Linux kernel header
 ***   of the same name, to make information necessary for userspace to
 ***   call into the kernel available to libc.  It contains only constants,
 ***   structures, and macros generated from the original header, and thus,
 ***   contains no copyrightable information.
 ***
 ***   To edit the content of this header, modify the corresponding
 ***   source file (e.g. under external/kernel-headers/original/) then
 ***   run bionic/libc/kernel/tools/update_all.py
 ***
 ***   Any manual change here will be lost the next time this script will
 ***   be run. You've been warned!
 ***
 ****************************************************************************
 ****************************************************************************/
#ifndef UAPI_UFS_H_
#define UAPI_UFS_H_
#define MAX_QUERY_IDN 0x18
enum flag_idn {
  QUERY_FLAG_IDN_FDEVICEINIT = 0x01,
  QUERY_FLAG_IDN_PERMANENT_WPE = 0x02,
  QUERY_FLAG_IDN_PWR_ON_WPE = 0x03,
  QUERY_FLAG_IDN_BKOPS_EN = 0x04,
  QUERY_FLAG_IDN_RESERVED1 = 0x05,
  QUERY_FLAG_IDN_PURGE_ENABLE = 0x06,
  QUERY_FLAG_IDN_RESERVED2 = 0x07,
  QUERY_FLAG_IDN_FPHYRESOURCEREMOVAL = 0x08,
  QUERY_FLAG_IDN_BUSY_RTC = 0x09,
  QUERY_FLAG_IDN_MANUAL_GC_CONT = 0x0E,
};
enum attr_idn {
  QUERY_ATTR_IDN_BOOT_LU_EN = 0x00,
  QUERY_ATTR_IDN_RESERVED = 0x01,
  QUERY_ATTR_IDN_POWER_MODE = 0x02,
  QUERY_ATTR_IDN_ACTIVE_ICC_LVL = 0x03,
  QUERY_ATTR_IDN_OOO_DATA_EN = 0x04,
  QUERY_ATTR_IDN_BKOPS_STATUS = 0x05,
  QUERY_ATTR_IDN_PURGE_STATUS = 0x06,
  QUERY_ATTR_IDN_MAX_DATA_IN = 0x07,
  QUERY_ATTR_IDN_MAX_DATA_OUT = 0x08,
  QUERY_ATTR_IDN_DYN_CAP_NEEDED = 0x09,
  QUERY_ATTR_IDN_REF_CLK_FREQ = 0x0A,
  QUERY_ATTR_IDN_CONF_DESC_LOCK = 0x0B,
  QUERY_ATTR_IDN_MAX_NUM_OF_RTT = 0x0C,
  QUERY_ATTR_IDN_EE_CONTROL = 0x0D,
  QUERY_ATTR_IDN_EE_STATUS = 0x0E,
  QUERY_ATTR_IDN_SECONDS_PASSED = 0x0F,
  QUERY_ATTR_IDN_CNTX_CONF = 0x10,
  QUERY_ATTR_IDN_CORR_PRG_BLK_NUM = 0x11,
  QUERY_ATTR_IDN_MANUAL_GC_STATUS = 0x17,
};
#define QUERY_ATTR_IDN_BOOT_LU_EN_MAX 0x02
enum desc_idn {
  QUERY_DESC_IDN_DEVICE = 0x0,
  QUERY_DESC_IDN_CONFIGURAION = 0x1,
  QUERY_DESC_IDN_UNIT = 0x2,
  QUERY_DESC_IDN_RFU_0 = 0x3,
  QUERY_DESC_IDN_INTERCONNECT = 0x4,
  QUERY_DESC_IDN_STRING = 0x5,
  QUERY_DESC_IDN_RFU_1 = 0x6,
  QUERY_DESC_IDN_GEOMETRY = 0x7,
  QUERY_DESC_IDN_POWER = 0x8,
  QUERY_DESC_IDN_HEALTH = 0x9,
  QUERY_DESC_IDN_RFU_2 = 0xA,
  QUERY_DESC_IDN_MAX,
};
enum query_opcode {
  UPIU_QUERY_OPCODE_NOP = 0x0,
  UPIU_QUERY_OPCODE_READ_DESC = 0x1,
  UPIU_QUERY_OPCODE_WRITE_DESC = 0x2,
  UPIU_QUERY_OPCODE_READ_ATTR = 0x3,
  UPIU_QUERY_OPCODE_WRITE_ATTR = 0x4,
  UPIU_QUERY_OPCODE_READ_FLAG = 0x5,
  UPIU_QUERY_OPCODE_SET_FLAG = 0x6,
  UPIU_QUERY_OPCODE_CLEAR_FLAG = 0x7,
  UPIU_QUERY_OPCODE_TOGGLE_FLAG = 0x8,
  UPIU_QUERY_OPCODE_MAX,
};
#define UPIU_QUERY_OPCODE_HIGH_HPB 0x5500
#define UPIU_QUERY_OPCODE_HIGH(opcode) ((opcode) >> 16)
#define UPIU_QUERY_OPCODE_LOW(opcode) ((opcode) & 0xffff)
#endif
