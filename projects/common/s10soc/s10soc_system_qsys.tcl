# stratix10soc carrier qsys


set system_type s10soc

# clock & reset

add_instance sys_clk clock_source
add_interface sys_clk clock sink
set_interface_property sys_clk EXPORT_OF sys_clk.clk_in
add_interface sys_rstn reset sink
set_interface_property sys_rstn EXPORT_OF sys_clk.clk_in_reset
set_instance_parameter_value sys_clk {clockFrequency} {100000000.0}
set_instance_parameter_value sys_clk {clockFrequencyKnown} {1}
set_instance_parameter_value sys_clk {resetSynchronousEdges} {NONE}

# sysid

add_instance sys_id altera_avalon_sysid_qsys
set_instance_parameter_value sys_id {ID} {0x00000100}
add_connection sys_clk.clk sys_id.clk
add_connection sys_clk.clk_reset sys_id.reset

# hps
# round-about way - qsys-script doesn't support {*}?

variable  hps_io_list

proc set_hps_io {io_index io_type} {

  global hps_io_list
  lappend hps_io_list $io_type
}

set_hps_io IO_SHARED_Q1_1   USB0:CLK
set_hps_io IO_SHARED_Q1_2   USB0:STP
set_hps_io IO_SHARED_Q1_3   USB0:DIR
set_hps_io IO_SHARED_Q1_4   USB0:DATA0
set_hps_io IO_SHARED_Q1_5   USB0:DATA1
set_hps_io IO_SHARED_Q1_6   USB0:NXT
set_hps_io IO_SHARED_Q1_7   USB0:DATA2
set_hps_io IO_SHARED_Q1_8   USB0:DATA3
set_hps_io IO_SHARED_Q1_9   USB0:DATA4
set_hps_io IO_SHARED_Q1_10  USB0:DATA5
set_hps_io IO_SHARED_Q1_11  USB0:DATA6
set_hps_io IO_SHARED_Q1_12  USB0:DATA7
set_hps_io IO_SHARED_Q2_1   EMAC0:TX_CLK
set_hps_io IO_SHARED_Q2_2   EMAC0:TX_CTL
set_hps_io IO_SHARED_Q2_3   EMAC0:RX_CLK
set_hps_io IO_SHARED_Q2_4   EMAC0:RX_CTL
set_hps_io IO_SHARED_Q2_5   EMAC0:TXD0
set_hps_io IO_SHARED_Q2_6   EMAC0:TXD1
set_hps_io IO_SHARED_Q2_7   EMAC0:RXD0
set_hps_io IO_SHARED_Q2_8   EMAC0:RXD1
set_hps_io IO_SHARED_Q2_9   EMAC0:TXD2
set_hps_io IO_SHARED_Q2_10  EMAC0:TXD3
set_hps_io IO_SHARED_Q2_11  EMAC0:RXD2
set_hps_io IO_SHARED_Q1_12  EMAC0:RXD3
set_hps_io IO_SHARED_Q3_1   GPIO
set_hps_io IO_SHARED_Q3_2   GPIO
set_hps_io IO_SHARED_Q3_3   UART0:TX
set_hps_io IO_SHARED_Q3_4   UART0:RX
set_hps_io IO_SHARED_Q3_5   GPIO
set_hps_io IO_SHARED_Q3_6   GPIO
set_hps_io IO_SHARED_Q3_7   I2C1:SDA
set_hps_io IO_SHARED_Q3_8   I2C1:SCL
set_hps_io IO_SHARED_Q3_9   JTAG:TCK
set_hps_io IO_SHARED_Q3_10  JTAG:TMS
set_hps_io IO_SHARED_Q3_11  JTAG:TDO
set_hps_io IO_SHARED_Q3_12  JTAG:TDI
set_hps_io IO_SHARED_Q4_1   SDMMC:D0
set_hps_io IO_SHARED_Q4_2   SDMMC:CMD
set_hps_io IO_SHARED_Q4_3   SDMMC:CCLK
set_hps_io IO_SHARED_Q4_4   SDMMC:D1
set_hps_io IO_SHARED_Q4_5   SDMMC:D2
set_hps_io IO_SHARED_Q4_6   SDMMC:D3
set_hps_io IO_SHARED_Q4_7   HPS_OSC_CLK
set_hps_io IO_SHARED_Q4_8   GPIO
set_hps_io IO_SHARED_Q4_9   GPIO
set_hps_io IO_SHARED_Q4_10  GPIO
set_hps_io IO_SHARED_Q4_11  MDIO0:MDIO
set_hps_io IO_SHARED_Q4_12  MDIO0:MDC

add_instance sys_hps altera_stratix10_hps
set_instance_parameter_value sys_hps {CLK_PERI_PLL_SOURCE2} {0}
set_instance_parameter_value sys_hps {CLK_PSI_SOURCE} {1}
set_instance_parameter_value sys_hps {CLK_S2F_USER0_SOURCE} {1}
set_instance_parameter_value sys_hps {CLK_S2F_USER1_SOURCE} {1}
set_instance_parameter_value sys_hps {CLK_SDMMC_SOURCE} {0}
set_instance_parameter_value sys_hps {CTI_Enable} {0}
set_instance_parameter_value sys_hps {CUSTOM_MPU_CLK} {800}
set_instance_parameter_value sys_hps {DMA_Enable} {No No No No No No No No}
set_instance_parameter_value sys_hps {EMAC0_CLK} {250}
set_instance_parameter_value sys_hps {EMAC0_Mode} {RGMII_with_MDIO}
set_instance_parameter_value sys_hps {EMAC0_PTP} {0}
set_instance_parameter_value sys_hps {EMAC0_PinMuxing} {IO}
set_instance_parameter_value sys_hps {EMAC0_SWITCH_Enable} {0}
set_instance_parameter_value sys_hps {EMAC_PTP_REF_CLK} {100}
set_instance_parameter_value sys_hps {EMIF_BYPASS_CHECK} {0}
set_instance_parameter_value sys_hps {EMIF_CONDUIT_Enable} {1}
set_instance_parameter_value sys_hps {F2SDRAM0_Width} {3}
set_instance_parameter_value sys_hps {F2SDRAM0_ready_latency} {0}
set_instance_parameter_value sys_hps {F2SDRAM_ADDRESS_WIDTH} {32}
set_instance_parameter_value sys_hps {F2SINTERRUPT_Enable} {1}
set_instance_parameter_value sys_hps {GPIO_REF_CLK} {4}
set_instance_parameter_value sys_hps {GPIO_REF_CLK2} {200}
set_instance_parameter_value sys_hps {H2F_COLD_RST_Enable} {1}
set_instance_parameter_value sys_hps {H2F_PENDING_RST_Enable} {1}
set_instance_parameter_value sys_hps {H2F_USER0_CLK_Enable} {1}
set_instance_parameter_value sys_hps {H2F_USER0_CLK_FREQ} {200}
set_instance_parameter_value sys_hps {HPS_BOOT} {1}
set_instance_parameter_value sys_hps {HPS_IO_Enable} $hps_io_list
set_instance_parameter_value sys_hps {IO_OUTPUT_DELAY12} {17}
set_instance_parameter_value sys_hps {L3_MAIN_FREE_CLK} {400}
set_instance_parameter_value sys_hps {L4_SYS_FREE_CLK} {1}
set_instance_parameter_value sys_hps {LWH2F_ADDRESS_WIDTH} {21}
set_instance_parameter_value sys_hps {LWH2F_Enable} {1}
set_instance_parameter_value sys_hps {LWH2F_ready_latency} {0}
set_instance_parameter_value sys_hps {MPU_CLK_VCCL} {1}
set_instance_parameter_value sys_hps {MPU_EVENTS_Enable} {0}
set_instance_parameter_value sys_hps {PSI_CLK_FREQ} {500}
set_instance_parameter_value sys_hps {S2F_ready_latency} {0}
set_instance_parameter_value sys_hps {SDMMC_Mode} {4-bit}
set_instance_parameter_value sys_hps {SDMMC_PinMuxing} {IO}
set_instance_parameter_value sys_hps {SDMMC_REF_CLK} {200}
set_instance_parameter_value sys_hps {I2C1_Mode} {default}
set_instance_parameter_value sys_hps {I2C1_PinMuxing} {IO}
set_instance_parameter_value sys_hps {SPIM0_Mode} {N/A}
set_instance_parameter_value sys_hps {SPIM0_PinMuxing} {Unused}
set_instance_parameter_value sys_hps {SPIM1_Mode} {N/A}
set_instance_parameter_value sys_hps {SPIM1_PinMuxing} {Unused}
set_instance_parameter_value sys_hps {STM_Enable} {1}
set_instance_parameter_value sys_hps {TESTIOCTRL_DEBUGCLKSEL} {16}
set_instance_parameter_value sys_hps {TESTIOCTRL_MAINCLKSEL} {8}
set_instance_parameter_value sys_hps {TESTIOCTRL_PERICLKSEL} {8}
set_instance_parameter_value sys_hps {TEST_Enable} {0}
set_instance_parameter_value sys_hps {TRACE_Mode} {N/A}
set_instance_parameter_value sys_hps {TRACE_PinMuxing} {Unused}
set_instance_parameter_value sys_hps {UART0_Mode} {No_flow_control}
set_instance_parameter_value sys_hps {UART0_PinMuxing} {IO}
set_instance_parameter_value sys_hps {UART1_Mode} {N/A}
set_instance_parameter_value sys_hps {UART1_PinMuxing} {Unused}
set_instance_parameter_value sys_hps {USB0_Mode} {default}
set_instance_parameter_value sys_hps {USB0_PinMuxing} {IO}
set_instance_parameter_value sys_hps {USB1_Mode} {N/A}
set_instance_parameter_value sys_hps {USB1_PinMuxing} {Unused}
set_instance_parameter_value sys_hps {USE_DEFAULT_MPU_CLK} {0}
set_instance_parameter_value sys_hps {W_RESET_ACTION} {0}
set_instance_parameter_value sys_hps {eosc1_clk_mhz} {25.0}
set_instance_parameter_value sys_hps {watchdog_reset} {1}

# add_interface sys_hps_rstn reset source
# set_interface_property sys_hps_rstn EXPORT_OF sys_hps.h2f_cold_rst_n

add_interface sys_hps_io conduit end
set_interface_property sys_hps_io EXPORT_OF sys_hps.hps_io
add_connection sys_clk.clk sys_hps.h2f_lw_axi_clock
add_connection sys_clk.clk_reset sys_hps.h2f_lw_axi_reset
add_connection sys_clk.clk sys_hps.f2h_axi_clock
add_connection sys_clk.clk_reset sys_hps.f2h_axi_reset
add_connection sys_clk.clk sys_hps.h2f_axi_clock
add_connection sys_clk.clk_reset sys_hps.h2f_axi_reset

# common dma interface

add_instance sys_dma_clk clock_source
add_connection sys_clk.clk_reset sys_dma_clk.clk_in_reset
add_connection sys_hps.h2f_user0_clock sys_dma_clk.clk_in
add_connection sys_dma_clk.clk sys_hps.f2sdram0_clock
add_connection sys_dma_clk.clk_reset sys_hps.f2sdram0_reset

# hps ddr4 interface

add_instance sys_hps_ddr4_cntrl altera_emif_s10_hps
set_instance_parameter_value sys_hps_ddr4_cntrl {PROTOCOL_ENUM} {PROTOCOL_DDR4}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_MEM_CLK_FREQ_MHZ} {1066.667}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_DEFAULT_REF_CLK_FREQ} {0}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_REF_CLK_FREQ_MHZ} {133.333}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_BANK_GROUP_WIDTH} {1}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ALERT_N_PLACEMENT_ENUM} {DDR4_ALERT_N_PLACEMENT_DATA_LANES}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_ALERT_N_DQS_GROUP} {0}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_DQ_WIDTH} {72}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_READ_DBI} {1}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TCL} {18}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_WTCL} {16}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_RTT_NOM_ENUM} {DDR4_RTT_NOM_RZQ_4}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_DEFAULT_IO} {0}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_AC_IO_STD_ENUM} {IO_STD_SSTL_12}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_AC_MODE_ENUM} {OUT_OCT_40_CAL}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_CK_IO_STD_ENUM} {IO_STD_SSTL_12}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_CK_MODE_ENUM} {OUT_OCT_40_CAL}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_DATA_IO_STD_ENUM} {IO_STD_POD_12}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_DATA_OUT_MODE_ENUM} {OUT_OCT_40_CAL}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_DATA_IN_MODE_ENUM} {IN_OCT_60_CAL}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_PLL_REF_CLK_IO_STD_ENUM} {IO_STD_LVDS}
set_instance_parameter_value sys_hps_ddr4_cntrl {PHY_DDR4_USER_RZQ_IO_STD_ENUM} {IO_STD_CMOS_12}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_SPEEDBIN_ENUM} {DDR4_SPEEDBIN_2400}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TRCD_NS} {15.00}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TRP_NS} {15.00}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TRRD_S_CYC} {7}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TRRD_L_CYC} {8}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TFAW_NS} {30.0}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TWTR_S_CYC} {3}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_TWTR_L_CYC} {9}
set_instance_parameter_value sys_hps_ddr4_cntrl {MEM_DDR4_LRDIMM_VREFDQ_VALUE} {}
set_instance_parameter_value sys_hps_ddr4_cntrl {DIAG_DDR4_SKIP_CA_LEVEL} {0}
set_instance_parameter_value sys_hps_ddr4_cntrl {SHORT_QSYS_INTERFACE_NAMES} {1}
set_instance_parameter_value sys_hps_ddr4_cntrl {CTRL_DDR4_ECC_EN} {1}

add_connection sys_hps_ddr4_cntrl.hps_emif sys_hps.hps_emif
add_interface sys_hps_ddr conduit end
set_interface_property sys_hps_ddr EXPORT_OF sys_hps_ddr4_cntrl.mem
add_interface sys_hps_ddr_oct conduit end
set_interface_property sys_hps_ddr_oct EXPORT_OF sys_hps_ddr4_cntrl.oct
add_interface sys_hps_ddr_ref_clk clock sink
set_interface_property sys_hps_ddr_ref_clk EXPORT_OF sys_hps_ddr4_cntrl.pll_ref_clk

# cpu/hps handling

proc ad_cpu_interrupt {m_irq m_port} {

  add_connection sys_hps.f2h_irq0 ${m_port}
  set_connection_parameter_value sys_hps.f2h_irq0/${m_port} irqNumber ${m_irq}
}

proc ad_cpu_interconnect {m_base m_port} {

  add_connection sys_hps.h2f_lw_axi_master ${m_port}
  set_connection_parameter_value sys_hps.h2f_lw_axi_master/${m_port} baseAddress ${m_base}
}

proc ad_dma_interconnect {m_port} {

  add_connection ${m_port} sys_hps.f2sdram0_data
  set_connection_parameter_value ${m_port}/sys_hps.f2sdram0_data baseAddress {0x0}
}

# gpio-bd

add_instance sys_gpio_bd altera_avalon_pio
set_instance_parameter_value sys_gpio_bd {direction} {InOut}
set_instance_parameter_value sys_gpio_bd {generateIRQ} {1}
set_instance_parameter_value sys_gpio_bd {width} {32}

add_connection sys_clk.clk sys_gpio_bd.clk
add_connection sys_clk.clk_reset sys_gpio_bd.reset
add_interface sys_gpio_bd conduit end
set_interface_property sys_gpio_bd EXPORT_OF sys_gpio_bd.external_connection

# gpio-in

add_instance sys_gpio_in altera_avalon_pio
set_instance_parameter_value sys_gpio_in {direction} {Input}
set_instance_parameter_value sys_gpio_in {generateIRQ} {1}
set_instance_parameter_value sys_gpio_in {width} {32}

add_connection sys_clk.clk_reset sys_gpio_in.reset
add_connection sys_clk.clk sys_gpio_in.clk
add_interface sys_gpio_in conduit end
set_interface_property sys_gpio_in EXPORT_OF sys_gpio_in.external_connection

# gpio-out

add_instance sys_gpio_out altera_avalon_pio
set_instance_parameter_value sys_gpio_out {direction} {Output}
set_instance_parameter_value sys_gpio_out {generateIRQ} {0}
set_instance_parameter_value sys_gpio_out {width} {32}

add_connection sys_clk.clk_reset sys_gpio_out.reset
add_connection sys_clk.clk sys_gpio_out.clk
add_interface sys_gpio_out conduit end
set_interface_property sys_gpio_out EXPORT_OF sys_gpio_out.external_connection

# spi

add_instance sys_spi altera_avalon_spi
set_instance_parameter_value sys_spi {clockPhase} {0}
set_instance_parameter_value sys_spi {clockPolarity} {0}
set_instance_parameter_value sys_spi {dataWidth} {8}
set_instance_parameter_value sys_spi {masterSPI} {1}
set_instance_parameter_value sys_spi {numberOfSlaves} {8}
set_instance_parameter_value sys_spi {targetClockRate} {10000000.0}

add_connection sys_clk.clk_reset sys_spi.reset
add_connection sys_clk.clk sys_spi.clk
add_interface sys_spi conduit end
set_interface_property sys_spi EXPORT_OF sys_spi.external

# base-addresses

ad_cpu_interconnect 0x000000e0 sys_id.control_slave
ad_cpu_interconnect 0x000000d0 sys_gpio_bd.s1
ad_cpu_interconnect 0x00000000 sys_gpio_in.s1
ad_cpu_interconnect 0x00000020 sys_gpio_out.s1
ad_cpu_interconnect 0x00000040 sys_spi.spi_control_port

# interrupts

ad_cpu_interrupt 5 sys_gpio_in.irq
ad_cpu_interrupt 6 sys_gpio_bd.irq
ad_cpu_interrupt 7 sys_spi.irq

# architecture specific global variables

set xcvr_reconfig_addr_width 11

