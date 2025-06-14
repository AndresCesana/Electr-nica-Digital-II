#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Ejercicios_hechos.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Ejercicios_hechos.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=Ejercicio3.6.asm Ejercicio3.8.asm Ejercicio3.9.asm Ejercicio3.10.asm Ejercicio3.11.asm Ejercicio3.3.asm Ejercicio3.4.asm Ejercicio3.12.asm Ejercicio3.13.asm Ejercicio3.14.asm Ejercicio3.7.asm Ejercicio3.15.asm Ejercicio4.2.asm Ejercicio4.4.asm Ejercicio4.3.asm Ejercicio4.4tabla.asm Ejercicio4.5.asm Ejercicio4.7.asm Parcial1.1.asm Parcial1.2.asm Parcial1.3.asm Ejemplotmr0.asm Ejercicio5.2.asm Ejercicio5.3.asm Prendeapagaled1s.asm Ejercicio5.4.asm Ejercicio5.5.asm Ejercicio5.7.asm Ejercicio7.1.asm Ejercicio7.3.asm Ejercicio7.3_Con_RB0.asm Ejercicio8.1.asm Ejercicio8.2.asm Parcial2.1.asm Parcial2.1teorico.asm Ejercicio8.5.asm Parcial2.2.asm Ejercicios2.2_segundaopcion.asm Parcial2.3.asm Luciana_Luz.asm

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Ejercicio3.6.o ${OBJECTDIR}/Ejercicio3.8.o ${OBJECTDIR}/Ejercicio3.9.o ${OBJECTDIR}/Ejercicio3.10.o ${OBJECTDIR}/Ejercicio3.11.o ${OBJECTDIR}/Ejercicio3.3.o ${OBJECTDIR}/Ejercicio3.4.o ${OBJECTDIR}/Ejercicio3.12.o ${OBJECTDIR}/Ejercicio3.13.o ${OBJECTDIR}/Ejercicio3.14.o ${OBJECTDIR}/Ejercicio3.7.o ${OBJECTDIR}/Ejercicio3.15.o ${OBJECTDIR}/Ejercicio4.2.o ${OBJECTDIR}/Ejercicio4.4.o ${OBJECTDIR}/Ejercicio4.3.o ${OBJECTDIR}/Ejercicio4.4tabla.o ${OBJECTDIR}/Ejercicio4.5.o ${OBJECTDIR}/Ejercicio4.7.o ${OBJECTDIR}/Parcial1.1.o ${OBJECTDIR}/Parcial1.2.o ${OBJECTDIR}/Parcial1.3.o ${OBJECTDIR}/Ejemplotmr0.o ${OBJECTDIR}/Ejercicio5.2.o ${OBJECTDIR}/Ejercicio5.3.o ${OBJECTDIR}/Prendeapagaled1s.o ${OBJECTDIR}/Ejercicio5.4.o ${OBJECTDIR}/Ejercicio5.5.o ${OBJECTDIR}/Ejercicio5.7.o ${OBJECTDIR}/Ejercicio7.1.o ${OBJECTDIR}/Ejercicio7.3.o ${OBJECTDIR}/Ejercicio7.3_Con_RB0.o ${OBJECTDIR}/Ejercicio8.1.o ${OBJECTDIR}/Ejercicio8.2.o ${OBJECTDIR}/Parcial2.1.o ${OBJECTDIR}/Parcial2.1teorico.o ${OBJECTDIR}/Ejercicio8.5.o ${OBJECTDIR}/Parcial2.2.o ${OBJECTDIR}/Ejercicios2.2_segundaopcion.o ${OBJECTDIR}/Parcial2.3.o ${OBJECTDIR}/Luciana_Luz.o
POSSIBLE_DEPFILES=${OBJECTDIR}/Ejercicio3.6.o.d ${OBJECTDIR}/Ejercicio3.8.o.d ${OBJECTDIR}/Ejercicio3.9.o.d ${OBJECTDIR}/Ejercicio3.10.o.d ${OBJECTDIR}/Ejercicio3.11.o.d ${OBJECTDIR}/Ejercicio3.3.o.d ${OBJECTDIR}/Ejercicio3.4.o.d ${OBJECTDIR}/Ejercicio3.12.o.d ${OBJECTDIR}/Ejercicio3.13.o.d ${OBJECTDIR}/Ejercicio3.14.o.d ${OBJECTDIR}/Ejercicio3.7.o.d ${OBJECTDIR}/Ejercicio3.15.o.d ${OBJECTDIR}/Ejercicio4.2.o.d ${OBJECTDIR}/Ejercicio4.4.o.d ${OBJECTDIR}/Ejercicio4.3.o.d ${OBJECTDIR}/Ejercicio4.4tabla.o.d ${OBJECTDIR}/Ejercicio4.5.o.d ${OBJECTDIR}/Ejercicio4.7.o.d ${OBJECTDIR}/Parcial1.1.o.d ${OBJECTDIR}/Parcial1.2.o.d ${OBJECTDIR}/Parcial1.3.o.d ${OBJECTDIR}/Ejemplotmr0.o.d ${OBJECTDIR}/Ejercicio5.2.o.d ${OBJECTDIR}/Ejercicio5.3.o.d ${OBJECTDIR}/Prendeapagaled1s.o.d ${OBJECTDIR}/Ejercicio5.4.o.d ${OBJECTDIR}/Ejercicio5.5.o.d ${OBJECTDIR}/Ejercicio5.7.o.d ${OBJECTDIR}/Ejercicio7.1.o.d ${OBJECTDIR}/Ejercicio7.3.o.d ${OBJECTDIR}/Ejercicio7.3_Con_RB0.o.d ${OBJECTDIR}/Ejercicio8.1.o.d ${OBJECTDIR}/Ejercicio8.2.o.d ${OBJECTDIR}/Parcial2.1.o.d ${OBJECTDIR}/Parcial2.1teorico.o.d ${OBJECTDIR}/Ejercicio8.5.o.d ${OBJECTDIR}/Parcial2.2.o.d ${OBJECTDIR}/Ejercicios2.2_segundaopcion.o.d ${OBJECTDIR}/Parcial2.3.o.d ${OBJECTDIR}/Luciana_Luz.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Ejercicio3.6.o ${OBJECTDIR}/Ejercicio3.8.o ${OBJECTDIR}/Ejercicio3.9.o ${OBJECTDIR}/Ejercicio3.10.o ${OBJECTDIR}/Ejercicio3.11.o ${OBJECTDIR}/Ejercicio3.3.o ${OBJECTDIR}/Ejercicio3.4.o ${OBJECTDIR}/Ejercicio3.12.o ${OBJECTDIR}/Ejercicio3.13.o ${OBJECTDIR}/Ejercicio3.14.o ${OBJECTDIR}/Ejercicio3.7.o ${OBJECTDIR}/Ejercicio3.15.o ${OBJECTDIR}/Ejercicio4.2.o ${OBJECTDIR}/Ejercicio4.4.o ${OBJECTDIR}/Ejercicio4.3.o ${OBJECTDIR}/Ejercicio4.4tabla.o ${OBJECTDIR}/Ejercicio4.5.o ${OBJECTDIR}/Ejercicio4.7.o ${OBJECTDIR}/Parcial1.1.o ${OBJECTDIR}/Parcial1.2.o ${OBJECTDIR}/Parcial1.3.o ${OBJECTDIR}/Ejemplotmr0.o ${OBJECTDIR}/Ejercicio5.2.o ${OBJECTDIR}/Ejercicio5.3.o ${OBJECTDIR}/Prendeapagaled1s.o ${OBJECTDIR}/Ejercicio5.4.o ${OBJECTDIR}/Ejercicio5.5.o ${OBJECTDIR}/Ejercicio5.7.o ${OBJECTDIR}/Ejercicio7.1.o ${OBJECTDIR}/Ejercicio7.3.o ${OBJECTDIR}/Ejercicio7.3_Con_RB0.o ${OBJECTDIR}/Ejercicio8.1.o ${OBJECTDIR}/Ejercicio8.2.o ${OBJECTDIR}/Parcial2.1.o ${OBJECTDIR}/Parcial2.1teorico.o ${OBJECTDIR}/Ejercicio8.5.o ${OBJECTDIR}/Parcial2.2.o ${OBJECTDIR}/Ejercicios2.2_segundaopcion.o ${OBJECTDIR}/Parcial2.3.o ${OBJECTDIR}/Luciana_Luz.o

# Source Files
SOURCEFILES=Ejercicio3.6.asm Ejercicio3.8.asm Ejercicio3.9.asm Ejercicio3.10.asm Ejercicio3.11.asm Ejercicio3.3.asm Ejercicio3.4.asm Ejercicio3.12.asm Ejercicio3.13.asm Ejercicio3.14.asm Ejercicio3.7.asm Ejercicio3.15.asm Ejercicio4.2.asm Ejercicio4.4.asm Ejercicio4.3.asm Ejercicio4.4tabla.asm Ejercicio4.5.asm Ejercicio4.7.asm Parcial1.1.asm Parcial1.2.asm Parcial1.3.asm Ejemplotmr0.asm Ejercicio5.2.asm Ejercicio5.3.asm Prendeapagaled1s.asm Ejercicio5.4.asm Ejercicio5.5.asm Ejercicio5.7.asm Ejercicio7.1.asm Ejercicio7.3.asm Ejercicio7.3_Con_RB0.asm Ejercicio8.1.asm Ejercicio8.2.asm Parcial2.1.asm Parcial2.1teorico.asm Ejercicio8.5.asm Parcial2.2.asm Ejercicios2.2_segundaopcion.asm Parcial2.3.asm Luciana_Luz.asm



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Ejercicios_hechos.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16f887
MP_LINKER_DEBUG_OPTION= 
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/Ejercicio3.6.o: Ejercicio3.6.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.6.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.6.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.6.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.6.lst\" -e\"${OBJECTDIR}/Ejercicio3.6.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.6.o\" \"Ejercicio3.6.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.6.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.6.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.8.o: Ejercicio3.8.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.8.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.8.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.8.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.8.lst\" -e\"${OBJECTDIR}/Ejercicio3.8.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.8.o\" \"Ejercicio3.8.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.8.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.8.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.9.o: Ejercicio3.9.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.9.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.9.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.9.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.9.lst\" -e\"${OBJECTDIR}/Ejercicio3.9.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.9.o\" \"Ejercicio3.9.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.9.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.9.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.10.o: Ejercicio3.10.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.10.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.10.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.10.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.10.lst\" -e\"${OBJECTDIR}/Ejercicio3.10.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.10.o\" \"Ejercicio3.10.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.10.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.10.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.11.o: Ejercicio3.11.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.11.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.11.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.11.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.11.lst\" -e\"${OBJECTDIR}/Ejercicio3.11.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.11.o\" \"Ejercicio3.11.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.11.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.11.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.3.o: Ejercicio3.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.3.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.3.lst\" -e\"${OBJECTDIR}/Ejercicio3.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.3.o\" \"Ejercicio3.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.4.o: Ejercicio3.4.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.4.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.4.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.4.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.4.lst\" -e\"${OBJECTDIR}/Ejercicio3.4.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.4.o\" \"Ejercicio3.4.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.4.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.4.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.12.o: Ejercicio3.12.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.12.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.12.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.12.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.12.lst\" -e\"${OBJECTDIR}/Ejercicio3.12.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.12.o\" \"Ejercicio3.12.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.12.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.12.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.13.o: Ejercicio3.13.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.13.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.13.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.13.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.13.lst\" -e\"${OBJECTDIR}/Ejercicio3.13.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.13.o\" \"Ejercicio3.13.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.13.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.13.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.14.o: Ejercicio3.14.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.14.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.14.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.14.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.14.lst\" -e\"${OBJECTDIR}/Ejercicio3.14.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.14.o\" \"Ejercicio3.14.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.14.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.14.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.7.o: Ejercicio3.7.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.7.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.7.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.7.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.7.lst\" -e\"${OBJECTDIR}/Ejercicio3.7.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.7.o\" \"Ejercicio3.7.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.7.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.7.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.15.o: Ejercicio3.15.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.15.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.15.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.15.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.15.lst\" -e\"${OBJECTDIR}/Ejercicio3.15.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.15.o\" \"Ejercicio3.15.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.15.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.15.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.2.o: Ejercicio4.2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.2.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.2.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.2.lst\" -e\"${OBJECTDIR}/Ejercicio4.2.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.2.o\" \"Ejercicio4.2.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.2.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.2.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.4.o: Ejercicio4.4.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.4.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.4.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.4.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.4.lst\" -e\"${OBJECTDIR}/Ejercicio4.4.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.4.o\" \"Ejercicio4.4.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.4.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.4.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.3.o: Ejercicio4.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.3.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.3.lst\" -e\"${OBJECTDIR}/Ejercicio4.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.3.o\" \"Ejercicio4.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.4tabla.o: Ejercicio4.4tabla.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.4tabla.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.4tabla.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.4tabla.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.4tabla.lst\" -e\"${OBJECTDIR}/Ejercicio4.4tabla.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.4tabla.o\" \"Ejercicio4.4tabla.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.4tabla.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.4tabla.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.5.o: Ejercicio4.5.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.5.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.5.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.5.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.5.lst\" -e\"${OBJECTDIR}/Ejercicio4.5.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.5.o\" \"Ejercicio4.5.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.5.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.5.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.7.o: Ejercicio4.7.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.7.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.7.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.7.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.7.lst\" -e\"${OBJECTDIR}/Ejercicio4.7.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.7.o\" \"Ejercicio4.7.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.7.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.7.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial1.1.o: Parcial1.1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial1.1.o.d 
	@${RM} ${OBJECTDIR}/Parcial1.1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial1.1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial1.1.lst\" -e\"${OBJECTDIR}/Parcial1.1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial1.1.o\" \"Parcial1.1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial1.1.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial1.1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial1.2.o: Parcial1.2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial1.2.o.d 
	@${RM} ${OBJECTDIR}/Parcial1.2.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial1.2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial1.2.lst\" -e\"${OBJECTDIR}/Parcial1.2.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial1.2.o\" \"Parcial1.2.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial1.2.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial1.2.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial1.3.o: Parcial1.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial1.3.o.d 
	@${RM} ${OBJECTDIR}/Parcial1.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial1.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial1.3.lst\" -e\"${OBJECTDIR}/Parcial1.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial1.3.o\" \"Parcial1.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial1.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial1.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejemplotmr0.o: Ejemplotmr0.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejemplotmr0.o.d 
	@${RM} ${OBJECTDIR}/Ejemplotmr0.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejemplotmr0.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejemplotmr0.lst\" -e\"${OBJECTDIR}/Ejemplotmr0.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejemplotmr0.o\" \"Ejemplotmr0.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejemplotmr0.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejemplotmr0.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio5.2.o: Ejercicio5.2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio5.2.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio5.2.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio5.2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio5.2.lst\" -e\"${OBJECTDIR}/Ejercicio5.2.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio5.2.o\" \"Ejercicio5.2.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio5.2.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio5.2.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio5.3.o: Ejercicio5.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio5.3.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio5.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio5.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio5.3.lst\" -e\"${OBJECTDIR}/Ejercicio5.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio5.3.o\" \"Ejercicio5.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio5.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio5.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Prendeapagaled1s.o: Prendeapagaled1s.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Prendeapagaled1s.o.d 
	@${RM} ${OBJECTDIR}/Prendeapagaled1s.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Prendeapagaled1s.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Prendeapagaled1s.lst\" -e\"${OBJECTDIR}/Prendeapagaled1s.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Prendeapagaled1s.o\" \"Prendeapagaled1s.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Prendeapagaled1s.o"
	@${FIXDEPS} "${OBJECTDIR}/Prendeapagaled1s.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio5.4.o: Ejercicio5.4.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio5.4.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio5.4.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio5.4.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio5.4.lst\" -e\"${OBJECTDIR}/Ejercicio5.4.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio5.4.o\" \"Ejercicio5.4.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio5.4.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio5.4.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio5.5.o: Ejercicio5.5.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio5.5.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio5.5.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio5.5.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio5.5.lst\" -e\"${OBJECTDIR}/Ejercicio5.5.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio5.5.o\" \"Ejercicio5.5.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio5.5.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio5.5.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio5.7.o: Ejercicio5.7.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio5.7.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio5.7.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio5.7.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio5.7.lst\" -e\"${OBJECTDIR}/Ejercicio5.7.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio5.7.o\" \"Ejercicio5.7.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio5.7.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio5.7.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio7.1.o: Ejercicio7.1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio7.1.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio7.1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio7.1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio7.1.lst\" -e\"${OBJECTDIR}/Ejercicio7.1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio7.1.o\" \"Ejercicio7.1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio7.1.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio7.1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio7.3.o: Ejercicio7.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio7.3.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio7.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio7.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio7.3.lst\" -e\"${OBJECTDIR}/Ejercicio7.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio7.3.o\" \"Ejercicio7.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio7.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio7.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio7.3_Con_RB0.o: Ejercicio7.3_Con_RB0.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio7.3_Con_RB0.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio7.3_Con_RB0.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio7.3_Con_RB0.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio7.3_Con_RB0.lst\" -e\"${OBJECTDIR}/Ejercicio7.3_Con_RB0.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio7.3_Con_RB0.o\" \"Ejercicio7.3_Con_RB0.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio7.3_Con_RB0.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio7.3_Con_RB0.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio8.1.o: Ejercicio8.1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio8.1.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio8.1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio8.1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio8.1.lst\" -e\"${OBJECTDIR}/Ejercicio8.1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio8.1.o\" \"Ejercicio8.1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio8.1.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio8.1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio8.2.o: Ejercicio8.2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio8.2.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio8.2.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio8.2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio8.2.lst\" -e\"${OBJECTDIR}/Ejercicio8.2.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio8.2.o\" \"Ejercicio8.2.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio8.2.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio8.2.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial2.1.o: Parcial2.1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial2.1.o.d 
	@${RM} ${OBJECTDIR}/Parcial2.1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial2.1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial2.1.lst\" -e\"${OBJECTDIR}/Parcial2.1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial2.1.o\" \"Parcial2.1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial2.1.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial2.1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial2.1teorico.o: Parcial2.1teorico.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial2.1teorico.o.d 
	@${RM} ${OBJECTDIR}/Parcial2.1teorico.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial2.1teorico.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial2.1teorico.lst\" -e\"${OBJECTDIR}/Parcial2.1teorico.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial2.1teorico.o\" \"Parcial2.1teorico.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial2.1teorico.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial2.1teorico.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio8.5.o: Ejercicio8.5.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio8.5.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio8.5.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio8.5.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio8.5.lst\" -e\"${OBJECTDIR}/Ejercicio8.5.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio8.5.o\" \"Ejercicio8.5.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio8.5.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio8.5.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial2.2.o: Parcial2.2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial2.2.o.d 
	@${RM} ${OBJECTDIR}/Parcial2.2.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial2.2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial2.2.lst\" -e\"${OBJECTDIR}/Parcial2.2.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial2.2.o\" \"Parcial2.2.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial2.2.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial2.2.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicios2.2_segundaopcion.o: Ejercicios2.2_segundaopcion.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicios2.2_segundaopcion.o.d 
	@${RM} ${OBJECTDIR}/Ejercicios2.2_segundaopcion.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicios2.2_segundaopcion.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicios2.2_segundaopcion.lst\" -e\"${OBJECTDIR}/Ejercicios2.2_segundaopcion.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicios2.2_segundaopcion.o\" \"Ejercicios2.2_segundaopcion.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicios2.2_segundaopcion.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicios2.2_segundaopcion.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial2.3.o: Parcial2.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial2.3.o.d 
	@${RM} ${OBJECTDIR}/Parcial2.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial2.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial2.3.lst\" -e\"${OBJECTDIR}/Parcial2.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial2.3.o\" \"Parcial2.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial2.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial2.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Luciana_Luz.o: Luciana_Luz.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Luciana_Luz.o.d 
	@${RM} ${OBJECTDIR}/Luciana_Luz.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Luciana_Luz.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Luciana_Luz.lst\" -e\"${OBJECTDIR}/Luciana_Luz.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Luciana_Luz.o\" \"Luciana_Luz.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Luciana_Luz.o"
	@${FIXDEPS} "${OBJECTDIR}/Luciana_Luz.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
else
${OBJECTDIR}/Ejercicio3.6.o: Ejercicio3.6.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.6.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.6.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.6.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.6.lst\" -e\"${OBJECTDIR}/Ejercicio3.6.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.6.o\" \"Ejercicio3.6.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.6.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.6.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.8.o: Ejercicio3.8.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.8.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.8.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.8.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.8.lst\" -e\"${OBJECTDIR}/Ejercicio3.8.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.8.o\" \"Ejercicio3.8.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.8.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.8.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.9.o: Ejercicio3.9.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.9.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.9.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.9.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.9.lst\" -e\"${OBJECTDIR}/Ejercicio3.9.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.9.o\" \"Ejercicio3.9.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.9.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.9.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.10.o: Ejercicio3.10.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.10.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.10.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.10.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.10.lst\" -e\"${OBJECTDIR}/Ejercicio3.10.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.10.o\" \"Ejercicio3.10.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.10.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.10.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.11.o: Ejercicio3.11.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.11.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.11.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.11.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.11.lst\" -e\"${OBJECTDIR}/Ejercicio3.11.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.11.o\" \"Ejercicio3.11.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.11.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.11.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.3.o: Ejercicio3.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.3.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.3.lst\" -e\"${OBJECTDIR}/Ejercicio3.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.3.o\" \"Ejercicio3.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.4.o: Ejercicio3.4.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.4.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.4.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.4.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.4.lst\" -e\"${OBJECTDIR}/Ejercicio3.4.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.4.o\" \"Ejercicio3.4.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.4.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.4.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.12.o: Ejercicio3.12.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.12.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.12.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.12.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.12.lst\" -e\"${OBJECTDIR}/Ejercicio3.12.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.12.o\" \"Ejercicio3.12.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.12.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.12.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.13.o: Ejercicio3.13.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.13.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.13.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.13.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.13.lst\" -e\"${OBJECTDIR}/Ejercicio3.13.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.13.o\" \"Ejercicio3.13.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.13.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.13.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.14.o: Ejercicio3.14.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.14.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.14.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.14.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.14.lst\" -e\"${OBJECTDIR}/Ejercicio3.14.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.14.o\" \"Ejercicio3.14.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.14.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.14.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.7.o: Ejercicio3.7.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.7.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.7.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.7.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.7.lst\" -e\"${OBJECTDIR}/Ejercicio3.7.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.7.o\" \"Ejercicio3.7.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.7.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.7.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio3.15.o: Ejercicio3.15.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio3.15.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio3.15.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio3.15.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio3.15.lst\" -e\"${OBJECTDIR}/Ejercicio3.15.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio3.15.o\" \"Ejercicio3.15.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio3.15.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio3.15.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.2.o: Ejercicio4.2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.2.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.2.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.2.lst\" -e\"${OBJECTDIR}/Ejercicio4.2.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.2.o\" \"Ejercicio4.2.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.2.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.2.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.4.o: Ejercicio4.4.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.4.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.4.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.4.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.4.lst\" -e\"${OBJECTDIR}/Ejercicio4.4.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.4.o\" \"Ejercicio4.4.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.4.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.4.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.3.o: Ejercicio4.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.3.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.3.lst\" -e\"${OBJECTDIR}/Ejercicio4.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.3.o\" \"Ejercicio4.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.4tabla.o: Ejercicio4.4tabla.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.4tabla.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.4tabla.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.4tabla.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.4tabla.lst\" -e\"${OBJECTDIR}/Ejercicio4.4tabla.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.4tabla.o\" \"Ejercicio4.4tabla.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.4tabla.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.4tabla.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.5.o: Ejercicio4.5.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.5.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.5.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.5.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.5.lst\" -e\"${OBJECTDIR}/Ejercicio4.5.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.5.o\" \"Ejercicio4.5.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.5.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.5.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio4.7.o: Ejercicio4.7.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio4.7.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio4.7.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio4.7.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio4.7.lst\" -e\"${OBJECTDIR}/Ejercicio4.7.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio4.7.o\" \"Ejercicio4.7.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio4.7.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio4.7.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial1.1.o: Parcial1.1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial1.1.o.d 
	@${RM} ${OBJECTDIR}/Parcial1.1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial1.1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial1.1.lst\" -e\"${OBJECTDIR}/Parcial1.1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial1.1.o\" \"Parcial1.1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial1.1.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial1.1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial1.2.o: Parcial1.2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial1.2.o.d 
	@${RM} ${OBJECTDIR}/Parcial1.2.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial1.2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial1.2.lst\" -e\"${OBJECTDIR}/Parcial1.2.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial1.2.o\" \"Parcial1.2.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial1.2.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial1.2.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial1.3.o: Parcial1.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial1.3.o.d 
	@${RM} ${OBJECTDIR}/Parcial1.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial1.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial1.3.lst\" -e\"${OBJECTDIR}/Parcial1.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial1.3.o\" \"Parcial1.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial1.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial1.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejemplotmr0.o: Ejemplotmr0.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejemplotmr0.o.d 
	@${RM} ${OBJECTDIR}/Ejemplotmr0.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejemplotmr0.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejemplotmr0.lst\" -e\"${OBJECTDIR}/Ejemplotmr0.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejemplotmr0.o\" \"Ejemplotmr0.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejemplotmr0.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejemplotmr0.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio5.2.o: Ejercicio5.2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio5.2.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio5.2.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio5.2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio5.2.lst\" -e\"${OBJECTDIR}/Ejercicio5.2.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio5.2.o\" \"Ejercicio5.2.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio5.2.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio5.2.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio5.3.o: Ejercicio5.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio5.3.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio5.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio5.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio5.3.lst\" -e\"${OBJECTDIR}/Ejercicio5.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio5.3.o\" \"Ejercicio5.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio5.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio5.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Prendeapagaled1s.o: Prendeapagaled1s.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Prendeapagaled1s.o.d 
	@${RM} ${OBJECTDIR}/Prendeapagaled1s.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Prendeapagaled1s.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Prendeapagaled1s.lst\" -e\"${OBJECTDIR}/Prendeapagaled1s.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Prendeapagaled1s.o\" \"Prendeapagaled1s.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Prendeapagaled1s.o"
	@${FIXDEPS} "${OBJECTDIR}/Prendeapagaled1s.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio5.4.o: Ejercicio5.4.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio5.4.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio5.4.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio5.4.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio5.4.lst\" -e\"${OBJECTDIR}/Ejercicio5.4.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio5.4.o\" \"Ejercicio5.4.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio5.4.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio5.4.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio5.5.o: Ejercicio5.5.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio5.5.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio5.5.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio5.5.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio5.5.lst\" -e\"${OBJECTDIR}/Ejercicio5.5.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio5.5.o\" \"Ejercicio5.5.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio5.5.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio5.5.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio5.7.o: Ejercicio5.7.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio5.7.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio5.7.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio5.7.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio5.7.lst\" -e\"${OBJECTDIR}/Ejercicio5.7.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio5.7.o\" \"Ejercicio5.7.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio5.7.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio5.7.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio7.1.o: Ejercicio7.1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio7.1.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio7.1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio7.1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio7.1.lst\" -e\"${OBJECTDIR}/Ejercicio7.1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio7.1.o\" \"Ejercicio7.1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio7.1.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio7.1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio7.3.o: Ejercicio7.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio7.3.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio7.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio7.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio7.3.lst\" -e\"${OBJECTDIR}/Ejercicio7.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio7.3.o\" \"Ejercicio7.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio7.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio7.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio7.3_Con_RB0.o: Ejercicio7.3_Con_RB0.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio7.3_Con_RB0.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio7.3_Con_RB0.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio7.3_Con_RB0.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio7.3_Con_RB0.lst\" -e\"${OBJECTDIR}/Ejercicio7.3_Con_RB0.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio7.3_Con_RB0.o\" \"Ejercicio7.3_Con_RB0.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio7.3_Con_RB0.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio7.3_Con_RB0.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio8.1.o: Ejercicio8.1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio8.1.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio8.1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio8.1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio8.1.lst\" -e\"${OBJECTDIR}/Ejercicio8.1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio8.1.o\" \"Ejercicio8.1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio8.1.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio8.1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio8.2.o: Ejercicio8.2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio8.2.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio8.2.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio8.2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio8.2.lst\" -e\"${OBJECTDIR}/Ejercicio8.2.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio8.2.o\" \"Ejercicio8.2.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio8.2.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio8.2.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial2.1.o: Parcial2.1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial2.1.o.d 
	@${RM} ${OBJECTDIR}/Parcial2.1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial2.1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial2.1.lst\" -e\"${OBJECTDIR}/Parcial2.1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial2.1.o\" \"Parcial2.1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial2.1.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial2.1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial2.1teorico.o: Parcial2.1teorico.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial2.1teorico.o.d 
	@${RM} ${OBJECTDIR}/Parcial2.1teorico.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial2.1teorico.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial2.1teorico.lst\" -e\"${OBJECTDIR}/Parcial2.1teorico.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial2.1teorico.o\" \"Parcial2.1teorico.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial2.1teorico.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial2.1teorico.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicio8.5.o: Ejercicio8.5.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicio8.5.o.d 
	@${RM} ${OBJECTDIR}/Ejercicio8.5.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicio8.5.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicio8.5.lst\" -e\"${OBJECTDIR}/Ejercicio8.5.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicio8.5.o\" \"Ejercicio8.5.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicio8.5.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicio8.5.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial2.2.o: Parcial2.2.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial2.2.o.d 
	@${RM} ${OBJECTDIR}/Parcial2.2.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial2.2.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial2.2.lst\" -e\"${OBJECTDIR}/Parcial2.2.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial2.2.o\" \"Parcial2.2.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial2.2.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial2.2.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Ejercicios2.2_segundaopcion.o: Ejercicios2.2_segundaopcion.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Ejercicios2.2_segundaopcion.o.d 
	@${RM} ${OBJECTDIR}/Ejercicios2.2_segundaopcion.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Ejercicios2.2_segundaopcion.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Ejercicios2.2_segundaopcion.lst\" -e\"${OBJECTDIR}/Ejercicios2.2_segundaopcion.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Ejercicios2.2_segundaopcion.o\" \"Ejercicios2.2_segundaopcion.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Ejercicios2.2_segundaopcion.o"
	@${FIXDEPS} "${OBJECTDIR}/Ejercicios2.2_segundaopcion.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Parcial2.3.o: Parcial2.3.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Parcial2.3.o.d 
	@${RM} ${OBJECTDIR}/Parcial2.3.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Parcial2.3.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Parcial2.3.lst\" -e\"${OBJECTDIR}/Parcial2.3.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Parcial2.3.o\" \"Parcial2.3.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Parcial2.3.o"
	@${FIXDEPS} "${OBJECTDIR}/Parcial2.3.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Luciana_Luz.o: Luciana_Luz.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Luciana_Luz.o.d 
	@${RM} ${OBJECTDIR}/Luciana_Luz.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Luciana_Luz.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Luciana_Luz.lst\" -e\"${OBJECTDIR}/Luciana_Luz.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Luciana_Luz.o\" \"Luciana_Luz.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Luciana_Luz.o"
	@${FIXDEPS} "${OBJECTDIR}/Luciana_Luz.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Ejercicios_hechos.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w -x -u_DEBUG -z__ICD2RAM=1 -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_SIMULATOR=1 $(MP_LINKER_DEBUG_OPTION) -odist/${CND_CONF}/${IMAGE_TYPE}/Ejercicios_hechos.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/Ejercicios_hechos.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -odist/${CND_CONF}/${IMAGE_TYPE}/Ejercicios_hechos.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
