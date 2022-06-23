-- start_ignore
create schema qp_derived_table;
set search_path to qp_derived_table;
-- This test file contains join intensive queries and when run with ORCA; the
-- optimization time is higher. Hence disable exhaustive join order search for
-- faster run. Also catch any fallbacks to planner.
set optimizer_join_order=query;
set optimizer_trace_fallback=on;
-- end_ignore

create table T0(
	C0 int,
	C1 int,
	C2 int,
	C3 int) distributed by (C0);

create table T1(
	C4 int,
	C5 int,
	C6 int,
	C7 int,
	C8 int,
	C9 int,
	C10 int,
	C11 int,
	C12 int,
	C13 int,
	C14 int) distributed by (C4);

create table T2(
	C15 int,
	C16 int,
	C17 int,
	C18 int,
	C19 int,
	C20 int,
	C21 int,
	C22 int,
	C23 int,
	C24 int,
	C25 int,
	C26 int,
	C27 int,
	C28 int,
	C29 int,
	C30 int,
	C31 int) distributed by (C15);

create table T3(
	C32 int,
	C33 int,
	C34 int,
	C35 int,
	C36 int,
	C37 int,
	C38 int,
	C39 int,
	C40 int,
	C41 int,
	C42 int,
	C43 int,
	C44 int,
	C45 int,
	C46 int,
	C47 int,
	C48 int,
	C49 int,
	C50 int,
	C51 int,
	C52 int) distributed by (C32);

create table T4(
	C53 int,
	C54 int,
	C55 int,
	C56 int,
	C57 int,
	C58 int,
	C59 int,
	C60 int,
	C61 int,
	C62 int,
	C63 int,
	C64 int,
	C65 int) distributed by (C53);

create table T5(
	C66 int,
	C67 int,
	C68 int,
	C69 int,
	C70 int,
	C71 int,
	C72 int,
	C73 int,
	C74 int) distributed by (C66);

create table T6(
	C75 int,
	C76 int,
	C77 int,
	C78 int,
	C79 int,
	C80 int,
	C81 int,
	C82 int,
	C83 int,
	C84 int,
	C85 int,
	C86 int,
	C87 int,
	C88 int) distributed by (C75);

create table T7(
	C89 int,
	C90 int,
	C91 int,
	C92 int,
	C93 int,
	C94 int,
	C95 int,
	C96 int,
	C97 int,
	C98 int,
	C99 int,
	C100 int,
	C101 int,
	C102 int,
	C103 int,
	C104 int,
	C105 int,
	C106 int,
	C107 int,
	C108 int,
	C109 int) distributed by (C89);

create table T8(
	C110 int,
	C111 int,
	C112 int,
	C113 int,
	C114 int,
	C115 int,
	C116 int,
	C117 int,
	C118 int,
	C119 int,
	C120 int,
	C121 int,
	C122 int,
	C123 int,
	C124 int,
	C125 int) distributed by (C110);

create table T9(
	C126 int,
	C127 int,
	C128 int,
	C129 int,
	C130 int,
	C131 int,
	C132 int,
	C133 int,
	C134 int,
	C135 int,
	C136 int,
	C137 int) distributed by (C126);

create table T10(
	C138 int,
	C139 int,
	C140 int,
	C141 int,
	C142 int,
	C143 int,
	C144 int,
	C145 int,
	C146 int,
	C147 int,
	C148 int,
	C149 int,
	C150 int,
	C151 int) distributed by (C138);

create table T11(
	C152 int,
	C153 int,
	C154 int,
	C155 int,
	C156 int) distributed by (C152);

create table T12(
	C157 int,
	C158 int,
	C159 int,
	C160 int,
	C161 int,
	C162 int,
	C163 int) distributed by (C157);

create table T13(
	C164 int,
	C165 int,
	C166 int,
	C167 int,
	C168 int,
	C169 int,
	C170 int,
	C171 int,
	C172 int,
	C173 int,
	C174 int,
	C175 int,
	C176 int,
	C177 int,
	C178 int,
	C179 int) distributed by (C164);

create table T14(
	C180 int,
	C181 int,
	C182 int,
	C183 int,
	C184 int,
	C185 int) distributed by (C180);

create table T15(
	C186 int,
	C187 int,
	C188 int,
	C189 int,
	C190 int,
	C191 int,
	C192 int,
	C193 int,
	C194 int,
	C195 int,
	C196 int,
	C197 int,
	C198 int,
	C199 int) distributed by (C186);

create table T16(
	C200 int,
	C201 int,
	C202 int,
	C203 int,
	C204 int,
	C205 int,
	C206 int) distributed by (C200);

create table T17(
	C207 int,
	C208 int,
	C209 int,
	C210 int,
	C211 int,
	C212 int,
	C213 int,
	C214 int,
	C215 int,
	C216 int,
	C217 int,
	C218 int) distributed by (C207);

create table T18(
	C219 int,
	C220 int,
	C221 int,
	C222 int,
	C223 int,
	C224 int,
	C225 int,
	C226 int,
	C227 int,
	C228 int,
	C229 int) distributed by (C219);

create table T19(
	C230 int,
	C231 int,
	C232 int) distributed by (C230);

create table T20(
	C233 int,
	C234 int,
	C235 int,
	C236 int,
	C237 int,
	C238 int,
	C239 int,
	C240 int,
	C241 int,
	C242 int,
	C243 int,
	C244 int,
	C245 int,
	C246 int) distributed by (C233);

create table T21(
	C247 int,
	C248 int,
	C249 int,
	C250 int,
	C251 int,
	C252 int,
	C253 int,
	C254 int,
	C255 int,
	C256 int,
	C257 int,
	C258 int) distributed by (C247);

create table T22(
	C259 int,
	C260 int,
	C261 int,
	C262 int,
	C263 int,
	C264 int,
	C265 int,
	C266 int,
	C267 int,
	C268 int,
	C269 int) distributed by (C259);

create table T23(
	C270 int,
	C271 int,
	C272 int,
	C273 int,
	C274 int,
	C275 int,
	C276 int,
	C277 int,
	C278 int) distributed by (C270);

create table T24(
	C279 int,
	C280 int,
	C281 int,
	C282 int) distributed by (C279);

create table T25(
	C283 int,
	C284 int,
	C285 int,
	C286 int,
	C287 int,
	C288 int,
	C289 int,
	C290 int,
	C291 int,
	C292 int,
	C293 int,
	C294 int,
	C295 int,
	C296 int) distributed by (C283);

create table T26(
	C297 int,
	C298 int,
	C299 int,
	C300 int,
	C301 int,
	C302 int,
	C303 int,
	C304 int,
	C305 int,
	C306 int,
	C307 int,
	C308 int,
	C309 int,
	C310 int,
	C311 int,
	C312 int,
	C313 int,
	C314 int,
	C315 int,
	C316 int,
	C317 int,
	C318 int) distributed by (C297);

create table T27(
	C319 int,
	C320 int,
	C321 int,
	C322 int,
	C323 int,
	C324 int,
	C325 int,
	C326 int,
	C327 int) distributed by (C319);

create table T28(
	C328 int,
	C329 int,
	C330 int,
	C331 int,
	C332 int,
	C333 int) distributed by (C328);

create table T29(
	C334 int,
	C335 int,
	C336 int,
	C337 int,
	C338 int,
	C339 int,
	C340 int) distributed by (C334);

create table T30(
	C341 int,
	C342 int,
	C343 int) distributed by (C341);

create table T31(
	C344 int,
	C345 int,
	C346 int,
	C347 int,
	C348 int,
	C349 int,
	C350 int,
	C351 int,
	C352 int,
	C353 int,
	C354 int,
	C355 int,
	C356 int,
	C357 int,
	C358 int,
	C359 int,
	C360 int,
	C361 int,
	C362 int,
	C363 int) distributed by (C344);

create table T32(
	C364 int,
	C365 int,
	C366 int,
	C367 int,
	C368 int,
	C369 int,
	C370 int,
	C371 int,
	C372 int,
	C373 int,
	C374 int,
	C375 int,
	C376 int,
	C377 int,
	C378 int,
	C379 int,
	C380 int,
	C381 int,
	C382 int) distributed by (C364);

create table T33(
	C383 int,
	C384 int,
	C385 int,
	C386 int,
	C387 int,
	C388 int,
	C389 int,
	C390 int,
	C391 int,
	C392 int,
	C393 int,
	C394 int,
	C395 int,
	C396 int,
	C397 int,
	C398 int,
	C399 int,
	C400 int,
	C401 int) distributed by (C383);

create table T34(
	C402 int,
	C403 int,
	C404 int,
	C405 int,
	C406 int,
	C407 int,
	C408 int,
	C409 int,
	C410 int) distributed by (C402);

create table T35(
	C411 int,
	C412 int,
	C413 int,
	C414 int,
	C415 int,
	C416 int,
	C417 int,
	C418 int) distributed by (C411);

create table T36(
	C419 int,
	C420 int,
	C421 int,
	C422 int,
	C423 int,
	C424 int,
	C425 int,
	C426 int,
	C427 int,
	C428 int,
	C429 int,
	C430 int,
	C431 int,
	C432 int,
	C433 int,
	C434 int,
	C435 int,
	C436 int,
	C437 int) distributed by (C419);

create table T37(
	C438 int,
	C439 int,
	C440 int) distributed by (C438);

create table T38(
	C441 int,
	C442 int,
	C443 int) distributed by (C441);

create table T39(
	C444 int,
	C445 int,
	C446 int) distributed by (C444);

create table T40(
	C447 int,
	C448 int,
	C449 int,
	C450 int) distributed by (C447);

create table T41(
	C451 int,
	C452 int,
	C453 int,
	C454 int,
	C455 int,
	C456 int,
	C457 int,
	C458 int,
	C459 int,
	C460 int,
	C461 int,
	C462 int,
	C463 int,
	C464 int,
	C465 int,
	C466 int,
	C467 int,
	C468 int,
	C469 int,
	C470 int,
	C471 int,
	C472 int) distributed by (C451);

create table T42(
	C473 int,
	C474 int,
	C475 int,
	C476 int,
	C477 int,
	C478 int,
	C479 int,
	C480 int,
	C481 int,
	C482 int,
	C483 int,
	C484 int,
	C485 int,
	C486 int) distributed by (C473);

create table T43(
	C487 int,
	C488 int,
	C489 int,
	C490 int,
	C491 int,
	C492 int,
	C493 int,
	C494 int,
	C495 int,
	C496 int,
	C497 int,
	C498 int,
	C499 int,
	C500 int,
	C501 int) distributed by (C487);

create table T44(
	C502 int,
	C503 int,
	C504 int,
	C505 int,
	C506 int,
	C507 int,
	C508 int,
	C509 int,
	C510 int,
	C511 int) distributed by (C502);

create table T45(
	C512 int,
	C513 int,
	C514 int,
	C515 int,
	C516 int,
	C517 int,
	C518 int,
	C519 int,
	C520 int,
	C521 int,
	C522 int,
	C523 int,
	C524 int,
	C525 int,
	C526 int,
	C527 int) distributed by (C512);

create table T46(
	C528 int,
	C529 int,
	C530 int,
	C531 int,
	C532 int,
	C533 int,
	C534 int,
	C535 int,
	C536 int,
	C537 int,
	C538 int,
	C539 int,
	C540 int,
	C541 int,
	C542 int,
	C543 int,
	C544 int,
	C545 int,
	C546 int,
	C547 int) distributed by (C528);

create table T47(
	C548 int,
	C549 int,
	C550 int,
	C551 int,
	C552 int,
	C553 int,
	C554 int,
	C555 int,
	C556 int,
	C557 int,
	C558 int,
	C559 int,
	C560 int,
	C561 int,
	C562 int,
	C563 int,
	C564 int,
	C565 int,
	C566 int,
	C567 int) distributed by (C548);

create table T48(
	C568 int,
	C569 int,
	C570 int,
	C571 int,
	C572 int,
	C573 int,
	C574 int,
	C575 int,
	C576 int,
	C577 int,
	C578 int,
	C579 int,
	C580 int,
	C581 int,
	C582 int,
	C583 int,
	C584 int,
	C585 int) distributed by (C568);

create table T49(
	C586 int,
	C587 int,
	C588 int,
	C589 int,
	C590 int,
	C591 int,
	C592 int,
	C593 int,
	C594 int,
	C595 int,
	C596 int,
	C597 int,
	C598 int,
	C599 int) distributed by (C586);

create table T50(
	C600 int,
	C601 int,
	C602 int,
	C603 int,
	C604 int,
	C605 int,
	C606 int,
	C607 int) distributed by (C600);

create table T51(
	C608 int,
	C609 int,
	C610 int,
	C611 int,
	C612 int,
	C613 int,
	C614 int,
	C615 int,
	C616 int,
	C617 int,
	C618 int,
	C619 int,
	C620 int,
	C621 int,
	C622 int,
	C623 int,
	C624 int) distributed by (C608);

create table T52(
	C625 int,
	C626 int,
	C627 int,
	C628 int,
	C629 int,
	C630 int,
	C631 int,
	C632 int,
	C633 int,
	C634 int,
	C635 int) distributed by (C625);

create table T53(
	C636 int,
	C637 int,
	C638 int,
	C639 int,
	C640 int,
	C641 int,
	C642 int,
	C643 int,
	C644 int,
	C645 int,
	C646 int,
	C647 int,
	C648 int,
	C649 int,
	C650 int,
	C651 int,
	C652 int,
	C653 int) distributed by (C636);

create table T54(
	C654 int,
	C655 int,
	C656 int,
	C657 int) distributed by (C654);

create table T55(
	C658 int,
	C659 int,
	C660 int,
	C661 int,
	C662 int,
	C663 int,
	C664 int,
	C665 int,
	C666 int,
	C667 int) distributed by (C658);

create table T56(
	C668 int,
	C669 int,
	C670 int,
	C671 int,
	C672 int,
	C673 int,
	C674 int,
	C675 int,
	C676 int,
	C677 int,
	C678 int,
	C679 int,
	C680 int,
	C681 int) distributed by (C668);

create table T57(
	C682 int,
	C683 int,
	C684 int,
	C685 int,
	C686 int,
	C687 int,
	C688 int,
	C689 int,
	C690 int,
	C691 int,
	C692 int,
	C693 int,
	C694 int,
	C695 int,
	C696 int,
	C697 int) distributed by (C682);

create table T58(
	C698 int,
	C699 int,
	C700 int,
	C701 int,
	C702 int,
	C703 int,
	C704 int,
	C705 int,
	C706 int,
	C707 int,
	C708 int,
	C709 int,
	C710 int,
	C711 int,
	C712 int) distributed by (C698);

create table T59(
	C713 int,
	C714 int,
	C715 int,
	C716 int) distributed by (C713);

create table T60(
	C717 int,
	C718 int,
	C719 int,
	C720 int,
	C721 int,
	C722 int,
	C723 int,
	C724 int) distributed by (C717);

create table T61(
	C725 int,
	C726 int,
	C727 int,
	C728 int,
	C729 int,
	C730 int,
	C731 int,
	C732 int,
	C733 int,
	C734 int,
	C735 int,
	C736 int,
	C737 int,
	C738 int,
	C739 int) distributed by (C725);

create table T62(
	C740 int,
	C741 int,
	C742 int) distributed by (C740);

create table T63(
	C743 int,
	C744 int,
	C745 int,
	C746 int,
	C747 int,
	C748 int,
	C749 int,
	C750 int,
	C751 int,
	C752 int,
	C753 int,
	C754 int,
	C755 int,
	C756 int,
	C757 int,
	C758 int,
	C759 int,
	C760 int,
	C761 int,
	C762 int,
	C763 int) distributed by (C743);

create table T64(
	C764 int,
	C765 int,
	C766 int,
	C767 int,
	C768 int,
	C769 int,
	C770 int,
	C771 int,
	C772 int,
	C773 int,
	C774 int,
	C775 int,
	C776 int,
	C777 int,
	C778 int,
	C779 int,
	C780 int,
	C781 int,
	C782 int) distributed by (C764);

create table T65(
	C783 int,
	C784 int,
	C785 int,
	C786 int,
	C787 int,
	C788 int,
	C789 int,
	C790 int,
	C791 int,
	C792 int,
	C793 int,
	C794 int,
	C795 int,
	C796 int,
	C797 int) distributed by (C783);

create table T66(
	C798 int,
	C799 int,
	C800 int,
	C801 int,
	C802 int,
	C803 int,
	C804 int,
	C805 int,
	C806 int,
	C807 int,
	C808 int) distributed by (C798);

create table T67(
	C809 int,
	C810 int,
	C811 int,
	C812 int,
	C813 int,
	C814 int,
	C815 int,
	C816 int,
	C817 int,
	C818 int,
	C819 int,
	C820 int) distributed by (C809);

create table T68(
	C821 int,
	C822 int,
	C823 int) distributed by (C821);

create table T69(
	C824 int,
	C825 int,
	C826 int,
	C827 int,
	C828 int,
	C829 int,
	C830 int,
	C831 int,
	C832 int,
	C833 int,
	C834 int,
	C835 int,
	C836 int,
	C837 int,
	C838 int) distributed by (C824);

create table T70(
	C839 int,
	C840 int,
	C841 int,
	C842 int,
	C843 int,
	C844 int,
	C845 int,
	C846 int,
	C847 int,
	C848 int,
	C849 int,
	C850 int,
	C851 int,
	C852 int,
	C853 int,
	C854 int,
	C855 int,
	C856 int,
	C857 int,
	C858 int,
	C859 int) distributed by (C839);

create table T71(
	C860 int,
	C861 int,
	C862 int,
	C863 int,
	C864 int,
	C865 int,
	C866 int) distributed by (C860);

create table T72(
	C867 int,
	C868 int,
	C869 int,
	C870 int,
	C871 int,
	C872 int,
	C873 int,
	C874 int,
	C875 int,
	C876 int,
	C877 int,
	C878 int,
	C879 int,
	C880 int,
	C881 int,
	C882 int,
	C883 int,
	C884 int,
	C885 int,
	C886 int,
	C887 int,
	C888 int) distributed by (C867);

create table T73(
	C889 int,
	C890 int,
	C891 int,
	C892 int,
	C893 int,
	C894 int,
	C895 int,
	C896 int,
	C897 int,
	C898 int,
	C899 int,
	C900 int,
	C901 int,
	C902 int,
	C903 int,
	C904 int,
	C905 int,
	C906 int,
	C907 int,
	C908 int,
	C909 int) distributed by (C889);

create table T74(
	C910 int,
	C911 int,
	C912 int,
	C913 int,
	C914 int,
	C915 int,
	C916 int,
	C917 int,
	C918 int,
	C919 int,
	C920 int,
	C921 int,
	C922 int,
	C923 int,
	C924 int,
	C925 int,
	C926 int,
	C927 int,
	C928 int,
	C929 int) distributed by (C910);

create table T75(
	C930 int,
	C931 int,
	C932 int,
	C933 int,
	C934 int,
	C935 int,
	C936 int,
	C937 int) distributed by (C930);

create table T76(
	C938 int,
	C939 int,
	C940 int,
	C941 int,
	C942 int,
	C943 int,
	C944 int,
	C945 int,
	C946 int) distributed by (C938);

create table T77(
	C947 int,
	C948 int,
	C949 int,
	C950 int,
	C951 int,
	C952 int,
	C953 int,
	C954 int,
	C955 int,
	C956 int,
	C957 int,
	C958 int,
	C959 int,
	C960 int,
	C961 int,
	C962 int,
	C963 int,
	C964 int) distributed by (C947);

create table T78(
	C965 int,
	C966 int,
	C967 int,
	C968 int,
	C969 int,
	C970 int,
	C971 int,
	C972 int,
	C973 int,
	C974 int,
	C975 int,
	C976 int,
	C977 int,
	C978 int) distributed by (C965);

create table T79(
	C979 int,
	C980 int,
	C981 int,
	C982 int,
	C983 int,
	C984 int,
	C985 int) distributed by (C979);

create table T80(
	C986 int,
	C987 int,
	C988 int,
	C989 int) distributed by (C986);

create table T81(
	C990 int,
	C991 int,
	C992 int,
	C993 int,
	C994 int) distributed by (C990);

create table T82(
	C995 int,
	C996 int,
	C997 int,
	C998 int,
	C999 int,
	C1000 int) distributed by (C995);

create table T83(
	C1001 int,
	C1002 int,
	C1003 int,
	C1004 int,
	C1005 int,
	C1006 int,
	C1007 int) distributed by (C1001);

create table T84(
	C1008 int,
	C1009 int,
	C1010 int,
	C1011 int,
	C1012 int,
	C1013 int,
	C1014 int,
	C1015 int,
	C1016 int,
	C1017 int,
	C1018 int,
	C1019 int,
	C1020 int,
	C1021 int,
	C1022 int,
	C1023 int,
	C1024 int,
	C1025 int,
	C1026 int,
	C1027 int,
	C1028 int) distributed by (C1008);

create table T85(
	C1029 int,
	C1030 int,
	C1031 int,
	C1032 int,
	C1033 int,
	C1034 int,
	C1035 int,
	C1036 int,
	C1037 int,
	C1038 int,
	C1039 int,
	C1040 int,
	C1041 int,
	C1042 int,
	C1043 int,
	C1044 int,
	C1045 int,
	C1046 int) distributed by (C1029);

create table T86(
	C1047 int,
	C1048 int,
	C1049 int,
	C1050 int,
	C1051 int,
	C1052 int,
	C1053 int,
	C1054 int,
	C1055 int) distributed by (C1047);

create table T87(
	C1056 int,
	C1057 int,
	C1058 int,
	C1059 int,
	C1060 int,
	C1061 int,
	C1062 int,
	C1063 int) distributed by (C1056);

create table T88(
	C1064 int,
	C1065 int,
	C1066 int,
	C1067 int,
	C1068 int,
	C1069 int,
	C1070 int,
	C1071 int,
	C1072 int,
	C1073 int,
	C1074 int,
	C1075 int) distributed by (C1064);

create table T89(
	C1076 int,
	C1077 int,
	C1078 int) distributed by (C1076);

create table T90(
	C1079 int,
	C1080 int,
	C1081 int,
	C1082 int,
	C1083 int,
	C1084 int,
	C1085 int,
	C1086 int,
	C1087 int,
	C1088 int,
	C1089 int,
	C1090 int,
	C1091 int,
	C1092 int) distributed by (C1079);

create table T91(
	C1093 int,
	C1094 int,
	C1095 int,
	C1096 int,
	C1097 int,
	C1098 int,
	C1099 int,
	C1100 int,
	C1101 int,
	C1102 int,
	C1103 int,
	C1104 int,
	C1105 int,
	C1106 int,
	C1107 int,
	C1108 int,
	C1109 int,
	C1110 int,
	C1111 int,
	C1112 int,
	C1113 int,
	C1114 int) distributed by (C1093);

create table T92(
	C1115 int,
	C1116 int,
	C1117 int,
	C1118 int,
	C1119 int,
	C1120 int,
	C1121 int,
	C1122 int,
	C1123 int,
	C1124 int,
	C1125 int,
	C1126 int,
	C1127 int,
	C1128 int,
	C1129 int,
	C1130 int,
	C1131 int,
	C1132 int,
	C1133 int,
	C1134 int,
	C1135 int) distributed by (C1115);

create table T93(
	C1136 int,
	C1137 int,
	C1138 int,
	C1139 int,
	C1140 int,
	C1141 int,
	C1142 int,
	C1143 int,
	C1144 int) distributed by (C1136);

create table T94(
	C1145 int,
	C1146 int,
	C1147 int,
	C1148 int,
	C1149 int,
	C1150 int,
	C1151 int,
	C1152 int,
	C1153 int,
	C1154 int,
	C1155 int,
	C1156 int,
	C1157 int,
	C1158 int,
	C1159 int,
	C1160 int,
	C1161 int,
	C1162 int,
	C1163 int,
	C1164 int,
	C1165 int,
	C1166 int) distributed by (C1145);

create table T95(
	C1167 int,
	C1168 int,
	C1169 int,
	C1170 int,
	C1171 int,
	C1172 int,
	C1173 int,
	C1174 int,
	C1175 int) distributed by (C1167);

create table T96(
	C1176 int,
	C1177 int,
	C1178 int,
	C1179 int,
	C1180 int,
	C1181 int,
	C1182 int,
	C1183 int,
	C1184 int,
	C1185 int,
	C1186 int,
	C1187 int,
	C1188 int,
	C1189 int) distributed by (C1176);

create table T97(
	C1190 int,
	C1191 int,
	C1192 int,
	C1193 int,
	C1194 int,
	C1195 int,
	C1196 int,
	C1197 int,
	C1198 int,
	C1199 int,
	C1200 int) distributed by (C1190);

create table T98(
	C1201 int,
	C1202 int,
	C1203 int) distributed by (C1201);

create table T99(
	C1204 int,
	C1205 int,
	C1206 int,
	C1207 int,
	C1208 int) distributed by (C1204);

INSERT INTO T0 VALUES ( 3, 2, 1, 5 ),( 3, 4, 4, 4 ),( 5, 4, 5, 5 ),( 1, 1, 4, 3 ),( 2, 3, 2, 4 ),( 4, 4, 3, 1 ),( 2, 2, 5, 2 ),( 5, 2, 3, 2 ),( 4, 5, 4, 1 ),( 2, 3, 2, 5 );


INSERT INTO T1 VALUES ( 2, 5, 1, 4, 5, 4, 5, 1, 5, 4, 1 ),( 1, 3, 1, 1, 5, 2, 4, 4, 3, 3, 1 ),( 1, 3, 1, 4, 1, 3, 2, 3, 1, 3, 5 ),( 2, 5, 2, 5, 2, 2, 4, 1, 2, 5, 1 ),( 3, 5, 3, 4, 1, 2, 3, 5, 3, 1, 1 ),( 2, 4, 4, 4, 2, 5, 2, 2, 3, 2, 5 ),( 4, 5, 5, 3, 1, 3, 1, 1, 3, 5, 1 ),( 3, 4, 1, 3, 5, 3, 1, 4, 2, 1, 3 ),( 4, 2, 3, 5, 4, 5, 5, 5, 1, 4, 4 ),( 1, 2, 4, 4, 3, 2, 3, 1, 5, 1, 3 );


INSERT INTO T2 VALUES ( 3, 3, 3, 3, 2, 3, 4, 3, 3, 3, 5, 5, 5, 3, 3, 1, 2 ), ( 1, 5, 1, 2, 1, 4, 4, 1, 1, 4, 5, 1, 2, 5, 1, 1, 5 ), ( 4, 3, 1, 4, 4, 2, 4, 1, 5, 5, 1, 5, 5, 4, 4, 4, 2 ), ( 1, 5, 3, 4, 2, 1, 5, 4, 4, 5, 3, 3, 3, 3, 3, 2, 2 ), ( 3, 5, 3, 2, 3, 3, 1, 2, 1, 1, 5, 4, 5, 5, 1, 3, 2 ), ( 4, 5, 1, 5, 2, 5, 1, 3, 2, 3, 2, 5, 1, 2, 3, 1, 4 ), ( 4, 4, 5, 5, 4, 5, 2, 2, 2, 2, 1, 2, 4, 1, 2, 1, 3 ), ( 4, 1, 3, 5, 1, 1, 4, 3, 1, 3, 5, 5, 2, 3, 2, 4, 2 ), ( 3, 3, 2, 1, 3, 4, 2, 2, 5, 3, 4, 4, 5, 1, 1, 2, 1 ), ( 2, 4, 1, 1, 3, 1, 3, 5, 5, 1, 5, 4, 2, 1, 4, 3, 2 );


INSERT INTO T3 VALUES ( 1, 1, 4, 1, 3, 2, 2, 1, 2, 4, 1, 1, 3, 5, 5, 3, 2, 2, 5, 3, 1 ), ( 5, 1, 1, 1, 1, 5, 1, 2, 3, 3, 2, 4, 3, 3, 3, 2, 1, 3, 2, 2, 5 ), ( 4, 5, 5, 2, 5, 3, 5, 4, 1, 5, 3, 4, 1, 3, 5, 2, 5, 2, 5, 3, 4 ), ( 5, 2, 5, 4, 4, 2, 2, 3, 1, 1, 1, 2, 4, 5, 3, 2, 2, 4, 3, 2, 3 ), ( 4, 1, 5, 5, 4, 1, 4, 1, 1, 2, 1, 2, 5, 5, 1, 1, 4, 1, 3, 3, 1 ), ( 5, 4, 2, 4, 4, 3, 3, 2, 2, 1, 3, 2, 5, 3, 2, 4, 1, 2, 5, 2, 4 ), ( 1, 2, 1, 3, 2, 1, 5, 5, 1, 5, 4, 1, 5, 4, 3, 5, 3, 3, 5, 2, 1 ), ( 2, 2, 2, 2, 2, 5, 3, 2, 1, 2, 3, 5, 3, 1, 2, 1, 4, 1, 3, 1, 5 ), ( 2, 5, 1, 2, 5, 5, 1, 3, 1, 4, 3, 2, 3, 4, 4, 2, 3, 3, 3, 4, 1 ), ( 1, 2, 4, 3, 1, 2, 2, 1, 1, 5, 2, 2, 2, 1, 4, 3, 1, 3, 3, 2, 5 );


INSERT INTO T4 VALUES ( 4, 1, 1, 2, 1, 3, 3, 4, 3, 5, 2, 3, 2 ),( 1, 5, 1, 2, 4, 3, 2, 1, 1, 4, 3, 3, 3 ), ( 3, 4, 1, 4, 1, 3, 1, 5, 4, 1, 4, 2, 3 ), ( 5, 1, 1, 2, 1, 1, 3, 1, 2, 2, 5, 5, 5 ), ( 4, 4, 2, 3, 2, 2, 4, 4, 1, 2, 2, 1, 3 ), ( 5, 4, 3, 1, 1, 4, 3, 4, 4, 5, 4, 3, 4 ), ( 4, 2, 4, 1, 2, 1, 2, 1, 2, 4, 4, 2, 3 ), ( 3, 4, 1, 2, 1, 4, 4, 4, 1, 2, 2, 1, 5 ), ( 3, 2, 5, 4, 4, 1, 1, 5, 5, 4, 3, 5, 5 ), ( 3, 4, 5, 4, 3, 2, 3, 4, 2, 3, 4, 2, 1 );


INSERT INTO T5 VALUES ( 1, 4, 1, 3, 2, 5, 4, 5, 2 ), ( 4, 2, 5, 2, 2, 3, 3, 2, 5 ), ( 4, 3, 5, 4, 3, 4, 5, 1, 2 ), ( 3, 4, 2, 3, 1, 5, 3, 4, 5 ), ( 1, 3, 2, 1, 5, 4, 2, 4, 5 ), ( 2, 1, 3, 2, 1, 3, 5, 5, 4 ), ( 5, 4, 4, 4, 2, 3, 4, 3, 1 ), ( 3, 5, 4, 5, 2, 2, 5, 2, 1 ), ( 5, 4, 5, 5, 2, 3, 1, 4, 4 ), ( 1, 3, 1, 4, 1, 5, 5, 5, 3 );


INSERT INTO T6 VALUES ( 3, 1, 4, 3, 1, 2, 2, 5, 5, 3, 3, 1, 4, 1 ), ( 2, 4, 5, 2, 3, 5, 2, 3, 2, 5, 1, 4, 3, 3 ), ( 2, 5, 4, 4, 1, 2, 2, 2, 2, 3, 2, 2, 3, 3 ), ( 4, 3, 3, 2, 5, 1, 1, 1, 3, 5, 3, 4, 5, 1 ), ( 4, 5, 4, 1, 5, 5, 3, 2, 3, 2, 5, 2, 5, 3 ), ( 3, 3, 1, 3, 1, 5, 1, 4, 5, 5, 3, 5, 4, 1 ), ( 1, 4, 1, 3, 2, 5, 3, 1, 3, 1, 5, 3, 5, 2 ), ( 1, 3, 4, 3, 2, 4, 4, 5, 3, 4, 2, 2, 3, 5 ), ( 2, 4, 5, 1, 2, 4, 1, 2, 2, 5, 1, 1, 1, 3 ), ( 1, 5, 1, 3, 2, 2, 5, 2, 5, 3, 4, 2, 3, 2 );


INSERT INTO T7 VALUES ( 1, 2, 4, 5, 5, 3, 1, 3, 2, 3, 3, 3, 2, 5, 5, 5, 3, 3, 3, 2, 5 ), ( 4, 2, 2, 1, 3, 5, 5, 3, 5, 4, 4, 3, 3, 1, 1, 4, 3, 4, 2, 4, 5 ), ( 2, 2, 1, 3, 5, 5, 5, 2, 1, 2, 1, 5, 5, 4, 2, 1, 4, 4, 5, 3, 5 ), ( 3, 1, 4, 1, 4, 2, 2, 2, 4, 2, 1, 2, 1, 1, 5, 4, 3, 5, 1, 2, 2 ), ( 3, 1, 2, 3, 3, 5, 1, 5, 3, 1, 5, 2, 2, 4, 4, 1, 5, 4, 2, 4, 3 ), ( 2, 1, 4, 1, 5, 4, 4, 1, 2, 1, 3, 4, 2, 4, 5, 5, 4, 1, 4, 5, 3 ), ( 4, 3, 3, 2, 2, 5, 2, 5, 3, 4, 3, 3, 2, 5, 5, 1, 4, 2, 1, 3, 3 ), ( 4, 2, 5, 5, 3, 3, 5, 1, 4, 2, 1, 4, 5, 5, 3, 3, 2, 1, 2, 1, 1 ), ( 5, 5, 5, 1, 1, 4, 5, 3, 1, 2, 5, 5, 2, 2, 3, 1, 3, 2, 5, 2, 4 ), ( 3, 5, 5, 5, 4, 5, 2, 2, 2, 3, 3, 3, 5, 1, 1, 5, 3, 4, 3, 1, 3 );


INSERT INTO T8 VALUES ( 4, 5, 5, 3, 5, 4, 2, 3, 2, 3, 2, 1, 5, 2, 1, 3 ), ( 5, 3, 5, 1, 4, 5, 3, 1, 1, 5, 3, 4, 4, 3, 4, 5 ), ( 2, 5, 1, 1, 5, 5, 1, 3, 5, 5, 3, 1, 4, 5, 4, 4 ), ( 3, 4, 2, 4, 2, 5, 3, 1, 2, 5, 4, 1, 1, 4, 2, 1 ), ( 1, 1, 2, 3, 5, 2, 1, 5, 1, 3, 4, 5, 1, 4, 3, 1 ), ( 4, 1, 1, 5, 2, 1, 3, 5, 5, 5, 3, 5, 2, 4, 4, 5 ), ( 3, 2, 5, 4, 2, 3, 5, 2, 4, 5, 1, 4, 3, 3, 1, 2 ), ( 5, 5, 4, 1, 4, 4, 4, 4, 3, 1, 2, 5, 3, 3, 4, 5 ), ( 1, 5, 3, 5, 1, 5, 1, 1, 2, 3, 3, 1, 4, 1, 2, 3 ), ( 1, 4, 3, 4, 1, 5, 3, 1, 2, 1, 5, 3, 3, 4, 4, 3 );


INSERT INTO T9 VALUES ( 3, 1, 5, 4, 2, 1, 1, 3, 1, 4, 5, 1 ), ( 4, 5, 5, 1, 1, 3, 1, 4, 3, 1, 5, 5 ), ( 4, 4, 4, 2, 2, 1, 1, 4, 2, 1, 2, 2 ), ( 1, 1, 3, 2, 4, 4, 3, 1, 4, 5, 3, 2 ), ( 5, 1, 2, 4, 4, 4, 3, 3, 5, 3, 3, 4 ), ( 3, 4, 3, 4, 2, 2, 3, 1, 3, 4, 3, 4 ), ( 5, 1, 2, 4, 4, 5, 3, 3, 2, 2, 4, 2 ), ( 4, 3, 1, 5, 1, 4, 2, 3, 1, 2, 5, 4 ), ( 5, 3, 2, 1, 4, 5, 5, 4, 1, 4, 3, 1 ), ( 3, 5, 5, 2, 3, 4, 5, 4, 1, 5, 5, 4 );


INSERT INTO T10 VALUES ( 5, 1, 1, 2, 1, 1, 2, 2, 3, 4, 3, 2, 1, 2 ), ( 5, 1, 1, 1, 5, 2, 1, 4, 5, 5, 4, 1, 3, 3 ), ( 2, 4, 5, 2, 4, 3, 1, 1, 1, 1, 2, 4, 3, 1 ), ( 4, 4, 1, 1, 3, 4, 4, 5, 2, 4, 3, 1, 2, 1 ), ( 3, 3, 4, 4, 2, 1, 1, 3, 1, 5, 1, 3, 1, 1 ), ( 5, 1, 3, 3, 4, 4, 2, 4, 1, 4, 3, 2, 5, 3 ), ( 3, 2, 2, 1, 3, 4, 4, 4, 3, 3, 3, 2, 5, 3 ), ( 4, 2, 4, 4, 2, 3, 4, 2, 1, 1, 4, 3, 4, 4 ), ( 1, 2, 4, 2, 3, 4, 3, 1, 2, 3, 4, 5, 1, 5 ), ( 2, 3, 1, 4, 4, 3, 5, 3, 5, 1, 3, 1, 5, 3 );


INSERT INTO T11 VALUES ( 4, 2, 5, 4, 2 ), ( 2, 5, 1, 4, 2 ), ( 2, 5, 5, 2, 2 ), ( 3, 3, 1, 2, 5 ), ( 5, 4, 5, 4, 2 ), ( 5, 1, 1, 1, 4 ), ( 2, 4, 2, 5, 3 ), ( 2, 2, 1, 2, 2 ), ( 1, 4, 4, 5, 2 ), ( 3, 5, 3, 4, 4 );


INSERT INTO T12 VALUES ( 2, 2, 4, 3, 4, 5, 3 ), ( 1, 5, 5, 3, 2, 3, 1 ), ( 4, 1, 1, 2, 4, 4, 1 ), ( 4, 2, 5, 1, 2, 2, 1 ), ( 2, 3, 3, 5, 3, 3, 3 ), ( 2, 4, 1, 2, 5, 1, 5 ), ( 3, 1, 2, 2, 1, 4, 4 ), ( 1, 5, 4, 2, 2, 5, 4 ), ( 1, 4, 3, 4, 3, 3, 4 ), ( 4, 4, 5, 4, 5, 3, 3 );


INSERT INTO T13 VALUES ( 5, 1, 5, 1, 2, 3, 3, 4, 1, 2, 5, 1, 5, 1, 3, 4 ), ( 3, 3, 4, 5, 1, 5, 4, 5, 3, 1, 2, 3, 1, 4, 1, 3 ), ( 2, 2, 1, 1, 2, 1, 1, 4, 2, 4, 4, 5, 4, 5, 2, 2 ), ( 5, 2, 5, 5, 1, 1, 4, 2, 4, 4, 2, 3, 5, 1, 4, 2 ), ( 4, 5, 4, 4, 1, 1, 2, 2, 4, 1, 1, 2, 1, 5, 1, 3 ), ( 4, 5, 4, 1, 3, 4, 3, 1, 3, 1, 3, 1, 5, 1, 1, 2 ), ( 1, 5, 3, 4, 2, 3, 3, 4, 2, 4, 1, 3, 1, 4, 4, 4 ), ( 3, 3, 3, 2, 1, 3, 3, 5, 4, 4, 2, 4, 5, 4, 1, 5 ), ( 1, 3, 5, 3, 4, 2, 1, 5, 1, 3, 5, 3, 5, 5, 5, 1 ), ( 3, 2, 2, 4, 2, 2, 3, 2, 4, 3, 1, 1, 4, 2, 2, 4 );


INSERT INTO T14 VALUES ( 1, 3, 2, 2, 4, 3 ), ( 3, 5, 4, 2, 3, 3 ), ( 2, 5, 3, 4, 3, 3 ), ( 5, 4, 3, 1, 3, 5 ), ( 1, 3, 1, 5, 4, 3 ), ( 2, 2, 5, 2, 3, 2 ), ( 5, 5, 5, 1, 3, 5 ), ( 4, 2, 3, 4, 1, 2 ), ( 2, 3, 1, 3, 2, 5 ), ( 5, 1, 1, 5, 2, 3 );


INSERT INTO T15 VALUES ( 1, 1, 4, 3, 4, 1, 5, 5, 5, 3, 1, 1, 1, 2 ), ( 1, 2, 5, 5, 3, 1, 2, 1, 5, 1, 5, 4, 4, 1 ), ( 5, 4, 1, 3, 5, 3, 5, 2, 2, 2, 2, 1, 3, 1 ), ( 1, 3, 4, 4, 5, 4, 5, 1, 2, 4, 3, 2, 1, 5 ), ( 5, 5, 5, 3, 2, 3, 4, 1, 1, 4, 5, 1, 4, 1 ), ( 2, 4, 2, 3, 3, 3, 4, 2, 5, 1, 5, 3, 4, 2 ), ( 4, 3, 2, 4, 3, 5, 5, 4, 4, 1, 2, 1, 1, 4 ), ( 4, 3, 2, 1, 5, 1, 3, 1, 1, 4, 1, 1, 4, 2 ), ( 4, 4, 1, 4, 5, 4, 5, 3, 2, 2, 1, 3, 3, 2 ), ( 4, 1, 4, 4, 4, 2, 2, 3, 3, 4, 3, 1, 5, 1 );


INSERT INTO T16 VALUES ( 3, 4, 1, 3, 3, 2, 3 ), ( 3, 4, 5, 1, 3, 1, 1 ), ( 5, 3, 3, 1, 3, 1, 4 ), ( 2, 3, 4, 3, 2, 2, 3 ), ( 1, 1, 2, 3, 2, 5, 3 ), ( 4, 5, 1, 3, 3, 3, 3 ), ( 3, 3, 4, 5, 4, 4, 4 ), ( 4, 5, 3, 5, 5, 4, 3 ), ( 1, 1, 5, 4, 1, 1, 1 ), ( 3, 3, 2, 3, 1, 4, 2 );


INSERT INTO T17 VALUES ( 5, 2, 4, 1, 5, 2, 1, 3, 2, 3, 2, 2 ), ( 2, 2, 1, 4, 3, 2, 3, 5, 2, 3, 3, 4 ), ( 1, 4, 4, 5, 5, 4, 5, 3, 4, 5, 5, 2 ), ( 4, 1, 3, 1, 5, 1, 2, 3, 4, 4, 4, 5 ), ( 1, 5, 1, 5, 1, 1, 4, 4, 5, 4, 1, 4 ), ( 2, 2, 5, 2, 2, 5, 2, 5, 3, 1, 3, 1 ), ( 4, 2, 3, 1, 4, 4, 1, 5, 1, 3, 3, 2 ), ( 5, 4, 3, 2, 1, 2, 3, 4, 2, 3, 1, 5 ), ( 5, 4, 1, 2, 4, 1, 3, 3, 4, 2, 1, 3 ), ( 3, 3, 5, 3, 1, 1, 5, 3, 3, 2, 2, 5 );


INSERT INTO T18 VALUES ( 3, 3, 1, 4, 2, 3, 4, 2, 5, 5, 1 ), ( 2, 2, 2, 4, 1, 2, 4, 2, 5, 2, 3 ), ( 2, 3, 2, 4, 3, 1, 5, 3, 1, 1, 1 ), ( 5, 5, 3, 1, 5, 5, 2, 5, 1, 4, 1 ), ( 2, 3, 4, 5, 1, 1, 2, 1, 4, 1, 5 ), ( 1, 4, 3, 5, 1, 1, 1, 2, 3, 1, 1 ), ( 4, 4, 4, 2, 1, 2, 4, 4, 4, 4, 5 ), ( 1, 1, 2, 2, 1, 5, 2, 3, 5, 2, 1 ), ( 5, 3, 3, 2, 1, 2, 2, 4, 4, 4, 4 ), ( 2, 1, 2, 1, 1, 4, 4, 5, 4, 4, 5 );


INSERT INTO T19 VALUES ( 1, 4, 1 ), ( 5, 1, 3 ), ( 5, 5, 2 ), ( 4, 3, 1 ), ( 2, 2, 2 ), ( 1, 5, 4 ), ( 2, 3, 4 ), ( 5, 2, 5 ), ( 1, 1, 5 ), ( 5, 3, 3 );


INSERT INTO T20 VALUES ( 2, 3, 3, 4, 3, 4, 5, 5, 5, 4, 1, 4, 5, 3 ), ( 3, 5, 4, 2, 3, 1, 1, 5, 1, 5, 3, 4, 4, 3 ), ( 4, 3, 1, 4, 2, 3, 1, 4, 5, 2, 3, 2, 3, 5 ), ( 2, 5, 5, 5, 1, 1, 4, 1, 4, 1, 3, 3, 5, 1 ), ( 4, 5, 4, 1, 2, 4, 1, 2, 2, 4, 5, 4, 2, 1 ), ( 4, 3, 1, 1, 4, 1, 4, 4, 5, 5, 5, 4, 2, 5 ), ( 2, 4, 4, 1, 2, 2, 3, 4, 5, 4, 4, 1, 5, 5 ), ( 5, 4, 5, 3, 1, 1, 2, 5, 1, 1, 5, 2, 1, 1 ), ( 2, 4, 5, 4, 4, 4, 1, 5, 4, 4, 3, 5, 3, 4 ), ( 1, 3, 1, 4, 4, 5, 5, 4, 1, 3, 4, 4, 2, 5 );


INSERT INTO T21 VALUES ( 2, 4, 5, 4, 1, 1, 4, 5, 2, 2, 4, 4 ), ( 2, 5, 1, 4, 2, 4, 1, 5, 1, 1, 4, 5 ), ( 4, 1, 4, 1, 1, 3, 4, 2, 2, 1, 1, 1 ), ( 4, 2, 1, 2, 5, 1, 2, 1, 4, 5, 2, 5 ), ( 4, 4, 5, 1, 2, 4, 2, 3, 3, 5, 1, 4 ), ( 2, 4, 1, 5, 2, 2, 5, 1, 5, 5, 3, 4 ), ( 1, 1, 2, 1, 4, 5, 5, 2, 1, 3, 3, 4 ), ( 4, 4, 3, 1, 3, 5, 4, 5, 5, 3, 1, 3 ), ( 5, 5, 2, 5, 5, 4, 5, 4, 3, 4, 1, 5 ), ( 2, 2, 1, 1, 3, 2, 1, 2, 5, 1, 4, 5 );


INSERT INTO T22 VALUES ( 2, 4, 1, 2, 1, 1, 2, 3, 5, 2, 5 ), ( 3, 4, 4, 3, 4, 3, 5, 2, 1, 4, 2 ), ( 1, 5, 3, 5, 1, 5, 2, 2, 4, 5, 5 ), ( 3, 2, 5, 2, 4, 2, 3, 4, 2, 5, 4 ), ( 2, 1, 3, 5, 1, 3, 4, 5, 1, 3, 5 ), ( 2, 5, 4, 3, 5, 3, 1, 2, 2, 3, 2 ), ( 5, 4, 5, 2, 1, 4, 3, 4, 5, 2, 4 ), ( 1, 2, 4, 3, 4, 1, 5, 3, 1, 5, 3 ), ( 4, 4, 2, 4, 3, 2, 3, 2, 5, 3, 3 ), ( 1, 1, 3, 3, 3, 2, 3, 4, 3, 5, 5 );


INSERT INTO T23 VALUES ( 5, 3, 1, 3, 2, 2, 2, 1, 3 ), ( 3, 3, 5, 2, 1, 1, 3, 1, 2 ), ( 2, 4, 3, 5, 1, 3, 3, 4, 1 ), ( 5, 5, 1, 4, 1, 2, 4, 3, 1 ), ( 3, 2, 4, 5, 5, 2, 3, 5, 1 ), ( 3, 5, 2, 2, 5, 1, 1, 5, 2 ), ( 3, 5, 2, 1, 1, 3, 5, 3, 2 ), ( 5, 3, 4, 2, 1, 5, 1, 1, 1 ), ( 5, 5, 3, 4, 1, 4, 1, 4, 3 ), ( 1, 4, 4, 1, 5, 2, 3, 1, 3 );


INSERT INTO T24 VALUES ( 3, 2, 5, 3 ), ( 2, 1, 1, 4 ), ( 1, 4, 4, 3 ), ( 4, 3, 2, 3 ), ( 2, 2, 4, 4 ), ( 3, 4, 4, 2 ), ( 3, 1, 3, 2 ), ( 2, 5, 1, 1 ), ( 2, 5, 2, 3 ), ( 2, 5, 5, 5 );


INSERT INTO T25 VALUES ( 3, 4, 3, 1, 1, 2, 2, 3, 3, 5, 2, 3, 5, 3 ), ( 1, 2, 2, 2, 5, 3, 3, 3, 4, 1, 4, 1, 3, 5 ), ( 4, 3, 4, 5, 5, 5, 4, 2, 5, 5, 2, 3, 1, 3 ), ( 4, 4, 4, 2, 1, 2, 3, 2, 4, 4, 3, 1, 1, 2 ), ( 4, 1, 5, 3, 5, 5, 5, 2, 4, 1, 5, 4, 1, 2 ), ( 2, 5, 2, 2, 4, 5, 5, 5, 5, 3, 1, 5, 4, 4 ), ( 2, 2, 2, 3, 5, 2, 3, 3, 3, 1, 4, 5, 5, 3 ), ( 3, 1, 4, 4, 1, 5, 4, 3, 4, 2, 1, 1, 1, 2 ), ( 2, 3, 5, 1, 4, 3, 4, 5, 5, 4, 1, 3, 1, 1 ), ( 3, 5, 2, 5, 3, 5, 3, 4, 1, 1, 4, 1, 5, 2 );


INSERT INTO T26 VALUES ( 2, 5, 2, 5, 5, 4, 1, 5, 3, 5, 4, 3, 3, 1, 4, 4, 2, 5, 1, 3, 2, 5 ), ( 3, 4, 4, 2, 1, 2, 1, 4, 4, 4, 4, 2, 5, 1, 3, 3, 3, 5, 5, 5, 4, 2 ), ( 3, 1, 1, 1, 3, 2, 3, 1, 3, 3, 4, 1, 3, 5, 1, 5, 1, 1, 2, 2, 4, 4 ), ( 2, 4, 5, 4, 5, 5, 3, 4, 2, 3, 3, 4, 1, 5, 1, 5, 1, 1, 2, 2, 5, 2 ), ( 5, 1, 4, 1, 5, 5, 4, 2, 3, 2, 3, 5, 1, 3, 2, 5, 4, 3, 2, 3, 1, 4 ), ( 3, 4, 1, 5, 2, 5, 4, 2, 3, 5, 3, 2, 2, 1, 2, 4, 2, 2, 4, 3, 5, 4 ), ( 4, 4, 2, 5, 1, 1, 5, 5, 3, 1, 4, 5, 4, 3, 3, 5, 5, 5, 1, 1, 5, 4 ), ( 1, 1, 5, 5, 2, 2, 5, 5, 4, 4, 3, 3, 5, 1, 2, 4, 1, 2, 1, 5, 4, 2 ), ( 1, 3, 2, 4, 1, 3, 5, 5, 1, 2, 4, 4, 1, 1, 3, 1, 4, 1, 4, 2, 2, 1 ), ( 5, 1, 2, 5, 5, 2, 5, 2, 2, 4, 1, 2, 4, 5, 1, 2, 4, 5, 3, 5, 2, 2 );


INSERT INTO T27 VALUES ( 2, 1, 4, 4, 4, 1, 1, 3, 4 ), ( 3, 1, 3, 3, 1, 2, 3, 1, 1 ), ( 5, 2, 1, 2, 4, 5, 3, 3, 5 ), ( 4, 3, 3, 3, 4, 5, 5, 1, 1 ), ( 3, 3, 2, 1, 2, 1, 3, 2, 3 ), ( 3, 3, 2, 4, 3, 2, 3, 5, 5 ), ( 5, 1, 3, 3, 5, 1, 2, 5, 3 ), ( 1, 4, 3, 4, 5, 5, 2, 4, 2 ), ( 5, 4, 1, 3, 5, 5, 3, 1, 4 ), ( 5, 3, 1, 5, 2, 3, 5, 1, 1 );


INSERT INTO T28 VALUES ( 3, 3, 3, 3, 1, 5 ), ( 1, 1, 1, 2, 3, 4 ), ( 2, 3, 4, 2, 3, 5 ), ( 4, 1, 3, 5, 4, 1 ), ( 5, 2, 2, 4, 2, 5 ), ( 2, 5, 5, 2, 3, 3 ), ( 4, 5, 1, 4, 5, 3 ), ( 2, 1, 5, 1, 1, 3 ), ( 5, 2, 3, 2, 3, 2 ), ( 2, 3, 3, 5, 4, 2 );


INSERT INTO T29 VALUES ( 5, 1, 1, 3, 1, 2, 4 ), ( 5, 5, 4, 3, 3, 3, 2 ), ( 5, 1, 3, 2, 1, 5, 4 ), ( 4, 1, 4, 4, 3, 2, 3 ), ( 3, 4, 1, 5, 3, 3, 3 ), ( 2, 5, 4, 3, 5, 3, 4 ), ( 4, 5, 1, 1, 1, 3, 2 ), ( 4, 5, 2, 1, 5, 3, 4 ), ( 4, 5, 2, 1, 5, 3, 1 ), ( 1, 2, 2, 2, 4, 3, 3 );


INSERT INTO T30 VALUES ( 3, 3, 1 ), ( 1, 2, 2 ), ( 3, 3, 1 ), ( 5, 4, 3 ), ( 5, 4, 1 ), ( 3, 4, 3 ), ( 3, 5, 5 ), ( 4, 3, 2 ), ( 4, 5, 4 ), ( 5, 1, 1 );


INSERT INTO T31 VALUES ( 3, 2, 2, 2, 1, 1, 3, 4, 5, 1, 4, 4, 4, 4, 5, 1, 5, 5, 3, 1 ), ( 3, 2, 2, 5, 3, 5, 5, 1, 2, 1, 5, 4, 5, 1, 3, 5, 1, 1, 5, 4 ), ( 2, 3, 3, 4, 3, 5, 1, 1, 3, 4, 1, 5, 4, 3, 1, 5, 3, 2, 5, 3 ), ( 3, 3, 3, 2, 2, 1, 5, 2, 5, 4, 1, 3, 2, 4, 3, 3, 3, 3, 4, 3 ), ( 2, 5, 2, 2, 5, 4, 3, 4, 5, 2, 5, 5, 4, 2, 4, 3, 3, 1, 5, 5 ), ( 5, 1, 2, 1, 1, 3, 5, 3, 1, 2, 3, 1, 5, 3, 2, 3, 3, 1, 3, 1 ), ( 1, 4, 1, 5, 2, 4, 2, 1, 3, 2, 2, 1, 5, 1, 3, 2, 3, 3, 3, 2 ), ( 5, 3, 4, 5, 3, 4, 5, 5, 3, 5, 2, 4, 3, 1, 5, 5, 2, 5, 5, 5 ), ( 3, 1, 3, 5, 2, 1, 2, 4, 3, 1, 3, 4, 1, 2, 1, 1, 4, 2, 2, 5 ), ( 2, 2, 1, 5, 1, 4, 5, 2, 4, 4, 4, 5, 4, 3, 2, 1, 5, 4, 5, 3 );


INSERT INTO T32 VALUES ( 2, 3, 4, 3, 1, 5, 1, 1, 5, 2, 4, 5, 3, 4, 5, 1, 3, 1, 2 ), ( 3, 4, 1, 3, 4, 5, 3, 3, 4, 2, 4, 3, 1, 5, 3, 1, 2, 5, 2 ), ( 4, 2, 1, 3, 3, 2, 5, 4, 2, 4, 2, 2, 2, 1, 2, 4, 1, 1, 5 ), ( 4, 5, 4, 4, 1, 4, 3, 5, 5, 4, 4, 3, 2, 5, 2, 2, 4, 5, 5 ), ( 2, 2, 1, 4, 4, 4, 1, 4, 3, 5, 4, 3, 2, 1, 2, 2, 4, 1, 1 ), ( 4, 2, 2, 1, 1, 1, 5, 4, 1, 5, 3, 3, 1, 3, 3, 3, 2, 1, 5 ), ( 2, 3, 5, 1, 2, 2, 3, 1, 4, 5, 3, 2, 3, 2, 4, 4, 1, 4, 1 ), ( 5, 1, 4, 5, 5, 5, 3, 2, 4, 1, 2, 3, 4, 2, 3, 3, 4, 3, 4 ), ( 4, 1, 5, 3, 5, 2, 2, 1, 4, 2, 4, 3, 5, 3, 4, 2, 3, 2, 1 ), ( 5, 4, 4, 4, 1, 1, 3, 2, 3, 2, 3, 1, 5, 1, 4, 4, 4, 4, 2 );


INSERT INTO T33 VALUES ( 5, 1, 3, 1, 5, 2, 4, 2, 2, 2, 4, 5, 3, 4, 1, 4, 2, 1, 3 ), ( 2, 2, 1, 5, 2, 4, 3, 4, 5, 5, 2, 4, 2, 4, 2, 1, 2, 3, 5 ), ( 1, 3, 2, 3, 5, 3, 2, 2, 5, 5, 5, 1, 4, 1, 5, 2, 4, 2, 4 ), ( 1, 1, 4, 3, 1, 5, 1, 2, 1, 1, 3, 2, 4, 3, 5, 1, 1, 2, 2 ), ( 1, 4, 1, 2, 5, 2, 5, 1, 4, 2, 3, 5, 3, 2, 3, 3, 2, 2, 4 ), ( 4, 2, 5, 3, 4, 4, 3, 2, 1, 2, 1, 3, 3, 3, 5, 4, 2, 1, 4 ), ( 2, 3, 1, 5, 2, 2, 3, 4, 2, 5, 2, 3, 4, 2, 4, 4, 5, 5, 3 ), ( 3, 1, 2, 2, 2, 5, 3, 3, 3, 5, 3, 2, 2, 4, 3, 5, 3, 4, 1 ), ( 2, 5, 5, 3, 1, 2, 4, 3, 3, 4, 1, 4, 3, 2, 5, 3, 2, 1, 1 ), ( 1, 2, 5, 1, 2, 2, 4, 5, 2, 1, 2, 2, 3, 5, 3, 5, 5, 1, 2 );


INSERT INTO T34 VALUES ( 4, 5, 2, 1, 1, 3, 4, 2, 4 ), ( 2, 5, 4, 1, 3, 3, 3, 4, 3 ), ( 5, 3, 4, 1, 5, 4, 4, 1, 5 ), ( 5, 1, 3, 4, 3, 1, 3, 1, 1 ), ( 2, 5, 2, 4, 3, 1, 4, 1, 4 ), ( 5, 1, 4, 3, 4, 2, 2, 3, 3 ), ( 1, 4, 4, 4, 4, 3, 3, 4, 5 ), ( 3, 3, 2, 5, 5, 5, 3, 3, 2 ), ( 4, 4, 3, 5, 4, 1, 4, 5, 4 ), ( 2, 5, 1, 3, 3, 4, 2, 5, 4 );


INSERT INTO T35 VALUES ( 5, 4, 4, 5, 5, 2, 4, 3 ), ( 3, 5, 5, 3, 4, 4, 2, 4 ), ( 5, 3, 1, 1, 3, 1, 2, 4 ), ( 5, 5, 4, 2, 1, 2, 3, 1 ), ( 1, 5, 5, 2, 5, 1, 1, 2 ), ( 2, 1, 5, 5, 4, 1, 1, 3 ), ( 1, 5, 4, 5, 2, 5, 5, 2 ), ( 4, 3, 2, 5, 2, 1, 2, 5 ), ( 4, 4, 4, 4, 4, 2, 1, 4 ), ( 2, 5, 5, 4, 3, 3, 2, 5 );


INSERT INTO T36 VALUES ( 3, 3, 3, 2, 5, 3, 3, 1, 4, 3, 5, 2, 4, 5, 1, 2, 3, 1, 2 ), ( 1, 1, 1, 3, 4, 5, 1, 5, 3, 2, 5, 2, 5, 5, 1, 1, 4, 5, 1 ), ( 1, 4, 5, 4, 5, 1, 5, 3, 3, 3, 5, 3, 2, 5, 1, 4, 5, 4, 2 ), ( 5, 2, 1, 3, 5, 4, 2, 4, 2, 5, 2, 4, 5, 3, 2, 2, 3, 4, 1 ), ( 3, 2, 5, 3, 1, 4, 3, 4, 2, 2, 1, 4, 1, 4, 4, 2, 5, 1, 1 ), ( 1, 2, 5, 2, 5, 4, 3, 4, 1, 5, 5, 1, 4, 5, 5, 1, 1, 4, 1 ), ( 2, 3, 4, 4, 4, 1, 5, 5, 1, 4, 1, 4, 2, 3, 2, 1, 5, 4, 4 ), ( 2, 1, 5, 2, 1, 2, 4, 3, 1, 1, 2, 4, 5, 1, 2, 5, 3, 1, 3 ), ( 1, 5, 2, 3, 4, 1, 4, 2, 5, 1, 4, 4, 4, 2, 2, 5, 2, 2, 2 ), ( 3, 5, 5, 4, 4, 2, 2, 4, 2, 4, 1, 4, 5, 1, 5, 3, 4, 4, 2 );


INSERT INTO T37 VALUES ( 5, 4, 4 ), ( 2, 1, 1 ), ( 3, 2, 2 ), ( 4, 2, 4 ), ( 3, 3, 4 ), ( 1, 5, 5 ), ( 4, 1, 1 ), ( 4, 2, 3 ), ( 1, 3, 3 ), ( 3, 5, 5 );


INSERT INTO T38 VALUES ( 1, 4, 1 ), ( 4, 2, 4 ), ( 5, 3, 4 ), ( 4, 2, 2 ), ( 3, 1, 1 ), ( 4, 3, 1 ), ( 2, 3, 3 ), ( 4, 4, 5 ), ( 2, 2, 5 ), ( 1, 1, 4 );


INSERT INTO T39 VALUES ( 1, 3, 2 ), ( 2, 1, 2 ), ( 5, 5, 4 ), ( 3, 2, 3 ), ( 5, 3, 3 ), ( 5, 5, 3 ), ( 4, 4, 4 ), ( 4, 2, 3 ), ( 1, 1, 3 ), ( 1, 2, 3 );


INSERT INTO T40 VALUES ( 2, 1, 5, 2 ), ( 4, 5, 1, 2 ), ( 1, 4, 1, 4 ), ( 3, 2, 4, 2 ), ( 1, 5, 1, 5 ), ( 2, 5, 3, 5 ), ( 4, 4, 5, 4 ), ( 1, 3, 1, 3 ), ( 2, 5, 2, 4 ), ( 2, 4, 1, 4 );


INSERT INTO T41 VALUES ( 4, 2, 1, 3, 5, 2, 5, 4, 4, 5, 1, 4, 3, 3, 4, 3, 2, 1, 2, 1, 1, 2 ), ( 5, 4, 3, 3, 3, 4, 1, 5, 5, 4, 3, 2, 3, 4, 2, 5, 1, 1, 2, 5, 5, 2 ), ( 4, 4, 3, 2, 4, 2, 4, 2, 1, 1, 4, 1, 1, 1, 5, 2, 5, 3, 1, 2, 4, 4 ), ( 4, 1, 3, 3, 1, 5, 4, 3, 1, 4, 2, 3, 4, 5, 3, 4, 3, 3, 2, 3, 3, 2 ), ( 5, 1, 3, 5, 3, 5, 5, 3, 5, 5, 2, 3, 1, 5, 3, 4, 4, 5, 5, 1, 4, 3 ), ( 1, 5, 3, 4, 5, 5, 3, 2, 3, 5, 2, 3, 4, 3, 1, 2, 5, 3, 4, 4, 1, 2 ), ( 3, 1, 2, 1, 5, 5, 1, 3, 3, 5, 1, 3, 5, 4, 1, 4, 2, 3, 5, 5, 2, 1 ), ( 1, 2, 2, 5, 5, 2, 3, 3, 2, 1, 1, 5, 3, 4, 5, 4, 1, 5, 3, 1, 3, 1 ), ( 4, 3, 3, 3, 3, 5, 1, 5, 3, 4, 5, 4, 2, 1, 4, 3, 5, 5, 3, 3, 5, 3 ), ( 3, 1, 3, 2, 1, 1, 4, 3, 3, 5, 1, 2, 2, 5, 2, 3, 3, 5, 5, 1, 4, 5 );


INSERT INTO T42 VALUES ( 5, 5, 3, 4, 1, 2, 5, 5, 4, 4, 5, 1, 1, 3 ), ( 1, 3, 5, 2, 3, 5, 3, 2, 5, 1, 5, 1, 5, 5 ), ( 3, 5, 1, 5, 4, 3, 5, 5, 2, 2, 3, 4, 4, 2 ), ( 3, 5, 5, 3, 1, 3, 1, 3, 5, 2, 4, 2, 2, 2 ), ( 2, 1, 2, 2, 4, 3, 4, 3, 4, 5, 1, 4, 2, 1 ), ( 2, 4, 4, 5, 1, 3, 5, 1, 5, 5, 1, 3, 1, 4 ), ( 4, 4, 1, 2, 5, 3, 2, 4, 3, 2, 2, 2, 3, 3 ), ( 5, 3, 3, 4, 4, 5, 4, 1, 5, 5, 2, 4, 1, 1 ), ( 2, 2, 1, 4, 4, 1, 3, 4, 2, 4, 4, 4, 2, 3 ), ( 4, 3, 1, 3, 2, 4, 3, 2, 2, 3, 1, 5, 3, 1 );


INSERT INTO T43 VALUES ( 5, 3, 4, 1, 3, 2, 1, 2, 5, 2, 4, 3, 2, 5, 1 ), ( 4, 1, 2, 5, 4, 5, 3, 5, 4, 3, 4, 2, 5, 3, 1 ), ( 5, 3, 3, 1, 5, 3, 2, 1, 5, 5, 3, 5, 1, 4, 4 ), ( 3, 2, 1, 4, 3, 3, 5, 1, 1, 3, 3, 5, 4, 5, 4 ), ( 2, 3, 4, 4, 5, 3, 3, 3, 3, 4, 2, 1, 5, 3, 4 ), ( 3, 5, 5, 3, 4, 1, 4, 4, 4, 5, 2, 3, 1, 3, 1 ), ( 5, 5, 3, 4, 3, 1, 2, 2, 5, 2, 4, 2, 1, 5, 3 ), ( 2, 5, 2, 3, 1, 1, 2, 4, 5, 4, 2, 1, 3, 5, 1 ), ( 2, 4, 3, 3, 1, 1, 3, 1, 5, 4, 5, 1, 2, 5, 1 ), ( 3, 3, 3, 4, 1, 1, 2, 3, 2, 5, 4, 2, 5, 1, 3 );


INSERT INTO T44 VALUES ( 5, 5, 4, 2, 4, 5, 1, 3, 5, 5 ), ( 5, 4, 3, 1, 3, 5, 1, 1, 5, 2 ), ( 1, 3, 4, 2, 4, 1, 4, 5, 1, 5 ), ( 5, 2, 1, 3, 1, 2, 1, 2, 5, 4 ), ( 2, 2, 5, 5, 1, 5, 1, 5, 5, 4 ), ( 5, 3, 4, 1, 1, 1, 4, 5, 1, 3 ), ( 3, 4, 1, 3, 3, 4, 2, 4, 1, 1 ), ( 3, 5, 1, 4, 4, 3, 4, 3, 1, 2 ), ( 1, 2, 2, 5, 3, 5, 5, 5, 4, 2 ), ( 1, 2, 3, 2, 5, 5, 5, 2, 3, 2 );


INSERT INTO T45 VALUES ( 5, 5, 5, 1, 4, 4, 4, 1, 3, 2, 1, 2, 4, 4, 2, 5 ), ( 5, 1, 1, 3, 2, 1, 2, 1, 2, 3, 3, 5, 5, 5, 5, 5 ), ( 1, 2, 5, 3, 4, 4, 3, 3, 5, 4, 5, 2, 2, 3, 4, 5 ), ( 3, 2, 3, 4, 1, 4, 5, 5, 4, 2, 3, 1, 1, 1, 4, 1 ), ( 4, 4, 4, 5, 3, 4, 4, 4, 4, 2, 2, 2, 5, 5, 3, 2 ), ( 2, 2, 1, 5, 3, 5, 4, 4, 4, 2, 3, 3, 1, 2, 3, 2 ), ( 1, 2, 3, 1, 2, 5, 3, 3, 2, 5, 1, 3, 2, 2, 5, 5 ), ( 4, 4, 4, 2, 4, 1, 4, 4, 5, 5, 2, 3, 2, 1, 5, 3 ), ( 2, 4, 2, 1, 5, 5, 3, 5, 1, 2, 2, 5, 3, 4, 3, 3 ), ( 3, 1, 2, 5, 3, 5, 1, 2, 4, 2, 4, 2, 4, 5, 2, 1 );


INSERT INTO T46 VALUES ( 3, 2, 4, 4, 3, 5, 4, 1, 4, 5, 2, 1, 3, 4, 5, 3, 1, 3, 1, 2 ), ( 5, 4, 3, 5, 4, 1, 4, 2, 5, 5, 5, 5, 2, 3, 2, 2, 2, 4, 1, 1 ), ( 4, 1, 4, 2, 2, 2, 3, 1, 2, 5, 1, 3, 3, 2, 5, 1, 1, 1, 1, 3 ), ( 4, 4, 4, 2, 4, 5, 5, 4, 4, 3, 2, 2, 3, 5, 2, 4, 5, 2, 2, 5 ), ( 5, 1, 4, 2, 5, 5, 3, 2, 4, 4, 2, 1, 4, 4, 1, 3, 2, 3, 2, 3 ), ( 5, 1, 1, 2, 4, 2, 2, 2, 2, 5, 3, 5, 4, 1, 3, 4, 2, 1, 2, 2 ), ( 3, 1, 3, 3, 3, 2, 2, 3, 3, 2, 2, 1, 3, 4, 3, 1, 1, 5, 5, 5 ), ( 2, 2, 5, 2, 3, 1, 1, 4, 1, 2, 3, 2, 5, 2, 1, 3, 4, 1, 5, 4 ), ( 5, 4, 4, 2, 3, 4, 1, 4, 4, 5, 1, 3, 5, 2, 1, 3, 1, 2, 5, 4 ), ( 2, 2, 2, 5, 5, 4, 3, 4, 1, 4, 2, 3, 4, 2, 2, 4, 4, 2, 1, 5 );


INSERT INTO T47 VALUES ( 1, 5, 4, 5, 2, 4, 3, 1, 2, 5, 4, 1, 5, 5, 3, 4, 2, 2, 3, 3 ), ( 3, 2, 3, 1, 1, 5, 5, 3, 2, 5, 4, 4, 3, 5, 1, 3, 4, 3, 4, 2 ), ( 5, 5, 1, 2, 3, 3, 5, 4, 3, 1, 3, 1, 4, 3, 2, 3, 1, 1, 5, 5 ), ( 2, 2, 1, 4, 4, 2, 5, 4, 2, 1, 4, 1, 2, 3, 5, 2, 3, 5, 1, 5 ), ( 5, 1, 2, 5, 5, 4, 3, 2, 4, 4, 1, 2, 1, 1, 3, 4, 2, 1, 2, 2 ), ( 4, 1, 5, 5, 2, 4, 1, 5, 3, 5, 5, 3, 4, 1, 4, 4, 4, 4, 2, 3 ), ( 3, 3, 4, 5, 3, 1, 1, 3, 3, 3, 1, 4, 5, 2, 1, 4, 3, 1, 3, 2 ), ( 4, 3, 2, 1, 5, 3, 5, 3, 4, 2, 4, 3, 4, 1, 5, 3, 5, 1, 1, 3 ), ( 4, 5, 5, 2, 3, 1, 2, 2, 5, 5, 3, 4, 5, 2, 1, 1, 2, 5, 1, 5 ), ( 3, 4, 5, 3, 1, 3, 3, 4, 5, 3, 5, 1, 1, 4, 1, 5, 2, 1, 1, 2 );


INSERT INTO T48 VALUES ( 1, 5, 2, 4, 2, 4, 4, 3, 4, 3, 5, 2, 1, 3, 2, 4, 3, 4 ), ( 3, 2, 1, 5, 4, 4, 3, 4, 2, 3, 3, 5, 1, 2, 3, 5, 2, 2 ), ( 3, 4, 4, 4, 1, 3, 2, 4, 2, 2, 5, 4, 5, 4, 5, 4, 1, 4 ), ( 3, 2, 1, 5, 2, 4, 5, 4, 1, 4, 2, 3, 1, 3, 4, 5, 5, 2 ), ( 4, 3, 1, 4, 5, 3, 3, 4, 2, 2, 3, 1, 1, 4, 1, 1, 4, 4 ), ( 4, 2, 3, 4, 3, 3, 3, 4, 4, 3, 1, 1, 3, 5, 3, 4, 3, 1 ), ( 2, 4, 1, 4, 4, 2, 4, 3, 1, 1, 5, 5, 1, 3, 4, 2, 5, 2 ), ( 5, 5, 3, 2, 4, 3, 1, 1, 2, 5, 4, 1, 4, 5, 5, 1, 5, 5 ), ( 1, 2, 3, 2, 4, 4, 4, 3, 5, 3, 5, 1, 1, 1, 3, 4, 4, 5 ), ( 4, 5, 5, 3, 3, 4, 2, 4, 2, 5, 3, 2, 2, 3, 5, 5, 4, 5 );


INSERT INTO T49 VALUES ( 2, 4, 2, 5, 5, 2, 1, 2, 2, 1, 2, 4, 1, 4 ), ( 4, 5, 1, 3, 2, 3, 2, 2, 2, 1, 2, 1, 5, 2 ), ( 3, 3, 2, 2, 2, 4, 1, 4, 4, 2, 3, 4, 5, 3 ), ( 3, 4, 4, 2, 3, 1, 4, 1, 2, 1, 2, 5, 2, 4 ), ( 5, 1, 5, 3, 1, 4, 4, 2, 3, 1, 1, 4, 1, 2 ), ( 1, 2, 5, 5, 3, 3, 4, 4, 2, 1, 1, 5, 2, 5 ), ( 1, 3, 1, 3, 4, 5, 2, 1, 2, 1, 5, 2, 3, 4 ), ( 3, 5, 1, 1, 4, 3, 4, 4, 4, 5, 1, 5, 4, 4 ), ( 5, 1, 1, 3, 2, 4, 1, 3, 4, 4, 4, 4, 4, 2 ), ( 5, 1, 5, 5, 3, 4, 2, 5, 4, 3, 5, 1, 3, 2 );


INSERT INTO T50 VALUES ( 2, 5, 1, 3, 3, 2, 3, 4 ), ( 2, 4, 1, 4, 4, 2, 4, 2 ), ( 1, 4, 3, 2, 2, 3, 5, 1 ), ( 4, 5, 4, 2, 5, 4, 4, 1 ), ( 5, 2, 2, 4, 5, 2, 1, 2 ), ( 3, 5, 4, 3, 1, 4, 1, 1 ), ( 5, 1, 1, 5, 5, 1, 5, 1 ), ( 3, 2, 2, 5, 2, 1, 1, 5 ), ( 2, 4, 2, 5, 4, 3, 4, 4 ), ( 4, 4, 5, 1, 4, 2, 3, 1 );


INSERT INTO T51 VALUES ( 4, 5, 2, 2, 3, 2, 3, 1, 1, 3, 5, 3, 1, 1, 5, 4, 4 ), ( 3, 1, 3, 4, 5, 4, 3, 2, 4, 5, 5, 5, 2, 3, 3, 5, 4 ), ( 4, 1, 2, 5, 5, 4, 4, 1, 1, 3, 3, 5, 2, 2, 4, 5, 5 ), ( 2, 3, 5, 5, 4, 1, 3, 2, 2, 1, 1, 3, 2, 3, 5, 4, 2 ), ( 4, 4, 3, 4, 3, 5, 1, 3, 1, 1, 1, 1, 2, 5, 5, 3, 5 ), ( 4, 2, 3, 1, 1, 1, 5, 2, 3, 3, 4, 5, 5, 5, 3, 2, 1 ), ( 3, 5, 5, 1, 5, 1, 4, 3, 4, 2, 3, 1, 1, 3, 1, 1, 2 ), ( 1, 1, 2, 3, 3, 1, 5, 5, 2, 1, 4, 3, 4, 5, 1, 3, 5 ), ( 1, 1, 3, 2, 5, 2, 2, 1, 5, 3, 1, 3, 3, 1, 3, 3, 4 ), ( 1, 1, 5, 2, 1, 4, 4, 3, 4, 1, 1, 2, 1, 2, 4, 4, 4 );


INSERT INTO T52 VALUES ( 1, 4, 2, 1, 3, 4, 5, 5, 3, 5, 3 ), ( 5, 4, 1, 4, 4, 4, 2, 1, 1, 5, 5 ), ( 4, 3, 2, 2, 3, 4, 2, 3, 5, 5, 4 ), ( 5, 2, 4, 4, 5, 3, 1, 1, 3, 5, 1 ), ( 4, 5, 5, 4, 5, 4, 4, 4, 3, 2, 4 ), ( 1, 3, 5, 2, 1, 1, 2, 3, 3, 4, 5 ), ( 1, 1, 4, 1, 4, 2, 2, 1, 4, 2, 4 ), ( 4, 4, 2, 5, 3, 1, 5, 3, 4, 4, 3 ), ( 3, 4, 1, 4, 2, 2, 5, 1, 3, 1, 5 ), ( 4, 1, 5, 4, 3, 5, 5, 3, 5, 2, 2 );


INSERT INTO T53 VALUES ( 4, 1, 4, 5, 5, 2, 5, 3, 5, 4, 3, 4, 5, 4, 2, 5, 2, 4 ), ( 4, 5, 2, 3, 2, 3, 4, 5, 4, 4, 1, 4, 3, 1, 5, 5, 2, 3 ), ( 2, 3, 1, 2, 3, 4, 5, 3, 4, 3, 5, 3, 1, 3, 1, 3, 1, 5 ), ( 1, 2, 4, 1, 4, 4, 1, 3, 4, 3, 1, 5, 1, 5, 4, 1, 5, 1 ), ( 4, 2, 3, 1, 2, 1, 4, 5, 4, 2, 4, 3, 5, 1, 3, 5, 4, 3 ), ( 4, 3, 4, 5, 1, 5, 2, 2, 5, 1, 1, 2, 3, 4, 4, 1, 2, 1 ), ( 2, 2, 3, 2, 1, 3, 1, 5, 3, 1, 3, 2, 1, 4, 1, 4, 2, 3 ), ( 3, 1, 5, 2, 5, 4, 1, 3, 1, 4, 2, 5, 2, 3, 5, 2, 4, 1 ), ( 4, 5, 3, 3, 2, 3, 5, 1, 2, 1, 5, 1, 4, 4, 4, 1, 3, 4 ), ( 4, 1, 5, 2, 5, 5, 4, 2, 2, 1, 2, 5, 3, 3, 2, 1, 5, 3 );


INSERT INTO T54 VALUES ( 5, 1, 1, 2 ), ( 4, 2, 3, 4 ), ( 5, 3, 3, 5 ), ( 5, 3, 4, 1 ), ( 1, 3, 1, 5 ), ( 1, 3, 2, 1 ), ( 2, 2, 3, 3 ), ( 1, 2, 2, 4 ), ( 5, 2, 1, 3 ), ( 4, 5, 1, 4 );


INSERT INTO T55 VALUES ( 1, 1, 3, 2, 5, 5, 5, 2, 2, 3 ), ( 2, 5, 3, 5, 2, 5, 1, 1, 1, 4 ), ( 5, 2, 3, 5, 3, 1, 5, 3, 3, 2 ), ( 5, 4, 2, 4, 4, 4, 4, 2, 4, 4 ), ( 3, 2, 1, 5, 2, 2, 5, 1, 4, 2 ), ( 1, 5, 1, 4, 2, 1, 4, 1, 5, 5 ), ( 3, 4, 1, 1, 3, 2, 2, 3, 4, 5 ), ( 2, 3, 2, 5, 5, 3, 1, 2, 1, 5 ), ( 4, 4, 1, 3, 2, 4, 5, 4, 4, 4 ), ( 5, 5, 5, 4, 1, 4, 5, 5, 4, 3 );


INSERT INTO T56 VALUES ( 4, 5, 1, 3, 3, 4, 5, 2, 4, 5, 1, 2, 5, 2 ), ( 4, 1, 4, 2, 3, 2, 2, 4, 5, 1, 3, 3, 5, 3 ), ( 3, 5, 4, 2, 5, 3, 1, 2, 2, 3, 5, 4, 4, 5 ), ( 1, 4, 2, 1, 5, 2, 5, 5, 1, 3, 1, 4, 2, 5 ), ( 2, 1, 4, 3, 2, 5, 1, 2, 1, 4, 4, 3, 4, 2 ), ( 4, 1, 2, 1, 2, 4, 3, 5, 5, 1, 3, 5, 2, 1 ), ( 3, 5, 2, 2, 3, 2, 1, 1, 2, 2, 2, 5, 4, 3 ), ( 1, 2, 4, 2, 1, 1, 1, 4, 1, 3, 5, 1, 2, 1 ), ( 4, 1, 3, 2, 1, 5, 5, 4, 1, 1, 3, 2, 3, 2 ), ( 2, 2, 5, 4, 5, 1, 4, 1, 3, 4, 1, 5, 4, 3 );


INSERT INTO T57 VALUES ( 3, 5, 2, 3, 1, 4, 5, 2, 1, 5, 1, 3, 5, 4, 3, 4 ), ( 1, 1, 5, 4, 2, 1, 1, 2, 5, 3, 3, 5, 2, 4, 5, 4 ), ( 2, 1, 3, 4, 1, 3, 3, 2, 5, 2, 3, 4, 5, 1, 4, 1 ), ( 5, 2, 2, 5, 1, 5, 1, 5, 5, 3, 5, 3, 3, 3, 1, 1 ), ( 5, 4, 5, 5, 4, 5, 5, 2, 1, 5, 1, 5, 2, 1, 1, 3 ), ( 2, 4, 2, 2, 2, 1, 5, 5, 4, 3, 3, 3, 3, 5, 4, 3 ), ( 4, 2, 2, 3, 4, 3, 5, 5, 4, 2, 2, 4, 1, 3, 2, 1 ), ( 3, 2, 2, 5, 4, 1, 3, 5, 5, 4, 4, 5, 2, 2, 5, 5 ), ( 3, 3, 2, 5, 1, 1, 3, 2, 3, 1, 5, 1, 4, 5, 2, 4 ), ( 4, 2, 2, 2, 5, 4, 4, 4, 4, 4, 1, 1, 1, 4, 1, 2 );


INSERT INTO T58 VALUES ( 1, 1, 4, 4, 3, 5, 5, 3, 1, 1, 1, 5, 1, 3, 1 ), ( 4, 2, 2, 5, 4, 5, 4, 3, 4, 4, 4, 3, 1, 3, 2 ), ( 1, 5, 3, 5, 4, 3, 5, 2, 3, 3, 5, 1, 3, 2, 5 ), ( 1, 2, 2, 5, 4, 2, 1, 1, 1, 1, 4, 3, 1, 3, 1 ), ( 1, 2, 5, 5, 3, 3, 1, 2, 4, 2, 5, 3, 1, 2, 4 ), ( 3, 4, 4, 4, 2, 5, 4, 3, 1, 2, 3, 2, 5, 2, 4 ), ( 4, 5, 3, 1, 4, 4, 2, 1, 1, 2, 1, 5, 1, 5, 4 ), ( 3, 4, 4, 1, 1, 5, 3, 5, 1, 2, 5, 5, 4, 3, 1 ), ( 3, 3, 3, 5, 2, 3, 1, 5, 5, 4, 4, 2, 2, 2, 4 ), ( 4, 4, 3, 5, 3, 3, 1, 1, 4, 2, 4, 4, 3, 2, 2 );


INSERT INTO T59 VALUES ( 2, 2, 4, 2 ), ( 1, 5, 1, 1 ), ( 1, 4, 1, 2 ), ( 2, 4, 1, 1 ), ( 1, 2, 5, 5 ), ( 3, 3, 4, 5 ), ( 5, 4, 4, 2 ), ( 5, 5, 4, 2 ), ( 2, 1, 3, 2 ), ( 4, 4, 4, 5 );


INSERT INTO T60 VALUES ( 4, 4, 3, 1, 2, 1, 4, 4 ), ( 4, 2, 1, 5, 5, 1, 3, 1 ), ( 5, 4, 5, 2, 5, 5, 2, 2 ), ( 2, 2, 1, 4, 1, 2, 2, 3 ), ( 4, 3, 2, 4, 5, 3, 1, 4 ), ( 4, 4, 3, 5, 5, 4, 4, 1 ), ( 2, 2, 4, 1, 5, 1, 4, 4 ), ( 5, 3, 1, 1, 4, 5, 5, 1 ), ( 3, 4, 2, 1, 1, 3, 2, 4 ), ( 5, 2, 2, 1, 4, 2, 2, 1 );


INSERT INTO T61 VALUES ( 2, 1, 4, 5, 1, 4, 5, 4, 5, 5, 3, 5, 1, 1, 3 ), ( 5, 4, 5, 1, 2, 1, 5, 2, 4, 2, 1, 1, 5, 5, 1 ), ( 3, 4, 2, 2, 3, 2, 3, 1, 4, 4, 2, 2, 2, 2, 2 ), ( 1, 2, 1, 2, 2, 1, 1, 5, 2, 3, 1, 4, 2, 1, 1 ), ( 2, 5, 1, 3, 2, 3, 5, 5, 2, 5, 3, 5, 2, 1, 4 ), ( 4, 2, 2, 4, 3, 1, 3, 3, 1, 2, 2, 4, 3, 3, 4 ), ( 2, 5, 4, 4, 2, 4, 2, 4, 1, 5, 4, 4, 1, 1, 4 ), ( 1, 4, 2, 5, 4, 4, 3, 1, 5, 5, 2, 3, 1, 1, 2 ), ( 3, 5, 4, 4, 4, 3, 2, 4, 3, 2, 3, 4, 5, 1, 5 ), ( 5, 2, 2, 5, 3, 1, 1, 4, 4, 1, 4, 2, 1, 1, 1 );


INSERT INTO T62 VALUES ( 4, 5, 1 ), ( 1, 3, 5 ), ( 3, 1, 1 ), ( 5, 4, 4 ), ( 3, 1, 4 ), ( 3, 5, 1 ), ( 4, 5, 5 ), ( 4, 1, 4 ), ( 4, 5, 1 ), ( 5, 5, 4 );


INSERT INTO T63 VALUES ( 5, 3, 3, 5, 2, 2, 2, 5, 5, 1, 3, 2, 5, 3, 2, 3, 3, 1, 3, 4, 1 ), ( 2, 2, 2, 2, 1, 1, 5, 3, 1, 4, 4, 3, 5, 1, 2, 5, 5, 3, 3, 4, 2 ), ( 1, 4, 4, 2, 1, 4, 5, 2, 5, 1, 4, 5, 5, 3, 1, 2, 4, 4, 3, 2, 1 ), ( 3, 1, 2, 3, 3, 2, 3, 2, 5, 5, 5, 2, 5, 5, 5, 1, 1, 2, 5, 4, 1 ), ( 3, 3, 1, 5, 1, 5, 5, 3, 2, 1, 2, 1, 3, 4, 2, 1, 3, 2, 3, 2, 3 ), ( 2, 1, 5, 3, 2, 4, 1, 4, 3, 2, 3, 3, 2, 1, 4, 5, 4, 4, 3, 2, 2 ), ( 5, 3, 2, 4, 3, 1, 5, 5, 4, 3, 2, 2, 3, 3, 3, 2, 2, 5, 3, 1, 4 ), ( 3, 1, 5, 5, 4, 2, 5, 1, 4, 5, 5, 1, 4, 1, 4, 5, 5, 2, 3, 3, 5 ), ( 1, 4, 3, 5, 2, 3, 2, 3, 4, 2, 2, 3, 2, 5, 2, 5, 4, 5, 1, 2, 1 ), ( 4, 5, 3, 4, 3, 2, 3, 2, 3, 3, 3, 5, 1, 3, 4, 3, 1, 4, 5, 5, 3 );


INSERT INTO T64 VALUES ( 2, 1, 5, 3, 3, 4, 5, 2, 2, 2, 3, 1, 1, 1, 3, 5, 3, 3, 2 ), ( 3, 4, 3, 5, 2, 1, 3, 4, 2, 4, 2, 4, 5, 4, 3, 3, 1, 3, 1 ), ( 4, 2, 1, 4, 1, 1, 3, 3, 3, 5, 5, 1, 4, 5, 5, 5, 4, 3, 2 ), ( 3, 1, 2, 5, 2, 2, 5, 2, 4, 2, 1, 2, 3, 3, 1, 3, 1, 2, 3 ), ( 2, 4, 1, 1, 4, 5, 1, 5, 2, 5, 1, 3, 4, 5, 5, 3, 2, 2, 5 ), ( 5, 2, 5, 4, 3, 3, 3, 3, 5, 4, 1, 3, 2, 2, 1, 1, 5, 3, 5 ), ( 4, 4, 5, 1, 2, 3, 3, 5, 2, 1, 5, 4, 2, 3, 1, 1, 1, 1, 1 ), ( 1, 1, 2, 3, 4, 2, 2, 1, 3, 5, 5, 1, 1, 1, 2, 1, 2, 1, 5 ), ( 3, 5, 5, 1, 1, 5, 2, 3, 2, 2, 5, 2, 1, 2, 4, 1, 2, 4, 1 ), ( 5, 5, 2, 1, 1, 4, 3, 4, 3, 3, 2, 3, 1, 5, 2, 5, 2, 2, 4 );


INSERT INTO T65 VALUES ( 1, 4, 3, 3, 5, 1, 1, 2, 5, 5, 5, 4, 5, 2, 4 ), ( 2, 5, 3, 3, 3, 3, 5, 4, 4, 1, 2, 5, 5, 5, 4 ), ( 3, 3, 1, 2, 3, 2, 4, 3, 2, 2, 5, 5, 5, 5, 3 ), ( 1, 5, 5, 3, 3, 1, 2, 2, 1, 5, 1, 1, 2, 4, 5 ), ( 4, 4, 5, 3, 3, 4, 2, 2, 5, 4, 4, 2, 2, 5, 1 ), ( 5, 1, 1, 1, 3, 1, 2, 2, 5, 1, 1, 4, 1, 4, 2 ), ( 3, 5, 4, 5, 1, 4, 3, 1, 4, 3, 3, 1, 3, 1, 4 ), ( 1, 1, 5, 1, 2, 1, 3, 1, 4, 5, 2, 3, 1, 2, 3 ), ( 3, 5, 3, 4, 3, 5, 5, 4, 4, 1, 5, 4, 2, 4, 4 ), ( 5, 3, 3, 2, 2, 3, 1, 5, 2, 1, 4, 5, 5, 4, 2 );


INSERT INTO T66 VALUES ( 4, 3, 4, 3, 4, 5, 5, 4, 4, 1, 4 ), ( 4, 5, 5, 2, 1, 5, 2, 1, 3, 2, 2 ), ( 2, 3, 1, 4, 4, 3, 5, 5, 3, 1, 3 ), ( 5, 1, 2, 1, 2, 3, 5, 4, 4, 2, 3 ), ( 3, 4, 5, 3, 5, 4, 1, 2, 3, 2, 4 ), ( 1, 4, 3, 4, 4, 2, 2, 2, 4, 4, 2 ), ( 5, 3, 3, 5, 2, 4, 4, 2, 5, 3, 5 ), ( 4, 3, 1, 1, 3, 1, 1, 2, 2, 5, 1 ), ( 5, 2, 1, 2, 2, 1, 4, 4, 1, 3, 1 ), ( 3, 4, 4, 2, 1, 4, 4, 1, 2, 4, 3 );


INSERT INTO T67 VALUES ( 4, 5, 5, 3, 5, 4, 2, 2, 5, 5, 4, 4 ), ( 2, 2, 2, 3, 2, 5, 5, 4, 2, 1, 4, 4 ), ( 1, 4, 3, 2, 5, 4, 2, 4, 5, 5, 1, 5 ), ( 3, 2, 3, 2, 2, 3, 3, 2, 4, 2, 5, 2 ), ( 2, 4, 5, 3, 2, 4, 5, 3, 3, 1, 1, 3 ), ( 5, 3, 1, 1, 5, 3, 3, 1, 4, 2, 4, 4 ), ( 5, 3, 3, 5, 2, 1, 2, 5, 2, 1, 3, 5 ), ( 1, 3, 1, 4, 2, 3, 2, 5, 5, 5, 5, 2 ), ( 4, 2, 3, 2, 2, 4, 4, 3, 2, 1, 2, 5 ), ( 4, 2, 1, 3, 5, 2, 1, 2, 1, 5, 5, 1 );


INSERT INTO T68 VALUES ( 1, 2, 4 ), ( 5, 5, 3 ), ( 3, 3, 3 ), ( 5, 5, 3 ), ( 3, 5, 2 ), ( 5, 2, 3 ), ( 1, 3, 1 ), ( 5, 3, 2 ), ( 5, 4, 5 ), ( 2, 2, 2 );


INSERT INTO T69 VALUES ( 5, 4, 2, 3, 1, 1, 5, 3, 3, 1, 5, 4, 1, 3, 3 ), ( 3, 1, 3, 4, 5, 1, 2, 5, 2, 1, 3, 1, 5, 4, 5 ), ( 2, 5, 4, 4, 1, 3, 1, 4, 2, 3, 5, 2, 4, 1, 3 ), ( 1, 1, 4, 3, 4, 2, 3, 5, 5, 2, 2, 1, 4, 5, 1 ), ( 1, 3, 5, 2, 5, 5, 3, 1, 3, 2, 5, 4, 4, 3, 5 ), ( 5, 4, 5, 5, 1, 5, 2, 2, 5, 1, 3, 5, 2, 2, 5 ), ( 3, 2, 5, 4, 1, 1, 1, 3, 3, 3, 1, 4, 1, 3, 2 ), ( 3, 5, 1, 5, 5, 1, 1, 3, 2, 1, 4, 4, 4, 2, 4 ), ( 4, 4, 2, 5, 5, 4, 4, 1, 1, 5, 2, 3, 5, 4, 5 ), ( 1, 4, 4, 1, 4, 1, 1, 5, 2, 2, 1, 5, 2, 5, 3 );


INSERT INTO T70 VALUES ( 3, 4, 4, 5, 4, 4, 1, 3, 3, 4, 4, 1, 5, 5, 4, 5, 3, 5, 2, 3, 4 ), ( 1, 3, 3, 5, 3, 2, 3, 1, 1, 2, 1, 4, 1, 1, 1, 5, 2, 4, 4, 5, 3 ), ( 3, 3, 5, 5, 2, 4, 5, 2, 4, 4, 1, 1, 2, 1, 5, 5, 5, 3, 4, 3, 1 ), ( 2, 3, 2, 2, 4, 1, 1, 1, 5, 4, 3, 4, 5, 1, 2, 4, 4, 5, 5, 1, 5 ), ( 4, 5, 2, 1, 2, 4, 2, 1, 1, 1, 2, 4, 3, 1, 5, 4, 2, 2, 1, 3, 4 ), ( 5, 1, 2, 5, 2, 2, 3, 2, 1, 1, 5, 5, 4, 1, 1, 2, 1, 5, 5, 2, 5 ), ( 4, 1, 5, 2, 5, 4, 4, 1, 4, 4, 2, 1, 3, 5, 2, 2, 4, 2, 4, 1, 1 ), ( 5, 3, 1, 5, 5, 5, 5, 2, 3, 2, 3, 5, 2, 2, 4, 5, 2, 4, 3, 4, 2 ), ( 4, 5, 2, 1, 3, 5, 5, 5, 1, 1, 5, 1, 4, 1, 3, 5, 5, 1, 2, 2, 3 ), ( 2, 2, 2, 1, 3, 3, 1, 2, 5, 3, 2, 3, 1, 3, 2, 3, 4, 5, 2, 2, 3 );


INSERT INTO T71 VALUES ( 4, 1, 2, 3, 4, 1, 5 ), ( 5, 3, 1, 4, 2, 3, 5 ), ( 4, 1, 5, 5, 2, 2, 2 ), ( 3, 3, 1, 5, 1, 3, 3 ), ( 4, 3, 5, 2, 3, 5, 1 ), ( 3, 5, 3, 4, 5, 2, 3 ), ( 1, 4, 5, 4, 4, 2, 4 ), ( 5, 5, 4, 5, 3, 4, 1 ), ( 1, 3, 2, 4, 4, 5, 1 ), ( 4, 2, 3, 2, 2, 1, 2 );


INSERT INTO T72 VALUES ( 2, 1, 4, 2, 4, 1, 2, 5, 1, 1, 1, 2, 3, 4, 2, 5, 3, 1, 5, 5, 4, 3 ), ( 4, 1, 4, 2, 3, 4, 2, 2, 2, 2, 2, 5, 1, 3, 4, 3, 2, 3, 3, 2, 3, 5 ), ( 1, 4, 1, 2, 5, 5, 5, 1, 2, 5, 1, 3, 2, 1, 1, 2, 1, 5, 2, 4, 4, 4 ), ( 5, 3, 5, 3, 3, 1, 4, 3, 4, 4, 2, 2, 2, 4, 2, 5, 1, 5, 3, 1, 5, 1 ), ( 2, 5, 4, 4, 2, 3, 3, 4, 1, 1, 3, 2, 4, 1, 4, 3, 2, 2, 2, 1, 1, 2 ), ( 3, 4, 3, 5, 3, 1, 4, 3, 2, 4, 5, 4, 4, 4, 3, 4, 3, 2, 4, 4, 3, 5 ), ( 3, 5, 4, 5, 2, 5, 1, 2, 1, 1, 4, 1, 1, 1, 1, 3, 4, 2, 1, 2, 5, 4 ), ( 3, 3, 2, 2, 5, 4, 2, 3, 4, 5, 4, 1, 1, 2, 4, 5, 2, 2, 3, 4, 4, 2 ), ( 5, 2, 2, 5, 3, 4, 4, 3, 2, 4, 2, 1, 1, 5, 3, 5, 5, 1, 1, 3, 2, 4 ), ( 1, 1, 5, 3, 1, 1, 3, 1, 3, 4, 3, 3, 1, 1, 3, 1, 1, 2, 4, 4, 2, 3 );


INSERT INTO T73 VALUES ( 5, 4, 1, 2, 3, 1, 4, 1, 2, 2, 5, 3, 3, 3, 1, 2, 4, 3, 2, 1, 4 ), ( 2, 4, 1, 3, 1, 2, 2, 3, 4, 5, 1, 1, 4, 4, 1, 3, 3, 2, 5, 5, 2 ), ( 1, 3, 4, 2, 2, 3, 1, 5, 1, 1, 5, 3, 4, 5, 4, 2, 2, 1, 4, 5, 5 ), ( 3, 3, 3, 5, 1, 1, 4, 5, 5, 2, 1, 2, 4, 3, 3, 5, 5, 5, 4, 1, 1 ), ( 3, 1, 2, 3, 5, 2, 4, 3, 5, 2, 4, 4, 5, 3, 5, 4, 3, 2, 5, 4, 4 ), ( 4, 5, 5, 2, 3, 1, 5, 3, 3, 4, 1, 3, 5, 2, 3, 1, 4, 2, 3, 1, 2 ), ( 2, 2, 4, 4, 5, 2, 2, 1, 5, 4, 5, 2, 4, 5, 5, 1, 3, 3, 4, 5, 4 ), ( 1, 3, 5, 4, 5, 3, 4, 2, 4, 1, 2, 5, 5, 4, 3, 3, 4, 3, 5, 1, 4 ), ( 5, 4, 5, 2, 2, 1, 4, 3, 5, 2, 3, 3, 3, 1, 2, 4, 3, 3, 2, 1, 5 ), ( 5, 5, 4, 2, 1, 1, 5, 1, 5, 3, 4, 4, 1, 5, 5, 5, 2, 4, 5, 4, 2 );


INSERT INTO T74 VALUES ( 3, 5, 5, 4, 3, 3, 5, 5, 5, 3, 3, 4, 5, 5, 2, 5, 1, 5, 4, 3 ), ( 2, 2, 2, 1, 4, 5, 1, 5, 4, 1, 4, 1, 4, 1, 5, 3, 1, 1, 5, 1 ), ( 5, 4, 3, 3, 5, 4, 2, 5, 5, 1, 4, 1, 2, 2, 3, 5, 4, 2, 3, 5 ), ( 2, 4, 2, 3, 1, 4, 2, 1, 5, 4, 4, 3, 3, 1, 4, 3, 2, 4, 5, 1 ), ( 4, 2, 2, 4, 3, 4, 4, 1, 5, 1, 1, 2, 4, 1, 3, 1, 3, 3, 2, 1 ), ( 3, 3, 1, 3, 1, 3, 4, 4, 1, 3, 5, 5, 1, 2, 2, 5, 1, 2, 4, 2 ), ( 1, 2, 4, 5, 4, 2, 3, 4, 5, 2, 2, 1, 1, 5, 4, 4, 2, 4, 4, 1 ), ( 3, 1, 3, 1, 2, 4, 1, 1, 2, 5, 4, 4, 3, 4, 4, 3, 3, 3, 1, 4 ), ( 5, 3, 3, 5, 1, 4, 5, 2, 4, 4, 5, 2, 5, 3, 3, 3, 2, 3, 1, 4 ), ( 1, 1, 1, 1, 1, 4, 4, 4, 3, 4, 1, 2, 5, 1, 3, 2, 4, 3, 1, 2 );


INSERT INTO T75 VALUES ( 3, 5, 4, 3, 3, 2, 1, 4 ), ( 2, 5, 3, 2, 3, 2, 2, 3 ), ( 4, 3, 3, 4, 2, 2, 4, 2 ), ( 5, 3, 5, 4, 2, 1, 5, 3 ), ( 5, 2, 1, 2, 1, 4, 2, 3 ), ( 5, 1, 1, 2, 5, 5, 1, 3 ), ( 4, 5, 3, 2, 3, 3, 2, 3 ), ( 4, 2, 1, 2, 2, 3, 5, 5 ), ( 1, 1, 2, 1, 3, 3, 2, 5 ), ( 3, 4, 5, 4, 5, 3, 5, 3 );


INSERT INTO T76 VALUES ( 5, 5, 2, 4, 5, 1, 2, 5, 3 ), ( 2, 1, 5, 2, 1, 5, 1, 2, 3 ), ( 4, 1, 1, 3, 4, 4, 5, 5, 5 ), ( 4, 4, 2, 2, 1, 4, 4, 2, 3 ), ( 5, 2, 5, 1, 4, 3, 3, 5, 4 ), ( 2, 4, 3, 1, 1, 1, 1, 2, 4 ), ( 1, 2, 1, 1, 4, 4, 3, 3, 4 ), ( 4, 4, 3, 1, 4, 2, 2, 2, 2 ), ( 1, 3, 1, 2, 1, 2, 4, 2, 1 ), ( 2, 2, 4, 3, 5, 1, 3, 5, 2 );


INSERT INTO T77 VALUES ( 5, 1, 4, 4, 5, 2, 2, 2, 5, 5, 5, 3, 3, 4, 4, 3, 1, 2 ), ( 5, 1, 3, 5, 2, 2, 5, 2, 4, 5, 5, 4, 5, 3, 3, 2, 1, 2 ), ( 2, 5, 4, 2, 5, 5, 3, 5, 4, 3, 2, 5, 4, 4, 3, 4, 4, 5 ), ( 2, 4, 5, 1, 3, 1, 5, 3, 2, 3, 4, 4, 1, 3, 3, 4, 5, 4 ), ( 2, 1, 5, 2, 3, 1, 2, 3, 5, 1, 5, 3, 3, 5, 4, 1, 5, 5 ), ( 5, 5, 2, 5, 5, 5, 2, 4, 3, 5, 5, 3, 1, 5, 1, 3, 3, 4 ), ( 1, 2, 2, 2, 5, 5, 4, 5, 5, 5, 1, 2, 3, 3, 2, 5, 1, 2 ), ( 4, 2, 3, 3, 1, 5, 1, 3, 5, 4, 1, 1, 4, 1, 5, 3, 2, 5 ), ( 5, 1, 3, 2, 5, 3, 5, 2, 2, 3, 4, 2, 5, 4, 4, 4, 5, 4 ), ( 1, 5, 2, 5, 2, 5, 3, 1, 4, 4, 4, 4, 3, 1, 4, 4, 4, 4 );


INSERT INTO T78 VALUES ( 5, 3, 4, 3, 3, 1, 4, 1, 4, 1, 5, 2, 2, 3 ), ( 2, 4, 5, 4, 1, 5, 2, 5, 3, 1, 5, 3, 1, 4 ), ( 2, 4, 5, 5, 4, 1, 4, 4, 3, 5, 3, 5, 5, 3 ), ( 2, 4, 1, 4, 4, 2, 3, 3, 5, 2, 2, 1, 3, 4 ), ( 2, 2, 3, 1, 2, 1, 4, 2, 2, 3, 5, 3, 5, 1 ), ( 5, 4, 3, 5, 5, 5, 4, 5, 4, 4, 2, 1, 2, 2 ), ( 5, 2, 1, 2, 3, 3, 1, 5, 2, 3, 4, 5, 5, 5 ), ( 1, 1, 3, 3, 5, 5, 5, 3, 2, 3, 1, 3, 2, 2 ), ( 5, 4, 2, 1, 5, 3, 4, 2, 5, 2, 5, 1, 1, 4 ), ( 4, 3, 5, 2, 1, 5, 1, 2, 5, 3, 2, 2, 3, 4 );


INSERT INTO T79 VALUES ( 2, 4, 2, 3, 4, 3, 5 ), ( 1, 3, 2, 5, 5, 1, 3 ), ( 3, 3, 3, 3, 3, 2, 1 ), ( 4, 2, 2, 1, 1, 5, 2 ), ( 2, 4, 1, 3, 5, 5, 5 ), ( 4, 1, 3, 3, 2, 5, 2 ), ( 3, 1, 4, 3, 2, 2, 2 ), ( 5, 4, 1, 4, 2, 1, 4 ), ( 5, 2, 1, 3, 2, 4, 4 ), ( 2, 3, 2, 4, 1, 5, 4 );


INSERT INTO T80 VALUES ( 2, 1, 5, 1 ), ( 2, 4, 4, 5 ), ( 3, 2, 1, 5 ), ( 4, 3, 5, 5 ), ( 4, 5, 5, 5 ), ( 4, 2, 3, 4 ), ( 4, 4, 2, 2 ), ( 4, 1, 4, 4 ), ( 4, 5, 5, 2 ), ( 4, 1, 3, 2 );


INSERT INTO T81 VALUES ( 5, 5, 2, 3, 3 ), ( 3, 2, 3, 2, 5 ), ( 4, 5, 4, 4, 2 ), ( 4, 1, 5, 3, 5 ), ( 2, 5, 5, 4, 2 ), ( 3, 3, 1, 2, 5 ), ( 5, 5, 4, 4, 4 ), ( 3, 2, 4, 2, 5 ), ( 4, 5, 1, 3, 4 ), ( 1, 1, 5, 2, 5 );


INSERT INTO T82 VALUES ( 2, 5, 5, 5, 1, 5 ), ( 1, 3, 3, 4, 2, 5 ), ( 3, 4, 5, 3, 1, 5 ), ( 5, 1, 5, 1, 2, 2 ), ( 5, 3, 3, 1, 5, 5 ), ( 1, 2, 5, 4, 4, 4 ), ( 4, 5, 5, 2, 4, 3 ), ( 3, 3, 3, 1, 2, 1 ), ( 3, 1, 1, 4, 5, 4 ), ( 3, 1, 2, 1, 4, 4 );


INSERT INTO T83 VALUES ( 3, 4, 2, 5, 4, 4, 1 ), ( 4, 4, 5, 3, 2, 1, 5 ), ( 5, 5, 2, 2, 2, 2, 5 ), ( 1, 2, 3, 2, 3, 2, 3 ), ( 5, 4, 1, 3, 3, 1, 3 ), ( 4, 1, 3, 2, 2, 5, 5 ), ( 2, 3, 3, 1, 3, 3, 1 ), ( 2, 4, 5, 2, 5, 4, 1 ), ( 3, 3, 2, 3, 2, 1, 2 ), ( 1, 3, 4, 2, 4, 4, 4 );


INSERT INTO T84 VALUES ( 3, 1, 1, 5, 4, 5, 2, 3, 5, 2, 1, 4, 2, 4, 4, 5, 4, 2, 4, 5, 1 ), ( 3, 4, 1, 1, 5, 1, 5, 5, 1, 4, 3, 4, 4, 4, 1, 1, 1, 1, 2, 5, 1 ), ( 2, 2, 5, 5, 3, 1, 2, 5, 4, 3, 5, 1, 2, 3, 1, 2, 4, 1, 3, 1, 3 ), ( 1, 2, 1, 4, 3, 1, 2, 5, 2, 3, 1, 4, 4, 5, 1, 3, 1, 1, 3, 1, 5 ), ( 4, 5, 4, 1, 2, 1, 1, 4, 2, 4, 4, 3, 5, 5, 5, 1, 3, 3, 2, 4, 2 ), ( 5, 1, 1, 1, 4, 2, 4, 2, 5, 1, 4, 5, 3, 4, 2, 2, 5, 4, 2, 1, 3 ), ( 2, 4, 2, 5, 3, 5, 3, 4, 2, 3, 5, 1, 5, 4, 4, 5, 4, 5, 2, 1, 5 ), ( 4, 1, 4, 3, 2, 1, 1, 5, 4, 5, 5, 5, 5, 4, 4, 2, 3, 2, 2, 5, 3 ), ( 5, 2, 4, 5, 3, 5, 4, 4, 3, 3, 1, 1, 2, 4, 5, 2, 2, 3, 2, 4, 5 ), ( 1, 2, 4, 1, 5, 5, 4, 4, 3, 3, 3, 2, 1, 5, 5, 3, 3, 2, 5, 2, 2 );


INSERT INTO T85 VALUES ( 2, 2, 4, 3, 1, 5, 5, 3, 1, 4, 2, 5, 3, 2, 5, 4, 3, 3 ), ( 2, 4, 4, 2, 4, 4, 4, 1, 1, 2, 1, 3, 2, 4, 5, 3, 1, 5 ), ( 5, 2, 2, 1, 2, 1, 1, 1, 1, 5, 2, 3, 4, 4, 5, 1, 5, 2 ), ( 3, 5, 1, 2, 4, 5, 2, 1, 5, 5, 3, 1, 3, 3, 3, 2, 1, 5 ), ( 4, 4, 3, 1, 2, 2, 4, 5, 4, 1, 2, 1, 3, 3, 1, 1, 3, 2 ), ( 1, 5, 3, 2, 2, 4, 4, 1, 1, 5, 3, 5, 2, 5, 2, 3, 3, 2 ), ( 3, 1, 3, 1, 3, 5, 2, 1, 5, 3, 5, 5, 5, 3, 1, 5, 5, 4 ), ( 1, 2, 2, 1, 1, 5, 1, 3, 2, 2, 2, 5, 3, 5, 3, 1, 4, 1 ), ( 4, 1, 5, 2, 5, 2, 4, 1, 4, 4, 5, 2, 3, 3, 3, 3, 5, 2 ), ( 1, 1, 3, 5, 4, 4, 5, 3, 3, 3, 2, 1, 2, 3, 2, 2, 1, 1 );


INSERT INTO T86 VALUES ( 1, 2, 2, 2, 5, 1, 1, 2, 5 ), ( 1, 2, 4, 4, 5, 2, 2, 1, 3 ), ( 2, 4, 4, 3, 1, 3, 1, 2, 2 ), ( 5, 2, 5, 5, 3, 1, 4, 4, 2 ), ( 4, 1, 2, 1, 4, 2, 3, 5, 1 ), ( 5, 2, 5, 1, 4, 3, 5, 1, 1 ), ( 4, 4, 3, 5, 4, 5, 2, 4, 2 ), ( 5, 1, 5, 1, 1, 2, 2, 1, 3 ), ( 4, 1, 3, 5, 1, 4, 1, 1, 1 ), ( 2, 5, 5, 2, 5, 3, 1, 2, 5 );


INSERT INTO T87 VALUES ( 4, 2, 4, 3, 2, 4, 5, 2 ), ( 4, 1, 3, 3, 5, 1, 1, 1 ), ( 5, 5, 1, 1, 2, 1, 5, 4 ), ( 3, 1, 3, 5, 1, 5, 2, 3 ), ( 4, 5, 2, 3, 2, 3, 2, 4 ), ( 2, 1, 5, 2, 5, 4, 5, 3 ), ( 4, 2, 4, 3, 5, 5, 1, 3 ), ( 2, 5, 2, 2, 2, 5, 5, 2 ), ( 2, 5, 2, 4, 2, 4, 3, 2 ), ( 2, 3, 1, 2, 1, 1, 4, 2 );


INSERT INTO T88 VALUES ( 3, 4, 1, 5, 5, 1, 4, 2, 1, 2, 4, 4 ), ( 2, 1, 1, 3, 1, 4, 1, 5, 5, 4, 2, 3 ), ( 5, 4, 3, 2, 1, 5, 5, 1, 4, 2, 1, 4 ), ( 5, 1, 3, 3, 2, 2, 1, 2, 5, 4, 1, 5 ), ( 4, 5, 3, 5, 4, 5, 2, 3, 5, 5, 4, 1 ), ( 3, 4, 3, 1, 1, 4, 1, 3, 2, 2, 5, 2 ), ( 1, 2, 4, 3, 1, 4, 2, 1, 2, 2, 1, 5 ), ( 5, 3, 1, 3, 1, 3, 3, 4, 4, 1, 4, 2 ), ( 5, 1, 3, 3, 5, 1, 3, 4, 4, 1, 3, 1 ), ( 1, 1, 1, 2, 5, 5, 1, 1, 5, 1, 5, 3 );


INSERT INTO T89 VALUES ( 3, 4, 4 ), ( 3, 2, 2 ), ( 3, 5, 3 ), ( 5, 3, 3 ), ( 4, 5, 2 ), ( 3, 2, 5 ), ( 5, 5, 4 ), ( 4, 2, 3 ), ( 5, 4, 3 ), ( 1, 3, 2 );


INSERT INTO T90 VALUES ( 4, 5, 1, 4, 2, 5, 1, 3, 4, 2, 2, 1, 5, 2 ), ( 4, 3, 2, 2, 4, 4, 4, 3, 1, 5, 1, 2, 4, 3 ), ( 1, 1, 1, 5, 3, 2, 3, 3, 1, 4, 1, 5, 4, 1 ), ( 1, 2, 1, 2, 1, 1, 5, 1, 5, 2, 5, 1, 2, 3 ), ( 4, 5, 2, 1, 3, 1, 4, 2, 2, 4, 2, 1, 3, 3 ), ( 3, 2, 2, 5, 4, 5, 4, 4, 2, 3, 1, 1, 5, 2 ), ( 5, 5, 5, 2, 3, 4, 4, 1, 3, 5, 2, 2, 4, 3 ), ( 5, 4, 2, 3, 3, 3, 1, 5, 3, 3, 3, 5, 4, 4 ), ( 2, 1, 4, 3, 2, 5, 4, 3, 5, 3, 4, 3, 1, 2 ), ( 4, 2, 3, 4, 3, 5, 1, 3, 2, 3, 5, 2, 1, 5 );


INSERT INTO T91 VALUES ( 1, 2, 3, 5, 2, 5, 4, 2, 3, 5, 4, 3, 4, 2, 4, 4, 5, 2, 3, 3, 1, 5 ), ( 3, 2, 5, 4, 5, 1, 2, 4, 3, 4, 4, 5, 3, 5, 2, 3, 2, 1, 1, 2, 1, 2 ), ( 4, 3, 5, 1, 3, 2, 4, 3, 1, 2, 1, 5, 3, 5, 5, 4, 2, 5, 1, 5, 2, 3 ), ( 3, 5, 2, 1, 5, 4, 1, 3, 4, 4, 1, 4, 2, 5, 2, 2, 5, 5, 1, 3, 3, 4 ), ( 4, 5, 4, 4, 4, 2, 5, 4, 4, 2, 1, 4, 3, 5, 3, 1, 4, 1, 3, 4, 2, 1 ), ( 5, 5, 3, 2, 3, 5, 2, 4, 2, 5, 4, 5, 1, 2, 4, 3, 3, 4, 1, 4, 3, 4 ), ( 5, 3, 2, 2, 4, 1, 2, 5, 3, 1, 2, 5, 5, 5, 2, 4, 5, 3, 4, 3, 1, 1 ), ( 1, 5, 2, 2, 5, 1, 2, 5, 2, 2, 2, 2, 4, 5, 4, 4, 1, 2, 3, 2, 4, 3 ), ( 3, 1, 3, 4, 1, 1, 5, 4, 4, 2, 1, 1, 1, 3, 5, 2, 3, 5, 5, 1, 5, 1 ), ( 3, 4, 1, 1, 2, 2, 1, 2, 4, 4, 3, 2, 1, 1, 3, 3, 5, 3, 4, 5, 1, 5 );


INSERT INTO T92 VALUES ( 2, 5, 5, 2, 3, 5, 2, 4, 3, 1, 3, 3, 3, 5, 5, 1, 5, 2, 4, 1, 3 ), ( 2, 1, 1, 3, 2, 2, 3, 2, 2, 3, 5, 1, 1, 4, 5, 5, 1, 1, 4, 1, 2 ), ( 5, 4, 3, 5, 1, 5, 3, 2, 5, 2, 4, 2, 4, 5, 5, 4, 3, 2, 4, 2, 5 ), ( 5, 5, 3, 3, 3, 2, 5, 2, 2, 5, 1, 5, 5, 3, 2, 1, 2, 2, 2, 1, 1 ), ( 3, 1, 5, 5, 4, 2, 5, 2, 5, 1, 1, 3, 5, 3, 5, 4, 1, 2, 1, 2, 5 ), ( 1, 2, 4, 1, 1, 1, 4, 3, 5, 5, 5, 1, 4, 5, 1, 5, 1, 3, 1, 4, 2 ), ( 2, 1, 3, 2, 2, 4, 4, 1, 1, 1, 3, 5, 1, 1, 4, 2, 2, 2, 4, 5, 3 ), ( 3, 2, 3, 5, 4, 3, 1, 4, 2, 4, 2, 1, 3, 5, 1, 5, 3, 2, 4, 4, 1 ), ( 5, 2, 4, 3, 1, 1, 5, 1, 1, 5, 1, 2, 2, 3, 2, 3, 2, 5, 5, 5, 5 ), ( 1, 4, 1, 4, 2, 4, 1, 2, 4, 4, 1, 2, 2, 5, 2, 4, 1, 2, 5, 3, 3 );


INSERT INTO T93 VALUES ( 3, 2, 2, 2, 2, 3, 4, 3, 2 ), ( 5, 1, 2, 5, 1, 2, 3, 3, 1 ), ( 3, 5, 3, 2, 3, 3, 4, 1, 4 ), ( 4, 5, 1, 4, 4, 4, 5, 3, 1 ), ( 5, 3, 5, 1, 4, 5, 3, 5, 4 ), ( 3, 2, 4, 2, 3, 1, 4, 3, 3 ), ( 4, 2, 4, 3, 1, 1, 2, 4, 4 ), ( 4, 4, 3, 5, 1, 2, 1, 2, 3 ), ( 3, 3, 2, 4, 4, 2, 5, 5, 1 ), ( 3, 2, 1, 4, 2, 5, 1, 4, 4 );


INSERT INTO T94 VALUES ( 1, 2, 4, 3, 3, 4, 3, 5, 4, 1, 5, 3, 2, 1, 1, 2, 4, 3, 5, 3, 5, 1 ), ( 4, 4, 4, 5, 3, 4, 3, 3, 4, 2, 5, 5, 3, 4, 4, 5, 4, 4, 5, 1, 1, 4 ), ( 2, 3, 4, 4, 1, 4, 2, 4, 2, 5, 2, 1, 2, 5, 3, 3, 2, 2, 5, 3, 1, 2 ), ( 1, 1, 5, 5, 2, 3, 4, 3, 3, 4, 2, 4, 3, 4, 2, 2, 2, 2, 3, 4, 3, 5 ), ( 1, 1, 3, 2, 4, 1, 3, 2, 4, 2, 2, 1, 4, 2, 1, 2, 2, 2, 1, 1, 4, 1 ), ( 2, 4, 3, 4, 1, 5, 4, 4, 5, 5, 4, 1, 4, 2, 4, 2, 4, 2, 5, 2, 3, 1 ), ( 4, 4, 4, 5, 3, 4, 4, 1, 2, 4, 4, 1, 3, 2, 1, 5, 4, 3, 1, 1, 2, 1 ), ( 2, 3, 5, 4, 3, 4, 4, 3, 1, 4, 5, 4, 3, 2, 5, 2, 4, 5, 5, 4, 5, 2 ), ( 2, 1, 3, 4, 4, 2, 3, 1, 1, 5, 1, 2, 2, 1, 1, 3, 3, 5, 5, 4, 5, 5 ), ( 2, 2, 4, 2, 5, 5, 2, 3, 3, 2, 4, 5, 1, 1, 2, 4, 5, 3, 5, 1, 4, 2 );


INSERT INTO T95 VALUES ( 1, 1, 5, 2, 4, 2, 5, 1, 5 ), ( 3, 4, 4, 4, 4, 3, 3, 5, 3 ), ( 4, 3, 5, 4, 5, 2, 4, 2, 5 ), ( 1, 2, 5, 1, 3, 3, 2, 1, 2 ), ( 2, 3, 5, 3, 2, 4, 3, 3, 1 ), ( 1, 1, 2, 2, 4, 2, 1, 2, 3 ), ( 4, 5, 1, 4, 1, 1, 5, 4, 4 ), ( 1, 2, 4, 2, 4, 5, 5, 2, 4 ), ( 4, 1, 2, 4, 3, 1, 1, 3, 1 ), ( 2, 5, 2, 2, 1, 1, 1, 2, 1 );


INSERT INTO T96 VALUES ( 4, 2, 4, 2, 4, 4, 1, 2, 1, 1, 5, 1, 5, 3 ), ( 2, 4, 1, 4, 1, 5, 4, 1, 2, 5, 2, 1, 5, 4 ), ( 5, 3, 4, 3, 1, 3, 1, 4, 4, 4, 2, 2, 4, 4 ), ( 3, 3, 2, 4, 4, 4, 4, 4, 1, 4, 5, 3, 2, 4 ), ( 4, 3, 2, 4, 2, 1, 4, 5, 1, 3, 3, 2, 3, 2 ), ( 3, 4, 4, 5, 4, 1, 5, 3, 5, 5, 5, 4, 1, 1 ), ( 4, 1, 1, 4, 2, 5, 1, 5, 1, 5, 2, 2, 1, 5 ), ( 4, 2, 3, 4, 4, 4, 3, 5, 3, 3, 5, 2, 1, 2 ), ( 4, 1, 5, 1, 5, 1, 2, 2, 4, 2, 2, 4, 1, 2 ), ( 4, 5, 3, 3, 5, 5, 1, 3, 3, 4, 3, 1, 5, 1 );


INSERT INTO T97 VALUES ( 2, 1, 1, 2, 1, 3, 1, 2, 5, 2, 5 ), ( 4, 3, 5, 5, 5, 2, 2, 3, 5, 1, 1 ), ( 3, 4, 1, 2, 2, 2, 4, 5, 4, 4, 4 ), ( 4, 2, 5, 1, 4, 4, 5, 5, 4, 5, 2 ), ( 1, 1, 5, 1, 2, 4, 3, 4, 1, 3, 1 ), ( 5, 1, 5, 4, 1, 3, 1, 3, 1, 4, 1 ), ( 5, 2, 2, 4, 1, 4, 4, 4, 2, 1, 3 ), ( 5, 1, 1, 5, 4, 3, 1, 4, 3, 2, 3 ), ( 4, 5, 5, 1, 3, 3, 5, 5, 5, 5, 1 ), ( 5, 4, 4, 2, 3, 1, 4, 2, 5, 4, 4 );


INSERT INTO T98 VALUES ( 4, 4, 4 ), ( 2, 1, 1 ), ( 4, 5, 4 ), ( 2, 3, 3 ), ( 3, 4, 2 ), ( 4, 1, 3 ), ( 5, 4, 1 ), ( 1, 5, 4 ), ( 4, 3, 5 ), ( 5, 2, 5 );


INSERT INTO T99 VALUES ( 5, 3, 3, 4, 1 ), ( 1, 1, 1, 1, 1 ), ( 2, 2, 1, 4, 2 ), ( 4, 1, 5, 4, 5 ), ( 1, 1, 2, 2, 1 ), ( 3, 3, 5, 2, 2 ), ( 3, 1, 5, 1, 1 ), ( 4, 4, 2, 3, 1 ), ( 2, 1, 4, 2, 4 ), ( 4, 5, 5, 2, 3 );
ANALYZE T0;
ANALYZE T1;
ANALYZE T2;
ANALYZE T3;
ANALYZE T4;
ANALYZE T5;
ANALYZE T6;
ANALYZE T7;
ANALYZE T8;
ANALYZE T9;
ANALYZE T10;
ANALYZE T11;
ANALYZE T12;
ANALYZE T13;
ANALYZE T14;
ANALYZE T15;
ANALYZE T16;
ANALYZE T17;
ANALYZE T18;
ANALYZE T19;
ANALYZE T20;
ANALYZE T21;
ANALYZE T22;
ANALYZE T23;
ANALYZE T24;
ANALYZE T25;
ANALYZE T26;
ANALYZE T27;
ANALYZE T28;
ANALYZE T29;
ANALYZE T30;
ANALYZE T31;
ANALYZE T32;
ANALYZE T33;
ANALYZE T34;
ANALYZE T35;
ANALYZE T36;
ANALYZE T37;
ANALYZE T38;
ANALYZE T39;
ANALYZE T40;
ANALYZE T41;
ANALYZE T42;
ANALYZE T43;
ANALYZE T44;
ANALYZE T45;
ANALYZE T46;
ANALYZE T47;
ANALYZE T48;
ANALYZE T49;
ANALYZE T50;
ANALYZE T51;
ANALYZE T52;
ANALYZE T53;
ANALYZE T54;
ANALYZE T55;
ANALYZE T56;
ANALYZE T57;
ANALYZE T58;
ANALYZE T59;
ANALYZE T60;
ANALYZE T61;
ANALYZE T62;
ANALYZE T63;
ANALYZE T64;
ANALYZE T65;
ANALYZE T66;
ANALYZE T67;
ANALYZE T68;
ANALYZE T69;
ANALYZE T70;
ANALYZE T71;
ANALYZE T72;
ANALYZE T73;
ANALYZE T74;
ANALYZE T75;
ANALYZE T76;
ANALYZE T77;
ANALYZE T78;
ANALYZE T79;
ANALYZE T80;
ANALYZE T81;
ANALYZE T82;
ANALYZE T83;
ANALYZE T84;
ANALYZE T85;
ANALYZE T86;
ANALYZE T87;
ANALYZE T88;
ANALYZE T89;
ANALYZE T90;
ANALYZE T91;
ANALYZE T92;
ANALYZE T93;
ANALYZE T94;
ANALYZE T95;
ANALYZE T96;
ANALYZE T97;
ANALYZE T98;
ANALYZE T99;


SELECT
	DT102.C339
	, DT102.C340
	, DT100.C498
	, SUM( DT102.C339 )
	, SUM( DT102.C340 )
	, COUNT( DT100.C498 )
FROM
	(
		(
			T43 DT100
		INNER JOIN
			T33 DT101
		ON
			DT100.C498 = DT101.C401
		)
	INNER JOIN
		T29 DT102
	ON
		DT101.C385 = DT102.C338
	)
WHERE
	(
		(
			DT101.C390 = DT100.C500
		)
		OR
		(
			(
				DT102.C338 <> DT101.C388
			)
			AND
			(
				DT102.C336 < DT100.C494
			)
		)
	)
	OR
	(
		(
			DT101.C391 < DT101.C399
		)
		AND
		(
			DT102.C335 = DT100.C490
		)
	)
GROUP BY
	DT100.C498
	, DT102.C339
	, DT102.C340
ORDER BY
	DT102.C339
	, DT102.C340
	, DT100.C498
	, SUM( DT102.C339 )
	, SUM( DT102.C340 )
	, COUNT( DT100.C498 )
LIMIT 497;


SELECT
	DT104.C427
	, SUM( DT106.C632 )
FROM
	(
		T52 DT106
	INNER JOIN
		(
			T35 DT103
		INNER JOIN
			(
				T36 DT104
			LEFT OUTER JOIN
				T28 DT105
			ON
				DT104.C430 > DT105.C331
			)
		ON
			DT103.C416 = DT104.C425
		)
	ON
		DT106.C632 = DT103.C413
	)
WHERE
	(
		(
			DT104.C424 = DT104.C429
		)
		OR
		(
			(
				DT104.C430 <> DT105.C332
			)
			OR
			(
				DT103.C415 <> DT104.C425
			)
		)
	)
	OR
	(
		(
			DT106.C628 = DT105.C330
		)
		AND
		(
			DT104.C420 = DT103.C413
		)
	)
GROUP BY
	DT106.C632
	, DT104.C427
ORDER BY
	DT104.C427
	, SUM( DT106.C632 )
LIMIT 795;


SELECT
	DT107.C806
	, DT107.C798
	, DT107.C805
	, COUNT( DT107.C806 )
FROM
	(
		T66 DT107
	INNER JOIN
		T71 DT108
	ON
		DT107.C800 = DT108.C863
	)
WHERE
	(
		(
			DT107.C806 = DT107.C798
		)
		OR
		(
			(
				DT107.C805 < DT108.C863
			)
			AND
			(
				DT107.C799 <> DT107.C799
			)
		)
	)
	AND
	(
		(
			DT107.C801 = DT107.C800
		)
		AND
		(
			DT108.C860 = DT107.C805
		)
	)
GROUP BY
	DT107.C805
	, DT107.C806
	, DT107.C798
ORDER BY
	DT107.C806
	, DT107.C798
	, DT107.C805
	, COUNT( DT107.C806 )
LIMIT 128;


SELECT
	DT109.C929
	, DT109.C918
FROM
	(
		T89 DT110
	INNER JOIN
		T74 DT109
	ON
		DT110.C1077 = DT109.C928
	)
WHERE
	(
		DT109.C929 <> DT109.C916
	)
	OR
	(
		(
			(
				DT109.C924 = DT109.C926
			)
			AND
			(
				DT109.C925 > DT109.C919
			)
		)
		OR
		(
			(
				DT109.C917 = DT109.C927
			)
			AND
			(
				DT109.C916 = DT109.C920
			)
		)
	)
GROUP BY
	DT109.C918
	, DT109.C929
ORDER BY
	DT109.C929
	, DT109.C918
LIMIT 221;


SELECT
	DT114.C475
	, SUM( DT111.C207 )
FROM
	(
		T17 DT111
	INNER JOIN
		(
			T42 DT114
		INNER JOIN
			(
				T14 DT113
			INNER JOIN
				T25 DT112
			ON
				DT113.C184 <> DT112.C288
			)
		ON
			DT114.C474 <> DT112.C288
		)
	ON
		DT111.C214 = DT114.C476
	)
WHERE
	(
		DT111.C217 < DT112.C285
	)
	OR
	(
		DT113.C181 <> DT112.C288
	)
GROUP BY
	DT111.C207
	, DT111.C209
	, DT114.C475
ORDER BY
	DT114.C475
	, SUM( DT111.C207 )
LIMIT 955;


SELECT
	DT116.C675
	, to_char(AVG( DT116.C675 ),'9999999.9999999') 
FROM
	(
		T2 DT115
	RIGHT OUTER JOIN
		T56 DT116
	ON
		DT115.C15 = DT116.C669
	)
WHERE
	(
		DT115.C21 <> DT115.C22
	)
	OR
	(
		DT116.C675 < DT116.C681
	)
GROUP BY
	DT116.C675
	, DT116.C669
ORDER BY
	DT116.C675
	, AVG( DT116.C675 )
LIMIT 393;


SELECT
	DT118.C660
	, MIN( DT117.C202 )
	, DT117.C202
FROM
	(
		T16 DT117
	INNER JOIN
		(
			T55 DT118
		INNER JOIN
			T54 DT119
		ON
			DT118.C662 = DT119.C657
		)
	ON
		DT117.C204 <> DT119.C657
	)
WHERE
	(
		(
			DT119.C657 <> DT117.C202
		)
		OR
		(
			DT117.C204 < DT118.C667
		)
	)
	OR
	(
		DT118.C662 > DT118.C658
	)
GROUP BY
	DT117.C202
	, DT118.C660
ORDER BY
	DT118.C660
	, MIN( DT117.C202 )
	, DT117.C202
LIMIT 399;


SELECT
	DT121.C801
FROM
	(
		T66 DT121
	INNER JOIN
		T2 DT120
	ON
		DT121.C804 = DT120.C18
	)
WHERE
	(
		DT121.C802 = DT120.C31
	)
	OR
	(
		(
			DT121.C800 <> DT121.C808
		)
		OR
		(
			DT121.C801 = DT121.C803
		)
	)
GROUP BY
	DT120.C30
	, DT121.C801
ORDER BY
	DT121.C801
LIMIT 210;


SELECT
	AVG( DT123.C1167 )
	, DT123.C1171
	, DT123.C1167
FROM
	(
		T95 DT123
	INNER JOIN
		T87 DT122
	ON
		DT123.C1175 < DT122.C1063
	)
WHERE
	(
		(
			DT123.C1173 = DT122.C1059
		)
		AND
		(
			DT122.C1059 = DT122.C1058
		)
	)
	AND
	(
		(
			DT123.C1170 = DT122.C1057
		)
		AND
		(
			DT123.C1169 = DT123.C1172
		)
	)
GROUP BY
	DT123.C1171
	, DT123.C1167
ORDER BY
	AVG( DT123.C1167 )
	, DT123.C1171
	, DT123.C1167
LIMIT 649;


SELECT
	DT126.C234
FROM
	(
		T20 DT126
	INNER JOIN
		(
			T11 DT125
		INNER JOIN
			T30 DT124
		ON
			DT125.C153 <> DT124.C341
		)
	ON
		DT126.C242 = DT124.C342
	)
WHERE
	(
		(
			(
				DT125.C152 = DT126.C244
			)
			OR
			(
				DT126.C245 <> DT126.C246
			)
		)
		OR
		(
			DT125.C154 < DT124.C343
		)
	)
	AND
	(
		DT125.C156 = DT126.C244
	)
GROUP BY
	DT126.C234
	, DT126.C242
ORDER BY
	DT126.C234
LIMIT 805;


SELECT
	DT128.C556
	, MAX( DT128.C560 )
	, COUNT( DT128.C555 )
	, DT128.C560
FROM
	(
		T47 DT128
	INNER JOIN
		T23 DT127
	ON
		DT128.C561 <> DT127.C277
	)
WHERE
	(
		DT128.C560 < DT128.C564
	)
	OR
	(
		DT128.C562 = DT128.C565
	)
GROUP BY
	DT128.C556
	, DT128.C555
	, DT128.C560
ORDER BY
	DT128.C556
	, MAX( DT128.C560 )
	, COUNT( DT128.C555 )
	, DT128.C560
LIMIT 834;


SELECT
	DT130.C184
	, DT129.C488
	, to_char(AVG( DT130.C184 ), '9999999.9999999')
	, MAX( DT129.C488 )
FROM
	(
		T43 DT129
	INNER JOIN
		T14 DT130
	ON
		DT129.C500 > DT130.C183
	)
WHERE
	(
		DT130.C182 = DT129.C494
	)
	AND
	(
		DT129.C492 > DT129.C499
	)
GROUP BY
	DT130.C184
	, DT129.C488
ORDER BY
	DT130.C184
	, DT129.C488
	, AVG( DT130.C184 )
	, MAX( DT129.C488 )
LIMIT 626;


SELECT
	MAX( DT131.C159 )
FROM
	(
		T12 DT131
	RIGHT OUTER JOIN
		T83 DT132
	ON
		DT131.C162 = DT132.C1007
	)
WHERE
	(
		DT131.C159 < DT131.C157
	)
	OR
	(
		(
			(
				DT131.C158 = DT132.C1004
			)
			OR
			(
				DT132.C1002 = DT132.C1005
			)
		)
		AND
		(
			DT132.C1001 = DT131.C158
		)
	)
GROUP BY
	DT132.C1001
	, DT131.C159
ORDER BY
	MAX( DT131.C159 )
LIMIT 258;


SELECT
	MAX( DT133.C1134 )
FROM
	(
		(
			T66 DT134
		INNER JOIN
			T36 DT135
		ON
			DT134.C798 <> DT135.C432
		)
	INNER JOIN
		T92 DT133
	ON
		DT135.C434 = DT133.C1118
	)
WHERE
	(
		DT135.C430 <> DT135.C427
	)
	OR
	(
		(
			DT135.C419 > DT135.C425
		)
		OR
		(
			DT134.C800 <> DT135.C420
		)
	)
GROUP BY
	DT133.C1116
	, DT133.C1134
	, DT135.C431
ORDER BY
	MAX( DT133.C1134 )
LIMIT 548;


SELECT
	DT137.C718
	, COUNT( DT136.C617 )
	, COUNT( DT136.C623 )
	, MIN( DT137.C718 )
FROM
	(
		T56 DT138
	INNER JOIN
		(
			(
				T60 DT137
			INNER JOIN
				T51 DT136
			ON
				DT137.C723 <> DT136.C613
			)
		INNER JOIN
			T7 DT139
		ON
			DT137.C720 = DT139.C107
		)
	ON
		DT138.C676 = DT139.C100
	)
WHERE
	(
		(
			DT139.C105 = DT137.C717
		)
		AND
		(
			DT136.C618 = DT139.C96
		)
	)
	AND
	(
		(
			(
				DT139.C92 = DT136.C621
			)
			OR
			(
				DT138.C676 < DT136.C624
			)
		)
		AND
		(
			DT138.C680 = DT136.C616
		)
	)
GROUP BY
	DT137.C718
	, DT136.C617
	, DT136.C623
ORDER BY
	DT137.C718
	, COUNT( DT136.C617 )
	, COUNT( DT136.C623 )
	, MIN( DT137.C718 )
LIMIT 958;


SELECT
	MIN( DT141.C204 )
	, DT140.C146
	, MIN( DT140.C146 )
	, DT141.C204
	, DT140.C148
FROM
	(
		T10 DT140
	INNER JOIN
		(
			T16 DT141
		INNER JOIN
			T67 DT142
		ON
			DT141.C200 = DT142.C811
		)
	ON
		DT140.C142 = DT142.C820
	)
WHERE
	(
		(
			DT141.C205 > DT141.C201
		)
		OR
		(
			DT140.C143 < DT140.C140
		)
	)
	AND
	(
		DT140.C140 = DT141.C202
	)
GROUP BY
	DT140.C146
	, DT141.C204
	, DT140.C148
ORDER BY
	MIN( DT141.C204 )
	, DT140.C146
	, MIN( DT140.C146 )
	, DT141.C204
	, DT140.C148
LIMIT 343;


SELECT
	DT146.C454
FROM
	(
		(
			(
				T0 DT144
			INNER JOIN
				T3 DT145
			ON
				DT144.C3 = DT145.C38
			)
		INNER JOIN
			T10 DT143
		ON
			DT145.C46 = DT143.C149
		)
	INNER JOIN
		T41 DT146
	ON
		DT143.C138 > DT146.C464
	)
WHERE
	(
		DT144.C3 <> DT145.C34
	)
	AND
	(
		DT144.C2 = DT145.C49
	)
GROUP BY
	DT144.C1
	, DT146.C454
ORDER BY
	DT146.C454
LIMIT 780;


SELECT
	DT147.C561
	, COUNT( DT147.C551 )
FROM
	(
		(
			T77 DT149
		INNER JOIN
			T11 DT148
		ON
			DT149.C957 <> DT148.C153
		)
	INNER JOIN
		(
			T47 DT147
		INNER JOIN
			T35 DT150
		ON
			DT147.C552 = DT150.C414
		)
	ON
		DT149.C947 > DT150.C414
	)
WHERE
	(
		DT147.C551 = DT149.C959
	)
	AND
	(
		DT147.C567 < DT147.C559
	)
GROUP BY
	DT147.C551
	, DT147.C561
ORDER BY
	DT147.C561
	, COUNT( DT147.C551 )
LIMIT 375;


SELECT
	DT151.C342
FROM
	(
		T86 DT153
	LEFT OUTER JOIN
		(
			T30 DT151
		INNER JOIN
			T13 DT152
		ON
			DT151.C342 <> DT152.C167
		)
	ON
		DT153.C1047 = DT152.C171
	)
WHERE
	(
		(
			DT153.C1054 = DT152.C171
		)
		AND
		(
			DT151.C343 > DT152.C179
		)
	)
	AND
	(
		(
			(
				DT152.C165 > DT151.C342
			)
			AND
			(
				DT153.C1050 = DT153.C1051
			)
		)
		AND
		(
			DT152.C173 = DT151.C342
		)
	)
GROUP BY
	DT152.C165
	, DT151.C342
ORDER BY
	DT151.C342
LIMIT 127;


SELECT
	MAX( DT156.C672 )
	, MIN( DT156.C680 )
	, DT156.C680
FROM
	(
		(
			T56 DT156
		INNER JOIN
			T64 DT155
		ON
			DT156.C675 > DT155.C767
		)
	INNER JOIN
		T89 DT154
	ON
		DT156.C670 = DT154.C1077
	)
WHERE
	(
		(
			DT156.C676 > DT156.C674
		)
		OR
		(
			DT156.C670 = DT155.C780
		)
	)
	AND
	(
		(
			DT156.C672 < DT155.C772
		)
		AND
		(
			DT156.C671 = DT156.C675
		)
	)
GROUP BY
	DT156.C672
	, DT156.C680
ORDER BY
	MAX( DT156.C672 )
	, MIN( DT156.C680 )
	, DT156.C680
LIMIT 428;


SELECT
	DT158.C1073
	, DT157.C821
	, MIN( DT157.C821 )
	, COUNT( DT158.C1066 )
	, MAX( DT158.C1073 )
	, DT158.C1066
FROM
	(
		T68 DT157
	INNER JOIN
		T88 DT158
	ON
		DT157.C822 = DT158.C1072
	)
WHERE
	(
		(
			DT157.C821 = DT158.C1067
		)
		OR
		(
			DT158.C1070 <> DT158.C1073
		)
	)
	OR
	(
		(
			DT157.C823 < DT158.C1072
		)
		OR
		(
			(
				DT158.C1068 = DT158.C1065
			)
			AND
			(
				DT158.C1066 = DT158.C1073
			)
		)
	)
GROUP BY
	DT158.C1073
	, DT157.C821
	, DT158.C1066
ORDER BY
	DT158.C1073
	, DT157.C821
	, MIN( DT157.C821 )
	, COUNT( DT158.C1066 )
	, MAX( DT158.C1073 )
	, DT158.C1066
LIMIT 462;


SELECT
	MIN( DT160.C651 )
	, to_char(AVG( DT160.C642 ),'9999999.9999999')  

FROM
	(
		(
			T93 DT161
		INNER JOIN
			T52 DT159
		ON
			DT161.C1138 = DT159.C634
		)
	INNER JOIN
		T53 DT160
	ON
		DT161.C1140 <> DT160.C640
	)
WHERE
	(
		DT160.C643 > DT159.C634
	)
	AND
	(
		(
			(
				DT160.C651 > DT160.C651
			)
			OR
			(
				(
					DT160.C637 < DT161.C1144
				)
				AND
				(
					DT159.C626 = DT160.C638
				)
			)
		)
		AND
		(
			DT160.C649 = DT159.C629
		)
	)
GROUP BY
	DT160.C651
	, DT160.C642
ORDER BY
	MIN( DT160.C651 )
	, AVG( DT160.C642 )
LIMIT 241;


SELECT
	MIN( DT163.C1055 )
	, DT162.C350
	, DT163.C1055
	, DT165.C1153
FROM
	(
		(
			T31 DT162
		INNER JOIN
			T94 DT165
		ON
			DT162.C345 < DT165.C1160
		)
	INNER JOIN
		(
			T86 DT163
		INNER JOIN
			T89 DT164
		ON
			DT163.C1051 = DT164.C1077
		)
	ON
		DT162.C358 > DT163.C1047
	)
WHERE
	(
		(
			(
				DT164.C1078 = DT165.C1147
			)
			AND
			(
				DT164.C1078 <> DT164.C1078
			)
		)
		OR
		(
			DT162.C355 = DT164.C1078
		)
	)
	OR
	(
		DT162.C346 = DT162.C353
	)
GROUP BY
	DT162.C350
	, DT163.C1055
	, DT165.C1153
ORDER BY
	MIN( DT163.C1055 )
	, DT162.C350
	, DT163.C1055
	, DT165.C1153
LIMIT 286;


SELECT
	DT166.C331
	, MIN( DT168.C1124 )
	, DT166.C333
	, SUM( DT166.C331 )
	, DT168.C1124
FROM
	(
		T92 DT168
	INNER JOIN
		(
			T94 DT167
		INNER JOIN
			T28 DT166
		ON
			DT167.C1147 = DT166.C332
		)
	ON
		DT168.C1128 = DT166.C331
	)
WHERE
	(
		DT167.C1160 = DT166.C328
	)
	OR
	(
		(
			(
				(
					DT167.C1164 = DT168.C1123
				)
				OR
				(
					DT168.C1117 < DT167.C1155
				)
			)
			AND
			(
				DT168.C1115 > DT167.C1166
			)
		)
		AND
		(
			DT167.C1157 = DT166.C329
		)
	)
GROUP BY
	DT168.C1124
	, DT166.C333
	, DT166.C331
ORDER BY
	DT166.C331
	, MIN( DT168.C1124 )
	, DT166.C333
	, SUM( DT166.C331 )
	, DT168.C1124
LIMIT 572;


SELECT
	MAX( DT170.C311 )
	, DT170.C314
FROM
	(
		(
			T53 DT172
		INNER JOIN
			(
				T26 DT170
			INNER JOIN
				T89 DT169
			ON
				DT170.C310 < DT169.C1076
			)
		ON
			DT172.C637 < DT169.C1077
		)
	INNER JOIN
		T30 DT171
	ON
		DT172.C636 = DT171.C342
	)
WHERE
	(
		DT172.C650 = DT170.C297
	)
	OR
	(
		(
			DT172.C647 > DT170.C314
		)
		OR
		(
			DT170.C304 = DT170.C316
		)
	)
GROUP BY
	DT170.C311
	, DT170.C314
	, DT172.C642
ORDER BY
	MAX( DT170.C311 )
	, DT170.C314
LIMIT 294;


SELECT
	DT173.C858
FROM
	(
		T0 DT174
	INNER JOIN
		(
			T70 DT173
		INNER JOIN
			T21 DT175
		ON
			DT173.C841 = DT175.C256
		)
	ON
		DT174.C0 = DT175.C252
	)
WHERE
	(
		(
			(
				DT175.C247 > DT174.C3
			)
			OR
			(
				DT175.C253 = DT173.C854
			)
		)
		OR
		(
			DT175.C251 > DT173.C853
		)
	)
	AND
	(
		DT173.C857 < DT175.C247
	)
GROUP BY
	DT173.C842
	, DT173.C858
ORDER BY
	DT173.C858
LIMIT 896;


SELECT
	DT177.C733
	, DT177.C735
	, DT177.C736
FROM
	(
		(
			T19 DT176
		INNER JOIN
			T61 DT177
		ON
			DT176.C230 = DT177.C731
		)
	INNER JOIN
		T71 DT178
	ON
		DT177.C736 > DT178.C862
	)
WHERE
	(
		DT176.C230 > DT177.C739
	)
	OR
	(
		DT177.C729 = DT177.C737
	)
GROUP BY
	DT177.C733
	, DT177.C735
	, DT177.C736
ORDER BY
	DT177.C733
	, DT177.C735
	, DT177.C736
LIMIT 288;


SELECT
	DT180.C1051
FROM
	(
		T42 DT181
	INNER JOIN
		(
			T86 DT180
		INNER JOIN
			T63 DT179
		ON
			DT180.C1052 <> DT179.C755
		)
	ON
		DT181.C473 = DT179.C745
	)
WHERE
	(
		(
			DT180.C1049 = DT179.C754
		)
		OR
		(
			(
				(
					DT179.C762 < DT180.C1050
				)
				AND
				(
					DT179.C762 = DT180.C1050
				)
			)
			OR
			(
				DT180.C1048 < DT180.C1055
			)
		)
	)
	OR
	(
		DT181.C483 = DT181.C481
	)
GROUP BY
	DT180.C1051
	, DT179.C758
	, DT180.C1048
ORDER BY
	DT180.C1051
LIMIT 194;


SELECT
	MAX( DT184.C1034 )
FROM
	(
		(
			T59 DT183
		RIGHT OUTER JOIN
			T85 DT184
		ON
			DT183.C715 < DT184.C1038
		)
	INNER JOIN
		T39 DT182
	ON
		DT184.C1035 > DT182.C444
	)
WHERE
	(
		DT183.C715 < DT183.C714
	)
	OR
	(
		DT183.C716 = DT184.C1038
	)
GROUP BY
	DT184.C1034
	, DT182.C446
ORDER BY
	MAX( DT184.C1034 )
LIMIT 516;


SELECT
	DT187.C500
	, SUM( DT186.C454 )
FROM
	(
		(
			T37 DT185
		INNER JOIN
			T41 DT186
		ON
			DT185.C439 <> DT186.C469
		)
	INNER JOIN
		T43 DT187
	ON
		DT186.C472 < DT187.C488
	)
WHERE
	(
		(
			(
				DT187.C498 = DT186.C469
			)
			OR
			(
				DT187.C498 = DT185.C440
			)
		)
		OR
		(
			(
				DT187.C500 = DT186.C453
			)
			AND
			(
				DT186.C454 = DT187.C488
			)
		)
	)
	OR
	(
		DT187.C490 < DT186.C470
	)
GROUP BY
	DT187.C500
	, DT186.C454
	, DT185.C440
ORDER BY
	DT187.C500
	, SUM( DT186.C454 )
LIMIT 356;


SELECT
	MAX( DT190.C1004 )
FROM
	(
		(
			T22 DT188
		INNER JOIN
			T54 DT191
		ON
			DT188.C259 > DT191.C655
		)
	INNER JOIN
		(
			T13 DT189
		INNER JOIN
			T83 DT190
		ON
			DT189.C167 > DT190.C1005
		)
	ON
		DT188.C260 = DT190.C1006
	)
WHERE
	(
		(
			(
				(
					DT188.C259 <> DT189.C169
				)
				OR
				(
					DT189.C172 = DT189.C167
				)
			)
			OR
			(
				DT190.C1007 = DT191.C654
			)
		)
		AND
		(
			DT190.C1002 < DT189.C179
		)
	)
	AND
	(
		DT188.C267 < DT191.C656
	)
GROUP BY
	DT188.C263
	, DT190.C1004
ORDER BY
	MAX( DT190.C1004 )
LIMIT 901;


SELECT
	to_char(AVG( DT194.C1022 ), '9999999.9999999')  
	, DT194.C1013
	, MAX( DT194.C1013 )
	, DT194.C1022
FROM
	(
		(
			T38 DT192
		LEFT OUTER JOIN
			T30 DT193
		ON
			DT192.C442 <> DT193.C342
		)
	INNER JOIN
		T84 DT194
	ON
		DT192.C443 = DT194.C1012
	)
WHERE
	(
		DT194.C1027 = DT194.C1027
	)
	AND
	(
		DT194.C1026 <> DT194.C1022
	)
GROUP BY
	DT194.C1013
	, DT194.C1022
ORDER BY
	AVG( DT194.C1022 )
	, DT194.C1013
	, MAX( DT194.C1013 )
	, DT194.C1022
LIMIT 489;


SELECT
	MAX( DT195.C801 )
FROM
	(
		T75 DT196
	INNER JOIN
		(
			T66 DT195
		RIGHT OUTER JOIN
			T9 DT197
		ON
			DT195.C805 = DT197.C129
		)
	ON
		DT196.C937 = DT197.C131
	)
WHERE
	(
		DT196.C937 = DT197.C126
	)
	OR
	(
		DT197.C129 = DT196.C931
	)
GROUP BY
	DT195.C798
	, DT195.C801
	, DT195.C808
ORDER BY
	MAX( DT195.C801 )
LIMIT 308;


SELECT
	DT199.C166
FROM
	(
		(
			T17 DT200
		INNER JOIN
			T67 DT201
		ON
			DT200.C207 < DT201.C820
		)
	LEFT OUTER JOIN
		(
			T13 DT199
		INNER JOIN
			T60 DT198
		ON
			DT199.C167 > DT198.C724
		)
	ON
		DT201.C810 > DT198.C717
	)
WHERE
	(
		(
			DT199.C179 = DT200.C215
		)
		OR
		(
			DT200.C212 = DT201.C812
		)
	)
	AND
	(
		DT200.C216 > DT200.C213
	)
GROUP BY
	DT201.C817
	, DT199.C166
ORDER BY
	DT199.C166
LIMIT 335;


SELECT
	MIN( DT203.C458 )
	, AVG( DT203.C469 )
	, DT203.C463
	, DT203.C458
FROM
	(
		T15 DT202
	INNER JOIN
		T41 DT203
	ON
		DT202.C193 = DT203.C464
	)
WHERE
	(
		DT202.C189 = DT202.C197
	)
	AND
	(
		(
			(
				DT203.C456 > DT202.C189
			)
			OR
			(
				DT203.C470 <> DT203.C464
			)
		)
		AND
		(
			DT203.C461 = DT202.C192
		)
	)
GROUP BY
	DT203.C469
	, DT203.C463
	, DT203.C458
ORDER BY
	MIN( DT203.C458 )
	, AVG( DT203.C469 )
	, DT203.C463
	, DT203.C458
LIMIT 256;


SELECT
	MAX( DT205.C3 )
FROM
	(
		T0 DT205
	INNER JOIN
		T99 DT204
	ON
		DT205.C3 < DT204.C1208
	)
WHERE
	(
		DT204.C1208 > DT205.C1
	)
	OR
	(
		DT205.C0 = DT204.C1204
	)
GROUP BY
	DT205.C3
	, DT205.C0
	, DT204.C1206
ORDER BY
	MAX( DT205.C3 )
LIMIT 437;


SELECT
	MAX( DT207.C268 )
FROM
	(
		T61 DT206
	INNER JOIN
		T22 DT207
	ON
		DT206.C733 = DT207.C265
	)
WHERE
	(
		(
			DT207.C266 = DT207.C259
		)
		OR
		(
			DT206.C734 = DT206.C730
		)
	)
	OR
	(
		DT207.C268 = DT207.C265
	)
GROUP BY
	DT207.C263
	, DT207.C268
ORDER BY
	MAX( DT207.C268 )
LIMIT 683;


SELECT
	to_char(AVG( DT208.C301 ), '9999999.9999999') 
FROM
	(
		(
			T70 DT209
		INNER JOIN
			T73 DT210
		ON
			DT209.C858 = DT210.C889
		)
	INNER JOIN
		T26 DT208
	ON
		DT209.C848 = DT208.C301
	)
WHERE
	(
		DT209.C844 < DT208.C311
	)
	OR
	(
		(
			DT210.C896 = DT209.C853
		)
		AND
		(
			(
				(
					DT208.C303 = DT208.C303
				)
				OR
				(
					DT209.C850 = DT208.C313
				)
			)
			AND
			(
				DT209.C845 = DT210.C890
			)
		)
	)
GROUP BY
	DT208.C301
	, DT209.C846
ORDER BY
	AVG( DT208.C301 )
LIMIT 154;


SELECT
	MAX( DT213.C319 )
FROM
	(
		(
			T2 DT211
		INNER JOIN
			T27 DT213
		ON
			DT211.C31 = DT213.C327
		)
	INNER JOIN
		(
			T55 DT214
		INNER JOIN
			T23 DT212
		ON
			DT214.C666 = DT212.C271
		)
	ON
		DT211.C28 > DT212.C278
	)
WHERE
	(
		(
			DT211.C21 = DT212.C274
		)
		AND
		(
			DT212.C272 = DT211.C23
		)
	)
	AND
	(
		DT214.C658 <> DT213.C322
	)
GROUP BY
	DT213.C319
	, DT213.C326
ORDER BY
	MAX( DT213.C319 )
LIMIT 995;


SELECT
	to_char(AVG( DT217.C873 ), '9999999.9999999') 
	, MIN( DT217.C874 )
	, DT217.C873
	, DT217.C874
FROM
	(
		T59 DT215
	INNER JOIN
		(
			T72 DT217
		INNER JOIN
			T40 DT216
		ON
			DT217.C886 = DT216.C448
		)
	ON
		DT215.C715 = DT216.C448
	)
WHERE
	(
		(
			(
				DT217.C877 > DT216.C450
			)
			OR
			(
				DT217.C870 > DT217.C879
			)
		)
		AND
		(
			DT217.C888 = DT217.C882
		)
	)
	OR
	(
		(
			DT217.C879 = DT217.C874
		)
		AND
		(
			DT217.C874 = DT217.C867
		)
	)
GROUP BY
	DT217.C873
	, DT217.C874
ORDER BY
	AVG( DT217.C873 )
	, MIN( DT217.C874 )
	, DT217.C873
	, DT217.C874
LIMIT 862;


SELECT
	SUM( DT218.C638 )
	, COUNT( DT219.C653 )
	, DT219.C653
FROM
	(
		T53 DT219
	INNER JOIN
		(
			T21 DT220
		INNER JOIN
			(
				T53 DT218
			INNER JOIN
				T80 DT221
			ON
				DT218.C642 = DT221.C989
			)
		ON
			DT220.C248 = DT218.C652
		)
	ON
		DT219.C648 = DT218.C642
	)
WHERE
	(
		(
			DT219.C652 = DT218.C652
		)
		AND
		(
			DT218.C637 = DT219.C650
		)
	)
	OR
	(
		(
			(
				DT219.C636 < DT220.C252
			)
			AND
			(
				DT218.C636 = DT221.C989
			)
		)
		OR
		(
			DT218.C638 = DT218.C639
		)
	)
GROUP BY
	DT218.C638
	, DT219.C653
ORDER BY
	SUM( DT218.C638 )
	, COUNT( DT219.C653 )
	, DT219.C653
LIMIT 749;


SELECT
	DT223.C1076
	, MIN( DT222.C464 )
	, DT222.C470
	, DT222.C464
FROM
	(
		T41 DT222
	INNER JOIN
		T89 DT223
	ON
		DT222.C472 <> DT223.C1076
	)
WHERE
	(
		(
			DT222.C454 > DT222.C462
		)
		AND
		(
			DT222.C472 < DT222.C461
		)
	)
	AND
	(
		DT222.C465 = DT222.C457
	)
GROUP BY
	DT222.C464
	, DT222.C470
	, DT223.C1076
ORDER BY
	DT223.C1076
	, MIN( DT222.C464 )
	, DT222.C470
	, DT222.C464
LIMIT 739;


SELECT
	MIN( DT225.C359 )
	, DT226.C712
	, DT225.C359
	, DT225.C358
FROM
	(
		(
			T58 DT226
		INNER JOIN
			T87 DT224
		ON
			DT226.C701 = DT224.C1063
		)
	INNER JOIN
		T31 DT225
	ON
		DT226.C707 = DT225.C347
	)
WHERE
	(
		(
			(
				DT225.C361 < DT224.C1057
			)
			AND
			(
				DT225.C345 = DT226.C706
			)
		)
		OR
		(
			DT224.C1061 > DT226.C702
		)
	)
	OR
	(
		(
			DT226.C706 <> DT224.C1059
		)
		AND
		(
			DT224.C1061 <> DT225.C353
		)
	)
GROUP BY
	DT225.C359
	, DT226.C712
	, DT225.C358
ORDER BY
	MIN( DT225.C359 )
	, DT226.C712
	, DT225.C359
	, DT225.C358
LIMIT 239;


SELECT
	DT228.C768
FROM
	(
		(
			T68 DT229
		INNER JOIN
			(
				T64 DT228
			INNER JOIN
				T85 DT230
			ON
				DT228.C773 <> DT230.C1035
			)
		ON
			DT229.C821 < DT230.C1039
		)
	INNER JOIN
		T70 DT227
	ON
		DT228.C766 = DT227.C852
	)
WHERE
	(
		DT227.C850 = DT228.C764
	)
	AND
	(
		(
			(
				DT227.C840 = DT228.C772
			)
			AND
			(
				DT230.C1030 = DT228.C775
			)
		)
		OR
		(
			(
				DT230.C1031 = DT228.C776
			)
			AND
			(
				DT228.C775 > DT229.C822
			)
		)
	)
GROUP BY
	DT230.C1038
	, DT228.C768
ORDER BY
	DT228.C768
LIMIT 235;


SELECT
	MAX( DT232.C870 )
	, MAX( DT233.C613 )
FROM
	(
		(
			T51 DT233
		INNER JOIN
			T42 DT231
		ON
			DT233.C613 = DT231.C486
		)
	INNER JOIN
		T72 DT232
	ON
		DT233.C620 > DT232.C871
	)
WHERE
	(
		DT231.C484 <> DT233.C617
	)
	AND
	(
		DT233.C612 = DT232.C878
	)
GROUP BY
	DT232.C870
	, DT232.C871
	, DT233.C613
ORDER BY
	MAX( DT232.C870 )
	, MAX( DT233.C613 )
LIMIT 868;


SELECT
	DT235.C199
	, DT235.C191
	, SUM( DT234.C421 )
	, DT234.C421
	, MAX( DT235.C199 )
FROM
	(
		T36 DT234
	INNER JOIN
		T15 DT235
	ON
		DT234.C430 < DT235.C193
	)
WHERE
	(
		DT235.C188 > DT234.C432
	)
	OR
	(
		DT234.C427 > DT235.C199
	)
GROUP BY
	DT235.C199
	, DT235.C191
	, DT234.C421
ORDER BY
	DT235.C199
	, DT235.C191
	, SUM( DT234.C421 )
	, DT234.C421
	, MAX( DT235.C199 )
LIMIT 901;


SELECT
	DT237.C257
	, COUNT( DT237.C247 )
	, DT237.C247
	, COUNT( DT237.C257 )
FROM
	(
		T21 DT237
	INNER JOIN
		T68 DT236
	ON
		DT237.C256 = DT236.C821
	)
WHERE
	(
		DT237.C253 = DT237.C250
	)
	AND
	(
		(
			DT236.C821 = DT237.C248
		)
		OR
		(
			DT237.C255 = DT237.C247
		)
	)
GROUP BY
	DT237.C247
	, DT237.C257
ORDER BY
	DT237.C257
	, COUNT( DT237.C247 )
	, DT237.C247
	, COUNT( DT237.C257 )
LIMIT 815;


SELECT
	DT239.C575
	, DT238.C154
	, DT239.C572
	, to_char(AVG( DT239.C572 ), '9999999.9999999')  

FROM
	(
		T48 DT239
	INNER JOIN
		(
			T11 DT238
		INNER JOIN
			T45 DT240
		ON
			DT238.C154 < DT240.C527
		)
	ON
		DT239.C569 = DT240.C527
	)
WHERE
	(
		DT239.C576 > DT240.C517
	)
	OR
	(
		(
			(
				DT240.C519 < DT239.C568
			)
			AND
			(
				DT238.C156 < DT239.C575
			)
		)
		OR
		(
			(
				DT240.C525 > DT240.C512
			)
			OR
			(
				DT240.C518 < DT239.C581
			)
		)
	)
GROUP BY
	DT239.C575
	, DT239.C572
	, DT238.C154
ORDER BY
	DT239.C575
	, DT238.C154
	, DT239.C572
	, AVG( DT239.C572 )
LIMIT 863;


SELECT
	MAX( DT242.C714 )
FROM
	(
		T72 DT241
	LEFT OUTER JOIN
		T59 DT242
	ON
		DT241.C875 = DT242.C714
	)
WHERE
	(
		(
			DT241.C875 = DT242.C713
		)
		AND
		(
			(
				(
					DT241.C880 < DT241.C872
				)
				OR
				(
					DT241.C870 <> DT242.C714
				)
			)
			OR
			(
				DT241.C868 < DT242.C716
			)
		)
	)
	AND
	(
		DT241.C881 < DT241.C880
	)
GROUP BY
	DT242.C714
	, DT241.C873
ORDER BY
	MAX( DT242.C714 )
LIMIT 304;


SELECT
	DT243.C212
	, SUM( DT243.C212 )
FROM
	(
		T17 DT243
	INNER JOIN
		T59 DT244
	ON
		DT243.C214 < DT244.C714
	)
WHERE
	(
		DT243.C211 > DT243.C217
	)
	AND
	(
		(
			DT243.C215 = DT243.C212
		)
		OR
		(
			(
				DT243.C208 > DT244.C713
			)
			OR
			(
				(
					DT243.C212 = DT243.C217
				)
				AND
				(
					DT243.C214 = DT243.C212
				)
			)
		)
	)
GROUP BY
	DT243.C210
	, DT243.C212
ORDER BY
	DT243.C212
	, SUM( DT243.C212 )
LIMIT 700;


SELECT
	DT246.C377
	, DT246.C364
	, MAX( DT246.C377 )
	, DT247.C84
FROM
	(
		T32 DT246
	LEFT OUTER JOIN
		(
			T47 DT245
		INNER JOIN
			T6 DT247
		ON
			DT245.C564 > DT247.C77
		)
	ON
		DT246.C367 = DT245.C552
	)
WHERE
	(
		DT246.C377 = DT245.C558
	)
	AND
	(
		(
			DT247.C82 = DT246.C368
		)
		AND
		(
			DT246.C377 > DT246.C374
		)
	)
GROUP BY
	DT246.C377
	, DT247.C84
	, DT246.C364
ORDER BY
	DT246.C377
	, DT246.C364
	, MAX( DT246.C377 )
	, DT247.C84
LIMIT 840;


SELECT
	DT248.C368
	, to_char(AVG( DT249.C717), '9999999.9999999') 

	, DT249.C717
FROM
	(
		T60 DT249
	INNER JOIN
		(
			T32 DT248
		INNER JOIN
			T56 DT250
		ON
			DT248.C368 < DT250.C668
		)
	ON
		DT249.C718 < DT248.C369
	)
WHERE
	(
		(
			DT248.C371 = DT250.C676
		)
		OR
		(
			DT250.C681 = DT250.C676
		)
	)
	OR
	(
		(
			DT250.C676 > DT248.C368
		)
		OR
		(
			DT249.C720 < DT249.C719
		)
	)
GROUP BY
	DT248.C368
	, DT249.C717
	, DT250.C671
ORDER BY
	DT248.C368
	, AVG( DT249.C717 )
	, DT249.C717
LIMIT 453;


SELECT
	DT253.C288
	, DT252.C587
FROM
	(
		T49 DT252
	INNER JOIN
		(
			T14 DT251
		LEFT OUTER JOIN
			T25 DT253
		ON
			DT251.C182 > DT253.C284
		)
	ON
		DT252.C596 > DT253.C286
	)
WHERE
	(
		DT251.C183 > DT252.C596
	)
	OR
	(
		DT253.C287 = DT252.C596
	)
GROUP BY
	DT252.C587
	, DT252.C598
	, DT253.C288
ORDER BY
	DT253.C288
	, DT252.C587
LIMIT 795;


SELECT
	MAX( DT255.C1104 )
FROM
	(
		T91 DT255
	INNER JOIN
		T26 DT254
	ON
		DT255.C1099 <> DT254.C315
	)
WHERE
	(
		(
			(
				DT255.C1104 > DT255.C1110
			)
			OR
			(
				DT254.C299 = DT255.C1108
			)
		)
		AND
		(
			DT254.C304 <> DT254.C302
		)
	)
	AND
	(
		DT255.C1103 < DT255.C1100
	)
GROUP BY
	DT254.C305
	, DT255.C1104
ORDER BY
	MAX( DT255.C1104 )
LIMIT 343;


SELECT
	DT257.C359
	, MAX( DT257.C359 )
	, DT257.C353
	, SUM( DT257.C347 )
	, DT257.C347
FROM
	(
		(
			T31 DT257
		INNER JOIN
			T81 DT258
		ON
			DT257.C360 <> DT258.C992
		)
	INNER JOIN
		T40 DT256
	ON
		DT257.C345 = DT256.C448
	)
WHERE
	(
		DT257.C358 = DT258.C993
	)
	AND
	(
		(
			DT257.C354 = DT257.C347
		)
		AND
		(
			(
				DT257.C346 = DT256.C448
			)
			OR
			(
				DT258.C990 <> DT257.C352
			)
		)
	)
GROUP BY
	DT257.C353
	, DT257.C359
	, DT257.C347
ORDER BY
	DT257.C359
	, MAX( DT257.C359 )
	, DT257.C353
	, SUM( DT257.C347 )
	, DT257.C347
LIMIT 688;


SELECT
	MIN( DT259.C860 )
	, MAX( DT259.C866 )
	, DT259.C866
	, DT259.C860
	, SUM( DT260.C1 )
FROM
	(
		T0 DT260
	INNER JOIN
		T71 DT259
	ON
		DT260.C2 <> DT259.C863
	)
WHERE
	(
		DT260.C3 = DT259.C865
	)
	OR
	(
		(
			DT260.C1 > DT259.C861
		)
		AND
		(
			DT260.C0 = DT260.C3
		)
	)
GROUP BY
	DT259.C866
	, DT260.C1
	, DT259.C860
ORDER BY
	MIN( DT259.C860 )
	, MAX( DT259.C866 )
	, DT259.C866
	, DT259.C860
	, SUM( DT260.C1 )
LIMIT 113;


SELECT
	DT261.C1131
FROM
	(
		T92 DT261
	INNER JOIN
		T87 DT262
	ON
		DT261.C1121 = DT262.C1062
	)
WHERE
	(
		DT261.C1135 < DT261.C1116
	)
	OR
	(
		(
			DT261.C1132 < DT261.C1128
		)
		AND
		(
			DT261.C1133 = DT262.C1057
		)
	)
GROUP BY
	DT261.C1131
	, DT262.C1058
ORDER BY
	DT261.C1131
LIMIT 277;


SELECT
	DT264.C364
	, DT264.C378
	, MIN( DT264.C378 )
FROM
	(
		(
			T32 DT264
		INNER JOIN
			T16 DT265
		ON
			DT264.C375 <> DT265.C200
		)
	INNER JOIN
		(
			T11 DT263
		INNER JOIN
			T4 DT266
		ON
			DT263.C154 > DT266.C63
		)
	ON
		DT264.C380 = DT266.C54
	)
WHERE
	(
		(
			(
				DT266.C57 > DT266.C65
			)
			OR
			(
				DT264.C366 < DT265.C205
			)
		)
		OR
		(
			DT266.C58 = DT266.C59
		)
	)
	OR
	(
		DT264.C382 = DT266.C59
	)
GROUP BY
	DT265.C200
	, DT264.C378
	, DT264.C364
ORDER BY
	DT264.C364
	, DT264.C378
	, MIN( DT264.C378 )
LIMIT 240;


SELECT
	to_char(AVG( DT268.C334 ), '9999999.9999999') 
	, DT268.C340
	, DT268.C336
	, SUM( DT268.C336 )
FROM
	(
		T81 DT267
	INNER JOIN
		T29 DT268
	ON
		DT267.C992 = DT268.C340
	)
WHERE
	(
		DT268.C339 <> DT268.C339
	)
	OR
	(
		DT267.C994 = DT268.C339
	)
GROUP BY
	DT268.C340
	, DT268.C334
	, DT268.C336
ORDER BY
	AVG( DT268.C334 )
	, DT268.C340
	, DT268.C336
	, SUM( DT268.C336 )
LIMIT 825;


SELECT
	MIN( DT269.C1008 )
	, DT269.C1008
	, DT272.C799
	, MIN( DT272.C799 )
FROM
	(
		T66 DT272
	INNER JOIN
		(
			T56 DT271
		INNER JOIN
			(
				T84 DT269
			INNER JOIN
				T12 DT270
			ON
				DT269.C1011 = DT270.C163
			)
		ON
			DT271.C676 = DT269.C1009
		)
	ON
		DT272.C800 <> DT269.C1021
	)
WHERE
	(
		(
			DT270.C157 = DT269.C1028
		)
		AND
		(
			DT269.C1025 = DT271.C680
		)
	)
	OR
	(
		(
			DT270.C162 < DT271.C681
		)
		AND
		(
			DT269.C1008 > DT270.C163
		)
	)
GROUP BY
	DT269.C1008
	, DT272.C799
ORDER BY
	MIN( DT269.C1008 )
	, DT269.C1008
	, DT272.C799
	, MIN( DT272.C799 )
LIMIT 658;


SELECT
	MAX( DT273.C132 )
FROM
	(
		T19 DT275
	INNER JOIN
		(
			T9 DT273
		LEFT OUTER JOIN
			T82 DT274
		ON
			DT273.C126 = DT274.C997
		)
	ON
		DT275.C230 = DT273.C127
	)
WHERE
	(
		DT273.C126 = DT273.C133
	)
	OR
	(
		DT273.C135 < DT273.C130
	)
GROUP BY
	DT273.C127
	, DT273.C132
ORDER BY
	MAX( DT273.C132 )
LIMIT 472;


SELECT
	COUNT( DT279.C332 )
FROM
	(
		T28 DT279
	INNER JOIN
		(
			(
				T59 DT277
			INNER JOIN
				T25 DT278
			ON
				DT277.C713 < DT278.C285
			)
		INNER JOIN
			T78 DT276
		ON
			DT277.C715 < DT276.C969
		)
	ON
		DT279.C330 = DT278.C293
	)
WHERE
	(
		DT276.C968 < DT276.C971
	)
	OR
	(
		(
			DT276.C972 > DT279.C329
		)
		AND
		(
			DT278.C289 > DT276.C978
		)
	)
GROUP BY
	DT277.C714
	, DT279.C332
	, DT276.C974
ORDER BY
	COUNT( DT279.C332 )
LIMIT 973;


SELECT
	DT282.C781
FROM
	(
		T64 DT282
	INNER JOIN
		(
			T60 DT281
		INNER JOIN
			T65 DT280
		ON
			DT281.C718 <> DT280.C788
		)
	ON
		DT282.C777 <> DT280.C790
	)
WHERE
	(
		(
			DT282.C775 = DT282.C780
		)
		OR
		(
			(
				DT280.C794 <> DT282.C777
			)
			OR
			(
				(
					DT282.C766 = DT281.C718
				)
				AND
				(
					DT281.C718 <> DT282.C766
				)
			)
		)
	)
	OR
	(
		DT282.C779 > DT281.C717
	)
GROUP BY
	DT282.C769
	, DT282.C781
	, DT281.C719
ORDER BY
	DT282.C781
LIMIT 150;


SELECT
	DT284.C798
	, DT283.C417
	, to_char(AVG( DT284.C798 ), '9999999.9999999')
	, DT283.C412
	, to_char(AVG( DT283.C417 ), '9999999.9999999') 
FROM
	(
		(
			T40 DT285
		INNER JOIN
			T66 DT284
		ON
			DT285.C449 = DT284.C800
		)
	INNER JOIN
		T35 DT283
	ON
		DT284.C800 = DT283.C414
	)
WHERE
	(
		(
			DT283.C415 <> DT285.C449
		)
		AND
		(
			(
				DT284.C800 = DT284.C802
			)
			OR
			(
				DT285.C448 = DT283.C415
			)
		)
	)
	OR
	(
		(
			DT284.C800 < DT283.C415
		)
		OR
		(
			DT283.C418 = DT283.C418
		)
	)
GROUP BY
	DT283.C417
	, DT283.C412
	, DT284.C798
ORDER BY
	DT284.C798
	, DT283.C417
	, AVG( DT284.C798 )
	, DT283.C412
	, AVG( DT283.C417 )
LIMIT 940;


SELECT
	DT289.C88
FROM
	(
		(
			T51 DT288
		INNER JOIN
			T72 DT287
		ON
			DT288.C621 = DT287.C885
		)
	INNER JOIN
		(
			T13 DT286
		INNER JOIN
			T6 DT289
		ON
			DT286.C167 < DT289.C86
		)
	ON
		DT288.C622 > DT286.C177
	)
WHERE
	(
		DT287.C875 = DT286.C169
	)
	AND
	(
		(
			DT288.C621 < DT287.C872
		)
		AND
		(
			DT288.C611 = DT286.C171
		)
	)
GROUP BY
	DT287.C868
	, DT289.C88
ORDER BY
	DT289.C88
LIMIT 756;


SELECT
	MAX( DT290.C742 )
	, MIN( DT291.C861 )
	, DT291.C861
FROM
	(
		T62 DT290
	LEFT OUTER JOIN
		T71 DT291
	ON
		DT290.C741 = DT291.C865
	)
WHERE
	(
		DT291.C861 = DT291.C866
	)
	AND
	(
		DT291.C864 = DT290.C742
	)
GROUP BY
	DT290.C742
	, DT291.C861
ORDER BY
	MAX( DT290.C742 )
	, MIN( DT291.C861 )
	, DT291.C861
LIMIT 868;


SELECT
	DT293.C30
	, MIN( DT294.C672 )
FROM
	(
		(
			T99 DT295
		INNER JOIN
			T20 DT292
		ON
			DT295.C1205 > DT292.C239
		)
	INNER JOIN
		(
			T2 DT293
		INNER JOIN
			T56 DT294
		ON
			DT293.C26 = DT294.C677
		)
	ON
		DT292.C235 <> DT294.C671
	)
WHERE
	(
		DT295.C1206 <> DT293.C29
	)
	AND
	(
		DT295.C1208 <> DT294.C679
	)
GROUP BY
	DT294.C672
	, DT293.C30
ORDER BY
	DT293.C30
	, MIN( DT294.C672 )
LIMIT 968;


SELECT
	DT297.C1038
	, DT297.C1032
FROM
	(
		T88 DT298
	INNER JOIN
		(
			T85 DT297
		INNER JOIN
			T81 DT296
		ON
			DT297.C1034 > DT296.C991
		)
	ON
		DT298.C1073 <> DT297.C1039
	)
WHERE
	(
		(
			DT296.C992 > DT298.C1068
		)
		OR
		(
			(
				DT298.C1069 = DT298.C1072
			)
			OR
			(
				DT297.C1039 > DT296.C994
			)
		)
	)
	AND
	(
		(
			DT296.C992 > DT297.C1031
		)
		AND
		(
			DT297.C1041 <> DT297.C1029
		)
	)
GROUP BY
	DT298.C1069
	, DT297.C1038
	, DT297.C1032
ORDER BY
	DT297.C1038
	, DT297.C1032
LIMIT 901;


SELECT
	to_char(AVG( DT300.C973 ), '9999999.9999999')  AS "AVG( DT300.C973 )"
	, DT301.C1057
FROM
	(
		T78 DT300
	INNER JOIN
		(
			(
				T87 DT301
			INNER JOIN
				T37 DT299
			ON
				DT301.C1057 <> DT299.C439
			)
		INNER JOIN
			T71 DT302
		ON
			DT301.C1058 = DT302.C862
		)
	ON
		DT300.C970 > DT301.C1058
	)
WHERE
	(
		DT301.C1062 > DT300.C967
	)
	AND
	(
		DT302.C866 > DT302.C860
	)
GROUP BY
	DT300.C973
	, DT301.C1057
	, DT301.C1056
ORDER BY
	AVG( DT300.C973 )
	, DT301.C1057
LIMIT 686;


SELECT
	DT304.C1207
FROM
	(
		(
			T33 DT303
		INNER JOIN
			T0 DT306
		ON
			DT303.C398 = DT306.C0
		)
	INNER JOIN
		(
			T99 DT304
		INNER JOIN
			T6 DT305
		ON
			DT304.C1207 = DT305.C80
		)
	ON
		DT303.C386 <> DT304.C1207
	)
WHERE
	(
		(
			DT304.C1207 = DT305.C80
		)
		AND
		(
			(
				(
					DT303.C400 = DT304.C1206
				)
				OR
				(
					DT304.C1208 = DT306.C1
				)
			)
			AND
			(
				DT303.C394 <> DT304.C1207
			)
		)
	)
	OR
	(
		DT304.C1208 = DT305.C82
	)
GROUP BY
	DT303.C395
	, DT304.C1207
ORDER BY
	DT304.C1207
LIMIT 876;


SELECT
	MAX( DT309.C817 )
FROM
	(
		(
			T67 DT309
		INNER JOIN
			T32 DT307
		ON
			DT309.C810 = DT307.C373
		)
	INNER JOIN
		T86 DT308
	ON
		DT307.C365 <> DT308.C1053
	)
WHERE
	(
		DT309.C814 > DT307.C376
	)
	OR
	(
		(
			DT308.C1049 = DT307.C365
		)
		OR
		(
			DT309.C812 < DT308.C1049
		)
	)
GROUP BY
	DT309.C817
	, DT307.C365
ORDER BY
	MAX( DT309.C817 )
LIMIT 760;


SELECT
	DT311.C902
	, DT311.C899
FROM
	(
		T73 DT311
	RIGHT OUTER JOIN
		T69 DT310
	ON
		DT311.C898 <> DT310.C832
	)
WHERE
	(
		DT310.C831 <> DT311.C904
	)
	AND
	(
		DT310.C824 = DT310.C824
	)
GROUP BY
	DT311.C907
	, DT311.C899
	, DT311.C902
ORDER BY
	DT311.C902
	, DT311.C899
LIMIT 453;


SELECT
	DT313.C927
	, DT313.C925
	, MAX( DT313.C913 )
	, DT313.C913
FROM
	(
		(
			T80 DT314
		INNER JOIN
			T74 DT313
		ON
			DT314.C986 < DT313.C918
		)
	INNER JOIN
		T62 DT312
	ON
		DT313.C929 = DT312.C740
	)
WHERE
	(
		(
			DT313.C916 = DT313.C916
		)
		AND
		(
			DT312.C740 = DT313.C914
		)
	)
	AND
	(
		DT314.C986 = DT312.C741
	)
GROUP BY
	DT313.C925
	, DT313.C913
	, DT313.C927
ORDER BY
	DT313.C927
	, DT313.C925
	, MAX( DT313.C913 )
	, DT313.C913
LIMIT 279;


SELECT
	DT316.C198
FROM
	(
		T15 DT316
	INNER JOIN
		T53 DT315
	ON
		DT316.C199 > DT315.C642
	)
WHERE
	(
		DT316.C187 > DT315.C652
	)
	OR
	(
		(
			DT316.C194 = DT315.C649
		)
		AND
		(
			DT315.C652 < DT315.C636
		)
	)
GROUP BY
	DT316.C198
	, DT315.C637
ORDER BY
	DT316.C198
LIMIT 494;


SELECT
	DT320.C472
	, MAX( DT320.C472 )
	, DT320.C456
	, MIN( DT320.C456 )
FROM
	(
		T31 DT317
	INNER JOIN
		(
			T92 DT319
		INNER JOIN
			(
				T38 DT318
			INNER JOIN
				T41 DT320
			ON
				DT318.C441 > DT320.C467
			)
		ON
			DT319.C1123 > DT318.C441
		)
	ON
		DT317.C352 = DT319.C1131
	)
WHERE
	(
		DT320.C461 > DT319.C1124
	)
	OR
	(
		(
			DT317.C355 = DT319.C1132
		)
		OR
		(
			(
				DT317.C359 > DT320.C461
			)
			OR
			(
				DT317.C352 <> DT317.C346
			)
		)
	)
GROUP BY
	DT320.C472
	, DT320.C456
ORDER BY
	DT320.C472
	, MAX( DT320.C472 )
	, DT320.C456
	, MIN( DT320.C456 )
LIMIT 430;


SELECT
	COUNT( DT321.C912 )
	, DT321.C916
	, DT321.C920
	, MIN( DT321.C916 )
	, COUNT( DT321.C920 )
FROM
	(
		T81 DT322
	INNER JOIN
		T74 DT321
	ON
		DT322.C991 <> DT321.C929
	)
WHERE
	(
		DT322.C993 = DT322.C991
	)
	AND
	(
		(
			DT321.C928 = DT321.C929
		)
		OR
		(
			(
				DT321.C910 < DT321.C921
			)
			OR
			(
				DT321.C911 = DT321.C913
			)
		)
	)
GROUP BY
	DT321.C920
	, DT321.C912
	, DT321.C916
ORDER BY
	COUNT( DT321.C912 )
	, DT321.C916
	, DT321.C920
	, MIN( DT321.C916 )
	, COUNT( DT321.C920 )
LIMIT 703;


SELECT
	DT324.C941
	, COUNT( DT324.C941 )
	, DT323.C1199
	, to_char(AVG( DT323.C1199 ), '9999999.9999999')  
FROM
	(
		T76 DT324
	INNER JOIN
		T97 DT323
	ON
		DT324.C940 > DT323.C1196
	)
WHERE
	(
		DT323.C1198 = DT323.C1193
	)
	OR
	(
		(
			DT324.C941 = DT324.C939
		)
		OR
		(
			DT323.C1193 = DT324.C941
		)
	)
GROUP BY
	DT323.C1199
	, DT324.C941
ORDER BY
	DT324.C941
	, COUNT( DT324.C941 )
	, DT323.C1199
	, AVG( DT323.C1199 )
LIMIT 400;


SELECT
	DT325.C981
	, DT325.C983
	, MIN( DT325.C983 )
FROM
	(
		T72 DT327
	INNER JOIN
		(
			T63 DT326
		INNER JOIN
			T79 DT325
		ON
			DT326.C759 < DT325.C985
		)
	ON
		DT327.C882 = DT326.C759
	)
WHERE
	(
		(
			DT325.C984 < DT326.C763
		)
		AND
		(
			DT326.C759 = DT326.C757
		)
	)
	OR
	(
		(
			DT326.C752 < DT327.C871
		)
		OR
		(
			DT326.C747 < DT325.C985
		)
	)
GROUP BY
	DT325.C981
	, DT325.C983
ORDER BY
	DT325.C981
	, DT325.C983
	, MIN( DT325.C983 )
LIMIT 451;


SELECT
	DT331.C741
	, MIN( DT329.C957 )
	, DT330.C1208
FROM
	(
		(
			(
				T99 DT330
			INNER JOIN
				T77 DT329
			ON
				DT330.C1207 = DT329.C962
			)
		INNER JOIN
			T0 DT328
		ON
			DT329.C949 = DT328.C3
		)
	INNER JOIN
		T62 DT331
	ON
		DT329.C962 > DT331.C741
	)
WHERE
	(
		(
			DT330.C1206 = DT329.C950
		)
		AND
		(
			DT330.C1208 <> DT329.C949
		)
	)
	AND
	(
		(
			(
				DT329.C953 = DT329.C956
			)
			AND
			(
				DT328.C2 = DT328.C1
			)
		)
		AND
		(
			DT330.C1208 = DT329.C960
		)
	)
GROUP BY
	DT329.C957
	, DT330.C1208
	, DT331.C741
ORDER BY
	DT331.C741
	, MIN( DT329.C957 )
	, DT330.C1208
LIMIT 420;


SELECT
	DT334.C392
FROM
	(
		(
			T82 DT332
		LEFT OUTER JOIN
			T80 DT333
		ON
			DT332.C997 < DT333.C989
		)
	INNER JOIN
		(
			T35 DT335
		LEFT OUTER JOIN
			T33 DT334
		ON
			DT335.C415 = DT334.C394
		)
	ON
		DT333.C987 < DT334.C383
	)
WHERE
	(
		DT334.C394 = DT333.C987
	)
	OR
	(
		DT334.C395 > DT335.C414
	)
GROUP BY
	DT334.C392
	, DT333.C989
ORDER BY
	DT334.C392
LIMIT 115;


SELECT
	DT339.C992
	, MIN( DT339.C992 )
	, DT337.C598
FROM
	(
		(
			T28 DT338
		INNER JOIN
			(
				T81 DT339
			INNER JOIN
				T5 DT336
			ON
				DT339.C991 < DT336.C68
			)
		ON
			DT338.C330 < DT336.C69
		)
	INNER JOIN
		T49 DT337
	ON
		DT339.C991 <> DT337.C598
	)
WHERE
	(
		DT338.C328 < DT338.C331
	)
	OR
	(
		DT339.C994 <> DT337.C591
	)
GROUP BY
	DT339.C992
	, DT337.C598
ORDER BY
	DT339.C992
	, MIN( DT339.C992 )
	, DT337.C598
LIMIT 427;


SELECT
	SUM( DT340.C383 )
FROM
	(
		T3 DT341
	LEFT OUTER JOIN
		T33 DT340
	ON
		DT341.C43 = DT340.C389
	)
WHERE
	(
		(
			DT341.C39 = DT341.C43
		)
		OR
		(
			(
				DT341.C51 < DT340.C386
			)
			AND
			(
				DT340.C395 = DT340.C390
			)
		)
	)
	OR
	(
		(
			DT341.C45 < DT340.C397
		)
		OR
		(
			DT340.C395 = DT340.C393
		)
	)
GROUP BY
	DT340.C383
	, DT340.C390
ORDER BY
	SUM( DT340.C383 )
LIMIT 665;


SELECT
	DT342.C1136
	, DT343.C271
	, COUNT( DT342.C1136 )
FROM
	(
		T93 DT342
	INNER JOIN
		T23 DT343
	ON
		DT342.C1138 < DT343.C272
	)
WHERE
	(
		(
			(
				(
					DT343.C273 = DT342.C1137
				)
				OR
				(
					DT342.C1138 < DT342.C1139
				)
			)
			OR
			(
				DT343.C271 = DT343.C273
			)
		)
		AND
		(
			DT342.C1142 <> DT342.C1143
		)
	)
	OR
	(
		DT342.C1138 > DT343.C277
	)
GROUP BY
	DT343.C271
	, DT342.C1136
ORDER BY
	DT342.C1136
	, DT343.C271
	, COUNT( DT342.C1136 )
LIMIT 266;


SELECT
	to_char(AVG( DT346.C196 ), '9999999.9999999')  
	, DT346.C196
	, DT347.C449
	, SUM( DT347.C449 )
FROM
	(
		T62 DT345
	INNER JOIN
		(
			T86 DT344
		INNER JOIN
			(
				T15 DT346
			INNER JOIN
				T40 DT347
			ON
				DT346.C194 > DT347.C450
			)
		ON
			DT344.C1048 <> DT346.C186
		)
	ON
		DT345.C740 = DT346.C196
	)
WHERE
	(
		(
			(
				DT344.C1050 <> DT347.C447
			)
			AND
			(
				(
					DT344.C1049 = DT344.C1047
				)
				OR
				(
					DT344.C1048 = DT347.C447
				)
			)
		)
		OR
		(
			DT346.C188 = DT347.C447
		)
	)
	AND
	(
		DT346.C195 <> DT345.C740
	)
GROUP BY
	DT347.C449
	, DT346.C196
ORDER BY
	AVG( DT346.C196 )
	, DT346.C196
	, DT347.C449
	, SUM( DT347.C449 )
LIMIT 328;


SELECT
	COUNT( DT349.C991 )
	, AVG( DT348.C821 )
FROM
	(
		T68 DT348
	INNER JOIN
		T81 DT349
	ON
		DT348.C822 <> DT349.C993
	)
WHERE
	(
		(
			DT349.C992 = DT349.C992
		)
		AND
		(
			DT349.C993 = DT349.C992
		)
	)
	AND
	(
		(
			DT349.C993 = DT349.C991
		)
		AND
		(
			DT349.C992 = DT349.C992
		)
	)
GROUP BY
	DT348.C821
	, DT349.C991
ORDER BY
	COUNT( DT349.C991 )
	, AVG( DT348.C821 )
LIMIT 448;


SELECT
	DT350.C547
FROM
	(
		T14 DT351
	INNER JOIN
		T46 DT350
	ON
		DT351.C181 = DT350.C543
	)
WHERE
	(
		DT350.C546 < DT350.C530
	)
	OR
	(
		(
			(
				DT350.C528 = DT351.C183
			)
			AND
			(
				DT351.C181 < DT350.C534
			)
		)
		OR
		(
			DT350.C536 = DT350.C535
		)
	)
GROUP BY
	DT350.C547
	, DT350.C539
ORDER BY
	DT350.C547
LIMIT 966;


SELECT
	to_char(AVG( DT353.C1137 ), '9999999.9999999') 
	, DT352.C1091
	, DT353.C1137
FROM
	(
		T90 DT352
	INNER JOIN
		T93 DT353
	ON
		DT352.C1083 = DT353.C1138
	)
WHERE
	(
		(
			DT353.C1136 = DT353.C1144
		)
		OR
		(
			(
				DT353.C1144 > DT353.C1142
			)
			OR
			(
				DT353.C1142 > DT352.C1092
			)
		)
	)
	AND
	(
		(
			DT352.C1088 = DT353.C1138
		)
		AND
		(
			DT353.C1142 > DT352.C1090
		)
	)
GROUP BY
	DT353.C1142
	, DT352.C1091
	, DT353.C1137
ORDER BY
	AVG( DT353.C1137 )
	, DT352.C1091
	, DT353.C1137
LIMIT 567;


SELECT
	DT356.C985
	, DT355.C394
	, MIN( DT356.C985 )
	, COUNT( DT355.C394 )
FROM
	(
		(
			T33 DT355
		INNER JOIN
			T54 DT354
		ON
			DT355.C384 > DT354.C655
		)
	INNER JOIN
		T79 DT356
	ON
		DT355.C388 < DT356.C982
	)
WHERE
	(
		DT355.C384 = DT356.C981
	)
	OR
	(
		(
			DT355.C388 = DT356.C981
		)
		OR
		(
			DT355.C389 <> DT355.C396
		)
	)
GROUP BY
	DT355.C394
	, DT356.C985
ORDER BY
	DT356.C985
	, DT355.C394
	, MIN( DT356.C985 )
	, COUNT( DT355.C394 )
LIMIT 628;


SELECT
	DT359.C155
	, to_char(AVG( DT360.C336 ), '9999999.9999999') 
	, to_char(AVG( DT359.C155 ), '9999999.9999999')
FROM
	(
		(
			T58 DT357
		INNER JOIN
			T29 DT360
		ON
			DT357.C710 < DT360.C335
		)
	INNER JOIN
		(
			T11 DT359
		INNER JOIN
			T26 DT358
		ON
			DT359.C153 = DT358.C316
		)
	ON
		DT357.C706 = DT359.C156
	)
WHERE
	(
		(
			DT358.C298 = DT358.C299
		)
		AND
		(
			DT358.C299 > DT360.C338
		)
	)
	OR
	(
		(
			(
				DT360.C336 > DT357.C704
			)
			AND
			(
				DT360.C336 < DT360.C336
			)
		)
		OR
		(
			DT360.C337 <> DT358.C302
		)
	)
GROUP BY
	DT359.C155
	, DT360.C336
ORDER BY
	DT359.C155
	, AVG( DT360.C336 )
	, AVG( DT359.C155 )
LIMIT 422;


SELECT
	DT362.C261
	, DT362.C259
FROM
	(
		T75 DT361
	INNER JOIN
		T22 DT362
	ON
		DT361.C934 = DT362.C260
	)
WHERE
	(
		DT362.C259 = DT361.C935
	)
	OR
	(
		(
			DT362.C265 > DT362.C261
		)
		AND
		(
			DT361.C932 < DT361.C932
		)
	)
GROUP BY
	DT361.C930
	, DT362.C261
	, DT362.C259
ORDER BY
	DT362.C261
	, DT362.C259
LIMIT 358;


SELECT
	to_char(AVG( DT366.C1139 ), '9999999.9999999')  AS "AVG( DT366.C1139 )"
FROM
	(
		(
			T40 DT363
		INNER JOIN
			T36 DT364
		ON
			DT363.C450 = DT364.C429
		)
	RIGHT OUTER JOIN
		(
			T71 DT365
		INNER JOIN
			T93 DT366
		ON
			DT365.C864 = DT366.C1139
		)
	ON
		DT364.C432 > DT365.C864
	)
WHERE
	(
		(
			DT364.C433 <> DT364.C434
		)
		OR
		(
			(
				DT366.C1138 < DT366.C1142
			)
			OR
			(
				DT364.C422 = DT364.C430
			)
		)
	)
	AND
	(
		(
			DT366.C1144 <> DT364.C426
		)
		AND
		(
			DT364.C436 <> DT366.C1144
		)
	)
GROUP BY
	DT366.C1139
	, DT364.C431
ORDER BY
	AVG( DT366.C1139 )
LIMIT 350;


SELECT
	MIN( DT368.C476 )
	, DT368.C482
	, MIN( DT368.C482 )
FROM
	(
		(
			T19 DT369
		INNER JOIN
			T42 DT368
		ON
			DT369.C232 <> DT368.C480
		)
	INNER JOIN
		T39 DT367
	ON
		DT368.C477 < DT367.C446
	)
WHERE
	(
		(
			DT367.C445 = DT368.C485
		)
		AND
		(
			DT368.C473 = DT367.C444
		)
	)
	OR
	(
		(
			DT368.C482 = DT367.C446
		)
		OR
		(
			DT368.C474 = DT368.C484
		)
	)
GROUP BY
	DT368.C476
	, DT368.C482
ORDER BY
	MIN( DT368.C476 )
	, DT368.C482
	, MIN( DT368.C482 )
LIMIT 791;


SELECT
	DT372.C718
	, MIN( DT370.C355 )
	, MIN( DT372.C718 )
	, DT370.C355
	, DT371.C308
	, MIN( DT371.C308 )
FROM
	(
		(
			T26 DT371
		INNER JOIN
			T60 DT372
		ON
			DT371.C311 > DT372.C719
		)
	INNER JOIN
		T31 DT370
	ON
		DT372.C724 = DT370.C355
	)
WHERE
	(
		DT371.C307 = DT371.C309
	)
	OR
	(
		(
			DT372.C722 = DT372.C723
		)
		OR
		(
			DT372.C719 = DT370.C355
		)
	)
GROUP BY
	DT372.C718
	, DT370.C355
	, DT371.C308
ORDER BY
	DT372.C718
	, MIN( DT370.C355 )
	, MIN( DT372.C718 )
	, DT370.C355
	, DT371.C308
	, MIN( DT371.C308 )
LIMIT 840;


SELECT
	DT374.C955
	, SUM( DT374.C955 )
	, DT373.C1097
	, MIN( DT374.C961 )
	, MAX( DT373.C1097 )
FROM
	(
		T91 DT373
	INNER JOIN
		T77 DT374
	ON
		DT373.C1106 > DT374.C958
	)
WHERE
	(
		(
			(
				DT374.C959 < DT374.C963
			)
			OR
			(
				DT374.C957 = DT373.C1101
			)
		)
		AND
		(
			(
				DT373.C1113 > DT373.C1114
			)
			OR
			(
				DT374.C952 < DT374.C955
			)
		)
	)
	AND
	(
		DT373.C1109 < DT374.C951
	)
GROUP BY
	DT373.C1097
	, DT374.C961
	, DT374.C955
ORDER BY
	DT374.C955
	, SUM( DT374.C955 )
	, DT373.C1097
	, MIN( DT374.C961 )
	, MAX( DT373.C1097 )
LIMIT 461;


SELECT
	to_char(AVG( DT378.C1126 ), '9999999.9999999') 
FROM
	(
		(
			(
				T89 DT377
			INNER JOIN
				T79 DT376
			ON
				DT377.C1076 < DT376.C979
			)
		INNER JOIN
			T92 DT378
		ON
			DT376.C982 > DT378.C1121
		)
	INNER JOIN
		T67 DT375
	ON
		DT378.C1119 = DT375.C811
	)
WHERE
	(
		DT378.C1128 = DT378.C1131
	)
	OR
	(
		(
			DT375.C816 = DT375.C819
		)
		OR
		(
			DT378.C1117 = DT375.C818
		)
	)
GROUP BY
	DT378.C1132
	, DT375.C817
	, DT378.C1126
ORDER BY
	AVG( DT378.C1126 )
LIMIT 625;


SELECT
	COUNT( DT381.C569 )
FROM
	(
		T77 DT380
	INNER JOIN
		(
			T48 DT381
		INNER JOIN
			T78 DT379
		ON
			DT381.C582 > DT379.C973
		)
	ON
		DT380.C960 > DT379.C972
	)
WHERE
	(
		DT380.C951 <> DT381.C578
	)
	OR
	(
		(
			DT379.C966 = DT381.C577
		)
		OR
		(
			(
				DT381.C573 = DT381.C576
			)
			AND
			(
				DT381.C573 <> DT381.C584
			)
		)
	)
GROUP BY
	DT380.C962
	, DT380.C959
	, DT381.C569
ORDER BY
	COUNT( DT381.C569 )
LIMIT 806;


SELECT
	DT383.C627
	, DT382.C2
	, DT384.C1083
	, DT384.C1089
	, DT383.C625
	, DT385.C601
	, DT384.C1088
	, DT382.C3
	, DT384.C1080
	, DT383.C630
	, DT383.C628
FROM
	(
		T50 DT385
	INNER JOIN
		(
			T52 DT383
		INNER JOIN
			(
				T0 DT382
			INNER JOIN
				T90 DT384
			ON
				DT382.C3 <> DT384.C1091
			)
		ON
			DT383.C634 <> DT384.C1088
		)
	ON
		DT385.C600 <> DT383.C625
	)
WHERE
	(
		(
			DT383.C635 > DT384.C1092
		)
		AND
		(
			(
				DT384.C1083 < DT383.C627
			)
			AND
			(
				DT383.C632 > DT382.C3
			)
		)
	)
	OR
	(
		DT384.C1083 = DT384.C1084
	)
ORDER BY
	DT383.C627
	, DT382.C2
	, DT384.C1083
	, DT384.C1089
	, DT383.C625
	, DT385.C601
	, DT384.C1088
	, DT382.C3
	, DT384.C1080
	, DT383.C630
	, DT383.C628
LIMIT 951;


SELECT
	SUM( DT389.C692 )
	, DT389.C692
FROM
	(
		(
			(
				T57 DT389
			INNER JOIN
				T41 DT386
			ON
				DT389.C697 = DT386.C453
			)
		INNER JOIN
			T4 DT388
		ON
			DT389.C696 = DT388.C57
		)
	INNER JOIN
		T49 DT387
	ON
		DT386.C455 <> DT387.C591
	)
WHERE
	(
		DT387.C593 <> DT387.C599
	)
	OR
	(
		(
			(
				DT388.C56 <> DT389.C684
			)
			OR
			(
				DT389.C684 > DT387.C593
			)
		)
		AND
		(
			DT389.C692 > DT389.C686
		)
	)
GROUP BY
	DT389.C692
	, DT386.C464
ORDER BY
	SUM( DT389.C692 )
	, DT389.C692
LIMIT 754;


SELECT
	SUM( DT390.C861 )
	, DT392.C564
	, DT392.C559
	, DT390.C861
FROM
	(
		(
			T47 DT392
		INNER JOIN
			(
				T71 DT390
			INNER JOIN
				T94 DT391
			ON
				DT390.C862 < DT391.C1149
			)
		ON
			DT392.C559 <> DT391.C1154
		)
	INNER JOIN
		T22 DT393
	ON
		DT392.C559 = DT393.C266
	)
WHERE
	(
		(
			DT391.C1158 = DT393.C266
		)
		AND
		(
			DT393.C269 < DT391.C1145
		)
	)
	AND
	(
		DT391.C1150 < DT392.C561
	)
GROUP BY
	DT390.C861
	, DT392.C559
	, DT392.C564
ORDER BY
	SUM( DT390.C861 )
	, DT392.C564
	, DT392.C559
	, DT390.C861
LIMIT 328;


SELECT
	DT394.C329
	, COUNT( DT394.C329 )
	, DT395.C185
FROM
	(
		T14 DT395
	RIGHT OUTER JOIN
		T28 DT394
	ON
		DT395.C180 = DT394.C329
	)
WHERE
	(
		(
			DT394.C330 = DT395.C180
		)
		AND
		(
			DT394.C328 < DT395.C184
		)
	)
	AND
	(
		(
			DT394.C333 = DT394.C329
		)
		AND
		(
			DT394.C331 < DT394.C329
		)
	)
GROUP BY
	DT395.C185
	, DT394.C329
ORDER BY
	DT394.C329
	, COUNT( DT394.C329 )
	, DT395.C185
LIMIT 459;


SELECT
	DT396.C1165
	, DT397.C281
	, DT396.C1148
	, DT396.C1146
	, DT396.C1152
	, DT396.C1163
	, DT396.C1155
	, DT396.C1153
	, DT396.C1158
	, DT396.C1156
	, DT396.C1145
	, DT396.C1147
	, DT397.C282
	, DT396.C1166
	, DT396.C1149
	, DT396.C1154
	, DT396.C1160
	, DT396.C1157
	, DT396.C1150
	, DT397.C279
	, DT396.C1159
	, DT396.C1151
	, DT396.C1164
FROM
	(
		T24 DT397
	INNER JOIN
		T94 DT396
	ON
		DT397.C279 = DT396.C1153
	)
WHERE
	(
		(
			DT396.C1149 > DT396.C1165
		)
		OR
		(
			DT396.C1166 = DT397.C282
		)
	)
	AND
	(
		DT396.C1159 > DT396.C1157
	)
ORDER BY
	DT396.C1165
	, DT397.C281
	, DT396.C1148
	, DT396.C1146
	, DT396.C1152
	, DT396.C1163
	, DT396.C1155
	, DT396.C1153
	, DT396.C1158
	, DT396.C1156
	, DT396.C1145
	, DT396.C1147
	, DT397.C282
	, DT396.C1166
	, DT396.C1149
	, DT396.C1154
	, DT396.C1160
	, DT396.C1157
	, DT396.C1150
	, DT397.C279
	, DT396.C1159
	, DT396.C1151
	, DT396.C1164
LIMIT 104;


SELECT
	SUM( DT398.C739 )
	, to_char(AVG( DT398.C731 ), '9999999.9999999') 
	, DT398.C731
	, DT399.C984
	, DT398.C739
	, MIN( DT399.C984 )
FROM
	(
		T61 DT398
	INNER JOIN
		T79 DT399
	ON
		DT398.C737 = DT399.C980
	)
WHERE
	(
		(
			DT399.C981 > DT398.C735
		)
		OR
		(
			DT398.C732 = DT399.C979
		)
	)
	OR
	(
		(
			DT398.C730 = DT398.C735
		)
		AND
		(
			DT398.C738 <> DT399.C985
		)
	)
GROUP BY
	DT398.C739
	, DT399.C984
	, DT398.C731
ORDER BY
	SUM( DT398.C739 )
	, AVG( DT398.C731 )
	, DT398.C731
	, DT399.C984
	, DT398.C739
	, MIN( DT399.C984 )
LIMIT 600;


SELECT
	DT400.C327
	, COUNT( DT400.C327 )
	, COUNT( DT400.C320 )
FROM
	(
		T38 DT401
	INNER JOIN
		T27 DT400
	ON
		DT401.C443 <> DT400.C322
	)
WHERE
	(
		DT400.C319 <> DT400.C326
	)
	OR
	(
		(
			DT401.C441 > DT401.C441
		)
		OR
		(
			DT400.C320 = DT400.C323
		)
	)
GROUP BY
	DT400.C320
	, DT400.C327
ORDER BY
	DT400.C327
	, COUNT( DT400.C327 )
	, COUNT( DT400.C320 )
LIMIT 245;


SELECT
	DT404.C788
	, SUM( DT403.C318 )
FROM
	(
		(
			T65 DT404
		INNER JOIN
			T26 DT403
		ON
			DT404.C791 <> DT403.C314
		)
	INNER JOIN
		T35 DT402
	ON
		DT404.C795 <> DT402.C414
	)
WHERE
	(
		(
			(
				DT404.C791 = DT404.C790
			)
			AND
			(
				(
					DT403.C315 <> DT403.C308
				)
				AND
				(
					DT403.C316 = DT403.C312
				)
			)
		)
		OR
		(
			DT404.C794 = DT404.C791
		)
	)
	AND
	(
		DT402.C416 = DT403.C311
	)
GROUP BY
	DT404.C788
	, DT403.C318
	, DT404.C790
ORDER BY
	DT404.C788
	, SUM( DT403.C318 )
LIMIT 967;


SELECT
	DT405.C1166
	, MIN( DT405.C1148 )
FROM
	(
		(
			(
				T94 DT405
			LEFT OUTER JOIN
				T17 DT406
			ON
				DT405.C1162 = DT406.C209
			)
		INNER JOIN
			T90 DT408
		ON
			DT405.C1155 = DT408.C1088
		)
	INNER JOIN
		T88 DT407
	ON
		DT408.C1088 = DT407.C1067
	)
WHERE
	(
		DT405.C1161 = DT405.C1155
	)
	AND
	(
		DT406.C210 = DT407.C1072
	)
GROUP BY
	DT405.C1166
	, DT405.C1148
ORDER BY
	DT405.C1166
	, MIN( DT405.C1148 )
LIMIT 148;


SELECT
	AVG( DT411.C934 )
	, MIN( DT410.C431 )
FROM
	(
		T30 DT412
	INNER JOIN
		(
			T36 DT410
		INNER JOIN
			(
				T75 DT411
			RIGHT OUTER JOIN
				T90 DT409
			ON
				DT411.C934 <> DT409.C1082
			)
		ON
			DT410.C421 = DT409.C1087
		)
	ON
		DT412.C341 > DT409.C1079
	)
WHERE
	(
		DT410.C420 = DT412.C342
	)
	AND
	(
		(
			DT409.C1091 = DT410.C430
		)
		AND
		(
			DT410.C437 <> DT412.C341
		)
	)
GROUP BY
	DT411.C934
	, DT410.C431
ORDER BY
	AVG( DT411.C934 )
	, MIN( DT410.C431 )
LIMIT 207;


SELECT
	MIN( DT414.C633 )
	, to_char(AVG( DT413.C617 ), '9999999.9999999') 
FROM
	(
		(
			(
				T51 DT413
			INNER JOIN
				T9 DT415
			ON
				DT413.C609 > DT415.C129
			)
		INNER JOIN
			T49 DT416
		ON
			DT413.C624 > DT416.C589
		)
	INNER JOIN
		T52 DT414
	ON
		DT416.C589 = DT414.C628
	)
WHERE
	(
		(
			DT414.C633 = DT413.C612
		)
		OR
		(
			DT415.C130 = DT416.C599
		)
	)
	AND
	(
		(
			DT415.C133 = DT413.C609
		)
		AND
		(
			DT415.C128 = DT415.C127
		)
	)
GROUP BY
	DT414.C633
	, DT413.C617
ORDER BY
	MIN( DT414.C633 )
	, AVG( DT413.C617 )
LIMIT 552;


SELECT
	DT417.C669
	, SUM( DT417.C669 )
	, DT419.C487
	, DT419.C489
FROM
	(
		T43 DT419
	INNER JOIN
		(
			T83 DT418
		RIGHT OUTER JOIN
			T56 DT417
		ON
			DT418.C1007 < DT417.C673
		)
	ON
		DT419.C500 > DT417.C675
	)
WHERE
	(
		(
			DT417.C673 = DT419.C487
		)
		AND
		(
			(
				DT417.C671 > DT418.C1005
			)
			AND
			(
				DT417.C677 = DT419.C494
			)
		)
	)
	OR
	(
		(
			DT418.C1005 < DT419.C494
		)
		AND
		(
			DT417.C671 = DT417.C676
		)
	)
GROUP BY
	DT419.C487
	, DT419.C489
	, DT417.C669
ORDER BY
	DT417.C669
	, SUM( DT417.C669 )
	, DT419.C487
	, DT419.C489
LIMIT 526;


SELECT
	MAX( DT423.C342 )
	, SUM( DT422.C527 )
	, DT422.C527
	, SUM( DT420.C230 )
	, DT420.C230
FROM
	(
		T30 DT423
	INNER JOIN
		(
			(
				T45 DT422
			INNER JOIN
				T19 DT420
			ON
				DT422.C518 <> DT420.C230
			)
		INNER JOIN
			T1 DT421
		ON
			DT422.C522 < DT421.C13
		)
	ON
		DT423.C342 <> DT422.C527
	)
WHERE
	(
		(
			DT422.C512 = DT421.C7
		)
		AND
		(
			DT422.C523 > DT421.C11
		)
	)
	OR
	(
		(
			(
				DT422.C520 <> DT420.C232
			)
			AND
			(
				DT421.C9 = DT420.C232
			)
		)
		AND
		(
			DT422.C514 = DT420.C231
		)
	)
GROUP BY
	DT423.C342
	, DT422.C527
	, DT420.C230
ORDER BY
	MAX( DT423.C342 )
	, SUM( DT422.C527 )
	, DT422.C527
	, SUM( DT420.C230 )
	, DT420.C230
LIMIT 638;


SELECT
	MAX( DT424.C364 )
	, MIN( DT424.C365 )
	, DT424.C364
	, DT424.C365
FROM
	(
		T32 DT424
	INNER JOIN
		T44 DT425
	ON
		DT424.C375 <> DT425.C505
	)
WHERE
	(
		DT424.C365 = DT424.C366
	)
	OR
	(
		DT424.C377 < DT424.C366
	)
GROUP BY
	DT424.C364
	, DT424.C365
ORDER BY
	MAX( DT424.C364 )
	, MIN( DT424.C365 )
	, DT424.C364
	, DT424.C365
LIMIT 748;


SELECT
	DT428.C1147
	, COUNT( DT428.C1147 )
FROM
	(
		(
			T11 DT427
		INNER JOIN
			T17 DT426
		ON
			DT427.C154 < DT426.C213
		)
	INNER JOIN
		T94 DT428
	ON
		DT427.C156 = DT428.C1161
	)
WHERE
	(
		(
			DT428.C1161 = DT428.C1160
		)
		OR
		(
			DT428.C1158 > DT427.C152
		)
	)
	AND
	(
		DT426.C208 = DT428.C1152
	)
GROUP BY
	DT428.C1147
	, DT426.C211
ORDER BY
	DT428.C1147
	, COUNT( DT428.C1147 )
LIMIT 391;


SELECT
	MAX( DT430.C379 )
	, DT430.C373
	, DT430.C379
FROM
	(
		T32 DT430
	RIGHT OUTER JOIN
		T79 DT429
	ON
		DT430.C369 > DT429.C979
	)
WHERE
	(
		DT430.C378 = DT430.C365
	)
	OR
	(
		(
			(
				DT430.C376 > DT429.C980
			)
			AND
			(
				DT430.C374 = DT429.C985
			)
		)
		OR
		(
			(
				DT429.C980 = DT430.C381
			)
			AND
			(
				DT430.C364 <> DT429.C979
			)
		)
	)
GROUP BY
	DT430.C373
	, DT430.C379
ORDER BY
	MAX( DT430.C379 )
	, DT430.C373
	, DT430.C379
LIMIT 191;


SELECT
	DT432.C265
	, DT433.C753
	, DT431.C387
	, SUM( DT433.C753 )
FROM
	(
		T33 DT431
	INNER JOIN
		(
			T22 DT432
		INNER JOIN
			T63 DT433
		ON
			DT432.C264 > DT433.C750
		)
	ON
		DT431.C391 > DT432.C259
	)
WHERE
	(
		DT432.C261 = DT433.C759
	)
	AND
	(
		DT431.C392 < DT433.C746
	)
GROUP BY
	DT433.C753
	, DT431.C387
	, DT432.C265
ORDER BY
	DT432.C265
	, DT433.C753
	, DT431.C387
	, SUM( DT433.C753 )
LIMIT 476;


SELECT
	MIN( DT434.C143 )
	, DT435.C376
	, DT434.C143
FROM
	(
		(
			T32 DT435
		INNER JOIN
			T93 DT437
		ON
			DT435.C370 < DT437.C1138
		)
	INNER JOIN
		(
			T79 DT436
		INNER JOIN
			T10 DT434
		ON
			DT436.C979 = DT434.C143
		)
	ON
		DT435.C376 < DT434.C150
	)
WHERE
	(
		DT435.C378 = DT436.C979
	)
	OR
	(
		(
			DT434.C151 = DT436.C984
		)
		AND
		(
			(
				(
					DT435.C370 > DT434.C141
				)
				AND
				(
					DT434.C148 < DT437.C1143
				)
			)
			AND
			(
				DT435.C376 = DT437.C1137
			)
		)
	)
GROUP BY
	DT436.C981
	, DT434.C143
	, DT435.C376
ORDER BY
	MIN( DT434.C143 )
	, DT435.C376
	, DT434.C143
LIMIT 578;


SELECT
	DT439.C924
	, SUM( DT439.C928 )
	, DT439.C928
FROM
	(
		T3 DT438
	INNER JOIN
		T74 DT439
	ON
		DT438.C49 = DT439.C918
	)
WHERE
	(
		(
			DT438.C34 < DT438.C41
		)
		AND
		(
			DT439.C911 > DT439.C910
		)
	)
	OR
	(
		(
			DT438.C50 < DT438.C37
		)
		OR
		(
			(
				DT439.C913 = DT438.C37
			)
			OR
			(
				DT438.C52 = DT439.C924
			)
		)
	)
GROUP BY
	DT439.C928
	, DT439.C924
ORDER BY
	DT439.C924
	, SUM( DT439.C928 )
	, DT439.C928
LIMIT 719;


SELECT
	COUNT( DT440.C338 )
	, DT441.C802
	, DT440.C338
	, DT442.C231
FROM
	(
		T29 DT440
	INNER JOIN
		(
			T66 DT441
		INNER JOIN
			T19 DT442
		ON
			DT441.C806 = DT442.C230
		)
	ON
		DT440.C335 = DT442.C230
	)
WHERE
	(
		(
			DT441.C799 = DT441.C808
		)
		OR
		(
			DT442.C231 < DT440.C339
		)
	)
	OR
	(
		DT441.C808 = DT440.C334
	)
GROUP BY
	DT440.C338
	, DT441.C802
	, DT442.C231
ORDER BY
	COUNT( DT440.C338 )
	, DT441.C802
	, DT440.C338
	, DT442.C231
LIMIT 913;


SELECT
	DT443.C771
FROM
	(
		(
			T64 DT443
		INNER JOIN
			T93 DT445
		ON
			DT443.C780 > DT445.C1139
		)
	INNER JOIN
		T68 DT444
	ON
		DT443.C774 = DT444.C821
	)
WHERE
	(
		DT443.C777 = DT443.C782
	)
	AND
	(
		DT445.C1142 > DT443.C772
	)
GROUP BY
	DT443.C771
	, DT445.C1138
ORDER BY
	DT443.C771
LIMIT 140;


SELECT
	COUNT( DT447.C1005 )
	, DT446.C253
FROM
	(
		T83 DT447
	INNER JOIN
		T21 DT446
	ON
		DT447.C1002 = DT446.C251
	)
WHERE
	(
		DT447.C1001 = DT446.C247
	)
	AND
	(
		DT446.C247 = DT447.C1006
	)
GROUP BY
	DT446.C253
	, DT447.C1005
ORDER BY
	COUNT( DT447.C1005 )
	, DT446.C253
LIMIT 166;


SELECT
	DT449.C1190
	, AVG( DT449.C1190 )
	, DT449.C1198
FROM
	(
		(
			T30 DT450
		INNER JOIN
			T97 DT449
		ON
			DT450.C343 = DT449.C1197
		)
	INNER JOIN
		T48 DT448
	ON
		DT449.C1190 > DT448.C585
	)
WHERE
	(
		DT448.C581 > DT449.C1196
	)
	AND
	(
		DT448.C575 > DT448.C575
	)
GROUP BY
	DT449.C1198
	, DT449.C1190
ORDER BY
	DT449.C1190
	, AVG( DT449.C1190 )
	, DT449.C1198
LIMIT 995;


SELECT
	COUNT( DT454.C1168 )
	, SUM( DT454.C1170 )
	, DT452.C375
	, DT454.C1170
	, DT454.C1168
FROM
	(
		T45 DT453
	LEFT OUTER JOIN
		(
			(
				T99 DT451
			INNER JOIN
				T95 DT454
			ON
				DT451.C1208 = DT454.C1171
			)
		INNER JOIN
			T32 DT452
		ON
			DT454.C1169 > DT452.C379
		)
	ON
		DT453.C524 > DT452.C380
	)
WHERE
	(
		DT452.C370 = DT452.C371
	)
	OR
	(
		DT452.C364 = DT453.C519
	)
GROUP BY
	DT454.C1170
	, DT452.C375
	, DT454.C1168
ORDER BY
	COUNT( DT454.C1168 )
	, SUM( DT454.C1170 )
	, DT452.C375
	, DT454.C1170
	, DT454.C1168
LIMIT 536;


SELECT
	to_char(AVG( DT458.C1156 ), '9999999.9999999') 
	, DT458.C1154
FROM
	(
		(
			T98 DT455
		INNER JOIN
			T37 DT457
		ON
			DT455.C1202 > DT457.C439
		)
	INNER JOIN
		(
			T67 DT456
		INNER JOIN
			T94 DT458
		ON
			DT456.C814 > DT458.C1148
		)
	ON
		DT455.C1202 < DT456.C813
	)
WHERE
	(
		(
			DT456.C810 = DT458.C1145
		)
		AND
		(
			DT456.C816 = DT456.C814
		)
	)
	OR
	(
		DT456.C819 > DT455.C1201
	)
GROUP BY
	DT456.C819
	, DT458.C1156
	, DT458.C1154
ORDER BY
	AVG( DT458.C1156 )
	, DT458.C1154
LIMIT 356;


SELECT
	AVG( DT461.C1139 )
FROM
	(
		T93 DT461
	LEFT OUTER JOIN
		(
			T17 DT460
		INNER JOIN
			T11 DT459
		ON
			DT460.C218 > DT459.C156
		)
	ON
		DT461.C1142 <> DT460.C210
	)
WHERE
	(
		DT460.C214 < DT461.C1136
	)
	AND
	(
		DT460.C215 = DT460.C218
	)
GROUP BY
	DT460.C212
	, DT460.C214
	, DT461.C1139
ORDER BY
	AVG( DT461.C1139 )
LIMIT 892;


SELECT
	DT463.C609
	, DT463.C618
	, MAX( DT463.C609 )
FROM
	(
		T51 DT463
	INNER JOIN
		T5 DT462
	ON
		DT463.C622 = DT462.C71
	)
WHERE
	(
		DT462.C66 = DT462.C70
	)
	AND
	(
		DT463.C611 <> DT463.C608
	)
GROUP BY
	DT463.C618
	, DT463.C609
ORDER BY
	DT463.C609
	, DT463.C618
	, MAX( DT463.C609 )
LIMIT 583;


SELECT
	MIN( DT464.C519 )
FROM
	(
		T45 DT464
	INNER JOIN
		T20 DT465
	ON
		DT464.C515 = DT465.C238
	)
WHERE
	(
		(
			DT465.C244 = DT465.C241
		)
		AND
		(
			DT464.C518 > DT465.C238
		)
	)
	OR
	(
		DT464.C517 <> DT464.C514
	)
GROUP BY
	DT464.C519
	, DT465.C246
ORDER BY
	MIN( DT464.C519 )
LIMIT 915;


SELECT
	DT466.C959
	, MAX( DT467.C682 )
	, MAX( DT466.C952 )
	, to_char(AVG( DT466.C959 ), '9999999.9999999') 
	, DT466.C952
	, DT467.C682
FROM
	(
		T77 DT466
	INNER JOIN
		T57 DT467
	ON
		DT466.C950 > DT467.C694
	)
WHERE
	(
		(
			DT466.C955 <> DT467.C693
		)
		OR
		(
			DT466.C956 = DT466.C950
		)
	)
	AND
	(
		DT467.C695 = DT467.C692
	)
GROUP BY
	DT466.C952
	, DT466.C959
	, DT467.C682
ORDER BY
	DT466.C959
	, MAX( DT467.C682 )
	, MAX( DT466.C952 )
	, AVG( DT466.C959 )
	, DT466.C952
	, DT467.C682
LIMIT 774;


SELECT
	DT468.C830
FROM
	(
		T79 DT469
	INNER JOIN
		T69 DT468
	ON
		DT469.C984 = DT468.C831
	)
WHERE
	(
		(
			DT468.C827 <> DT469.C979
		)
		AND
		(
			DT469.C984 = DT468.C830
		)
	)
	OR
	(
		(
			DT469.C980 <> DT469.C984
		)
		OR
		(
			DT469.C983 = DT468.C824
		)
	)
GROUP BY
	DT468.C830
	, DT468.C832
ORDER BY
	DT468.C830
LIMIT 879;


SELECT
	DT471.C40
FROM
	(
		T3 DT471
	INNER JOIN
		T55 DT470
	ON
		DT471.C47 < DT470.C659
	)
WHERE
	(
		DT470.C662 = DT471.C42
	)
	AND
	(
		DT471.C52 = DT471.C52
	)
GROUP BY
	DT471.C40
	, DT471.C36
	, DT471.C34
ORDER BY
	DT471.C40
LIMIT 399;


SELECT
	DT475.C63
	, to_char(AVG( DT474.C520 ), '9999999.9999999') 
FROM
	(
		(
			T4 DT475
		INNER JOIN
			T45 DT474
		ON
			DT475.C59 < DT474.C521
		)
	INNER JOIN
		(
			T11 DT472
		INNER JOIN
			T87 DT473
		ON
			DT472.C156 < DT473.C1057
		)
	ON
		DT475.C54 = DT473.C1062
	)
WHERE
	(
		DT472.C155 <> DT472.C153
	)
	OR
	(
		DT474.C523 = DT473.C1063
	)
GROUP BY
	DT475.C54
	, DT474.C520
	, DT475.C63
ORDER BY
	DT475.C63
	, AVG( DT474.C520 )
LIMIT 673;


SELECT
	COUNT( DT477.C1069 )
	, DT476.C657
	, MAX( DT476.C657 )
	, DT477.C1069
FROM
	(
		T54 DT476
	INNER JOIN
		T88 DT477
	ON
		DT476.C657 = DT477.C1069
	)
WHERE
	(
		DT477.C1072 > DT477.C1073
	)
	AND
	(
		DT477.C1066 <> DT477.C1069
	)
GROUP BY
	DT477.C1069
	, DT476.C657
ORDER BY
	COUNT( DT477.C1069 )
	, DT476.C657
	, MAX( DT476.C657 )
	, DT477.C1069
LIMIT 763;


SELECT
	DT479.C798
	, DT479.C803
	, COUNT( DT479.C808 )
	, DT479.C808
FROM
	(
		T19 DT478
	INNER JOIN
		T66 DT479
	ON
		DT478.C232 = DT479.C803
	)
WHERE
	(
		(
			DT479.C806 = DT479.C807
		)
		OR
		(
			(
				DT479.C798 = DT479.C803
			)
			OR
			(
				(
					DT478.C232 < DT479.C806
				)
				AND
				(
					DT478.C230 = DT479.C807
				)
			)
		)
	)
	AND
	(
		DT478.C231 = DT478.C232
	)
GROUP BY
	DT479.C798
	, DT479.C808
	, DT479.C803
ORDER BY
	DT479.C798
	, DT479.C803
	, COUNT( DT479.C808 )
	, DT479.C808
LIMIT 154;


SELECT
	DT483.C12
FROM
	(
		(
			T1 DT483
		INNER JOIN
			T16 DT481
		ON
			DT483.C7 <> DT481.C201
		)
	INNER JOIN
		(
			T38 DT480
		RIGHT OUTER JOIN
			T15 DT482
		ON
			DT480.C442 = DT482.C192
		)
	ON
		DT483.C4 < DT482.C196
	)
WHERE
	(
		DT482.C199 = DT483.C8
	)
	AND
	(
		(
			DT480.C442 < DT481.C201
		)
		AND
		(
			DT481.C205 > DT482.C186
		)
	)
GROUP BY
	DT482.C198
	, DT483.C12
ORDER BY
	DT483.C12
LIMIT 422;


SELECT
	MIN( DT484.C354 )
	, DT486.C542
	, DT484.C354
FROM
	(
		(
			T46 DT486
		INNER JOIN
			(
				T35 DT485
			INNER JOIN
				T31 DT484
			ON
				DT485.C413 > DT484.C352
			)
		ON
			DT486.C545 = DT484.C360
		)
	INNER JOIN
		T85 DT487
	ON
		DT484.C360 < DT487.C1043
	)
WHERE
	(
		(
			(
				DT486.C545 <> DT486.C538
			)
			OR
			(
				DT484.C355 = DT486.C537
			)
		)
		OR
		(
			DT484.C359 > DT484.C358
		)
	)
	AND
	(
		(
			DT484.C345 > DT487.C1045
		)
		AND
		(
			DT487.C1034 <> DT484.C361
		)
	)
GROUP BY
	DT486.C547
	, DT484.C354
	, DT486.C542
ORDER BY
	MIN( DT484.C354 )
	, DT486.C542
	, DT484.C354
LIMIT 516;


SELECT
	DT489.C203
FROM
	(
		T16 DT489
	INNER JOIN
		T33 DT488
	ON
		DT489.C202 = DT488.C401
	)
WHERE
	(
		(
			DT488.C386 <> DT488.C394
		)
		OR
		(
			DT489.C204 <> DT488.C393
		)
	)
	OR
	(
		DT488.C385 = DT488.C400
	)
GROUP BY
	DT488.C385
	, DT489.C203
	, DT488.C389
ORDER BY
	DT489.C203
LIMIT 524;


SELECT
	DT491.C697
	, DT490.C1111
	, DT491.C690
	, DT490.C1104
	, DT490.C1101
	, DT490.C1103
	, DT492.C986
	, DT491.C683
	, DT490.C1109
	, DT490.C1112
	, DT491.C687
	, DT491.C696
	, DT491.C695
	, DT490.C1102
	, DT491.C688
	, DT490.C1107
	, DT492.C988
FROM
	(
		T80 DT492
	INNER JOIN
		(
			T57 DT491
		INNER JOIN
			T91 DT490
		ON
			DT491.C696 = DT490.C1098
		)
	ON
		DT492.C986 = DT490.C1101
	)
WHERE
	(
		DT490.C1097 > DT490.C1102
	)
	AND
	(
		DT491.C688 > DT490.C1110
	)
ORDER BY
	DT491.C697
	, DT490.C1111
	, DT491.C690
	, DT490.C1104
	, DT490.C1101
	, DT490.C1103
	, DT492.C986
	, DT491.C683
	, DT490.C1109
	, DT490.C1112
	, DT491.C687
	, DT491.C696
	, DT491.C695
	, DT490.C1102
	, DT491.C688
	, DT490.C1107
	, DT492.C988
LIMIT 161;


SELECT
	DT495.C529
FROM
	(
		(
			T46 DT495
		INNER JOIN
			T7 DT496
		ON
			DT495.C539 = DT496.C92
		)
	LEFT OUTER JOIN
		(
			T76 DT493
		LEFT OUTER JOIN
			T62 DT494
		ON
			DT493.C938 = DT494.C740
		)
	ON
		DT496.C103 <> DT493.C946
	)
WHERE
	(
		(
			DT496.C98 = DT496.C94
		)
		AND
		(
			DT496.C108 < DT496.C99
		)
	)
	AND
	(
		DT493.C941 = DT495.C528
	)
GROUP BY
	DT496.C90
	, DT495.C529
ORDER BY
	DT495.C529
LIMIT 659;


SELECT
	MAX( DT499.C862 )
	, DT498.C631
	, MIN( DT498.C631 )
	, DT499.C862
FROM
	(
		(
			T71 DT499
		INNER JOIN
			T78 DT497
		ON
			DT499.C866 = DT497.C978
		)
	INNER JOIN
		T52 DT498
	ON
		DT497.C972 = DT498.C626
	)
WHERE
	(
		(
			(
				DT497.C975 = DT499.C863
			)
			OR
			(
				DT498.C635 = DT498.C633
			)
		)
		OR
		(
			DT499.C860 = DT498.C635
		)
	)
	AND
	(
		DT497.C973 < DT497.C968
	)
GROUP BY
	DT498.C631
	, DT499.C862
ORDER BY
	MAX( DT499.C862 )
	, DT498.C631
	, MIN( DT498.C631 )
	, DT499.C862
LIMIT 436;


SELECT
	DT500.C430
	, DT501.C410
	, DT501.C407
	, DT500.C429
	, DT500.C428
	, DT500.C427
	, DT500.C433
	, DT501.C404
	, DT501.C406
	, DT501.C408
	, DT501.C403
	, DT500.C422
	, DT500.C435
	, DT500.C424
	, DT500.C436
	, DT501.C405
	, DT500.C419
	, DT500.C421
	, DT500.C423
	, DT501.C402
	, DT501.C409
	, DT500.C437
	, DT500.C431
	, DT500.C432
	, DT500.C434
FROM
	(
		T36 DT500
	INNER JOIN
		T34 DT501
	ON
		DT500.C420 > DT501.C408
	)
WHERE
	(
		(
			DT501.C404 < DT500.C436
		)
		AND
		(
			DT500.C426 > DT500.C431
		)
	)
	OR
	(
		DT500.C424 = DT500.C428
	)
ORDER BY
	DT500.C430
	, DT501.C410
	, DT501.C407
	, DT500.C429
	, DT500.C428
	, DT500.C427
	, DT500.C433
	, DT501.C404
	, DT501.C406
	, DT501.C408
	, DT501.C403
	, DT500.C422
	, DT500.C435
	, DT500.C424
	, DT500.C436
	, DT501.C405
	, DT500.C419
	, DT500.C421
	, DT500.C423
	, DT501.C402
	, DT501.C409
	, DT500.C437
	, DT500.C431
	, DT500.C432
	, DT500.C434
LIMIT 355;


SELECT
	SUM( DT503.C541 )
	, DT504.C21
FROM
	(
		(
			T27 DT502
		INNER JOIN
			T2 DT504
		ON
			DT502.C321 <> DT504.C17
		)
	INNER JOIN
		T46 DT503
	ON
		DT502.C320 = DT503.C542
	)
WHERE
	(
		DT502.C321 > DT503.C529
	)
	AND
	(
		(
			DT503.C542 = DT504.C24
		)
		OR
		(
			DT504.C29 > DT504.C24
		)
	)
GROUP BY
	DT504.C21
	, DT503.C541
	, DT503.C537
ORDER BY
	SUM( DT503.C541 )
	, DT504.C21
LIMIT 641;


SELECT
	DT507.C54
	, DT507.C58
	, DT507.C55
	, COUNT( DT507.C54 )
	, COUNT( DT507.C58 )
	, MIN( DT507.C55 )
FROM
	(
		T20 DT505
	RIGHT OUTER JOIN
		(
			T4 DT507
		LEFT OUTER JOIN
			T35 DT506
		ON
			DT507.C53 = DT506.C411
		)
	ON
		DT505.C237 = DT507.C57
	)
WHERE
	(
		(
			DT505.C237 = DT505.C238
		)
		AND
		(
			DT505.C242 > DT506.C417
		)
	)
	OR
	(
		DT505.C241 > DT505.C241
	)
GROUP BY
	DT507.C55
	, DT507.C58
	, DT507.C54
ORDER BY
	DT507.C54
	, DT507.C58
	, DT507.C55
	, COUNT( DT507.C54 )
	, COUNT( DT507.C58 )
	, MIN( DT507.C55 )
LIMIT 457;


SELECT
	DT508.C968
	, MAX( DT508.C968 )
	, MIN( DT508.C972 )
	, DT508.C972
FROM
	(
		T72 DT509
	INNER JOIN
		T78 DT508
	ON
		DT509.C876 = DT508.C966
	)
WHERE
	(
		(
			DT508.C977 = DT509.C881
		)
		AND
		(
			DT508.C978 = DT508.C967
		)
	)
	OR
	(
		DT509.C879 = DT508.C966
	)
GROUP BY
	DT508.C972
	, DT508.C968
ORDER BY
	DT508.C968
	, MAX( DT508.C968 )
	, MIN( DT508.C972 )
	, DT508.C972
LIMIT 688;


SELECT
	COUNT( DT511.C692 )
	, DT511.C695
FROM
	(
		T8 DT510
	LEFT OUTER JOIN
		(
			T36 DT512
		INNER JOIN
			T57 DT511
		ON
			DT512.C430 <> DT511.C688
		)
	ON
		DT510.C122 > DT511.C696
	)
WHERE
	(
		(
			DT511.C688 < DT512.C432
		)
		OR
		(
			DT512.C426 = DT510.C110
		)
	)
	OR
	(
		DT512.C423 = DT510.C123
	)
GROUP BY
	DT511.C692
	, DT511.C695
ORDER BY
	COUNT( DT511.C692 )
	, DT511.C695
LIMIT 812;


SELECT
	DT514.C747
	, DT514.C743
	, DT513.C1043
	, DT513.C1044
	, DT513.C1040
	, DT514.C753
	, DT513.C1030
	, DT514.C759
	, DT513.C1041
	, DT513.C1032
	, DT514.C755
	, DT514.C758
	, DT513.C1036
	, DT513.C1038
	, DT514.C762
	, DT515.C654
	, DT514.C756
	, DT513.C1031
	, DT513.C1042
FROM
	(
		T54 DT515
	INNER JOIN
		(
			T85 DT513
		INNER JOIN
			T63 DT514
		ON
			DT513.C1040 <> DT514.C751
		)
	ON
		DT515.C657 = DT513.C1040
	)
WHERE
	(
		(
			DT513.C1042 < DT513.C1040
		)
		OR
		(
			DT513.C1033 < DT513.C1045
		)
	)
	OR
	(
		DT514.C757 <> DT513.C1038
	)
ORDER BY
	DT514.C747
	, DT514.C743
	, DT513.C1043
	, DT513.C1044
	, DT513.C1040
	, DT514.C753
	, DT513.C1030
	, DT514.C759
	, DT513.C1041
	, DT513.C1032
	, DT514.C755
	, DT514.C758
	, DT513.C1036
	, DT513.C1038
	, DT514.C762
	, DT515.C654
	, DT514.C756
	, DT513.C1031
	, DT513.C1042
LIMIT 620;


SELECT
	DT517.C447
	, DT516.C129
	, SUM( DT516.C129 )
FROM
	(
		T9 DT516
	INNER JOIN
		(
			T62 DT518
		INNER JOIN
			T40 DT517
		ON
			DT518.C740 <> DT517.C450
		)
	ON
		DT516.C132 <> DT517.C447
	)
WHERE
	(
		DT516.C134 < DT516.C133
	)
	OR
	(
		(
			(
				DT516.C131 < DT516.C133
			)
			AND
			(
				DT516.C130 < DT516.C132
			)
		)
		AND
		(
			DT517.C449 <> DT516.C126
		)
	)
GROUP BY
	DT516.C129
	, DT517.C447
ORDER BY
	DT517.C447
	, DT516.C129
	, SUM( DT516.C129 )
LIMIT 842;


SELECT
	DT519.C857
	, to_char(AVG( DT519.C857 ), '9999999.9999999') 
	, DT520.C1208
FROM
	(
		T99 DT520
	INNER JOIN
		T70 DT519
	ON
		DT520.C1208 <> DT519.C859
	)
WHERE
	(
		DT519.C852 <> DT519.C839
	)
	OR
	(
		DT519.C850 < DT519.C844
	)
GROUP BY
	DT520.C1208
	, DT519.C857
ORDER BY
	DT519.C857
	, AVG( DT519.C857 )
	, DT520.C1208
LIMIT 243;


SELECT
	DT523.C156
FROM
	(
		(
			T58 DT522
		INNER JOIN
			T60 DT521
		ON
			DT522.C711 <> DT521.C719
		)
	INNER JOIN
		(
			T11 DT523
		INNER JOIN
			T20 DT524
		ON
			DT523.C156 = DT524.C233
		)
	ON
		DT521.C721 > DT524.C245
	)
WHERE
	(
		DT522.C710 = DT524.C235
	)
	AND
	(
		(
			DT522.C712 = DT521.C719
		)
		AND
		(
			DT522.C706 = DT522.C706
		)
	)
GROUP BY
	DT522.C699
	, DT523.C156
ORDER BY
	DT523.C156
LIMIT 874;


SELECT
	to_char(AVG( DT528.C938 ), '9999999.9999999') 
	, DT528.C938
	, DT526.C53
FROM
	(
		T4 DT526
	INNER JOIN
		(
			T40 DT527
		INNER JOIN
			(
				T76 DT528
			INNER JOIN
				T9 DT525
			ON
				DT528.C943 = DT525.C128
			)
		ON
			DT527.C448 <> DT528.C945
		)
	ON
		DT526.C57 <> DT528.C941
	)
WHERE
	(
		(
			DT527.C447 < DT525.C137
		)
		AND
		(
			(
				DT525.C136 > DT525.C132
			)
			OR
			(
				DT528.C943 = DT527.C447
			)
		)
	)
	AND
	(
		(
			DT525.C133 = DT528.C943
		)
		OR
		(
			DT526.C63 <> DT525.C135
		)
	)
GROUP BY
	DT526.C53
	, DT525.C135
	, DT528.C938
ORDER BY
	AVG( DT528.C938 )
	, DT528.C938
	, DT526.C53
LIMIT 573;


SELECT
	DT529.C577
	, DT532.C818
	, DT529.C573
	, DT530.C562
	, DT529.C568
	, DT529.C583
	, DT531.C282
	, DT530.C558
	, DT530.C565
	, DT530.C551
	, DT530.C556
	, DT529.C574
	, DT530.C567
	, DT530.C555
	, DT530.C552
	, DT532.C820
	, DT532.C819
	, DT530.C553
	, DT532.C814
FROM
	(
		(
			T47 DT530
		INNER JOIN
			T48 DT529
		ON
			DT530.C566 > DT529.C572
		)
	INNER JOIN
		(
			T67 DT532
		INNER JOIN
			T24 DT531
		ON
			DT532.C820 = DT531.C279
		)
	ON
		DT530.C557 <> DT531.C280
	)
WHERE
	(
		(
			DT530.C552 < DT529.C573
		)
		AND
		(
			(
				DT530.C557 > DT532.C809
			)
			OR
			(
				DT532.C811 = DT530.C557
			)
		)
	)
	AND
	(
		DT529.C578 > DT530.C556
	)
ORDER BY
	DT529.C577
	, DT532.C818
	, DT529.C573
	, DT530.C562
	, DT529.C568
	, DT529.C583
	, DT531.C282
	, DT530.C558
	, DT530.C565
	, DT530.C551
	, DT530.C556
	, DT529.C574
	, DT530.C567
	, DT530.C555
	, DT530.C552
	, DT532.C820
	, DT532.C819
	, DT530.C553
	, DT532.C814
LIMIT 246;


SELECT
	DT534.C307
	, DT534.C301
FROM
	(
		T30 DT533
	INNER JOIN
		T26 DT534
	ON
		DT533.C342 < DT534.C309
	)
WHERE
	(
		DT533.C341 = DT534.C313
	)
	AND
	(
		(
			DT534.C310 <> DT534.C310
		)
		OR
		(
			(
				DT533.C341 = DT534.C316
			)
			AND
			(
				DT534.C310 > DT534.C310
			)
		)
	)
GROUP BY
	DT533.C342
	, DT534.C301
	, DT534.C307
ORDER BY
	DT534.C307
	, DT534.C301
LIMIT 668;


SELECT
	COUNT( DT536.C218 )
	, DT535.C481
FROM
	(
		T17 DT536
	INNER JOIN
		T42 DT535
	ON
		DT536.C211 <> DT535.C483
	)
WHERE
	(
		DT535.C485 = DT535.C483
	)
	AND
	(
		DT536.C211 > DT535.C478
	)
GROUP BY
	DT536.C218
	, DT535.C481
ORDER BY
	COUNT( DT536.C218 )
	, DT535.C481
LIMIT 713;


SELECT
	SUM( DT537.C130 )
	, DT538.C323
	, DT537.C130
FROM
	(
		(
			T27 DT538
		INNER JOIN
			T77 DT539
		ON
			DT538.C324 = DT539.C964
		)
	INNER JOIN
		T9 DT537
	ON
		DT539.C959 < DT537.C130
	)
WHERE
	(
		(
			DT539.C950 <> DT538.C325
		)
		AND
		(
			DT539.C950 <> DT539.C954
		)
	)
	OR
	(
		(
			DT539.C960 = DT539.C956
		)
		OR
		(
			DT539.C956 = DT539.C952
		)
	)
GROUP BY
	DT538.C323
	, DT537.C130
ORDER BY
	SUM( DT537.C130 )
	, DT538.C323
	, DT537.C130
LIMIT 156;


SELECT
	DT541.C2
	, DT541.C1
FROM
	(
		T0 DT541
	INNER JOIN
		T96 DT540
	ON
		DT541.C2 = DT540.C1188
	)
WHERE
	(
		DT540.C1188 = DT541.C3
	)
	AND
	(
		DT540.C1176 > DT540.C1177
	)
GROUP BY
	DT540.C1179
	, DT541.C2
	, DT541.C1
ORDER BY
	DT541.C2
	, DT541.C1
LIMIT 588;


SELECT
	DT542.C1108
	, MIN( DT542.C1108 )
	, DT543.C628
FROM
	(
		T91 DT542
	INNER JOIN
		T52 DT543
	ON
		DT542.C1107 < DT543.C625
	)
WHERE
	(
		(
			(
				DT542.C1103 < DT542.C1112
			)
			OR
			(
				DT542.C1097 = DT542.C1114
			)
		)
		AND
		(
			DT542.C1097 > DT542.C1111
		)
	)
	OR
	(
		(
			DT542.C1113 > DT543.C635
		)
		OR
		(
			DT542.C1106 = DT542.C1113
		)
	)
GROUP BY
	DT543.C628
	, DT542.C1108
	, DT542.C1103
ORDER BY
	DT542.C1108
	, MIN( DT542.C1108 )
	, DT543.C628
LIMIT 909;


SELECT
	DT546.C380
	, to_char(AVG( DT545.C1177 ), '9999999.9999999') 
	, DT546.C382
	, DT545.C1177
FROM
	(
		(
			T96 DT545
		INNER JOIN
			T32 DT546
		ON
			DT545.C1180 > DT546.C371
		)
	INNER JOIN
		T71 DT544
	ON
		DT545.C1189 = DT544.C863
	)
WHERE
	(
		DT546.C369 = DT544.C866
	)
	AND
	(
		DT545.C1180 < DT544.C860
	)
GROUP BY
	DT546.C382
	, DT545.C1177
	, DT546.C380
ORDER BY
	DT546.C380
	, AVG( DT545.C1177 )
	, DT546.C382
	, DT545.C1177
LIMIT 396;


SELECT
	DT548.C1069
	, SUM( DT548.C1069 )
FROM
	(
		T82 DT547
	INNER JOIN
		T88 DT548
	ON
		DT547.C996 = DT548.C1068
	)
WHERE
	(
		DT548.C1064 = DT548.C1070
	)
	OR
	(
		DT548.C1072 <> DT547.C996
	)
GROUP BY
	DT548.C1070
	, DT548.C1069
ORDER BY
	DT548.C1069
	, SUM( DT548.C1069 )
LIMIT 746;


SELECT
	DT549.C1082
FROM
	(
		T12 DT551
	INNER JOIN
		(
			T78 DT550
		LEFT OUTER JOIN
			T90 DT549
		ON
			DT550.C972 = DT549.C1084
		)
	ON
		DT551.C161 = DT550.C977
	)
WHERE
	(
		(
			DT549.C1079 = DT550.C969
		)
		OR
		(
			DT551.C163 < DT550.C978
		)
	)
	OR
	(
		(
			(
				DT549.C1086 = DT549.C1091
			)
			AND
			(
				DT551.C162 > DT550.C965
			)
		)
		OR
		(
			DT549.C1081 = DT549.C1088
		)
	)
GROUP BY
	DT550.C975
	, DT550.C977
	, DT549.C1082
ORDER BY
	DT549.C1082
LIMIT 217;


SELECT
	DT552.C23
	, COUNT( DT552.C23 )
	, DT555.C1031
	, DT555.C1029
FROM
	(
		(
			T2 DT552
		INNER JOIN
			(
				T29 DT554
			INNER JOIN
				T93 DT553
			ON
				DT554.C340 < DT553.C1139
			)
		ON
			DT552.C29 = DT553.C1139
		)
	RIGHT OUTER JOIN
		T85 DT555
	ON
		DT552.C22 < DT555.C1031
	)
WHERE
	(
		DT552.C19 = DT555.C1036
	)
	AND
	(
		(
			DT555.C1043 = DT552.C23
		)
		AND
		(
			DT555.C1040 = DT555.C1033
		)
	)
GROUP BY
	DT555.C1029
	, DT555.C1031
	, DT552.C23
ORDER BY
	DT552.C23
	, COUNT( DT552.C23 )
	, DT555.C1031
	, DT555.C1029
LIMIT 732;


SELECT
	to_char(AVG( DT558.C71 ), '9999999.9999999') 
FROM
	(
		(
			(
				T69 DT557
			INNER JOIN
				T5 DT558
			ON
				DT557.C832 > DT558.C73
			)
		INNER JOIN
			T14 DT556
		ON
			DT557.C835 > DT556.C183
		)
	INNER JOIN
		T30 DT559
	ON
		DT557.C838 = DT559.C341
	)
WHERE
	(
		(
			DT558.C66 = DT557.C832
		)
		OR
		(
			DT558.C73 > DT557.C838
		)
	)
	AND
	(
		(
			DT558.C71 = DT559.C343
		)
		OR
		(
			DT557.C835 = DT556.C180
		)
	)
GROUP BY
	DT557.C824
	, DT557.C837
	, DT558.C71
ORDER BY
	AVG( DT558.C71 )
LIMIT 364;


SELECT
	DT560.C678
	, DT560.C671
	, COUNT( DT560.C678 )
FROM
	(
		(
			T12 DT562
		INNER JOIN
			T56 DT560
		ON
			DT562.C163 > DT560.C676
		)
	INNER JOIN
		T26 DT561
	ON
		DT562.C157 = DT561.C313
	)
WHERE
	(
		DT561.C300 = DT561.C299
	)
	OR
	(
		(
			DT561.C316 <> DT561.C316
		)
		AND
		(
			DT561.C307 = DT562.C157
		)
	)
GROUP BY
	DT560.C678
	, DT560.C671
ORDER BY
	DT560.C678
	, DT560.C671
	, COUNT( DT560.C678 )
LIMIT 368;


SELECT
	DT564.C385
	, COUNT( DT564.C385 )
	, DT564.C393
	, DT564.C397
	, to_char(AVG( DT564.C393 ), '9999999.9999999') 
FROM
	(
		(
			(
				T8 DT565
			INNER JOIN
				T83 DT566
			ON
				DT565.C122 = DT566.C1005
			)
		INNER JOIN
			T33 DT564
		ON
			DT565.C112 = DT564.C391
		)
	INNER JOIN
		T68 DT563
	ON
		DT565.C117 > DT563.C821
	)
WHERE
	(
		(
			DT563.C821 = DT565.C120
		)
		AND
		(
			DT565.C123 = DT563.C821
		)
	)
	OR
	(
		DT564.C387 = DT565.C125
	)
GROUP BY
	DT564.C385
	, DT564.C393
	, DT564.C397
ORDER BY
	DT564.C385
	, COUNT( DT564.C385 )
	, DT564.C393
	, DT564.C397
	, AVG( DT564.C393 )
LIMIT 173;


SELECT
	AVG( DT568.C115 )
	, DT568.C115
FROM
	(
		T30 DT567
	INNER JOIN
		T8 DT568
	ON
		DT567.C341 = DT568.C111
	)
WHERE
	(
		DT568.C125 = DT568.C117
	)
	AND
	(
		(
			(
				DT568.C125 = DT568.C112
			)
			OR
			(
				DT568.C121 = DT568.C113
			)
		)
		AND
		(
			DT568.C110 > DT568.C119
		)
	)
GROUP BY
	DT567.C343
	, DT568.C115
ORDER BY
	AVG( DT568.C115 )
	, DT568.C115
LIMIT 184;


SELECT
	MAX( DT570.C1069 )
	, COUNT( DT570.C1072 )
FROM
	(
		(
			T99 DT569
		INNER JOIN
			T21 DT571
		ON
			DT569.C1204 = DT571.C249
		)
	INNER JOIN
		T88 DT570
	ON
		DT571.C250 > DT570.C1074
	)
WHERE
	(
		(
			DT569.C1206 > DT570.C1073
		)
		AND
		(
			DT570.C1067 <> DT571.C254
		)
	)
	AND
	(
		(
			DT570.C1066 = DT571.C252
		)
		OR
		(
			(
				DT570.C1075 = DT571.C252
			)
			OR
			(
				DT570.C1068 > DT570.C1075
			)
		)
	)
GROUP BY
	DT570.C1072
	, DT570.C1069
ORDER BY
	MAX( DT570.C1069 )
	, COUNT( DT570.C1072 )
LIMIT 734;


SELECT
	COUNT( DT572.C788 )
	, DT572.C788
FROM
	(
		(
			T54 DT573
		INNER JOIN
			T5 DT575
		ON
			DT573.C655 = DT575.C68
		)
	INNER JOIN
		(
			T59 DT574
		INNER JOIN
			T65 DT572
		ON
			DT574.C715 = DT572.C783
		)
	ON
		DT575.C74 > DT574.C715
	)
WHERE
	(
		(
			DT572.C791 < DT572.C787
		)
		OR
		(
			DT574.C715 = DT574.C715
		)
	)
	AND
	(
		DT575.C72 < DT572.C783
	)
GROUP BY
	DT572.C788
	, DT572.C796
ORDER BY
	COUNT( DT572.C788 )
	, DT572.C788
LIMIT 757;


SELECT
	DT576.C588
FROM
	(
		T49 DT576
	RIGHT OUTER JOIN
		T33 DT577
	ON
		DT576.C586 <> DT577.C391
	)
WHERE
	(
		(
			DT576.C594 > DT577.C392
		)
		OR
		(
			DT577.C383 = DT576.C594
		)
	)
	AND
	(
		(
			DT576.C593 < DT577.C396
		)
		OR
		(
			DT576.C599 = DT577.C387
		)
	)
GROUP BY
	DT576.C588
	, DT577.C388
ORDER BY
	DT576.C588
LIMIT 359;


SELECT
	COUNT( DT578.C701 )
	, DT578.C701
FROM
	(
		(
			T58 DT578
		INNER JOIN
			T1 DT580
		ON
			DT578.C708 = DT580.C8
		)
	INNER JOIN
		T76 DT579
	ON
		DT580.C9 = DT579.C942
	)
WHERE
	(
		(
			DT579.C942 > DT578.C700
		)
		OR
		(
			DT578.C712 <> DT580.C11
		)
	)
	OR
	(
		(
			DT580.C8 = DT578.C706
		)
		AND
		(
			DT578.C707 = DT579.C940
		)
	)
GROUP BY
	DT578.C701
	, DT578.C699
	, DT578.C704
ORDER BY
	COUNT( DT578.C701 )
	, DT578.C701
LIMIT 446;


SELECT
	DT583.C78
	, MIN( DT583.C78 )
	, DT581.C1167
	, DT583.C82
FROM
	(
		(
			(
				T6 DT583
			INNER JOIN
				T15 DT582
			ON
				DT583.C84 = DT582.C186
			)
		INNER JOIN
			T95 DT581
		ON
			DT582.C190 = DT581.C1174
		)
	INNER JOIN
		T16 DT584
	ON
		DT582.C195 < DT584.C201
	)
WHERE
	(
		DT582.C195 < DT583.C80
	)
	OR
	(
		(
			DT584.C204 = DT582.C189
		)
		OR
		(
			DT582.C188 = DT584.C200
		)
	)
GROUP BY
	DT583.C78
	, DT581.C1167
	, DT583.C82
ORDER BY
	DT583.C78
	, MIN( DT583.C78 )
	, DT581.C1167
	, DT583.C82
LIMIT 994;


SELECT
	COUNT( DT586.C39 )
	, to_char(AVG( DT586.C32 ), '9999999.9999999') 
	, DT586.C39
	, DT586.C32
FROM
	(
		(
			T37 DT585
		INNER JOIN
			T93 DT587
		ON
			DT585.C438 <> DT587.C1141
		)
	INNER JOIN
		T3 DT586
	ON
		DT585.C438 < DT586.C48
	)
WHERE
	(
		(
			(
				DT586.C42 = DT587.C1139
			)
			OR
			(
				DT587.C1142 = DT587.C1137
			)
		)
		AND
		(
			DT587.C1143 = DT586.C49
		)
	)
	OR
	(
		(
			DT587.C1138 = DT586.C42
		)
		AND
		(
			DT586.C50 = DT587.C1137
		)
	)
GROUP BY
	DT586.C39
	, DT586.C32
ORDER BY
	COUNT( DT586.C39 )
	, AVG( DT586.C32 )
	, DT586.C39
	, DT586.C32
LIMIT 330;


SELECT
	DT588.C452
	, SUM( DT588.C469 )
	, DT588.C469
	, DT588.C453
	, MAX( DT588.C453 )
	, COUNT( DT588.C452 )
FROM
	(
		T14 DT590
	INNER JOIN
		(
			T89 DT589
		INNER JOIN
			T41 DT588
		ON
			DT589.C1077 <> DT588.C467
		)
	ON
		DT590.C183 = DT588.C459
	)
WHERE
	(
		DT588.C451 = DT588.C457
	)
	OR
	(
		DT590.C181 < DT588.C465
	)
GROUP BY
	DT588.C469
	, DT588.C452
	, DT588.C453
ORDER BY
	DT588.C452
	, SUM( DT588.C469 )
	, DT588.C469
	, DT588.C453
	, MAX( DT588.C453 )
	, COUNT( DT588.C452 )
LIMIT 402;


SELECT
	DT592.C368
FROM
	(
		(
			T18 DT593
		INNER JOIN
			T82 DT591
		ON
			DT593.C227 = DT591.C996
		)
	INNER JOIN
		(
			T32 DT592
		INNER JOIN
			T76 DT594
		ON
			DT592.C378 = DT594.C942
		)
	ON
		DT591.C995 = DT592.C371
	)
WHERE
	(
		(
			DT593.C225 > DT592.C369
		)
		AND
		(
			DT593.C222 > DT594.C946
		)
	)
	AND
	(
		(
			DT593.C221 <> DT592.C382
		)
		OR
		(
			(
				DT593.C219 = DT592.C374
			)
			AND
			(
				DT592.C367 <> DT594.C941
			)
		)
	)
GROUP BY
	DT593.C228
	, DT592.C368
ORDER BY
	DT592.C368
LIMIT 583;


SELECT
	SUM( DT596.C401 )
	, DT596.C397
	, DT595.C132
	, MAX( DT596.C397 )
	, DT596.C401
	, MAX( DT595.C132 )
FROM
	(
		T33 DT596
	INNER JOIN
		T9 DT595
	ON
		DT596.C393 = DT595.C137
	)
WHERE
	(
		DT595.C128 <> DT596.C393
	)
	AND
	(
		(
			(
				DT596.C396 <> DT596.C386
			)
			OR
			(
				DT595.C129 = DT596.C397
			)
		)
		AND
		(
			(
				DT595.C131 = DT596.C401
			)
			AND
			(
				DT596.C386 <> DT596.C384
			)
		)
	)
GROUP BY
	DT595.C132
	, DT596.C401
	, DT596.C397
ORDER BY
	SUM( DT596.C401 )
	, DT596.C397
	, DT595.C132
	, MAX( DT596.C397 )
	, DT596.C401
	, MAX( DT595.C132 )
LIMIT 695;


SELECT
	MIN( DT600.C684 )
	, DT600.C692
	, COUNT( DT600.C692 )
FROM
	(
		T85 DT597
	INNER JOIN
		(
			(
				T74 DT599
			INNER JOIN
				T67 DT598
			ON
				DT599.C922 = DT598.C810
			)
		INNER JOIN
			T57 DT600
		ON
			DT599.C917 = DT600.C686
		)
	ON
		DT597.C1037 = DT598.C817
	)
WHERE
	(
		(
			DT597.C1037 > DT600.C690
		)
		OR
		(
			DT597.C1043 = DT597.C1033
		)
	)
	OR
	(
		(
			DT599.C919 = DT599.C924
		)
		OR
		(
			DT599.C911 > DT597.C1033
		)
	)
GROUP BY
	DT600.C692
	, DT600.C684
ORDER BY
	MIN( DT600.C684 )
	, DT600.C692
	, COUNT( DT600.C692 )
LIMIT 655;


SELECT
	DT601.C291
	, SUM( DT601.C295 )
	, DT602.C27
	, COUNT( DT602.C27 )
	, DT601.C295
FROM
	(
		T2 DT602
	INNER JOIN
		T25 DT601
	ON
		DT602.C23 = DT601.C293
	)
WHERE
	(
		(
			(
				DT602.C16 = DT602.C19
			)
			OR
			(
				(
					DT602.C31 < DT602.C15
				)
				AND
				(
					DT601.C291 = DT602.C30
				)
			)
		)
		OR
		(
			DT601.C295 = DT602.C30
		)
	)
	OR
	(
		DT601.C294 <> DT601.C284
	)
GROUP BY
	DT601.C291
	, DT601.C295
	, DT602.C27
ORDER BY
	DT601.C291
	, SUM( DT601.C295 )
	, DT602.C27
	, COUNT( DT602.C27 )
	, DT601.C295
LIMIT 739;


SELECT
	DT603.C519
FROM
	(
		T45 DT603
	INNER JOIN
		(
			T0 DT604
		INNER JOIN
			T50 DT605
		ON
			DT604.C3 <> DT605.C604
		)
	ON
		DT603.C521 < DT605.C607
	)
WHERE
	(
		(
			DT605.C600 = DT603.C513
		)
		OR
		(
			(
				DT605.C600 = DT603.C525
			)
			OR
			(
				DT603.C521 > DT603.C516
			)
		)
	)
	AND
	(
		DT603.C522 = DT603.C521
	)
GROUP BY
	DT603.C519
	, DT604.C2
ORDER BY
	DT603.C519
LIMIT 941;


SELECT
	to_char(AVG( DT609.C409 ), '9999999.9999999') 
	, DT608.C73
FROM
	(
		(
			T93 DT607
		INNER JOIN
			T34 DT609
		ON
			DT607.C1136 <> DT609.C406
		)
	INNER JOIN
		(
			T87 DT606
		INNER JOIN
			T5 DT608
		ON
			DT606.C1056 = DT608.C70
		)
	ON
		DT609.C407 <> DT606.C1061
	)
WHERE
	(
		DT609.C409 = DT606.C1062
	)
	OR
	(
		(
			DT607.C1144 <> DT608.C70
		)
		AND
		(
			(
				(
					DT606.C1060 = DT606.C1060
				)
				AND
				(
					DT608.C73 > DT609.C406
				)
			)
			OR
			(
				DT609.C405 < DT608.C67
			)
		)
	)
GROUP BY
	DT609.C409
	, DT608.C73
ORDER BY
	AVG( DT609.C409 )
	, DT608.C73
LIMIT 942;


SELECT
	DT613.C598
	, COUNT( DT610.C580 )
	, MIN( DT611.C343 )
FROM
	(
		(
			T30 DT611
		INNER JOIN
			T54 DT612
		ON
			DT611.C343 = DT612.C657
		)
	INNER JOIN
		(
			T48 DT610
		INNER JOIN
			T49 DT613
		ON
			DT610.C578 > DT613.C598
		)
	ON
		DT612.C655 = DT613.C594
	)
WHERE
	(
		DT610.C577 <> DT610.C571
	)
	AND
	(
		(
			DT613.C593 = DT610.C582
		)
		OR
		(
			(
				DT611.C341 < DT613.C588
			)
			AND
			(
				DT610.C573 = DT610.C582
			)
		)
	)
GROUP BY
	DT611.C343
	, DT613.C598
	, DT610.C580
ORDER BY
	DT613.C598
	, COUNT( DT610.C580 )
	, MIN( DT611.C343 )
LIMIT 527;


SELECT
	DT615.C628
	, COUNT( DT614.C722 )
	, DT614.C722
	, to_char(AVG( DT615.C628 ), '9999999.9999999') 
	, DT616.C411
FROM
	(
		(
			T52 DT615
		INNER JOIN
			T60 DT614
		ON
			DT615.C626 = DT614.C719
		)
	INNER JOIN
		T35 DT616
	ON
		DT614.C724 > DT616.C412
	)
WHERE
	(
		DT614.C718 = DT615.C630
	)
	OR
	(
		(
			DT614.C724 < DT615.C633
		)
		AND
		(
			(
				DT614.C717 < DT616.C412
			)
			OR
			(
				DT615.C635 <> DT615.C632
			)
		)
	)
GROUP BY
	DT614.C722
	, DT616.C411
	, DT615.C628
ORDER BY
	DT615.C628
	, COUNT( DT614.C722 )
	, DT614.C722
	, AVG( DT615.C628 )
	, DT616.C411
LIMIT 463;


SELECT
	MAX( DT617.C523 )
	, COUNT( DT617.C521 )
	, DT617.C521
	, DT617.C524
	, DT617.C523
FROM
	(
		(
			T86 DT619
		INNER JOIN
			T58 DT618
		ON
			DT619.C1051 <> DT618.C699
		)
	INNER JOIN
		(
			T23 DT620
		INNER JOIN
			T45 DT617
		ON
			DT620.C272 <> DT617.C519
		)
	ON
		DT618.C704 = DT617.C518
	)
WHERE
	(
		DT617.C526 = DT618.C706
	)
	OR
	(
		DT620.C273 < DT618.C698
	)
GROUP BY
	DT617.C523
	, DT617.C524
	, DT617.C521
ORDER BY
	MAX( DT617.C523 )
	, COUNT( DT617.C521 )
	, DT617.C521
	, DT617.C524
	, DT617.C523
LIMIT 690;


SELECT
	DT622.C671
FROM
	(
		T0 DT621
	INNER JOIN
		T56 DT622
	ON
		DT621.C1 > DT622.C678
	)
WHERE
	(
		(
			DT622.C669 = DT622.C671
		)
		AND
		(
			DT622.C668 = DT621.C3
		)
	)
	OR
	(
		(
			DT622.C668 < DT622.C680
		)
		OR
		(
			(
				DT622.C674 = DT622.C668
			)
			OR
			(
				DT622.C677 = DT622.C681
			)
		)
	)
GROUP BY
	DT622.C671
	, DT622.C676
	, DT621.C3
ORDER BY
	DT622.C671
LIMIT 856;


SELECT
	DT623.C499
	, DT623.C497
FROM
	(
		T43 DT623
	INNER JOIN
		T74 DT624
	ON
		DT623.C495 = DT624.C925
	)
WHERE
	(
		(
			DT623.C489 = DT623.C490
		)
		OR
		(
			DT623.C488 <> DT624.C917
		)
	)
	AND
	(
		(
			DT623.C488 = DT623.C494
		)
		AND
		(
			(
				DT624.C915 = DT623.C495
			)
			OR
			(
				DT624.C927 = DT623.C499
			)
		)
	)
GROUP BY
	DT623.C499
	, DT623.C497
ORDER BY
	DT623.C499
	, DT623.C497
LIMIT 921;


SELECT
	COUNT( DT627.C865 )
FROM
	(
		(
			T65 DT625
		INNER JOIN
			T71 DT627
		ON
			DT625.C787 = DT627.C860
		)
	INNER JOIN
		T16 DT626
	ON
		DT625.C783 = DT626.C201
	)
WHERE
	(
		DT626.C204 < DT625.C793
	)
	AND
	(
		DT625.C796 > DT627.C860
	)
GROUP BY
	DT625.C795
	, DT627.C865
ORDER BY
	COUNT( DT627.C865 )
LIMIT 645;


SELECT
	DT629.C184
FROM
	(
		(
			T18 DT628
		INNER JOIN
			(
				T74 DT631
			INNER JOIN
				T14 DT629
			ON
				DT631.C910 = DT629.C182
			)
		ON
			DT628.C220 <> DT631.C920
		)
	INNER JOIN
		T36 DT630
	ON
		DT629.C181 <> DT630.C431
	)
WHERE
	(
		(
			DT628.C223 < DT628.C227
		)
		OR
		(
			(
				DT628.C226 <> DT631.C923
			)
			OR
			(
				DT630.C427 = DT631.C913
			)
		)
	)
	AND
	(
		DT628.C227 = DT631.C928
	)
GROUP BY
	DT629.C182
	, DT629.C184
ORDER BY
	DT629.C184
LIMIT 567;


SELECT
	COUNT( DT634.C809 )
	, DT634.C809
FROM
	(
		(
			T11 DT633
		INNER JOIN
			T67 DT634
		ON
			DT633.C152 = DT634.C814
		)
	INNER JOIN
		T83 DT632
	ON
		DT634.C818 < DT632.C1006
	)
WHERE
	(
		(
			DT633.C155 = DT633.C153
		)
		AND
		(
			DT632.C1002 <> DT633.C154
		)
	)
	AND
	(
		DT634.C820 > DT632.C1004
	)
GROUP BY
	DT632.C1005
	, DT634.C809
ORDER BY
	COUNT( DT634.C809 )
	, DT634.C809
LIMIT 872;


SELECT
	DT636.C461
	, DT636.C458
	, MAX( DT636.C453 )
	, DT636.C453
	, to_char(AVG( DT636.C461 ),'9999999.9999999') 
FROM
	(
		T41 DT636
	INNER JOIN
		T98 DT635
	ON
		DT636.C463 = DT635.C1201
	)
WHERE
	(
		DT635.C1201 = DT636.C467
	)
	OR
	(
		DT636.C454 <> DT635.C1203
	)
GROUP BY
	DT636.C458
	, DT636.C461
	, DT636.C453
ORDER BY
	DT636.C461
	, DT636.C458
	, MAX( DT636.C453 )
	, DT636.C453
	, AVG( DT636.C461 )
LIMIT 735;


SELECT
	DT637.C622
FROM
	(
		T11 DT639
	INNER JOIN
		(
			T92 DT638
		INNER JOIN
			T51 DT637
		ON
			DT638.C1131 = DT637.C615
		)
	ON
		DT639.C155 < DT638.C1124
	)
WHERE
	(
		DT638.C1122 = DT638.C1124
	)
	OR
	(
		DT638.C1128 > DT639.C153
	)
GROUP BY
	DT638.C1119
	, DT637.C622
	, DT637.C615
ORDER BY
	DT637.C622
LIMIT 868;


SELECT
	DT640.C716
	, DT641.C1101
	, DT640.C715
	, DT641.C1100
FROM
	(
		T59 DT640
	INNER JOIN
		T91 DT641
	ON
		DT640.C714 < DT641.C1111
	)
WHERE
	(
		DT640.C713 = DT641.C1100
	)
	AND
	(
		DT641.C1100 = DT641.C1111
	)
ORDER BY
	DT640.C716
	, DT641.C1101
	, DT640.C715
	, DT641.C1100
LIMIT 467;


SELECT
	DT642.C342
FROM
	(
		(
			T83 DT643
		INNER JOIN
			T22 DT644
		ON
			DT643.C1006 < DT644.C265
		)
	INNER JOIN
		T30 DT642
	ON
		DT644.C264 > DT642.C341
	)
WHERE
	(
		DT644.C260 = DT644.C267
	)
	AND
	(
		DT644.C262 = DT644.C266
	)
GROUP BY
	DT642.C342
	, DT643.C1003
	, DT644.C260
ORDER BY
	DT642.C342
LIMIT 586;


SELECT
	MIN( DT647.C525 )
	, DT646.C991
	, DT647.C525
FROM
	(
		T82 DT645
	INNER JOIN
		(
			T81 DT646
		RIGHT OUTER JOIN
			T45 DT647
		ON
			DT646.C991 <> DT647.C519
		)
	ON
		DT645.C998 < DT646.C992
	)
WHERE
	(
		DT647.C524 = DT645.C996
	)
	AND
	(
		(
			DT645.C995 < DT646.C990
		)
		OR
		(
			(
				DT646.C992 > DT646.C992
			)
			AND
			(
				DT647.C525 = DT647.C522
			)
		)
	)
GROUP BY
	DT646.C991
	, DT647.C525
ORDER BY
	MIN( DT647.C525 )
	, DT646.C991
	, DT647.C525
LIMIT 599;


SELECT
	MIN( DT651.C687 )
FROM
	(
		(
			T17 DT648
		INNER JOIN
			T73 DT649
		ON
			DT648.C216 < DT649.C896
		)
	INNER JOIN
		(
			T57 DT651
		INNER JOIN
			T24 DT650
		ON
			DT651.C688 = DT650.C281
		)
	ON
		DT649.C906 > DT651.C683
	)
WHERE
	(
		DT649.C899 < DT651.C694
	)
	OR
	(
		(
			DT650.C279 = DT650.C279
		)
		OR
		(
			(
				DT650.C280 < DT649.C891
			)
			OR
			(
				DT651.C696 <> DT648.C217
			)
		)
	)
GROUP BY
	DT650.C280
	, DT651.C687
ORDER BY
	MIN( DT651.C687 )
LIMIT 807;


SELECT
	DT653.C792
FROM
	(
		T65 DT653
	INNER JOIN
		T63 DT652
	ON
		DT653.C790 < DT652.C752
	)
WHERE
	(
		DT652.C751 = DT652.C750
	)
	OR
	(
		DT652.C754 = DT652.C762
	)
GROUP BY
	DT653.C795
	, DT653.C792
ORDER BY
	DT653.C792
LIMIT 257;


SELECT
	DT655.C429
FROM
	(
		T44 DT657
	INNER JOIN
		(
			T41 DT656
		INNER JOIN
			(
				T98 DT654
			RIGHT OUTER JOIN
				T36 DT655
			ON
				DT654.C1201 < DT655.C435
			)
		ON
			DT656.C465 < DT654.C1201
		)
	ON
		DT657.C503 = DT656.C451
	)
WHERE
	(
		(
			DT656.C461 < DT657.C511
		)
		AND
		(
			DT657.C511 = DT655.C436
		)
	)
	AND
	(
		DT655.C423 = DT657.C507
	)
GROUP BY
	DT655.C436
	, DT655.C429
ORDER BY
	DT655.C429
LIMIT 408;


SELECT
	DT658.C1186
FROM
	(
		T96 DT658
	INNER JOIN
		T5 DT659
	ON
		DT658.C1183 = DT659.C72
	)
WHERE
	(
		DT658.C1183 = DT658.C1181
	)
	OR
	(
		(
			DT658.C1176 <> DT658.C1181
		)
		OR
		(
			(
				DT658.C1187 = DT659.C73
			)
			AND
			(
				DT659.C71 <> DT658.C1182
			)
		)
	)
GROUP BY
	DT659.C70
	, DT658.C1186
ORDER BY
	DT658.C1186
LIMIT 311;


SELECT
	DT660.C257
	, MIN( DT660.C257 )
FROM
	(
		T50 DT661
	INNER JOIN
		T21 DT660
	ON
		DT661.C602 <> DT660.C253
	)
WHERE
	(
		DT660.C256 < DT661.C604
	)
	OR
	(
		(
			DT661.C604 <> DT661.C607
		)
		AND
		(
			DT660.C252 < DT660.C250
		)
	)
GROUP BY
	DT660.C257
	, DT661.C600
ORDER BY
	DT660.C257
	, MIN( DT660.C257 )
LIMIT 269;


SELECT
	DT665.C782
	, MAX( DT662.C1085 )
	, DT662.C1085
FROM
	(
		T16 DT664
	INNER JOIN
		(
			(
				T89 DT663
			INNER JOIN
				T64 DT665
			ON
				DT663.C1076 > DT665.C771
			)
		INNER JOIN
			T90 DT662
		ON
			DT665.C773 > DT662.C1087
		)
	ON
		DT664.C202 > DT663.C1078
	)
WHERE
	(
		DT665.C775 < DT664.C200
	)
	OR
	(
		DT662.C1084 = DT662.C1083
	)
GROUP BY
	DT665.C782
	, DT662.C1085
ORDER BY
	DT665.C782
	, MAX( DT662.C1085 )
	, DT662.C1085
LIMIT 852;


SELECT
	DT667.C857
	, MIN( DT668.C286 )
	, MAX( DT667.C857 )
FROM
	(
		(
			T30 DT669
		RIGHT OUTER JOIN
			(
				T70 DT667
			INNER JOIN
				T25 DT668
			ON
				DT667.C845 <> DT668.C286
			)
		ON
			DT669.C342 = DT668.C296
		)
	INNER JOIN
		T97 DT666
	ON
		DT668.C286 <> DT666.C1193
	)
WHERE
	(
		DT666.C1198 < DT668.C284
	)
	AND
	(
		DT669.C342 > DT669.C341
	)
GROUP BY
	DT668.C286
	, DT667.C857
ORDER BY
	DT667.C857
	, MIN( DT668.C286 )
	, MAX( DT667.C857 )
LIMIT 726;


SELECT
	DT671.C822
	, COUNT( DT670.C739 )
FROM
	(
		T61 DT670
	INNER JOIN
		T68 DT671
	ON
		DT670.C729 < DT671.C821
	)
WHERE
	(
		DT670.C728 = DT670.C732
	)
	OR
	(
		(
			(
				(
					DT670.C739 > DT670.C739
				)
				OR
				(
					DT671.C822 = DT670.C739
				)
			)
			OR
			(
				DT670.C727 = DT670.C727
			)
		)
		OR
		(
			DT670.C735 > DT670.C726
		)
	)
GROUP BY
	DT670.C731
	, DT671.C822
	, DT670.C739
ORDER BY
	DT671.C822
	, COUNT( DT670.C739 )
LIMIT 506;


SELECT
	to_char(AVG( DT672.C367 ), '9999999.9999999') 
	, DT672.C367
FROM
	(
		T4 DT673
	INNER JOIN
		(
			T14 DT674
		INNER JOIN
			T32 DT672
		ON
			DT674.C183 = DT672.C380
		)
	ON
		DT673.C64 = DT672.C381
	)
WHERE
	(
		(
			DT672.C368 <> DT672.C375
		)
		AND
		(
			(
				DT672.C364 = DT674.C182
			)
			AND
			(
				DT672.C367 <> DT673.C59
			)
		)
	)
	AND
	(
		DT673.C56 = DT673.C62
	)
GROUP BY
	DT672.C367
	, DT672.C373
ORDER BY
	AVG( DT672.C367 )
	, DT672.C367
LIMIT 919;


SELECT
	MAX( DT676.C158 )
	, DT676.C162
	, SUM( DT677.C1000 )
	, DT677.C1000
	, DT676.C158
FROM
	(
		T82 DT677
	RIGHT OUTER JOIN
		(
			T12 DT676
		INNER JOIN
			T97 DT675
		ON
			DT676.C158 > DT675.C1194
		)
	ON
		DT677.C999 = DT675.C1190
	)
WHERE
	(
		(
			DT676.C162 <> DT676.C161
		)
		AND
		(
			DT676.C160 < DT676.C161
		)
	)
	OR
	(
		(
			DT677.C1000 > DT676.C158
		)
		AND
		(
			(
				DT676.C158 <> DT677.C995
			)
			OR
			(
				DT677.C998 > DT675.C1194
			)
		)
	)
GROUP BY
	DT676.C158
	, DT677.C1000
	, DT676.C162
ORDER BY
	MAX( DT676.C158 )
	, DT676.C162
	, SUM( DT677.C1000 )
	, DT677.C1000
	, DT676.C158
LIMIT 981;


SELECT
	MIN( DT680.C728 )
	, DT680.C733
FROM
	(
		T95 DT678
	INNER JOIN
		(
			T36 DT679
		INNER JOIN
			T61 DT680
		ON
			DT679.C432 < DT680.C728
		)
	ON
		DT678.C1169 > DT679.C421
	)
WHERE
	(
		DT680.C726 > DT679.C434
	)
	OR
	(
		(
			DT678.C1168 = DT680.C729
		)
		OR
		(
			DT679.C432 < DT680.C726
		)
	)
GROUP BY
	DT680.C733
	, DT680.C728
ORDER BY
	MIN( DT680.C728 )
	, DT680.C733
LIMIT 437;


SELECT
	SUM( DT681.C1034 )
	, MIN( DT682.C218 )
	, DT681.C1034
	, DT682.C218
FROM
	(
		T85 DT681
	INNER JOIN
		T17 DT682
	ON
		DT681.C1040 = DT682.C218
	)
WHERE
	(
		DT681.C1037 = DT682.C208
	)
	OR
	(
		DT681.C1034 <> DT682.C214
	)
GROUP BY
	DT682.C218
	, DT681.C1034
ORDER BY
	SUM( DT681.C1034 )
	, MIN( DT682.C218 )
	, DT681.C1034
	, DT682.C218
LIMIT 817;


SELECT
	DT683.C890
FROM
	(
		T73 DT683
	INNER JOIN
		T60 DT684
	ON
		DT683.C904 <> DT684.C722
	)
WHERE
	(
		(
			DT684.C724 <> DT683.C895
		)
		OR
		(
			(
				DT683.C889 = DT683.C903
			)
			AND
			(
				DT684.C718 = DT683.C907
			)
		)
	)
	OR
	(
		DT683.C897 <> DT683.C899
	)
GROUP BY
	DT683.C890
	, DT684.C721
	, DT683.C889
ORDER BY
	DT683.C890
LIMIT 455;


SELECT
	DT687.C284
	, COUNT( DT686.C774 )
FROM
	(
		(
			(
				T99 DT688
			INNER JOIN
				T25 DT687
			ON
				DT688.C1207 = DT687.C293
			)
		INNER JOIN
			T64 DT686
		ON
			DT688.C1208 > DT686.C776
		)
	INNER JOIN
		T21 DT685
	ON
		DT687.C288 < DT685.C250
	)
WHERE
	(
		DT685.C252 < DT687.C287
	)
	OR
	(
		(
			DT687.C287 = DT685.C250
		)
		AND
		(
			DT687.C291 <> DT685.C253
		)
	)
GROUP BY
	DT686.C774
	, DT685.C251
	, DT687.C284
ORDER BY
	DT687.C284
	, COUNT( DT686.C774 )
LIMIT 256;



SELECT
	DT101.C391
	, DT100.C490
	, DT102.C336
	, DT101.C399
	, DT102.C337
	, DT101.C398
	, DT101.C392
	, DT102.C334
	, DT102.C335
	, DT100.C494
	, DT100.C493
	, DT102.C338
	, DT101.C390
	, DT100.C501
	, DT101.C386
	, DT101.C400
	, DT101.C394
FROM
	(
		(
			T43 DT100
		INNER JOIN
			T33 DT101
		ON
			DT100.C498 = DT101.C401
		)
	INNER JOIN
		T29 DT102
	ON
		DT101.C385 = DT102.C338
	)
WHERE
	(
		(
			DT101.C397 < DT101.C388
		)
		AND
		(
			(
				(
					DT101.C390 = DT100.C500
				)
				AND
				(
					DT101.C391 < DT101.C399
				)
			)
			OR
			(
				DT101.C383 = DT100.C501
			)
		)
	)
	OR
	(
		(
			(
				DT100.C489 = DT100.C501
			)
			AND
			(
				DT102.C338 <> DT101.C388
			)
		)
		AND
		(
			(
				DT102.C336 < DT100.C494
			)
			AND
			(
				DT102.C335 = DT100.C490
			)
		)
	)
ORDER BY
	DT101.C391
	, DT100.C490
	, DT102.C336
	, DT101.C399
	, DT102.C337
	, DT101.C398
	, DT101.C392
	, DT102.C334
	, DT102.C335
	, DT100.C494
	, DT100.C493
	, DT102.C338
	, DT101.C390
	, DT100.C501
	, DT101.C386
	, DT101.C400
	, DT101.C394
LIMIT 226;


SELECT
	DT103.C809
	, DT103.C814
FROM
	(
		(
			T67 DT103
		INNER JOIN
			(
			SELECT
				SUM( DT112.C655 )
				, MIN( DT111.C160 )
				, DT112.C655
			FROM
				(
					T12 DT111
				INNER JOIN
					T54 DT112
				ON
					DT111.C158 < DT112.C655
				)
			WHERE
				(
					(
						DT111.C157 <> DT112.C656
					)
					AND
					(
						DT111.C163 > DT111.C158
					)
				)
				OR
				(
					(
						(
							DT111.C163 = DT111.C157
						)
						OR
						(
							DT111.C158 < DT111.C162
						)
					)
					OR
					(
						DT111.C161 < DT112.C655
					)
				)
			GROUP BY
				DT112.C655
				, DT111.C160
			ORDER BY
				SUM( DT112.C655 )
				, MIN( DT111.C160 )
				, DT112.C655
			LIMIT 833
			)  DT113 ( C1224, C1225, C1226 ) 
		ON
			DT103.C815 = DT113.C1225
		)
	INNER JOIN
		(
		SELECT
			DT108.C1213
			, AVG( DT109.C3 )
			, DT109.C1
			, MAX( DT109.C1 )
			, DT109.C2
			, DT109.C0
		FROM
			(
				(
				SELECT
					DT106.C700
					, DT106.C705
				FROM
					(
						(
							T58 DT106
						INNER JOIN
							T91 DT107
						ON
							DT106.C708 > DT107.C1094
						)
					INNER JOIN
						(
							T67 DT104
						INNER JOIN
							T36 DT105
						ON
							DT104.C812 <> DT105.C428
						)
					ON
						DT107.C1105 < DT104.C818
					)
				WHERE
					(
						(
							DT104.C818 = DT107.C1095
						)
						AND
						(
							(
								DT107.C1107 < DT107.C1099
							)
							OR
							(
								DT107.C1113 > DT107.C1095
							)
						)
					)
					OR
					(
						(
							(
								DT106.C710 <> DT104.C813
							)
							AND
							(
								DT105.C433 = DT104.C811
							)
						)
						AND
						(
							(
								DT107.C1108 < DT104.C818
							)
							OR
							(
								DT104.C819 = DT104.C814
							)
						)
					)
				GROUP BY
					DT106.C700
					, DT107.C1108
					, DT106.C705
				ORDER BY
					DT106.C700
					, DT106.C705
				LIMIT 234
				)  DT108 ( C1212, C1213 ) 
			INNER JOIN
				T0 DT109
			ON
				DT108.C1212 < DT109.C3
			)
		WHERE
			(
				(
					(
						DT108.C1212 <> DT108.C1212
					)
					OR
					(
						DT109.C1 = DT109.C0
					)
				)
				OR
				(
					(
						DT109.C1 = DT109.C2
					)
					AND
					(
						DT109.C1 = DT108.C1212
					)
				)
			)
			AND
			(
				(
					DT108.C1213 = DT108.C1213
				)
				AND
				(
					DT108.C1212 = DT109.C0
				)
			)
		GROUP BY
			DT109.C0
			, DT109.C1
			, DT109.C3
			, DT108.C1213
			, DT109.C2
		ORDER BY
			DT108.C1213
			, AVG( DT109.C3 )
			, DT109.C1
			, MAX( DT109.C1 )
			, DT109.C2
			, DT109.C0
		LIMIT 334
		)  DT110 ( C1216, C1217, C1218, C1219, C1220, C1221 ) 
	ON
		DT103.C809 = DT110.C1217
	)
WHERE
	(
		(
			DT103.C810 = DT103.C814
		)
		OR
		(
			DT113.C1224 > DT110.C1220
		)
	)
	OR
	(
		(
			DT103.C815 > DT103.C815
		)
		AND
		(
			(
				DT113.C1226 = DT103.C811
			)
			OR
			(
				DT103.C817 < DT103.C819
			)
		)
	)
GROUP BY
	DT103.C820
	, DT103.C809
	, DT103.C814
	, DT110.C1220
	, DT113.C1226
ORDER BY
	DT103.C809
	, DT103.C814
LIMIT 506;


SELECT
	DT115.C878
	, DT115.C869
	, COUNT( DT115.C869 )
	, AVG( DT115.C878 )
	, DT114.C801
FROM
	(
		(
			T72 DT115
		INNER JOIN
			T21 DT116
		ON
			DT115.C878 = DT116.C251
		)
	INNER JOIN
		(
			T66 DT114
		INNER JOIN
			(
			SELECT
				COUNT( DT118.C353 )
				, AVG( DT118.C363 )
			FROM
				(
					T31 DT118
				INNER JOIN
					(
						T14 DT117
					INNER JOIN
						T26 DT119
					ON
						DT117.C182 = DT119.C304
					)
				ON
					DT118.C354 < DT119.C306
				)
			WHERE
				(
					(
						DT119.C317 < DT119.C301
					)
					AND
					(
						DT118.C363 = DT119.C308
					)
				)
				OR
				(
					(
						(
							DT117.C185 > DT118.C362
						)
						OR
						(
							(
								(
									DT119.C317 <> DT118.C349
								)
								AND
								(
									DT119.C314 <> DT119.C312
								)
							)
							AND
							(
								DT118.C354 < DT119.C309
							)
						)
					)
					OR
					(
						DT118.C355 < DT118.C362
					)
				)
			GROUP BY
				DT118.C353
				, DT118.C363
			ORDER BY
				COUNT( DT118.C353 )
				, AVG( DT118.C363 )
			LIMIT 160
			) AS DT120 ( C1230, C1231 ) 
		ON
			DT114.C801 = DT120.C1230
		)
	ON
		DT115.C872 < DT114.C801
	)
WHERE
	(
		(
			(
				DT115.C870 <> DT120.C1230
			)
			AND
			(
				DT116.C251 <> DT116.C256
			)
		)
		AND
		(
			DT115.C872 <> DT115.C879
		)
	)
	AND
	(
		(
			(
				DT115.C886 = DT115.C872
			)
			OR
			(
				DT115.C873 <> DT120.C1230
			)
		)
		AND
		(
			DT115.C886 = DT114.C804
		)
	)
GROUP BY
	DT115.C878
	, DT115.C869
	, DT114.C801
ORDER BY
	DT115.C878
	, DT115.C869
	, COUNT( DT115.C869 )
	, AVG( DT115.C878 )
	, DT114.C801
LIMIT 173;


SELECT
	to_char(AVG( DT124.C241 ),'9999999.9999999')
	, DT124.C243
	, DT124.C245
	, DT124.C241
FROM
	(
		(
			T30 DT122
		INNER JOIN
			T20 DT124
		ON
			DT122.C343 = DT124.C245
		)
	RIGHT OUTER JOIN
		(
			T11 DT123
		INNER JOIN
			T62 DT121
		ON
			DT123.C153 <> DT121.C740
		)
	ON
		DT124.C241 <> DT123.C156
	)
WHERE
	(
		(
			(
				DT123.C155 = DT124.C242
			)
			OR
			(
				(
					DT121.C740 <> DT124.C238
				)
				OR
				(
					DT124.C237 <> DT124.C244
				)
			)
		)
		OR
		(
			(
				DT121.C740 = DT122.C342
			)
			AND
			(
				(
					DT124.C240 = DT124.C237
				)
				OR
				(
					DT122.C342 > DT123.C153
				)
			)
		)
	)
	OR
	(
		(
			DT124.C233 = DT123.C154
		)
		OR
		(
			DT124.C245 = DT124.C243
		)
	)
GROUP BY
	DT124.C245
	, DT124.C241
	, DT124.C243
ORDER BY
	AVG( DT124.C241 )
	, DT124.C243
	, DT124.C245
	, DT124.C241
LIMIT 562;


SELECT
	to_char(AVG( DT125.C1190 ),'9999999.9999999')
	, MIN( DT125.C1191 )
FROM
	(
		T97 DT125
	INNER JOIN
		T99 DT126
	ON
		DT125.C1199 = DT126.C1206
	)
WHERE
	(
		(
			DT126.C1206 = DT125.C1195
		)
		AND
		(
			(
				DT125.C1193 > DT125.C1199
			)
			OR
			(
				DT125.C1199 = DT125.C1198
			)
		)
	)
	OR
	(
		(
			DT125.C1197 = DT126.C1207
		)
		AND
		(
			DT125.C1197 > DT125.C1196
		)
	)
GROUP BY
	DT125.C1192
	, DT125.C1190
	, DT125.C1193
	, DT126.C1206
	, DT125.C1191
ORDER BY
	AVG( DT125.C1190 )
	, MIN( DT125.C1191 )
LIMIT 561;


SELECT
	SUM( DT127.C160 )
	, MAX( DT127.C161 )
FROM
	(
		T12 DT127
	INNER JOIN
		T80 DT128
	ON
		DT127.C162 <> DT128.C987
	)
WHERE
	(
		(
			(
				(
					(
						DT127.C158 < DT127.C163
					)
					OR
					(
						DT127.C157 > DT127.C158
					)
				)
				OR
				(
					DT127.C157 = DT128.C987
				)
			)
			AND
			(
				DT127.C157 > DT128.C988
			)
		)
		OR
		(
			(
				(
					DT127.C162 < DT128.C987
				)
				AND
				(
					DT128.C989 <> DT127.C162
				)
			)
			OR
			(
				DT127.C159 < DT127.C157
			)
		)
	)
	AND
	(
		DT127.C158 = DT127.C162
	)
GROUP BY
	DT127.C161
	, DT127.C160
	, DT128.C987
ORDER BY
	SUM( DT127.C160 )
	, MAX( DT127.C161 )
LIMIT 216;


SELECT
	DT129.C302
	, MIN( DT130.C733 )
FROM
	(
		T61 DT130
	INNER JOIN
		T26 DT129
	ON
		DT130.C726 = DT129.C315
	)
WHERE
	(
		(
			(
				DT129.C297 = DT130.C733
			)
			OR
			(
				DT130.C732 = DT129.C301
			)
		)
		OR
		(
			(
				DT129.C309 = DT130.C739
			)
			OR
			(
				DT130.C726 = DT129.C302
			)
		)
	)
	OR
	(
		(
			DT130.C731 = DT129.C302
		)
		AND
		(
			(
				DT130.C734 < DT129.C315
			)
			AND
			(
				(
					DT130.C736 <> DT129.C318
				)
				AND
				(
					DT129.C298 > DT129.C303
				)
			)
		)
	)
GROUP BY
	DT130.C733
	, DT129.C302
ORDER BY
	DT129.C302
	, MIN( DT130.C733 )
LIMIT 594;


SELECT
	DT131.C1045
	, DT132.C388
	, MAX( DT132.C383 )
	, DT132.C392
FROM
	(
		T85 DT131
	LEFT OUTER JOIN
		(
			T33 DT132
		INNER JOIN
			(
			SELECT
				DT133.C390
				, MIN( DT134.C91 )
				, DT134.C91
			FROM
				(
					T7 DT134
				INNER JOIN
					(
						T33 DT133
					INNER JOIN
						T68 DT135
					ON
						DT133.C399 <> DT135.C821
					)
				ON
					DT134.C101 = DT133.C391
				)
			WHERE
				(
					(
						(
							(
								DT134.C104 = DT135.C822
							)
							AND
							(
								(
									DT134.C94 > DT134.C93
								)
								AND
								(
									DT133.C401 < DT133.C390
								)
							)
						)
						OR
						(
							(
								DT134.C104 = DT134.C92
							)
							OR
							(
								DT134.C109 = DT134.C92
							)
						)
					)
					AND
					(
						DT135.C822 < DT134.C95
					)
				)
				AND
				(
					DT133.C386 = DT134.C89
				)
			GROUP BY
				DT133.C390
				, DT133.C384
				, DT134.C91
			ORDER BY
				DT133.C390
				, MIN( DT134.C91 )
				, DT134.C91
			LIMIT 827
			) AS DT136 ( C1247, C1248, C1249 ) 
		ON
			DT132.C390 < DT136.C1249
		)
	ON
		DT131.C1040 > DT132.C396
	)
WHERE
	(
		(
			DT131.C1031 <> DT131.C1033
		)
		AND
		(
			DT131.C1030 = DT131.C1043
		)
	)
	AND
	(
		(
			(
				DT132.C385 > DT132.C389
			)
			OR
			(
				DT136.C1249 = DT132.C394
			)
		)
		OR
		(
			DT131.C1044 <> DT131.C1030
		)
	)
GROUP BY
	DT132.C383
	, DT132.C388
	, DT131.C1031
	, DT132.C392
	, DT131.C1045
ORDER BY
	DT131.C1045
	, DT132.C388
	, MAX( DT132.C383 )
	, DT132.C392
LIMIT 229;


SELECT
	DT148.C181
	, DT142.C1259
FROM
	(
		(
			(
			SELECT
				MIN( DT140.C1143 )
				, MAX( DT140.C1136 )
				, DT140.C1136
			FROM
				(
					T93 DT140
				INNER JOIN
					T68 DT141
				ON
					DT140.C1139 = DT141.C823
				)
			WHERE
				(
					(
						(
							DT140.C1137 = DT140.C1139
						)
						OR
						(
							DT140.C1140 = DT140.C1143
						)
					)
					OR
					(
						DT140.C1136 < DT140.C1141
					)
				)
				AND
				(
					(
						(
							DT140.C1144 = DT140.C1139
						)
						OR
						(
							DT140.C1140 = DT140.C1140
						)
					)
					AND
					(
						DT140.C1141 = DT140.C1140
					)
				)
			GROUP BY
				DT140.C1143
				, DT140.C1136
			ORDER BY
				MIN( DT140.C1143 )
				, MAX( DT140.C1136 )
				, DT140.C1136
			LIMIT 408
			) AS DT142 ( C1257, C1258, C1259 ) 
		INNER JOIN
			(
			SELECT
				MIN( DT145.C815 )
			FROM
				(
					(
						T89 DT146
					INNER JOIN
						T13 DT143
					ON
						DT146.C1078 <> DT143.C167
					)
				INNER JOIN
					(
						T67 DT145
					INNER JOIN
						T55 DT144
					ON
						DT145.C812 = DT144.C666
					)
				ON
					DT143.C174 > DT144.C664
				)
			WHERE
				(
					(
						(
							DT145.C811 = DT145.C820
						)
						AND
						(
							DT146.C1078 <> DT144.C666
						)
					)
					AND
					(
						DT145.C815 <> DT145.C818
					)
				)
				OR
				(
					(
						(
							DT144.C664 < DT145.C820
						)
						OR
						(
							DT144.C663 > DT143.C178
						)
					)
					OR
					(
						DT146.C1076 > DT144.C662
					)
				)
			GROUP BY
				DT143.C168
				, DT144.C658
				, DT145.C815
			ORDER BY
				MIN( DT145.C815 )
			LIMIT 259
			) AS DT147 ( C1263 ) 
		ON
			DT142.C1257 < DT147.C1263
		)
	LEFT OUTER JOIN
		(
			(
			SELECT
				DT138.C611
				, DT138.C617
			FROM
				(
					T30 DT137
				INNER JOIN
					T51 DT138
				ON
					DT137.C342 < DT138.C617
				)
			WHERE
				(
					(
						DT138.C615 > DT138.C616
					)
					AND
					(
						DT138.C608 < DT138.C620
					)
				)
				AND
				(
					(
						DT138.C619 = DT138.C610
					)
					OR
					(
						(
							DT138.C620 <> DT137.C341
						)
						AND
						(
							(
								DT138.C611 = DT138.C609
							)
							AND
							(
								DT137.C342 <> DT137.C342
							)
						)
					)
				)
			GROUP BY
				DT138.C611
				, DT138.C616
				, DT138.C617
			ORDER BY
				DT138.C611
				, DT138.C617
			LIMIT 986
			) AS DT139 ( C1253, C1254 ) 
		INNER JOIN
			T14 DT148
		ON
			DT139.C1253 = DT148.C181
		)
	ON
		DT142.C1257 > DT148.C180
	)
WHERE
	(
		DT148.C184 = DT139.C1253
	)
	OR
	(
		(
			DT142.C1257 = DT142.C1259
		)
		AND
		(
			(
				(
					DT142.C1259 <> DT148.C183
				)
				OR
				(
					(
						(
							DT148.C182 > DT139.C1254
						)
						OR
						(
							DT148.C185 > DT148.C185
						)
					)
					OR
					(
						DT147.C1263 = DT148.C181
					)
				)
			)
			OR
			(
				(
					DT148.C180 < DT142.C1259
				)
				AND
				(
					DT148.C184 = DT142.C1259
				)
			)
		)
	)
GROUP BY
	DT148.C181
	, DT142.C1258
	, DT148.C182
	, DT142.C1259
ORDER BY
	DT148.C181
	, DT142.C1259
LIMIT 585;


SELECT
	DT156.C838
	, DT154.C930
	, DT154.C933
	, DT156.C825
	, DT155.C439
	, DT154.C931
	, DT153.C1267
	, DT155.C438
	, DT156.C826
	, DT156.C833
	, DT156.C824
	, DT156.C837
	, DT156.C834
FROM
	(
		(
			(
				T69 DT156
			INNER JOIN
				(
				SELECT
					DT152.C45
				FROM
					(
						(
							T82 DT150
						INNER JOIN
							T24 DT151
						ON
							DT150.C995 = DT151.C280
						)
					INNER JOIN
						(
							T3 DT152
						INNER JOIN
							T9 DT149
						ON
							DT152.C35 < DT149.C132
						)
					ON
						DT150.C996 = DT152.C34
					)
				WHERE
					(
						(
							DT152.C37 < DT149.C127
						)
						OR
						(
							DT150.C998 = DT151.C279
						)
					)
					AND
					(
						(
							(
								DT152.C44 = DT149.C137
							)
							OR
							(
								DT152.C50 < DT149.C134
							)
						)
						AND
						(
							(
								DT152.C35 <> DT149.C132
							)
							OR
							(
								(
									DT149.C126 <> DT152.C44
								)
								AND
								(
									(
										DT150.C997 <> DT152.C41
									)
									AND
									(
										DT149.C135 < DT150.C1000
									)
								)
							)
						)
					)
				GROUP BY
					DT152.C45
					, DT150.C996
				ORDER BY
					DT152.C45
				LIMIT 936
				) AS DT153 ( C1267 ) 
			ON
				DT156.C824 > DT153.C1267
			)
		INNER JOIN
			T75 DT154
		ON
			DT156.C829 <> DT154.C930
		)
	RIGHT OUTER JOIN
		T37 DT155
	ON
		DT154.C934 = DT155.C440
	)
WHERE
	(
		(
			(
				(
					DT156.C831 = DT154.C933
				)
				OR
				(
					DT154.C935 > DT156.C827
				)
			)
			AND
			(
				(
					DT156.C826 = DT154.C935
				)
				OR
				(
					DT156.C832 = DT154.C934
				)
			)
		)
		AND
		(
			DT155.C438 = DT154.C930
		)
	)
	AND
	(
		(
			DT156.C825 <> DT156.C830
		)
		OR
		(
			DT155.C440 = DT155.C438
		)
	)
ORDER BY
	DT156.C838
	, DT154.C930
	, DT154.C933
	, DT156.C825
	, DT155.C439
	, DT154.C931
	, DT153.C1267
	, DT155.C438
	, DT156.C826
	, DT156.C833
	, DT156.C824
	, DT156.C837
	, DT156.C834
LIMIT 315;


SELECT
	COUNT( DT159.C623 )
	, DT159.C623
	, MIN( DT159.C614 )
	, MIN( DT159.C618 )
FROM
	(
		T40 DT157
	INNER JOIN
		(
			T51 DT159
		INNER JOIN
			T19 DT158
		ON
			DT159.C616 <> DT158.C230
		)
	ON
		DT157.C449 = DT159.C614
	)
WHERE
	(
		(
			DT159.C622 < DT157.C449
		)
		AND
		(
			(
				(
					DT159.C612 > DT157.C447
				)
				AND
				(
					DT157.C449 = DT159.C623
				)
			)
			OR
			(
				DT157.C448 > DT159.C618
			)
		)
	)
	OR
	(
		DT159.C609 = DT159.C616
	)
GROUP BY
	DT159.C618
	, DT159.C623
	, DT159.C614
ORDER BY
	COUNT( DT159.C623 )
	, DT159.C623
	, MIN( DT159.C614 )
	, MIN( DT159.C618 )
LIMIT 468;


SELECT
	DT164.C1275
	, MAX( DT164.C1275 )
	, DT170.C1278
	, DT165.C439
	, MAX( DT165.C439 )
FROM
	(
		(
			(
			SELECT
				AVG( DT162.C359 )
				, DT162.C359
				, DT161.C306
			FROM
				(
					(
						T87 DT160
					INNER JOIN
						T42 DT163
					ON
						DT160.C1057 < DT163.C483
					)
				INNER JOIN
					(
						T31 DT162
					INNER JOIN
						T26 DT161
					ON
						DT162.C344 > DT161.C312
					)
				ON
					DT163.C473 <> DT162.C349
				)
			WHERE
				(
					(
						(
							DT160.C1061 = DT161.C314
						)
						AND
						(
							(
								(
									DT162.C358 = DT163.C473
								)
								OR
								(
									DT161.C312 < DT162.C351
								)
							)
							AND
							(
								DT160.C1060 < DT162.C351
							)
						)
					)
					AND
					(
						(
							DT161.C305 < DT162.C363
						)
						AND
						(
							DT163.C475 > DT160.C1058
						)
					)
				)
				OR
				(
					DT161.C299 > DT163.C474
				)
			GROUP BY
				DT162.C359
				, DT161.C306
				, DT160.C1058
				, DT161.C300
			ORDER BY
				AVG( DT162.C359 )
				, DT162.C359
				, DT161.C306
			LIMIT 558
			) AS DT164 ( C1273, C1274, C1275 ) 
		INNER JOIN
			(
			SELECT
				DT169.C75
				, DT169.C79
				, DT167.C70
				, DT167.C73
				, MAX( DT169.C79 )
			FROM
				(
					(
						(
							T98 DT166
						LEFT OUTER JOIN
							T6 DT169
						ON
							DT166.C1201 <> DT169.C82
						)
					INNER JOIN
						T5 DT167
					ON
						DT169.C85 < DT167.C69
					)
				INNER JOIN
					T39 DT168
				ON
					DT167.C68 < DT168.C446
				)
			WHERE
				(
					DT167.C74 = DT169.C85
				)
				AND
				(
					(
						(
							DT169.C79 = DT169.C76
						)
						AND
						(
							(
								(
									DT167.C66 < DT167.C66
								)
								OR
								(
									DT166.C1202 = DT169.C79
								)
							)
							OR
							(
								DT167.C68 = DT169.C86
							)
						)
					)
					AND
					(
						(
							DT167.C69 = DT167.C69
						)
						OR
						(
							DT168.C446 = DT169.C80
						)
					)
				)
			GROUP BY
				DT169.C75
				, DT167.C73
				, DT167.C70
				, DT169.C79
			ORDER BY
				DT169.C75
				, DT169.C79
				, DT167.C70
				, DT167.C73
				, MAX( DT169.C79 )
			LIMIT 768
			)  DT170 ( C1277, C1278, C1279, C1280, C1281 ) 
		ON
			DT164.C1275 = DT170.C1281
		)
	INNER JOIN
		T37 DT165
	ON
		DT164.C1273 < DT165.C439
	)
WHERE
	(
		(
			DT165.C440 <> DT165.C438
		)
		OR
		(
			DT165.C440 = DT170.C1280
		)
	)
	AND
	(
		(
			(
				DT170.C1277 <> DT170.C1281
			)
			AND
			(
				DT170.C1277 > DT164.C1274
			)
		)
		AND
		(
			(
				DT170.C1280 > DT165.C438
			)
			AND
			(
				DT164.C1275 = DT170.C1279
			)
		)
	)
GROUP BY
	DT164.C1275
	, DT165.C439
	, DT170.C1277
	, DT170.C1278
ORDER BY
	DT164.C1275
	, MAX( DT164.C1275 )
	, DT170.C1278
	, DT165.C439
	, MAX( DT165.C439 )
LIMIT 495;


SELECT
	DT173.C183
FROM
	(
		(
			T85 DT171
		INNER JOIN
			(
				T39 DT174
			INNER JOIN
				T14 DT173
			ON
				DT174.C445 <> DT173.C185
			)
		ON
			DT171.C1034 = DT173.C185
		)
	INNER JOIN
		T62 DT172
	ON
		DT171.C1032 < DT172.C742
	)
WHERE
	(
		(
			DT173.C184 = DT171.C1033
		)
		OR
		(
			(
				DT172.C741 = DT174.C445
			)
			OR
			(
				DT171.C1040 = DT171.C1039
			)
		)
	)
	OR
	(
		(
			DT172.C742 = DT173.C185
		)
		AND
		(
			DT171.C1045 = DT171.C1034
		)
	)
GROUP BY
	DT173.C181
	, DT173.C183
	, DT172.C741
	, DT172.C740
	, DT173.C185
ORDER BY
	DT173.C183
LIMIT 109;


SELECT
	DT181.C716
FROM
	(
		T52 DT176
	INNER JOIN
		(
			(
				T14 DT175
			INNER JOIN
				(
				SELECT
					DT178.C584
					, DT179.C594
					, DT179.C588
					, SUM( DT178.C574 )
				FROM
					(
						T48 DT178
					INNER JOIN
						(
							T44 DT177
						INNER JOIN
							T49 DT179
						ON
							DT177.C506 = DT179.C586
						)
					ON
						DT178.C581 = DT179.C586
					)
				WHERE
					(
						DT177.C506 > DT177.C510
					)
					OR
					(
						(
							DT178.C580 <> DT178.C568
						)
						OR
						(
							(
								(
									(
										DT178.C584 = DT178.C579
									)
									AND
									(
										DT179.C595 > DT178.C572
									)
								)
								AND
								(
									DT179.C596 > DT177.C505
								)
							)
							AND
							(
								(
									DT178.C573 > DT179.C598
								)
								AND
								(
									DT178.C578 = DT178.C575
								)
							)
						)
					)
				GROUP BY
					DT179.C594
					, DT178.C584
					, DT178.C574
					, DT178.C572
					, DT179.C588
				ORDER BY
					DT178.C584
					, DT179.C594
					, DT179.C588
					, SUM( DT178.C574 )
				LIMIT 152
				)  DT180 ( C1290, C1291, C1292, C1293 ) 
			ON
				DT175.C185 = DT180.C1292
			)
		INNER JOIN
			T59 DT181
		ON
			DT175.C185 > DT181.C715
		)
	ON
		DT176.C628 = DT175.C180
	)
WHERE
	(
		(
			DT175.C182 = DT176.C630
		)
		AND
		(
			(
				DT176.C627 = DT176.C629
			)
			AND
			(
				DT180.C1290 = DT176.C635
			)
		)
	)
	AND
	(
		(
			DT176.C635 > DT176.C635
		)
		OR
		(
			DT176.C630 > DT176.C635
		)
	)
GROUP BY
	DT176.C631
	, DT176.C632
	, DT181.C716
	, DT176.C628
ORDER BY
	DT181.C716
LIMIT 979;


SELECT
	DT186.C721
	, AVG( DT186.C720 )
	, DT186.C720
	, DT184.C1297
FROM
	(
		(
			(
				T53 DT187
			INNER JOIN
				T60 DT186
			ON
				DT187.C638 = DT186.C720
			)
		INNER JOIN
			(
			SELECT
				DT183.C812
			FROM
				(
					T67 DT183
				INNER JOIN
					T3 DT182
				ON
					DT183.C814 = DT182.C50
				)
			WHERE
				(
					(
						(
							DT182.C50 <> DT182.C47
						)
						AND
						(
							(
								(
									DT182.C52 = DT182.C41
								)
								AND
								(
									(
										DT182.C39 <> DT182.C44
									)
									AND
									(
										DT182.C35 > DT182.C52
									)
								)
							)
							OR
							(
								DT182.C38 = DT182.C42
							)
						)
					)
					AND
					(
						DT182.C45 = DT182.C32
					)
				)
				AND
				(
					DT182.C45 = DT183.C818
				)
			GROUP BY
				DT182.C33
				, DT182.C44
				, DT183.C812
				, DT182.C42
				, DT183.C814
			ORDER BY
				DT183.C812
			LIMIT 590
			) AS DT184 ( C1297 ) 
		ON
			DT187.C651 = DT184.C1297
		)
	INNER JOIN
		T41 DT185
	ON
		DT186.C724 <> DT185.C464
	)
WHERE
	(
		(
			(
				DT185.C465 <> DT187.C648
			)
			AND
			(
				(
					DT184.C1297 = DT187.C647
				)
				OR
				(
					DT185.C470 = DT187.C650
				)
			)
		)
		AND
		(
			(
				(
					DT186.C723 <> DT187.C651
				)
				OR
				(
					DT185.C456 < DT187.C647
				)
			)
			AND
			(
				DT187.C639 > DT185.C453
			)
		)
	)
	AND
	(
		(
			DT187.C653 = DT185.C472
		)
		AND
		(
			DT185.C458 <> DT185.C460
		)
	)
GROUP BY
	DT184.C1297
	, DT186.C720
	, DT185.C461
	, DT185.C460
	, DT186.C721
ORDER BY
	DT186.C721
	, AVG( DT186.C720 )
	, DT186.C720
	, DT184.C1297
LIMIT 260;


SELECT
	MAX( DT195.C767 )
	, DT195.C774
	, DT188.C291
FROM
	(
		(
		SELECT
			DT192.C191
			, DT192.C196
			, DT190.C630
			, DT192.C189
			, DT192.C198
			, DT191.C714
			, DT193.C1189
			, DT192.C190
			, DT193.C1187
			, DT191.C715
			, DT190.C629
			, DT192.C193
			, DT190.C635
			, DT193.C1179
			, DT193.C1186
			, DT193.C1177
			, DT190.C628
			, DT193.C1183
			, DT192.C186
			, DT190.C625
			, DT193.C1185
			, DT192.C188
			, DT193.C1180
			, DT190.C634
		FROM
			(
				(
					T52 DT190
				INNER JOIN
					T15 DT192
				ON
					DT190.C629 = DT192.C192
				)
			INNER JOIN
				(
					T59 DT191
				INNER JOIN
					T96 DT193
				ON
					DT191.C716 > DT193.C1176
				)
			ON
				DT192.C188 = DT193.C1186
			)
		WHERE
			(
				(
					(
						DT190.C631 > DT193.C1189
					)
					AND
					(
						DT190.C634 = DT190.C631
					)
				)
				AND
				(
					(
						(
							DT190.C634 <> DT192.C197
						)
						OR
						(
							DT192.C187 < DT192.C197
						)
					)
					OR
					(
						DT192.C187 <> DT193.C1179
					)
				)
			)
			AND
			(
				(
					(
						DT192.C188 = DT192.C191
					)
					AND
					(
						DT193.C1183 > DT193.C1179
					)
				)
				AND
				(
					DT190.C631 = DT190.C635
				)
			)
		ORDER BY
			DT192.C191
			, DT192.C196
			, DT190.C630
			, DT192.C189
			, DT192.C198
			, DT191.C714
			, DT193.C1189
			, DT192.C190
			, DT193.C1187
			, DT191.C715
			, DT190.C629
			, DT192.C193
			, DT190.C635
			, DT193.C1179
			, DT193.C1186
			, DT193.C1177
			, DT190.C628
			, DT193.C1183
			, DT192.C186
			, DT190.C625
			, DT193.C1185
			, DT192.C188
			, DT193.C1180
			, DT190.C634
		LIMIT 226
		)  DT194 ( C1302, C1303, C1304, C1305, C1306, C1307, C1308, C1309, C1310, C1311, C1312, C1313, C1314, C1315, C1316, C1317, C1318, C1319, C1320, C1321, C1322, C1323, C1324, C1325 ) 
	INNER JOIN
		(
			T64 DT195
		INNER JOIN
			(
				T29 DT189
			INNER JOIN
				T25 DT188
			ON
				DT189.C339 = DT188.C286
			)
		ON
			DT195.C765 <> DT188.C295
		)
	ON
		DT194.C1310 <> DT188.C287
	)
WHERE
	(
		(
			(
				DT194.C1315 > DT195.C774
			)
			AND
			(
				(
					DT189.C340 <> DT194.C1312
				)
				AND
				(
					DT188.C287 < DT189.C339
				)
			)
		)
		AND
		(
			DT195.C768 <> DT195.C782
		)
	)
	OR
	(
		(
			DT188.C283 < DT194.C1311
		)
		AND
		(
			(
				DT194.C1317 < DT188.C285
			)
			AND
			(
				DT195.C764 <> DT189.C336
			)
		)
	)
GROUP BY
	DT195.C774
	, DT195.C767
	, DT194.C1321
	, DT188.C291
ORDER BY
	MAX( DT195.C767 )
	, DT195.C774
	, DT188.C291
LIMIT 308;


SELECT
	MAX( DT201.C1338 )
	, DT201.C1336
	, DT201.C1338
FROM
	(
		(
		SELECT
			SUM( DT199.C1332 )
			, DT199.C1332
			, AVG( DT199.C1329 )
			, DT199.C1329
		FROM
			(
				(
				SELECT
					MIN( DT196.C628 )
					, DT198.C708
					, AVG( DT198.C708 )
					, DT196.C628
				FROM
					(
						T17 DT197
					INNER JOIN
						(
							T52 DT196
						INNER JOIN
							T58 DT198
						ON
							DT196.C630 > DT198.C698
						)
					ON
						DT197.C215 < DT198.C708
					)
				WHERE
					(
						DT198.C712 < DT198.C711
					)
					AND
					(
						(
							DT198.C700 <> DT198.C710
						)
						OR
						(
							(
								(
									DT198.C702 < DT197.C209
								)
								AND
								(
									DT197.C207 = DT196.C627
								)
							)
							OR
							(
								DT198.C704 = DT198.C708
							)
						)
					)
				GROUP BY
					DT198.C708
					, DT196.C628
				ORDER BY
					MIN( DT196.C628 )
					, DT198.C708
					, AVG( DT198.C708 )
					, DT196.C628
				LIMIT 906
				) AS DT199 ( C1329, C1330, C1331, C1332 ) 
			INNER JOIN
				T25 DT200
			ON
				DT199.C1332 < DT200.C283
			)
		WHERE
			(
				DT200.C295 < DT200.C285
			)
			OR
			(
				(
					DT200.C289 = DT200.C292
				)
				AND
				(
					(
						(
							DT200.C283 = DT200.C296
						)
						OR
						(
							DT199.C1332 <> DT200.C284
						)
					)
					AND
					(
						(
							DT200.C290 = DT200.C294
						)
						AND
						(
							DT200.C294 = DT200.C290
						)
					)
				)
			)
		GROUP BY
			DT199.C1329
			, DT199.C1332
		ORDER BY
			SUM( DT199.C1332 )
			, DT199.C1332
			, AVG( DT199.C1329 )
			, DT199.C1329
		LIMIT 198
		) AS DT201 ( C1335, C1336, C1337, C1338 ) 
	INNER JOIN
		T19 DT202
	ON
		DT201.C1338 <> DT202.C231
	)
WHERE
	(
		(
			DT201.C1335 <> DT201.C1335
		)
		OR
		(
			(
				DT201.C1335 = DT202.C231
			)
			AND
			(
				DT201.C1336 = DT201.C1335
			)
		)
	)
	OR
	(
		(
			DT201.C1336 = DT201.C1336
		)
		OR
		(
			(
				DT201.C1336 < DT201.C1337
			)
			OR
			(
				DT202.C231 <> DT202.C232
			)
		)
	)
GROUP BY
	DT201.C1336
	, DT201.C1338
ORDER BY
	MAX( DT201.C1338 )
	, DT201.C1336
	, DT201.C1338
LIMIT 593;


SELECT
	DT204.C1132
	, DT204.C1121
	, COUNT( DT204.C1132 )
	, to_char(AVG( DT204.C1121 ),'9999999.9999999')
FROM
	(
		(
		SELECT
			MAX( DT206.C940 )
		FROM
			(
				T13 DT205
			INNER JOIN
				T76 DT206
			ON
				DT205.C168 = DT206.C938
			)
		WHERE
			(
				(
					(
						DT205.C164 <> DT205.C174
					)
					AND
					(
						DT206.C941 > DT205.C172
					)
				)
				AND
				(
					DT205.C174 > DT205.C176
				)
			)
			OR
			(
				(
					(
						DT205.C164 = DT206.C943
					)
					AND
					(
						DT205.C173 > DT205.C169
					)
				)
				AND
				(
					DT205.C176 = DT206.C943
				)
			)
		GROUP BY
			DT206.C941
			, DT206.C940
		ORDER BY
			MAX( DT206.C940 )
		LIMIT 683
		) AS DT207 ( C1343 ) 
	INNER JOIN
		(
			T92 DT204
		INNER JOIN
			T29 DT203
		ON
			DT204.C1125 = DT203.C340
		)
	ON
		DT207.C1343 = DT204.C1133
	)
WHERE
	(
		DT204.C1119 > DT207.C1343
	)
	OR
	(
		(
			DT204.C1119 = DT203.C338
		)
		OR
		(
			(
				DT204.C1131 > DT203.C340
			)
			AND
			(
				(
					DT204.C1129 < DT204.C1117
				)
				OR
				(
					DT204.C1129 <> DT204.C1123
				)
			)
		)
	)
GROUP BY
	DT204.C1132
	, DT204.C1121
ORDER BY
	DT204.C1132
	, DT204.C1121
	, COUNT( DT204.C1132 )
	, AVG( DT204.C1121 )
LIMIT 222;


SELECT
	DT211.C1349
	, MIN( DT211.C1348 )
	, MAX( DT220.C713 )
	, DT220.C715
	, DT211.C1348
	, MAX( DT220.C715 )
	, DT220.C713
FROM
	(
		T59 DT220
	INNER JOIN
		(
			(
			SELECT
				DT208.C472
				, to_char(AVG( DT208.C466 ),'9999999.9999999')
				, DT208.C470
			FROM
				(
					(
						T41 DT208
					INNER JOIN
						T0 DT209
					ON
						DT208.C455 < DT209.C3
					)
				INNER JOIN
					T82 DT210
				ON
					DT208.C452 = DT210.C998
				)
			WHERE
				(
					DT208.C456 <> DT209.C2
				)
				OR
				(
					(
						(
							DT208.C461 > DT209.C3
						)
						AND
						(
							DT208.C461 > DT208.C453
						)
					)
					OR
					(
						(
							(
								DT208.C472 <> DT208.C461
							)
							AND
							(
								(
									(
										DT209.C1 < DT208.C463
									)
									AND
									(
										DT208.C466 = DT208.C469
									)
								)
								OR
								(
									DT208.C467 = DT208.C452
								)
							)
						)
						AND
						(
							DT208.C467 = DT208.C462
						)
					)
				)
			GROUP BY
				DT208.C466
				, DT208.C458
				, DT210.C999
				, DT208.C472
				, DT208.C470
			ORDER BY
				DT208.C472
				, AVG( DT208.C466 )
				, DT208.C470
			LIMIT 290
			)  DT211 ( C1347, C1348, C1349 ) 
		INNER JOIN
			(
			SELECT
				SUM( DT217.C1355 )
				, DT212.C826
				, MIN( DT213.C724 )
			FROM
				(
					(
						T60 DT213
					INNER JOIN
						T69 DT212
					ON
						DT213.C722 < DT212.C828
					)
				INNER JOIN
					(
						T13 DT218
					INNER JOIN
						(
						SELECT
							DT216.C1202
							, DT214.C1194
							, COUNT( DT214.C1194 )
							, MIN( DT216.C1202 )
						FROM
							(
								(
									T97 DT214
								INNER JOIN
									T98 DT216
								ON
									DT214.C1193 > DT216.C1202
								)
							INNER JOIN
								T5 DT215
							ON
								DT216.C1202 = DT215.C67
							)
						WHERE
							(
								(
									DT215.C67 > DT215.C74
								)
								AND
								(
									(
										(
											DT214.C1190 < DT214.C1196
										)
										AND
										(
											DT215.C70 = DT216.C1203
										)
									)
									OR
									(
										DT215.C69 = DT214.C1197
									)
								)
							)
							OR
							(
								DT215.C67 = DT216.C1203
							)
						GROUP BY
							DT216.C1202
							, DT214.C1194
						ORDER BY
							DT216.C1202
							, DT214.C1194
							, COUNT( DT214.C1194 )
							, MIN( DT216.C1202 )
						LIMIT 407
						) AS DT217 ( C1352, C1353, C1354, C1355 ) 
					ON
						DT218.C176 = DT217.C1355
					)
				ON
					DT212.C836 = DT217.C1353
				)
			WHERE
				(
					(
						DT213.C719 > DT217.C1354
					)
					OR
					(
						(
							DT212.C835 = DT212.C825
						)
						AND
						(
							DT218.C176 = DT212.C829
						)
					)
				)
				OR
				(
					(
						(
							DT218.C169 = DT212.C836
						)
						OR
						(
							DT212.C825 > DT213.C720
						)
					)
					OR
					(
						(
							(
								DT212.C826 = DT212.C836
							)
							AND
							(
								DT212.C833 = DT212.C834
							)
						)
						AND
						(
							DT218.C169 = DT212.C835
						)
					)
				)
			GROUP BY
				DT217.C1355
				, DT212.C826
				, DT213.C724
			ORDER BY
				SUM( DT217.C1355 )
				, DT212.C826
				, MIN( DT213.C724 )
			LIMIT 631
			) AS DT219 ( C1359, C1360, C1361 ) 
		ON
			DT211.C1348 <> DT219.C1361::text
		)
	ON
		DT220.C716 = DT219.C1359
	)
WHERE
	(
		(
			DT220.C716 > DT219.C1359
		)
		OR
		(
			(
				DT220.C715 = DT220.C714
			)
			OR
			(
				(
					(
						DT220.C714 = DT211.C1347
					)
					OR
					(
						DT219.C1361 = DT220.C716
					)
				)
				AND
				(
					DT219.C1360 = DT219.C1360
				)
			)
		)
	)
	AND
	(
		(
			DT211.C1349 > DT220.C715
		)
		OR
		(
			DT211.C1349 = DT220.C714
		)
	)
GROUP BY
	DT220.C713
	, DT211.C1348
	, DT211.C1349
	, DT220.C715
ORDER BY
	DT211.C1349
	, MIN( DT211.C1348 )
	, MAX( DT220.C713 )
	, DT220.C715
	, DT211.C1348
	, MAX( DT220.C715 )
	, DT220.C713
LIMIT 414;


SELECT
	DT225.C1367
FROM
	(
		(
		SELECT
			DT224.C82
			, SUM( DT224.C82 )
			, COUNT( DT222.C869 )
		FROM
			(
				(
					T97 DT223
				INNER JOIN
					T72 DT222
				ON
					DT223.C1192 = DT222.C882
				)
			RIGHT OUTER JOIN
				T6 DT224
			ON
				DT222.C871 = DT224.C84
			)
		WHERE
			(
				(
					DT224.C85 < DT222.C878
				)
				AND
				(
					(
						DT223.C1195 = DT223.C1190
					)
					OR
					(
						(
							(
								DT222.C884 = DT223.C1192
							)
							OR
							(
								DT222.C868 = DT222.C877
							)
						)
						AND
						(
							DT224.C86 < DT222.C877
						)
					)
				)
			)
			OR
			(
				(
					DT222.C885 = DT223.C1192
				)
				AND
				(
					DT222.C876 = DT222.C884
				)
			)
		GROUP BY
			DT222.C869
			, DT224.C82
		ORDER BY
			DT224.C82
			, SUM( DT224.C82 )
			, COUNT( DT222.C869 )
		LIMIT 822
		)  DT225 ( C1367, C1368, C1369 ) 
	INNER JOIN
		T17 DT221
	ON
		DT225.C1367 = DT221.C215
	)
WHERE
	(
		(
			(
				DT221.C210 <> DT225.C1367
			)
			AND
			(
				(
					DT221.C217 = DT221.C210
				)
				AND
				(
					DT225.C1367 = DT221.C218
				)
			)
		)
		OR
		(
			(
				DT225.C1367 = DT221.C217
			)
			OR
			(
				DT221.C213 <> DT221.C216
			)
		)
	)
	OR
	(
		DT221.C218 < DT221.C218
	)
GROUP BY
	DT221.C214
	, DT225.C1367
ORDER BY
	DT225.C1367
LIMIT 722;


SELECT
	DT227.C862
FROM
	(
		T71 DT227
	INNER JOIN
		T71 DT226
	ON
		DT227.C860 > DT226.C860
	)
WHERE
	(
		(
			(
				DT226.C863 = DT227.C862
			)
			OR
			(
				(
					DT226.C865 > DT227.C864
				)
				OR
				(
					DT226.C860 <> DT227.C866
				)
			)
		)
		AND
		(
			(
				DT226.C860 < DT227.C860
			)
			OR
			(
				DT226.C862 <> DT227.C863
			)
		)
	)
	AND
	(
		(
			DT227.C862 < DT226.C864
		)
		OR
		(
			DT227.C865 > DT226.C860
		)
	)
GROUP BY
	DT227.C865
	, DT227.C866
	, DT227.C862
ORDER BY
	DT227.C862
LIMIT 167;


SELECT
	SUM( DT229.C179 )
FROM
	(
		T13 DT229
	INNER JOIN
		T39 DT228
	ON
		DT229.C176 = DT228.C444
	)
WHERE
	(
		(
			DT229.C164 = DT228.C446
		)
		AND
		(
			DT229.C172 = DT228.C444
		)
	)
	OR
	(
		(
			DT229.C177 > DT229.C173
		)
		AND
		(
			(
				DT229.C176 = DT229.C167
			)
			AND
			(
				(
					(
						DT229.C179 = DT229.C170
					)
					AND
					(
						DT229.C178 > DT229.C172
					)
				)
				AND
				(
					DT229.C175 = DT229.C167
				)
			)
		)
	)
GROUP BY
	DT228.C445
	, DT229.C179
ORDER BY
	SUM( DT229.C179 )
LIMIT 291;


SELECT
	DT232.C998
	, MAX( DT232.C997 )
	, MAX( DT232.C998 )
	, DT230.C467
	, DT230.C470
	, DT232.C997
FROM
	(
		T9 DT231
	INNER JOIN
		(
			T82 DT232
		INNER JOIN
			T41 DT230
		ON
			DT232.C999 > DT230.C472
		)
	ON
		DT231.C130 < DT230.C459
	)
WHERE
	(
		(
			(
				DT230.C455 = DT230.C456
			)
			OR
			(
				DT230.C464 < DT230.C465
			)
		)
		AND
		(
			(
				(
					DT232.C996 = DT231.C126
				)
				AND
				(
					DT232.C995 = DT232.C997
				)
			)
			AND
			(
				(
					(
						DT230.C460 <> DT230.C454
					)
					AND
					(
						DT230.C452 <> DT231.C128
					)
				)
				AND
				(
					DT230.C465 = DT230.C464
				)
			)
		)
	)
	OR
	(
		DT231.C132 <> DT232.C998
	)
GROUP BY
	DT230.C470
	, DT232.C997
	, DT230.C467
	, DT232.C998
ORDER BY
	DT232.C998
	, MAX( DT232.C997 )
	, MAX( DT232.C998 )
	, DT230.C467
	, DT230.C470
	, DT232.C997
LIMIT 488;


SELECT
	DT239.C475
	, SUM( DT239.C485 )
FROM
	(
		(
			T90 DT240
		INNER JOIN
			(
			SELECT
				COUNT( DT234.C639 )
				, DT235.C86
				, AVG( DT235.C86 )
				, DT237.C762
				, DT234.C639
			FROM
				(
					(
						T53 DT234
					INNER JOIN
						T55 DT236
					ON
						DT234.C650 <> DT236.C665
					)
				INNER JOIN
					(
						T6 DT235
					INNER JOIN
						T63 DT237
					ON
						DT235.C82 <> DT237.C745
					)
				ON
					DT234.C651 > DT235.C77
				)
			WHERE
				(
					(
						(
							(
								DT235.C87 < DT237.C752
							)
							AND
							(
								DT235.C86 = DT234.C638
							)
						)
						OR
						(
							DT237.C759 < DT234.C653
						)
					)
					OR
					(
						(
							DT237.C756 = DT237.C754
						)
						OR
						(
							DT237.C743 < DT234.C645
						)
					)
				)
				AND
				(
					DT234.C646 = DT237.C755
				)
			GROUP BY
				DT234.C639
				, DT237.C762
				, DT235.C86
			ORDER BY
				COUNT( DT234.C639 )
				, DT235.C86
				, AVG( DT235.C86 )
				, DT237.C762
				, DT234.C639
			LIMIT 128
			) AS DT238 ( C1382, C1383, C1384, C1385, C1386 ) 
		ON
			DT240.C1081 < DT238.C1382
		)
	INNER JOIN
		(
			T42 DT239
		INNER JOIN
			T64 DT233
		ON
			DT239.C483 = DT233.C771
		)
	ON
		DT238.C1383 <> DT239.C476
	)
WHERE
	(
		DT240.C1087 > DT240.C1086
	)
	AND
	(
		(
			DT240.C1089 = DT240.C1086
		)
		AND
		(
			(
				(
					DT239.C479 = DT240.C1082
				)
				AND
				(
					DT238.C1384 = DT240.C1082
				)
			)
			AND
			(
				DT233.C777 = DT239.C476
			)
		)
	)
GROUP BY
	DT239.C485
	, DT233.C774
	, DT239.C480
	, DT239.C475
	, DT240.C1087
ORDER BY
	DT239.C475
	, SUM( DT239.C485 )
LIMIT 615;


SELECT
	DT242.C154
	, SUM( DT242.C155 )
	, COUNT( DT243.C801 )
FROM
	(
		T66 DT243
	INNER JOIN
		(
			T11 DT242
		INNER JOIN
			T5 DT241
		ON
			DT242.C152 = DT241.C69
		)
	ON
		DT243.C806 = DT241.C71
	)
WHERE
	(
		(
			(
				DT243.C808 <> DT243.C803
			)
			AND
			(
				(
					DT241.C66 = DT243.C805
				)
				OR
				(
					DT241.C70 = DT243.C801
				)
			)
		)
		AND
		(
			DT241.C72 <> DT242.C154
		)
	)
	AND
	(
		DT242.C152 = DT241.C73
	)
GROUP BY
	DT242.C156
	, DT242.C155
	, DT241.C66
	, DT243.C801
	, DT242.C154
ORDER BY
	DT242.C154
	, SUM( DT242.C155 )
	, COUNT( DT243.C801 )
LIMIT 741;


SELECT
	MAX( DT244.C1049 )
FROM
	(
		T40 DT245
	INNER JOIN
		T86 DT244
	ON
		DT245.C447 = DT244.C1050
	)
WHERE
	(
		(
			(
				(
					DT244.C1055 = DT244.C1050
				)
				AND
				(
					DT245.C450 = DT245.C450
				)
			)
			AND
			(
				DT245.C447 > DT244.C1052
			)
		)
		OR
		(
			(
				(
					(
						DT245.C449 > DT244.C1048
					)
					AND
					(
						DT244.C1051 = DT244.C1052
					)
				)
				OR
				(
					DT244.C1048 = DT244.C1051
				)
			)
			AND
			(
				DT244.C1053 = DT245.C450
			)
		)
	)
	OR
	(
		DT244.C1052 = DT244.C1047
	)
GROUP BY
	DT244.C1055
	, DT245.C450
	, DT245.C448
	, DT244.C1048
	, DT244.C1049
ORDER BY
	MAX( DT244.C1049 )
LIMIT 897;


SELECT
	DT247.C236
FROM
	(
		(
			T20 DT247
		INNER JOIN
			T7 DT248
		ON
			DT247.C240 = DT248.C109
		)
	INNER JOIN
		T93 DT246
	ON
		DT248.C97 > DT246.C1140
	)
WHERE
	(
		(
			DT247.C237 < DT248.C98
		)
		AND
		(
			(
				DT246.C1136 <> DT248.C106
			)
			AND
			(
				DT247.C233 < DT247.C237
			)
		)
	)
	AND
	(
		(
			DT247.C245 <> DT247.C244
		)
		OR
		(
			DT248.C95 < DT248.C108
		)
	)
GROUP BY
	DT248.C94
	, DT248.C95
	, DT247.C236
	, DT248.C101
ORDER BY
	DT247.C236
LIMIT 851;


SELECT
	DT249.C381
	, SUM( DT249.C368 )
	, DT249.C365
	, DT249.C366
	, DT249.C368
	, to_char(AVG( DT249.C381 ),'9999999.9999999')
	, COUNT( DT249.C366 )
	, to_char(AVG( DT249.C365 ),'9999999.9999999')
FROM
	(
		T32 DT249
	INNER JOIN
		(
		SELECT
			DT252.C1408
			, DT255.C1052
			, DT252.C1411
			, DT252.C1405
			, SUM( DT252.C1411 )
			, DT254.C68
			, MIN( DT255.C1052 )
			, MAX( DT254.C68 )
		FROM
			(
				(
					(
						T86 DT255
					INNER JOIN
						T5 DT254
					ON
						DT255.C1047 = DT254.C74
					)
				INNER JOIN
					(
					SELECT
						AVG( DT250.C245 )
						, DT250.C245
						, AVG( DT251.C827 )
						, DT250.C243
						, DT251.C834
						, SUM( DT250.C243 )
						, AVG( DT251.C834 )
						, DT251.C827
					FROM
						(
							T20 DT250
						INNER JOIN
							T69 DT251
						ON
							DT250.C240 = DT251.C838
						)
					WHERE
						(
							(
								(
									(
										DT251.C825 <> DT251.C833
									)
									AND
									(
										DT250.C237 = DT250.C235
									)
								)
								OR
								(
									(
										DT250.C243 = DT251.C838
									)
									AND
									(
										(
											DT250.C234 = DT251.C831
										)
										AND
										(
											DT251.C831 = DT250.C240
										)
									)
								)
							)
							OR
							(
								DT250.C242 = DT250.C243
							)
						)
						OR
						(
							(
								DT251.C828 < DT250.C234
							)
							OR
							(
								DT251.C831 = DT250.C242
							)
						)
					GROUP BY
						DT250.C243
						, DT251.C834
						, DT250.C245
						, DT251.C827
					ORDER BY
						AVG( DT250.C245 )
						, DT250.C245
						, AVG( DT251.C827 )
						, DT250.C243
						, DT251.C834
						, SUM( DT250.C243 )
						, AVG( DT251.C834 )
						, DT251.C827
					LIMIT 898
					) AS DT252 ( C1404, C1405, C1406, C1407, C1408, C1409, C1410, C1411 ) 
				ON
					DT254.C69 = DT252.C1408
				)
			INNER JOIN
				T71 DT253
			ON
				DT252.C1405 = DT253.C863
			)
		WHERE
			(
				DT253.C860 <> DT255.C1049
			)
			AND
			(
				(
					DT254.C66 > DT254.C69
				)
				OR
				(
					(
						(
							DT253.C863 = DT254.C71
						)
						OR
						(
							DT255.C1053 <> DT254.C74
						)
					)
					AND
					(
						DT253.C866 > DT253.C865
					)
				)
			)
		GROUP BY
			DT252.C1411
			, DT255.C1052
			, DT252.C1408
			, DT254.C68
			, DT252.C1405
		ORDER BY
			DT252.C1408
			, DT255.C1052
			, DT252.C1411
			, DT252.C1405
			, SUM( DT252.C1411 )
			, DT254.C68
			, MIN( DT255.C1052 )
			, MAX( DT254.C68 )
		LIMIT 403
		) AS DT256 ( C1416, C1417, C1418, C1419, C1420, C1421, C1422, C1423 ) 
	ON
		DT249.C381 < DT256.C1421
	)
WHERE
	(
		DT256.C1422 <> DT256.C1418
	)
	AND
	(
		(
			(
				DT256.C1418 = DT249.C370
			)
			OR
			(
				DT249.C374 > DT256.C1416
			)
		)
		AND
		(
			(
				DT256.C1421 = DT256.C1418
			)
			AND
			(
				DT249.C369 < DT249.C375
			)
		)
	)
GROUP BY
	DT249.C366
	, DT249.C368
	, DT249.C381
	, DT249.C365
ORDER BY
	DT249.C381
	, SUM( DT249.C368 )
	, DT249.C365
	, DT249.C366
	, DT249.C368
	, AVG( DT249.C381 )
	, COUNT( DT249.C366 )
	, AVG( DT249.C365 )
LIMIT 405;


SELECT
	DT257.C489
	, DT257.C492
	, DT257.C491
	, DT257.C496
	, DT257.C500
	, DT257.C493
	, DT257.C488
	, DT257.C487
	, DT257.C499
	, DT257.C490
	, DT264.C1439
	, DT257.C498
	, DT257.C497
	, DT264.C1440
	, DT257.C494
FROM
	(
		(
		SELECT
			DT263.C1144
			, DT262.C240
		FROM
			(
				T59 DT261
			INNER JOIN
				(
					T93 DT263
				INNER JOIN
					(
						(
						SELECT
							DT259.C138
							, DT259.C140
							, DT259.C151
							, SUM( DT259.C151 )
						FROM
							(
								T0 DT258
							INNER JOIN
								T10 DT259
							ON
								DT258.C0 < DT259.C146
							)
						WHERE
							(
								(
									(
										DT259.C150 = DT258.C3
									)
									OR
									(
										DT258.C2 <> DT258.C3
									)
								)
								AND
								(
									DT258.C2 < DT259.C138
								)
							)
							OR
							(
								(
									DT259.C149 > DT259.C141
								)
								AND
								(
									DT259.C149 > DT259.C145
								)
							)
						GROUP BY
							DT259.C138
							, DT259.C140
							, DT259.C151
							, DT259.C142
						ORDER BY
							DT259.C138
							, DT259.C140
							, DT259.C151
							, SUM( DT259.C151 )
						LIMIT 876
						)  DT260 ( C1432, C1433, C1434, C1435 ) 
					INNER JOIN
						T20 DT262
					ON
						DT260.C1434 = DT262.C239
					)
				ON
					DT263.C1142 > DT262.C238
				)
			ON
				DT261.C713 = DT262.C242
			)
		WHERE
			(
				(
					DT263.C1137 > DT262.C237
				)
				OR
				(
					(
						(
							DT263.C1138 > DT263.C1142
						)
						OR
						(
							(
								DT263.C1142 = DT262.C246
							)
							OR
							(
								DT263.C1142 > DT262.C239
							)
						)
					)
					OR
					(
						(
							DT261.C716 < DT262.C241
						)
						OR
						(
							DT262.C236 = DT262.C241
						)
					)
				)
			)
			OR
			(
				DT263.C1138 = DT262.C235
			)
		GROUP BY
			DT262.C236
			, DT262.C240
			, DT263.C1144
		ORDER BY
			DT263.C1144
			, DT262.C240
		LIMIT 155
		)  DT264 ( C1439, C1440 ) 
	INNER JOIN
		(
			(
			SELECT
				DT265.C998
			FROM
				(
					(
						T82 DT265
					INNER JOIN
						T5 DT266
					ON
						DT265.C1000 = DT266.C67
					)
				INNER JOIN
					(
						T72 DT267
					INNER JOIN
						T21 DT268
					ON
						DT267.C878 <> DT268.C254
					)
				ON
					DT266.C73 = DT267.C868
				)
			WHERE
				(
					(
						(
							DT267.C888 = DT268.C253
						)
						AND
						(
							DT268.C251 = DT267.C881
						)
					)
					OR
					(
						(
							(
								DT266.C74 = DT267.C870
							)
							OR
							(
								DT265.C995 > DT267.C868
							)
						)
						OR
						(
							DT268.C257 = DT266.C71
						)
					)
				)
				OR
				(
					(
						(
							DT267.C873 < DT267.C887
						)
						OR
						(
							DT268.C257 > DT265.C995
						)
					)
					OR
					(
						DT267.C885 = DT267.C887
					)
				)
			GROUP BY
				DT268.C258
				, DT267.C888
				, DT265.C998
				, DT267.C877
			ORDER BY
				DT265.C998
			LIMIT 953
			) AS DT269 ( C1443 ) 
		INNER JOIN
			T43 DT257
		ON
			DT269.C1443 = DT257.C490
		)
	ON
		DT264.C1440 = DT257.C495
	)
WHERE
	(
		(
			DT269.C1443 = DT257.C488
		)
		AND
		(
			DT257.C501 <> DT264.C1440
		)
	)
	AND
	(
		(
			DT257.C497 = DT257.C487
		)
		AND
		(
			(
				(
					DT257.C494 = DT257.C491
				)
				OR
				(
					DT257.C492 = DT257.C492
				)
			)
			OR
			(
				DT257.C501 = DT257.C494
			)
		)
	)
ORDER BY
	DT257.C489
	, DT257.C492
	, DT257.C491
	, DT257.C496
	, DT257.C500
	, DT257.C493
	, DT257.C488
	, DT257.C487
	, DT257.C499
	, DT257.C490
	, DT264.C1439
	, DT257.C498
	, DT257.C497
	, DT264.C1440
	, DT257.C494
LIMIT 562;


SELECT
	AVG( DT271.C142 )
	, DT272.C800
	, DT271.C142
	, DT272.C803
FROM
	(
		T84 DT270
	INNER JOIN
		(
			T10 DT271
		INNER JOIN
			(
				T21 DT273
			INNER JOIN
				T66 DT272
			ON
				DT273.C258 = DT272.C806
			)
		ON
			DT271.C149 = DT272.C806
		)
	ON
		DT270.C1017 > DT271.C150
	)
WHERE
	(
		DT271.C151 = DT272.C806
	)
	AND
	(
		(
			DT273.C250 = DT271.C147
		)
		AND
		(
			(
				DT270.C1015 = DT270.C1011
			)
			OR
			(
				(
					DT271.C147 = DT273.C255
				)
				OR
				(
					DT272.C807 < DT271.C150
				)
			)
		)
	)
GROUP BY
	DT273.C254
	, DT271.C142
	, DT272.C800
	, DT272.C803
	, DT271.C139
ORDER BY
	AVG( DT271.C142 )
	, DT272.C800
	, DT271.C142
	, DT272.C803
LIMIT 732;


SELECT
	DT274.C6
	, DT280.C1450
	, DT280.C1454
	, DT275.C1050
	, DT274.C10
FROM
	(
		T86 DT275
	INNER JOIN
		(
			(
			SELECT
				MAX( DT279.C709 )
				, DT278.C1207
				, DT279.C711
				, MIN( DT276.C975 )
				, AVG( DT278.C1207 )
				, SUM( DT279.C698 )
				, DT279.C709
				, DT276.C975
			FROM
				(
					(
						(
							T58 DT279
						INNER JOIN
							T79 DT277
						ON
							DT279.C703 = DT277.C983
						)
					INNER JOIN
						T78 DT276
					ON
						DT277.C979 = DT276.C967
					)
				INNER JOIN
					T99 DT278
				ON
					DT279.C708 < DT278.C1208
				)
			WHERE
				(
					(
						(
							DT276.C967 = DT279.C705
						)
						OR
						(
							DT276.C966 > DT276.C974
						)
					)
					OR
					(
						(
							(
								DT276.C974 = DT277.C984
							)
							AND
							(
								(
									DT278.C1205 <> DT279.C705
								)
								OR
								(
									DT276.C977 < DT279.C710
								)
							)
						)
						OR
						(
							DT276.C977 = DT279.C699
						)
					)
				)
				AND
				(
					DT279.C706 = DT279.C700
				)
			GROUP BY
				DT276.C975
				, DT279.C698
				, DT279.C711
				, DT278.C1207
				, DT279.C709
			ORDER BY
				MAX( DT279.C709 )
				, DT278.C1207
				, DT279.C711
				, MIN( DT276.C975 )
				, AVG( DT278.C1207 )
				, SUM( DT279.C698 )
				, DT279.C709
				, DT276.C975
			LIMIT 739
			)  DT280 ( C1450, C1451, C1452, C1453, C1454, C1455, C1456, C1457 ) 
		INNER JOIN
			T1 DT274
		ON
			DT280.C1450 = DT274.C12
		)
	ON
		DT275.C1049 < DT274.C9
	)
WHERE
	(
		(
			DT274.C9 <> DT274.C13
		)
		OR
		(
			DT274.C5 = DT274.C9
		)
	)
	OR
	(
		(
			(
				DT280.C1450 = DT275.C1049
			)
			OR
			(
				DT275.C1050 = DT280.C1452
			)
		)
		AND
		(
			(
				(
					(
						DT274.C11 = DT280.C1455
					)
					OR
					(
						DT274.C13 < DT275.C1049
					)
				)
				AND
				(
					DT274.C9 = DT280.C1454
				)
			)
			AND
			(
				DT275.C1055 = DT274.C9
			)
		)
	)
GROUP BY
	DT280.C1454
	, DT274.C6
	, DT275.C1050
	, DT274.C10
	, DT280.C1450
ORDER BY
	DT274.C6
	, DT280.C1450
	, DT280.C1454
	, DT275.C1050
	, DT274.C10
LIMIT 687;


SELECT
	DT284.C1464
	, DT284.C1466
FROM
	(
		(
		SELECT
			MIN( DT281.C157 )
			, DT281.C163
			, DT281.C157
			, DT283.C180
		FROM
			(
				(
					T14 DT283
				INNER JOIN
					T60 DT282
				ON
					DT283.C182 = DT282.C723
				)
			INNER JOIN
				T12 DT281
			ON
				DT283.C185 = DT281.C157
			)
		WHERE
			(
				DT282.C722 > DT282.C719
			)
			AND
			(
				(
					(
						DT282.C719 = DT283.C184
					)
					OR
					(
						(
							DT281.C163 < DT283.C185
						)
						AND
						(
							DT281.C163 > DT282.C723
						)
					)
				)
				AND
				(
					(
						DT282.C719 = DT282.C718
					)
					AND
					(
						(
							(
								DT281.C163 = DT282.C719
							)
							AND
							(
								DT282.C717 < DT281.C159
							)
						)
						OR
						(
							DT282.C718 <> DT281.C163
						)
					)
				)
			)
		GROUP BY
			DT281.C163
			, DT281.C157
			, DT283.C183
			, DT283.C180
		ORDER BY
			MIN( DT281.C157 )
			, DT281.C163
			, DT281.C157
			, DT283.C180
		LIMIT 689
		) AS DT284 ( C1463, C1464, C1465, C1466 ) 
	INNER JOIN
		T5 DT285
	ON
		DT284.C1464 = DT285.C68
	)
WHERE
	(
		(
			(
				DT285.C72 <> DT285.C68
			)
			OR
			(
				DT285.C73 = DT285.C67
			)
		)
		AND
		(
			(
				(
					DT285.C70 > DT285.C74
				)
				AND
				(
					DT285.C71 = DT284.C1463
				)
			)
			AND
			(
				DT284.C1463 <> DT285.C66
			)
		)
	)
	OR
	(
		(
			(
				DT285.C69 = DT285.C71
			)
			AND
			(
				DT284.C1464 = DT285.C72
			)
		)
		AND
		(
			DT285.C67 <> DT285.C73
		)
	)
GROUP BY
	DT284.C1466
	, DT284.C1464
ORDER BY
	DT284.C1464
	, DT284.C1466
LIMIT 577;


SELECT
	MIN( DT290.C1471 )
	, DT292.C324
	, MIN( DT291.C23 )
	, DT290.C1471
FROM
	(
		(
			T27 DT292
		INNER JOIN
			T2 DT291
		ON
			DT292.C322 = DT291.C26
		)
	INNER JOIN
		(
		SELECT
			DT288.C556
		FROM
			(
				(
					T47 DT288
				INNER JOIN
					(
						T15 DT287
					INNER JOIN
						T82 DT286
					ON
						DT287.C189 <> DT286.C997
					)
				ON
					DT288.C565 = DT287.C199
				)
			INNER JOIN
				T52 DT289
			ON
				DT286.C995 > DT289.C635
			)
		WHERE
			(
				(
					DT288.C557 = DT289.C625
				)
				OR
				(
					(
						DT289.C634 < DT287.C199
					)
					OR
					(
						DT289.C634 > DT287.C188
					)
				)
			)
			OR
			(
				(
					DT287.C189 < DT287.C197
				)
				AND
				(
					(
						(
							DT288.C554 = DT288.C563
						)
						OR
						(
							DT288.C549 > DT287.C193
						)
					)
					AND
					(
						DT288.C565 = DT288.C558
					)
				)
			)
		GROUP BY
			DT287.C196
			, DT288.C556
		ORDER BY
			DT288.C556
		LIMIT 992
		) AS DT290 ( C1471 ) 
	ON
		DT291.C17 < DT290.C1471
	)
WHERE
	(
		DT291.C18 = DT291.C29
	)
	OR
	(
		(
			(
				DT292.C319 = DT292.C323
			)
			AND
			(
				(
					DT291.C25 = DT290.C1471
				)
				AND
				(
					DT291.C31 = DT291.C18
				)
			)
		)
		OR
		(
			(
				(
					DT291.C26 = DT291.C27
				)
				OR
				(
					DT291.C29 = DT291.C15
				)
			)
			OR
			(
				DT292.C326 = DT291.C29
			)
		)
	)
GROUP BY
	DT291.C18
	, DT291.C23
	, DT292.C324
	, DT291.C30
	, DT290.C1471
ORDER BY
	MIN( DT290.C1471 )
	, DT292.C324
	, MIN( DT291.C23 )
	, DT290.C1471
LIMIT 716;


SELECT
	COUNT( DT293.C179 )
	, DT293.C179
FROM
	(
		(
			T75 DT295
		INNER JOIN
			T48 DT294
		ON
			DT295.C936 = DT294.C578
		)
	INNER JOIN
		T13 DT293
	ON
		DT294.C576 > DT293.C175
	)
WHERE
	(
		DT295.C933 = DT294.C578
	)
	OR
	(
		(
			(
				(
					(
						DT294.C568 = DT294.C581
					)
					AND
					(
						DT294.C572 = DT293.C171
					)
				)
				AND
				(
					DT294.C582 < DT294.C578
				)
			)
			AND
			(
				(
					DT294.C571 = DT295.C931
				)
				AND
				(
					DT293.C171 = DT293.C165
				)
			)
		)
		OR
		(
			DT294.C583 <> DT293.C178
		)
	)
GROUP BY
	DT293.C179
	, DT295.C935
	, DT294.C581
	, DT295.C937
	, DT293.C165
ORDER BY
	COUNT( DT293.C179 )
	, DT293.C179
LIMIT 423;


SELECT
	DT298.C193
	, MAX( DT297.C125 )
	, DT297.C125
FROM
	(
		(
			T8 DT297
		INNER JOIN
			T15 DT298
		ON
			DT297.C124 <> DT298.C191
		)
	INNER JOIN
		(
			(
			SELECT
				DT299.C1202
				, SUM( DT299.C1203 )
				, DT299.C1203
				, DT302.C1482
				, DT299.C1201
				, AVG( DT302.C1482 )
			FROM
				(
					T98 DT299
				INNER JOIN
					(
					SELECT
						DT300.C869
						, DT301.C1181
					FROM
						(
							T72 DT300
						LEFT OUTER JOIN
							T96 DT301
						ON
							DT300.C887 = DT301.C1179
						)
					WHERE
						(
							(
								(
									DT301.C1188 > DT301.C1186
								)
								OR
								(
									DT301.C1176 = DT301.C1189
								)
							)
							AND
							(
								(
									DT301.C1185 > DT300.C884
								)
								OR
								(
									DT301.C1185 > DT300.C888
								)
							)
						)
						OR
						(
							(
								DT300.C877 = DT300.C867
							)
							AND
							(
								DT300.C881 = DT301.C1179
							)
						)
					GROUP BY
						DT301.C1176
						, DT301.C1181
						, DT300.C869
						, DT300.C882
					ORDER BY
						DT300.C869
						, DT301.C1181
					LIMIT 369
					)  DT302 ( C1481, C1482 ) 
				ON
					DT299.C1203 < DT302.C1481
				)
			WHERE
				(
					(
						DT299.C1202 < DT299.C1203
					)
					OR
					(
						DT299.C1202 = DT299.C1202
					)
				)
				OR
				(
					(
						(
							DT302.C1481 = DT299.C1203
						)
						OR
						(
							DT302.C1482 > DT299.C1201
						)
					)
					AND
					(
						(
							DT299.C1201 > DT302.C1482
						)
						AND
						(
							(
								DT302.C1482 = DT302.C1481
							)
							OR
							(
								DT302.C1481 = DT299.C1201
							)
						)
					)
				)
			GROUP BY
				DT299.C1203
				, DT302.C1482
				, DT299.C1202
				, DT299.C1201
			ORDER BY
				DT299.C1202
				, SUM( DT299.C1203 )
				, DT299.C1203
				, DT302.C1482
				, DT299.C1201
				, AVG( DT302.C1482 )
			LIMIT 156
			) AS DT303 ( C1486, C1487, C1488, C1489, C1490, C1491 ) 
		INNER JOIN
			T5 DT296
		ON
			DT303.C1487 = DT296.C69
		)
	ON
		DT298.C193 = DT303.C1487
	)
WHERE
	(
		(
			DT298.C195 = DT298.C190
		)
		OR
		(
			DT298.C186 > DT296.C73
		)
	)
	OR
	(
		(
			(
				(
					DT303.C1491 = DT297.C118
				)
				AND
				(
					DT298.C190 = DT298.C194
				)
			)
			AND
			(
				(
					DT298.C191 = DT298.C197
				)
				OR
				(
					DT297.C125 = DT298.C187
				)
			)
		)
		AND
		(
			(
				DT303.C1488 > DT296.C73
			)
			AND
			(
				DT297.C122 > DT298.C196
			)
		)
	)
GROUP BY
	DT297.C125
	, DT303.C1490
	, DT298.C193
ORDER BY
	DT298.C193
	, MAX( DT297.C125 )
	, DT297.C125
LIMIT 292;


SELECT
	MAX( DT307.C572 )
	, DT307.C572
	, DT308.C46
	, MIN( DT307.C577 )
FROM
	(
		T3 DT308
	RIGHT OUTER JOIN
		(
			T48 DT307
		INNER JOIN
			(
			SELECT
				DT304.C895
				, DT305.C977
				, DT305.C972
			FROM
				(
					T73 DT304
				INNER JOIN
					T78 DT305
				ON
					DT304.C898 = DT305.C974
				)
			WHERE
				(
					(
						(
							DT304.C892 = DT304.C892
						)
						AND
						(
							DT304.C899 < DT304.C892
						)
					)
					AND
					(
						(
							DT304.C893 = DT305.C970
						)
						OR
						(
							DT304.C895 = DT304.C889
						)
					)
				)
				AND
				(
					(
						(
							DT305.C977 = DT304.C899
						)
						OR
						(
							(
								DT304.C903 = DT304.C901
							)
							OR
							(
								DT305.C966 > DT304.C904
							)
						)
					)
					OR
					(
						DT305.C973 = DT305.C966
					)
				)
			GROUP BY
				DT305.C970
				, DT304.C898
				, DT305.C972
				, DT304.C895
				, DT305.C977
			ORDER BY
				DT304.C895
				, DT305.C977
				, DT305.C972
			LIMIT 455
			)  DT306 ( C1494, C1495, C1496 ) 
		ON
			DT307.C574 > DT306.C1494
		)
	ON
		DT308.C52 > DT307.C576
	)
WHERE
	(
		(
			DT307.C570 < DT308.C40
		)
		OR
		(
			DT308.C50 < DT306.C1496
		)
	)
	OR
	(
		(
			DT307.C580 <> DT306.C1496
		)
		AND
		(
			(
				(
					DT308.C37 < DT308.C48
				)
				OR
				(
					DT307.C579 <> DT308.C40
				)
			)
			AND
			(
				DT306.C1494 > DT307.C574
			)
		)
	)
GROUP BY
	DT308.C45
	, DT307.C577
	, DT308.C46
	, DT307.C572
ORDER BY
	MAX( DT307.C572 )
	, DT307.C572
	, DT308.C46
	, MIN( DT307.C577 )
LIMIT 791;


SELECT
	DT310.C300
FROM
	(
		(
			T26 DT310
		INNER JOIN
			T60 DT311
		ON
			DT310.C311 > DT311.C719
		)
	INNER JOIN
		T31 DT309
	ON
		DT311.C724 = DT309.C355
	)
WHERE
	(
		DT311.C719 = DT309.C355
	)
	OR
	(
		(
			(
				DT311.C723 < DT309.C360
			)
			AND
			(
				DT310.C307 = DT310.C309
			)
		)
		AND
		(
			(
				DT311.C722 = DT311.C723
			)
			AND
			(
				(
					DT311.C718 = DT309.C354
				)
				OR
				(
					DT311.C718 = DT309.C348
				)
			)
		)
	)
GROUP BY
	DT310.C300
	, DT310.C305
	, DT309.C348
	, DT310.C312
ORDER BY
	DT310.C300
LIMIT 669;


SELECT
	MIN( DT314.C1114 )
	, MIN( DT314.C1101 )
	, COUNT( DT313.C1033 )
	, DT314.C1110
	, DT314.C1114
	, DT313.C1034
	, DT313.C1033
FROM
	(
		(
			T85 DT313
		INNER JOIN
			T91 DT314
		ON
			DT313.C1042 < DT314.C1106
		)
	INNER JOIN
		T1 DT312
	ON
		DT313.C1037 < DT312.C5
	)
WHERE
	(
		(
			DT314.C1097 = DT314.C1105
		)
		AND
		(
			(
				DT313.C1044 <> DT314.C1113
			)
			OR
			(
				(
					DT313.C1030 = DT313.C1039
				)
				AND
				(
					DT313.C1041 <> DT314.C1108
				)
			)
		)
	)
	OR
	(
		(
			(
				DT312.C9 = DT314.C1098
			)
			AND
			(
				DT313.C1034 <> DT312.C10
			)
		)
		OR
		(
			DT312.C10 = DT314.C1102
		)
	)
GROUP BY
	DT313.C1033
	, DT313.C1034
	, DT314.C1114
	, DT314.C1101
	, DT314.C1110
ORDER BY
	MIN( DT314.C1114 )
	, MIN( DT314.C1101 )
	, COUNT( DT313.C1033 )
	, DT314.C1110
	, DT314.C1114
	, DT313.C1034
	, DT313.C1033
LIMIT 594;


SELECT
	DT330.C984
	, DT318.C1510
	, COUNT( DT330.C984 )
FROM
	(
		(
			(
			SELECT
				COUNT( DT319.C569 )
			FROM
				(
					(
						T76 DT328
					INNER JOIN
						(
						SELECT
							AVG( DT323.C778 )
							, DT323.C765
							, DT321.C335
							, DT323.C778
							, MIN( DT321.C335 )
							, DT321.C334
						FROM
							(
								(
									T64 DT323
								INNER JOIN
									T85 DT320
								ON
									DT323.C776 > DT320.C1039
								)
							INNER JOIN
								(
									T67 DT322
								LEFT OUTER JOIN
									T29 DT321
								ON
									DT322.C817 = DT321.C335
								)
							ON
								DT320.C1030 = DT322.C809
							)
						WHERE
							(
								(
									(
										DT323.C766 <> DT323.C764
									)
									AND
									(
										DT320.C1040 = DT322.C815
									)
								)
								OR
								(
									(
										DT321.C335 > DT320.C1039
									)
									AND
									(
										(
											DT320.C1046 <> DT320.C1034
										)
										AND
										(
											(
												DT320.C1030 < DT322.C818
											)
											AND
											(
												(
													DT322.C814 = DT323.C778
												)
												OR
												(
													DT320.C1042 < DT320.C1037
												)
											)
										)
									)
								)
							)
							AND
							(
								DT323.C781 = DT322.C814
							)
						GROUP BY
							DT321.C335
							, DT323.C778
							, DT323.C765
							, DT321.C334
						ORDER BY
							AVG( DT323.C778 )
							, DT323.C765
							, DT321.C335
							, DT323.C778
							, MIN( DT321.C335 )
							, DT321.C334
						LIMIT 102
						)  DT324 ( C1514, C1515, C1516, C1517, C1518, C1519 ) 
					ON
						DT328.C941 > DT324.C1515
					)
				INNER JOIN
					(
						T48 DT319
					LEFT OUTER JOIN
						(
						SELECT
							DT326.C668
							, MIN( DT326.C680 )
							, MAX( DT326.C677 )
						FROM
							(
								T93 DT325
							INNER JOIN
								T56 DT326
							ON
								DT325.C1144 = DT326.C675
							)
						WHERE
							(
								(
									DT326.C679 <> DT326.C681
								)
								AND
								(
									DT325.C1136 > DT326.C679
								)
							)
							AND
							(
								(
									(
										DT326.C668 < DT326.C671
									)
									AND
									(
										(
											DT325.C1139 > DT325.C1137
										)
										AND
										(
											DT326.C673 <> DT325.C1136
										)
									)
								)
								OR
								(
									DT326.C671 <> DT326.C676
								)
							)
						GROUP BY
							DT325.C1143
							, DT326.C668
							, DT326.C680
							, DT326.C677
						ORDER BY
							DT326.C668
							, MIN( DT326.C680 )
							, MAX( DT326.C677 )
						LIMIT 744
						)  DT327 ( C1522, C1523, C1524 ) 
					ON
						DT319.C585 <> DT327.C1523
					)
				ON
					DT328.C941 = DT319.C585
				)
			WHERE
				(
					DT324.C1514 < DT319.C583
				)
				OR
				(
					(
						(
							DT319.C577 = DT319.C583
						)
						OR
						(
							DT328.C946 = DT319.C576
						)
					)
					OR
					(
						(
							DT327.C1524 < DT319.C574
						)
						OR
						(
							DT324.C1519 = DT328.C945
						)
					)
				)
			GROUP BY
				DT319.C569
				, DT327.C1522
			ORDER BY
				COUNT( DT319.C569 )
			LIMIT 704
			) AS DT329 ( C1526 ) 
		INNER JOIN
			T79 DT330
		ON
			DT329.C1526 = DT330.C983
		)
	INNER JOIN
		(
		SELECT
			DT317.C556
		FROM
			(
				T36 DT315
			INNER JOIN
				(
					T94 DT316
				INNER JOIN
					T47 DT317
				ON
					DT316.C1152 > DT317.C565
				)
			ON
				DT315.C434 < DT316.C1146
			)
		WHERE
			(
				(
					(
						DT316.C1165 = DT317.C561
					)
					OR
					(
						DT316.C1153 = DT316.C1161
					)
				)
				OR
				(
					(
						(
							DT315.C431 > DT317.C562
						)
						OR
						(
							DT316.C1156 = DT315.C431
						)
					)
					AND
					(
						(
							DT317.C556 < DT316.C1165
						)
						OR
						(
							DT316.C1160 <> DT315.C424
						)
					)
				)
			)
			OR
			(
				DT316.C1165 = DT317.C560
			)
		GROUP BY
			DT315.C424
			, DT316.C1161
			, DT317.C556
			, DT317.C552
		ORDER BY
			DT317.C556
		LIMIT 186
		) AS DT318 ( C1510 ) 
	ON
		DT330.C982 < DT318.C1510
	)
WHERE
	(
		DT330.C983 = DT330.C981
	)
	AND
	(
		(
			(
				DT329.C1526 < DT330.C979
			)
			AND
			(
				DT330.C980 <> DT330.C979
			)
		)
		OR
		(
			(
				(
					DT330.C981 = DT330.C985
				)
				OR
				(
					DT330.C982 = DT330.C979
				)
			)
			AND
			(
				DT330.C980 = DT318.C1510
			)
		)
	)
GROUP BY
	DT330.C980
	, DT318.C1510
	, DT330.C984
ORDER BY
	DT330.C984
	, DT318.C1510
	, COUNT( DT330.C984 )
LIMIT 875;


SELECT
	DT334.C743
	, COUNT( DT334.C743 )
	, MAX( DT334.C746 )
FROM
	(
		(
			(
			SELECT
				SUM( DT332.C631 )
			FROM
				(
					T37 DT331
				INNER JOIN
					T52 DT332
				ON
					DT331.C438 = DT332.C627
				)
			WHERE
				(
					(
						DT331.C439 < DT331.C440
					)
					AND
					(
						DT332.C627 > DT332.C631
					)
				)
				AND
				(
					(
						(
							DT331.C439 <> DT332.C633
						)
						AND
						(
							DT332.C626 = DT332.C632
						)
					)
					OR
					(
						DT331.C439 = DT332.C627
					)
				)
			GROUP BY
				DT332.C631
				, DT332.C626
			ORDER BY
				SUM( DT332.C631 )
			LIMIT 697
			)  DT333 ( C1530 ) 
		INNER JOIN
			T63 DT334
		ON
			DT333.C1530 < DT334.C749
		)
	INNER JOIN
		(
			T44 DT335
		INNER JOIN
			T47 DT336
		ON
			DT335.C506 > DT336.C556
		)
	ON
		DT334.C754 = DT335.C510
	)
WHERE
	(
		DT334.C756 > DT334.C763
	)
	OR
	(
		(
			(
				DT335.C504 < DT334.C756
			)
			AND
			(
				DT334.C761 = DT335.C506
			)
		)
		AND
		(
			(
				DT336.C556 <> DT335.C502
			)
			AND
			(
				DT336.C558 = DT333.C1530
			)
		)
	)
GROUP BY
	DT334.C743
	, DT334.C746
	, DT333.C1530
ORDER BY
	DT334.C743
	, COUNT( DT334.C743 )
	, MAX( DT334.C746 )
LIMIT 278;


SELECT
	DT342.C338
FROM
	(
		(
		SELECT
			DT337.C635
			, DT340.C440
			, MIN( DT338.C200 )
			, MAX( DT340.C440 )
			, COUNT( DT337.C635 )
		FROM
			(
				T52 DT337
			RIGHT OUTER JOIN
				(
					(
						T16 DT338
					INNER JOIN
						T37 DT340
					ON
						DT338.C205 < DT340.C440
					)
				INNER JOIN
					T33 DT339
				ON
					DT340.C438 > DT339.C383
				)
			ON
				DT337.C627 = DT338.C205
			)
		WHERE
			(
				(
					(
						DT339.C385 <> DT339.C394
					)
					AND
					(
						DT339.C398 = DT340.C439
					)
				)
				OR
				(
					DT339.C388 = DT340.C438
				)
			)
			AND
			(
				(
					DT339.C388 = DT338.C200
				)
				OR
				(
					DT337.C631 = DT337.C627
				)
			)
		GROUP BY
			DT338.C200
			, DT337.C635
			, DT340.C440
			, DT337.C633
		ORDER BY
			DT337.C635
			, DT340.C440
			, MIN( DT338.C200 )
			, MAX( DT340.C440 )
			, COUNT( DT337.C635 )
		LIMIT 608
		) AS DT341 ( C1538, C1539, C1540, C1541, C1542 ) 
	INNER JOIN
		T29 DT342
	ON
		DT341.C1540 = DT342.C340
	)
WHERE
	(
		DT342.C336 > DT341.C1541
	)
	OR
	(
		(
			(
				DT341.C1542 = DT341.C1538
			)
			OR
			(
				(
					(
						DT342.C339 = DT342.C335
					)
					OR
					(
						DT341.C1540 = DT341.C1538
					)
				)
				OR
				(
					DT342.C335 = DT341.C1538
				)
			)
		)
		OR
		(
			DT342.C337 = DT341.C1541
		)
	)
GROUP BY
	DT342.C335
	, DT342.C338
	, DT341.C1540
ORDER BY
	DT342.C338
LIMIT 246;


SELECT
	to_char(AVG( DT345.C769 ),'9999999.9999999')
	, DT344.C162
	, DT345.C769
	, DT343.C402
	, MAX( DT344.C162 )
FROM
	(
		T64 DT345
	INNER JOIN
		(
			T34 DT343
		INNER JOIN
			T12 DT344
		ON
			DT343.C409 = DT344.C157
		)
	ON
		DT345.C777 = DT343.C410
	)
WHERE
	(
		(
			DT345.C781 = DT345.C779
		)
		AND
		(
			(
				DT345.C781 < DT343.C402
			)
			OR
			(
				DT343.C408 = DT343.C403
			)
		)
	)
	OR
	(
		(
			(
				DT343.C409 = DT345.C774
			)
			OR
			(
				(
					DT343.C406 <> DT345.C769
				)
				OR
				(
					DT345.C767 = DT343.C403
				)
			)
		)
		AND
		(
			(
				DT345.C766 <> DT344.C159
			)
			AND
			(
				DT345.C776 = DT345.C772
			)
		)
	)
GROUP BY
	DT345.C773
	, DT344.C162
	, DT345.C769
	, DT343.C402
ORDER BY
	AVG( DT345.C769 )
	, DT344.C162
	, DT345.C769
	, DT343.C402
	, MAX( DT344.C162 )
LIMIT 940;


SELECT
	DT346.C284
	, DT352.C797
FROM
	(
		T54 DT347
	INNER JOIN
		(
			(
				(
				SELECT
					DT348.C858
					, DT348.C852
				FROM
					(
						(
							T69 DT350
						INNER JOIN
							T70 DT348
						ON
							DT350.C835 = DT348.C839
						)
					INNER JOIN
						T98 DT349
					ON
						DT348.C855 < DT349.C1201
					)
				WHERE
					(
						(
							(
								(
									DT348.C852 = DT348.C844
								)
								OR
								(
									DT348.C857 = DT350.C829
								)
							)
							AND
							(
								(
									DT348.C841 = DT350.C838
								)
								AND
								(
									(
										DT350.C829 = DT350.C830
									)
									AND
									(
										DT348.C844 = DT348.C850
									)
								)
							)
						)
						OR
						(
							DT350.C833 < DT350.C828
						)
					)
					AND
					(
						DT348.C849 = DT348.C851
					)
				GROUP BY
					DT348.C852
					, DT350.C838
					, DT349.C1203
					, DT350.C824
					, DT348.C858
				ORDER BY
					DT348.C858
					, DT348.C852
				LIMIT 904
				)  DT351 ( C1549, C1550 ) 
			INNER JOIN
				T65 DT352
			ON
				DT351.C1550 > DT352.C784
			)
		INNER JOIN
			T25 DT346
		ON
			DT352.C788 > DT346.C295
		)
	ON
		DT347.C655 = DT352.C784
	)
WHERE
	(
		(
			(
				(
					DT352.C796 < DT346.C287
				)
				OR
				(
					DT352.C790 = DT346.C288
				)
			)
			OR
			(
				DT352.C793 = DT352.C790
			)
		)
		OR
		(
			DT352.C786 = DT352.C787
		)
	)
	OR
	(
		DT347.C654 > DT352.C786
	)
GROUP BY
	DT346.C284
	, DT352.C797
	, DT351.C1550
	, DT346.C289
ORDER BY
	DT346.C284
	, DT352.C797
LIMIT 508;


SELECT
	DT353.C611
FROM
	(
		(
		SELECT
			DT354.C915
			, DT360.C1554
			, COUNT( DT354.C915 )
		FROM
			(
				(
					(
					SELECT
						DT358.C1190
					FROM
						(
							T97 DT358
						INNER JOIN
							(
								T73 DT359
							INNER JOIN
								(
									T97 DT357
								INNER JOIN
									T49 DT356
								ON
									DT357.C1191 > DT356.C586
								)
							ON
								DT359.C900 > DT357.C1191
							)
						ON
							DT358.C1197 < DT357.C1195
						)
					WHERE
						(
							DT357.C1192 <> DT357.C1192
						)
						OR
						(
							(
								(
									DT358.C1199 < DT359.C895
								)
								AND
								(
									(
										DT358.C1196 < DT357.C1199
									)
									OR
									(
										DT359.C908 = DT359.C905
									)
								)
							)
							AND
							(
								DT356.C589 > DT359.C904
							)
						)
					GROUP BY
						DT356.C588
						, DT358.C1190
					ORDER BY
						DT358.C1190
					LIMIT 584
					) AS DT360 ( C1554 ) 
				INNER JOIN
					T5 DT361
				ON
					DT360.C1554 < DT361.C68
				)
			INNER JOIN
				(
					T0 DT355
				INNER JOIN
					T74 DT354
				ON
					DT355.C2 = DT354.C920
				)
			ON
				DT360.C1554 = DT354.C927
			)
		WHERE
			(
				(
					(
						DT354.C929 < DT361.C74
					)
					OR
					(
						DT361.C67 > DT355.C3
					)
				)
				OR
				(
					(
						(
							DT360.C1554 = DT355.C0
						)
						OR
						(
							DT354.C918 = DT354.C912
						)
					)
					AND
					(
						DT354.C922 = DT354.C928
					)
				)
			)
			OR
			(
				DT354.C922 > DT354.C929
			)
		GROUP BY
			DT354.C915
			, DT354.C920
			, DT360.C1554
		ORDER BY
			DT354.C915
			, DT360.C1554
			, COUNT( DT354.C915 )
		LIMIT 237
		) AS DT362 ( C1556, C1557, C1558 ) 
	INNER JOIN
		T51 DT353
	ON
		DT362.C1556 < DT353.C619
	)
WHERE
	(
		DT353.C612 = DT353.C613
	)
	AND
	(
		(
			(
				DT353.C617 = DT362.C1558
			)
			AND
			(
				DT353.C620 = DT362.C1557
			)
		)
		OR
		(
			(
				(
					DT353.C623 < DT362.C1557
				)
				AND
				(
					DT353.C610 = DT353.C614
				)
			)
			OR
			(
				DT353.C608 <> DT353.C610
			)
		)
	)
GROUP BY
	DT353.C611
	, DT353.C623
	, DT353.C612
	, DT353.C622
	, DT353.C615
ORDER BY
	DT353.C611
LIMIT 983;


SELECT
	DT363.C822
	, SUM( DT374.C1575 )
	, DT374.C1575
	, SUM( DT363.C822 )
FROM
	(
		(
		SELECT
			DT364.C961
			, MIN( DT365.C231 )
		FROM
			(
				T77 DT364
			INNER JOIN
				T19 DT365
			ON
				DT364.C949 < DT365.C230
			)
		WHERE
			(
				(
					(
						DT364.C952 <> DT364.C952
					)
					AND
					(
						(
							DT365.C230 <> DT365.C232
						)
						OR
						(
							DT364.C947 <> DT364.C948
						)
					)
				)
				AND
				(
					(
						DT364.C957 <> DT364.C960
					)
					OR
					(
						DT364.C958 = DT364.C956
					)
				)
			)
			AND
			(
				DT364.C957 = DT364.C950
			)
		GROUP BY
			DT365.C231
			, DT364.C961
			, DT364.C957
		ORDER BY
			DT364.C961
			, MIN( DT365.C231 )
		LIMIT 133
		) AS DT366 ( C1563, C1564 ) 
	INNER JOIN
		(
			T68 DT363
		INNER JOIN
			(
			SELECT
				SUM( DT368.C963 )
				, DT368.C963
				, DT367.C928
				, DT368.C964
				, DT367.C917
				, DT367.C919
			FROM
				(
					(
						T77 DT368
					INNER JOIN
						T74 DT367
					ON
						DT368.C963 <> DT367.C914
					)
				INNER JOIN
					(
					SELECT
						AVG( DT369.C691 )
						, DT369.C691
						, MAX( DT369.C688 )
						, DT369.C688
					FROM
						(
							T57 DT369
						INNER JOIN
							(
								(
									T39 DT370
								INNER JOIN
									T89 DT372
								ON
									DT370.C444 = DT372.C1076
								)
							INNER JOIN
								T1 DT371
							ON
								DT370.C446 = DT371.C11
							)
						ON
							DT369.C697 <> DT372.C1077
						)
					WHERE
						(
							(
								DT371.C10 > DT372.C1078
							)
							AND
							(
								(
									DT371.C5 = DT371.C13
								)
								AND
								(
									(
										DT371.C7 <> DT372.C1076
									)
									OR
									(
										DT371.C4 > DT370.C444
									)
								)
							)
						)
						AND
						(
							(
								DT372.C1078 = DT369.C696
							)
							OR
							(
								DT372.C1078 <> DT370.C445
							)
						)
					GROUP BY
						DT369.C688
						, DT369.C691
					ORDER BY
						AVG( DT369.C691 )
						, DT369.C691
						, MAX( DT369.C688 )
						, DT369.C688
					LIMIT 568
					)  DT373 ( C1567, C1568, C1569, C1570 ) 
				ON
					DT368.C949 = DT373.C1570
				)
			WHERE
				(
					(
						DT368.C957 = DT368.C962
					)
					AND
					(
						(
							(
								DT367.C928 < DT368.C954
							)
							OR
							(
								DT368.C963 > DT367.C914
							)
						)
						AND
						(
							(
								(
									DT367.C924 <> DT368.C958
								)
								AND
								(
									DT367.C917 = DT368.C954
								)
							)
							AND
							(
								DT367.C911 = DT368.C950
							)
						)
					)
				)
				AND
				(
					(
						DT367.C920 > DT368.C956
					)
					AND
					(
						DT368.C953 > DT368.C963
					)
				)
			GROUP BY
				DT368.C964
				, DT368.C963
				, DT367.C928
				, DT367.C919
				, DT367.C917
			ORDER BY
				SUM( DT368.C963 )
				, DT368.C963
				, DT367.C928
				, DT368.C964
				, DT367.C917
				, DT367.C919
			LIMIT 428
			) AS DT374 ( C1573, C1574, C1575, C1576, C1577, C1578 ) 
		ON
			DT363.C822 = DT374.C1577
		)
	ON
		DT366.C1564 > DT374.C1576
	)
WHERE
	(
		(
			(
				DT363.C822 < DT374.C1578
			)
			OR
			(
				DT374.C1577 = DT374.C1576
			)
		)
		OR
		(
			DT374.C1575 > DT374.C1575
		)
	)
	AND
	(
		(
			DT374.C1577 = DT374.C1575
		)
		OR
		(
			(
				(
					DT374.C1578 = DT374.C1575
				)
				AND
				(
					DT374.C1577 > DT363.C822
				)
			)
			OR
			(
				(
					DT374.C1576 < DT366.C1563
				)
				AND
				(
					DT374.C1573 < DT374.C1578
				)
			)
		)
	)
GROUP BY
	DT374.C1578
	, DT374.C1575
	, DT363.C822
	, DT374.C1574
ORDER BY
	DT363.C822
	, SUM( DT374.C1575 )
	, DT374.C1575
	, SUM( DT363.C822 )
LIMIT 103;


SELECT
	DT378.C1583
FROM
	(
		T16 DT375
	INNER JOIN
		(
		SELECT
			DT376.C612
			, DT376.C623
			, DT377.C464
			, DT377.C452
			, DT376.C622
			, DT377.C451
			, DT376.C610
			, DT377.C461
			, DT377.C472
			, DT377.C465
			, DT376.C619
		FROM
			(
				T41 DT377
			INNER JOIN
				T51 DT376
			ON
				DT377.C461 = DT376.C616
			)
		WHERE
			(
				DT376.C620 = DT376.C624
			)
			AND
			(
				(
					DT376.C615 < DT377.C460
				)
				OR
				(
					(
						(
							DT377.C455 <> DT377.C455
						)
						OR
						(
							DT376.C619 = DT377.C466
						)
					)
					AND
					(
						(
							DT377.C466 = DT377.C453
						)
						AND
						(
							DT376.C621 <> DT376.C619
						)
					)
				)
			)
		ORDER BY
			DT376.C612
			, DT376.C623
			, DT377.C464
			, DT377.C452
			, DT376.C622
			, DT377.C451
			, DT376.C610
			, DT377.C461
			, DT377.C472
			, DT377.C465
			, DT376.C619
		LIMIT 509
		)  DT378 ( C1582, C1583, C1584, C1585, C1586, C1587, C1588, C1589, C1590, C1591, C1592 ) 
	ON
		DT375.C203 = DT378.C1584
	)
WHERE
	(
		(
			(
				DT375.C203 = DT375.C203
			)
			OR
			(
				(
					(
						DT378.C1586 = DT378.C1589
					)
					AND
					(
						DT378.C1591 > DT375.C201
					)
				)
				OR
				(
					DT378.C1587 <> DT378.C1582
				)
			)
		)
		OR
		(
			DT375.C206 = DT378.C1582
		)
	)
	AND
	(
		DT378.C1586 = DT375.C200
	)
GROUP BY
	DT378.C1583
	, DT378.C1589
	, DT375.C206
ORDER BY
	DT378.C1583
LIMIT 599;


SELECT
	MIN( DT382.C1597 )
	, MAX( DT382.C1598 )
	, DT387.C1602
FROM
	(
		(
		SELECT
			MIN( DT384.C104 )
			, DT384.C101
			, DT384.C104
		FROM
			(
				(
					(
						T7 DT384
					INNER JOIN
						T2 DT383
					ON
						DT384.C94 <> DT383.C21
					)
				INNER JOIN
					T81 DT385
				ON
					DT384.C99 = DT385.C994
				)
			INNER JOIN
				T80 DT386
			ON
				DT384.C101 <> DT386.C986
			)
		WHERE
			(
				(
					DT385.C992 = DT384.C108
				)
				AND
				(
					(
						DT386.C986 = DT385.C993
					)
					AND
					(
						DT383.C28 = DT383.C23
					)
				)
			)
			OR
			(
				(
					DT384.C93 > DT383.C20
				)
				AND
				(
					DT383.C30 = DT383.C28
				)
			)
		GROUP BY
			DT384.C104
			, DT384.C101
		ORDER BY
			MIN( DT384.C104 )
			, DT384.C101
			, DT384.C104
		LIMIT 237
		) AS DT387 ( C1602, C1603, C1604 ) 
	INNER JOIN
		(
		SELECT
			DT379.C180
			, DT381.C943
			, MAX( DT379.C180 )
			, AVG( DT381.C943 )
		FROM
			(
				(
					T14 DT379
				INNER JOIN
					T76 DT381
				ON
					DT379.C180 > DT381.C946
				)
			INNER JOIN
				T22 DT380
			ON
				DT381.C943 < DT380.C263
			)
		WHERE
			(
				(
					DT380.C268 = DT381.C944
				)
				AND
				(
					DT379.C184 = DT380.C263
				)
			)
			AND
			(
				(
					DT380.C263 = DT381.C939
				)
				AND
				(
					(
						DT380.C260 <> DT379.C183
					)
					AND
					(
						(
							(
								DT379.C183 < DT381.C939
							)
							OR
							(
								DT381.C940 = DT379.C180
							)
						)
						OR
						(
							DT380.C260 <> DT380.C268
						)
					)
				)
			)
		GROUP BY
			DT381.C943
			, DT379.C180
		ORDER BY
			DT379.C180
			, DT381.C943
			, MAX( DT379.C180 )
			, AVG( DT381.C943 )
		LIMIT 273
		) AS DT382 ( C1597, C1598, C1599, C1600 ) 
	ON
		DT387.C1604 > DT382.C1599
	)
WHERE
	(
		(
			(
				DT382.C1599 <> DT387.C1603
			)
			OR
			(
				DT387.C1602 = DT382.C1599
			)
		)
		AND
		(
			DT382.C1598 <> DT382.C1600
		)
	)
	OR
	(
		(
			DT387.C1602 < DT382.C1597
		)
		AND
		(
			(
				DT387.C1604 = DT382.C1598
			)
			OR
			(
				DT382.C1597 > DT382.C1600
			)
		)
	)
GROUP BY
	DT382.C1597
	, DT382.C1598
	, DT387.C1602
	, DT387.C1603
ORDER BY
	MIN( DT382.C1597 )
	, MAX( DT382.C1598 )
	, DT387.C1602
LIMIT 316;


SELECT
	DT392.C1614
	, DT392.C1613
	, MAX( DT393.C677 )
FROM
	(
		T56 DT393
	INNER JOIN
		(
		SELECT
			DT388.C1043
			, SUM( DT388.C1030 )
			, MAX( DT388.C1043 )
			, DT388.C1038
			, DT388.C1030
			, DT391.C914
		FROM
			(
				(
					T0 DT390
				INNER JOIN
					T98 DT389
				ON
					DT390.C0 = DT389.C1202
				)
			INNER JOIN
				(
					T74 DT391
				INNER JOIN
					T85 DT388
				ON
					DT391.C921 = DT388.C1037
				)
			ON
				DT390.C3 = DT388.C1039
			)
		WHERE
			(
				(
					DT391.C922 < DT390.C1
				)
				AND
				(
					(
						DT388.C1037 = DT388.C1042
					)
					OR
					(
						(
							DT391.C927 = DT391.C915
						)
						AND
						(
							DT388.C1040 = DT390.C2
						)
					)
				)
			)
			OR
			(
				DT388.C1032 = DT388.C1046
			)
		GROUP BY
			DT388.C1043
			, DT391.C914
			, DT388.C1038
			, DT388.C1030
		ORDER BY
			DT388.C1043
			, SUM( DT388.C1030 )
			, MAX( DT388.C1043 )
			, DT388.C1038
			, DT388.C1030
			, DT391.C914
		LIMIT 414
		)  DT392 ( C1611, C1612, C1613, C1614, C1615, C1616 ) 
	ON
		DT393.C669 = DT392.C1613
	)
WHERE
	(
		(
			DT393.C676 <> DT393.C671
		)
		OR
		(
			DT392.C1615 > DT393.C672
		)
	)
	AND
	(
		(
			DT393.C677 > DT393.C672
		)
		OR
		(
			(
				DT393.C678 <> DT392.C1616
			)
			AND
			(
				DT393.C671 = DT393.C669
			)
		)
	)
GROUP BY
	DT392.C1614
	, DT392.C1613
	, DT393.C677
ORDER BY
	DT392.C1614
	, DT392.C1613
	, MAX( DT393.C677 )
LIMIT 759;


SELECT
	AVG( DT400.C1621 )
	, DT394.C1048
	, DT395.C328
	, MAX( DT395.C331 )
FROM
	(
		T28 DT395
	INNER JOIN
		(
			T86 DT394
		INNER JOIN
			(
				T76 DT396
			INNER JOIN
				(
				SELECT
					DT399.C900
					, AVG( DT397.C732 )
				FROM
					(
						T45 DT398
					INNER JOIN
						(
							T61 DT397
						INNER JOIN
							T73 DT399
						ON
							DT397.C738 = DT399.C902
						)
					ON
						DT398.C520 = DT399.C905
					)
				WHERE
					(
						(
							DT398.C523 = DT399.C900
						)
						AND
						(
							DT397.C729 = DT397.C727
						)
					)
					AND
					(
						(
							(
								DT399.C892 = DT397.C730
							)
							AND
							(
								(
									(
										DT399.C902 <> DT397.C735
									)
									OR
									(
										DT399.C906 <> DT398.C522
									)
								)
								AND
								(
									DT397.C725 = DT397.C737
								)
							)
						)
						AND
						(
							DT399.C907 = DT397.C735
						)
					)
				GROUP BY
					DT397.C732
					, DT399.C900
				ORDER BY
					DT399.C900
					, AVG( DT397.C732 )
				LIMIT 526
				) AS DT400 ( C1620, C1621 ) 
			ON
				DT396.C940 = DT400.C1620
			)
		ON
			DT394.C1049 > DT396.C938
		)
	ON
		DT395.C331 = DT394.C1054
	)
WHERE
	(
		(
			DT394.C1050 = DT395.C332
		)
		OR
		(
			DT394.C1047 > DT396.C942
		)
	)
	OR
	(
		(
			(
				DT400.C1621 = DT396.C938
			)
			AND
			(
				DT395.C333 > DT395.C332
			)
		)
		OR
		(
			DT394.C1055 = DT394.C1051
		)
	)
GROUP BY
	DT394.C1048
	, DT400.C1621
	, DT395.C331
	, DT395.C328
ORDER BY
	AVG( DT400.C1621 )
	, DT394.C1048
	, DT395.C328
	, MAX( DT395.C331 )
LIMIT 603;


SELECT
	DT408.C1049
	, DT409.C57
	, DT409.C54
	, DT408.C1048
	, COUNT( DT409.C54 )
FROM
	(
		(
			(
				(
				SELECT
					DT406.C826
					, COUNT( DT406.C836 )
					, DT406.C829
				FROM
					(
						T69 DT406
					INNER JOIN
						(
						SELECT
							DT402.C576
						FROM
							(
								(
									T26 DT404
								INNER JOIN
									T93 DT403
								ON
									DT404.C317 = DT403.C1138
								)
							INNER JOIN
								T48 DT402
							ON
								DT404.C308 = DT402.C582
							)
						WHERE
							(
								(
									(
										(
											DT402.C580 < DT404.C297
										)
										OR
										(
											DT402.C579 = DT403.C1137
										)
									)
									OR
									(
										DT404.C310 > DT404.C318
									)
								)
								AND
								(
									DT404.C314 = DT404.C312
								)
							)
							OR
							(
								DT404.C306 <> DT403.C1142
							)
						GROUP BY
							DT404.C309
							, DT402.C576
							, DT402.C570
							, DT403.C1144
							, DT402.C574
						ORDER BY
							DT402.C576
						LIMIT 396
						) AS DT405 ( C1626 ) 
					ON
						DT406.C827 = DT405.C1626
					)
				WHERE
					(
						(
							DT406.C833 < DT406.C837
						)
						AND
						(
							(
								(
									DT406.C837 = DT406.C837
								)
								OR
								(
									DT406.C830 = DT406.C836
								)
							)
							AND
							(
								DT406.C836 > DT406.C829
							)
						)
					)
					OR
					(
						(
							DT406.C836 < DT406.C828
						)
						AND
						(
							(
								(
									DT406.C835 = DT406.C837
								)
								OR
								(
									DT406.C831 = DT406.C828
								)
							)
							OR
							(
								DT406.C826 = DT406.C825
							)
						)
					)
				GROUP BY
					DT406.C836
					, DT406.C829
					, DT406.C826
				ORDER BY
					DT406.C826
					, COUNT( DT406.C836 )
					, DT406.C829
				LIMIT 683
				)  DT407 ( C1629, C1630, C1631 ) 
			INNER JOIN
				T86 DT408
			ON
				DT407.C1631 < DT408.C1049
			)
		INNER JOIN
			T38 DT401
		ON
			DT408.C1050 = DT401.C443
		)
	INNER JOIN
		T4 DT409
	ON
		DT401.C442 > DT409.C55
	)
WHERE
	(
		(
			(
				DT409.C65 = DT408.C1055
			)
			AND
			(
				(
					(
						(
							DT407.C1631 <> DT409.C54
						)
						AND
						(
							DT408.C1052 <> DT409.C59
						)
					)
					AND
					(
						(
							DT408.C1051 <> DT408.C1051
						)
						AND
						(
							DT408.C1051 = DT409.C61
						)
					)
				)
				OR
				(
					DT408.C1047 = DT408.C1048
				)
			)
		)
		OR
		(
			DT408.C1050 = DT401.C442
		)
	)
	AND
	(
		DT407.C1629 <> DT408.C1047
	)
GROUP BY
	DT409.C57
	, DT408.C1049
	, DT409.C54
	, DT408.C1048
ORDER BY
	DT408.C1049
	, DT409.C57
	, DT409.C54
	, DT408.C1048
	, COUNT( DT409.C54 )
LIMIT 341;


SELECT
	AVG( DT415.C862 )
	, SUM( DT415.C865 )
	, DT415.C862
FROM
	(
		(
			T81 DT414
		INNER JOIN
			(
				(
				SELECT
					MAX( DT410.C924 )
					, MAX( DT411.C1194 )
					, DT411.C1194
					, DT411.C1197
				FROM
					(
						T97 DT411
					INNER JOIN
						T74 DT410
					ON
						DT411.C1190 <> DT410.C925
					)
				WHERE
					(
						DT410.C911 = DT410.C911
					)
					OR
					(
						(
							(
								DT410.C917 = DT411.C1190
							)
							AND
							(
								DT411.C1194 = DT410.C926
							)
						)
						OR
						(
							(
								DT411.C1190 = DT410.C926
							)
							AND
							(
								DT410.C921 = DT411.C1200
							)
						)
					)
				GROUP BY
					DT411.C1197
					, DT410.C921
					, DT410.C924
					, DT411.C1194
				ORDER BY
					MAX( DT410.C924 )
					, MAX( DT411.C1194 )
					, DT411.C1194
					, DT411.C1197
				LIMIT 438
				)  DT412 ( C1637, C1638, C1639, C1640 ) 
			INNER JOIN
				T85 DT413
			ON
				DT412.C1640 = DT413.C1030
			)
		ON
			DT414.C991 > DT413.C1044
		)
	INNER JOIN
		T71 DT415
	ON
		DT413.C1041 = DT415.C865
	)
WHERE
	(
		DT413.C1042 = DT413.C1032
	)
	AND
	(
		(
			DT415.C864 = DT413.C1038
		)
		AND
		(
			(
				(
					(
						DT413.C1032 = DT415.C860
					)
					AND
					(
						DT413.C1046 > DT414.C990
					)
				)
				OR
				(
					(
						DT415.C860 > DT413.C1041
					)
					AND
					(
						DT414.C993 > DT414.C993
					)
				)
			)
			AND
			(
				DT413.C1037 = DT413.C1032
			)
		)
	)
GROUP BY
	DT413.C1046
	, DT415.C865
	, DT415.C862
ORDER BY
	AVG( DT415.C862 )
	, SUM( DT415.C865 )
	, DT415.C862
LIMIT 198;


SELECT
	DT429.C1179
FROM
	(
		(
			(
			SELECT
				SUM( DT417.C767 )
				, DT417.C780
			FROM
				(
					T38 DT416
				INNER JOIN
					T64 DT417
				ON
					DT416.C441 = DT417.C775
				)
			WHERE
				(
					(
						DT417.C777 = DT417.C777
					)
					OR
					(
						(
							DT417.C773 < DT417.C782
						)
						AND
						(
							DT417.C768 = DT416.C441
						)
					)
				)
				AND
				(
					(
						(
							DT417.C777 < DT416.C441
						)
						OR
						(
							DT417.C771 = DT417.C767
						)
					)
					OR
					(
						DT417.C773 = DT417.C768
					)
				)
			GROUP BY
				DT417.C780
				, DT417.C767
				, DT417.C779
				, DT417.C776
			ORDER BY
				SUM( DT417.C767 )
				, DT417.C780
			LIMIT 641
			)  DT418 ( C1645, C1646 ) 
		INNER JOIN
			T96 DT429
		ON
			DT418.C1646 < DT429.C1184
		)
	INNER JOIN
		(
		SELECT
			MAX( DT427.C52 )
			, DT419.C871
			, MIN( DT427.C49 )
		FROM
			(
				T3 DT427
			INNER JOIN
				(
					T72 DT419
				LEFT OUTER JOIN
					(
					SELECT
						DT425.C235
						, COUNT( DT425.C235 )
						, MAX( DT420.C1192 )
						, DT420.C1192
					FROM
						(
							T2 DT421
						INNER JOIN
							(
								(
									T20 DT425
								INNER JOIN
									(
									SELECT
										DT422.C203
										, AVG( DT422.C203 )
									FROM
										(
											T91 DT423
										INNER JOIN
											T16 DT422
										ON
											DT423.C1102 = DT422.C202
										)
									WHERE
										(
											(
												DT423.C1107 = DT423.C1098
											)
											OR
											(
												(
													DT423.C1111 = DT422.C206
												)
												AND
												(
													DT423.C1113 = DT423.C1093
												)
											)
										)
										AND
										(
											(
												DT423.C1099 <> DT423.C1096
											)
											OR
											(
												DT423.C1094 <> DT423.C1112
											)
										)
									GROUP BY
										DT423.C1102
										, DT422.C203
									ORDER BY
										DT422.C203
										, AVG( DT422.C203 )
									LIMIT 123
									)  DT424 ( C1649, C1650 ) 
								ON
									DT425.C235 <> DT424.C1649
								)
							INNER JOIN
								T97 DT420
							ON
								DT425.C245 = DT420.C1200
							)
						ON
							DT421.C16 > DT420.C1195
						)
					WHERE
						(
							(
								(
									(
										(
											DT425.C244 > DT425.C243
										)
										AND
										(
											DT420.C1195 <> DT420.C1194
										)
									)
									OR
									(
										DT421.C19 <> DT421.C24
									)
								)
								OR
								(
									DT420.C1195 > DT421.C30
								)
							)
							AND
							(
								(
									DT420.C1196 <> DT420.C1199
								)
								OR
								(
									DT420.C1197 > DT425.C239
								)
							)
						)
						AND
						(
							(
								DT420.C1200 < DT425.C241
							)
							AND
							(
								DT425.C238 = DT420.C1196
							)
						)
					GROUP BY
						DT425.C235
						, DT420.C1192
					ORDER BY
						DT425.C235
						, COUNT( DT425.C235 )
						, MAX( DT420.C1192 )
						, DT420.C1192
					LIMIT 927
					) AS DT426 ( C1653, C1654, C1655, C1656 ) 
				ON
					DT419.C873 < DT426.C1654
				)
			ON
				DT427.C45 > DT419.C871
			)
		WHERE
			(
				(
					DT427.C47 = DT427.C41
				)
				AND
				(
					DT419.C880 = DT427.C34
				)
			)
			OR
			(
				(
					DT419.C886 = DT419.C876
				)
				OR
				(
					(
						DT419.C873 = DT419.C886
					)
					OR
					(
						DT419.C888 = DT427.C46
					)
				)
			)
		GROUP BY
			DT419.C871
			, DT427.C52
			, DT419.C867
			, DT427.C49
		ORDER BY
			MAX( DT427.C52 )
			, DT419.C871
			, MIN( DT427.C49 )
		LIMIT 922
		)  DT428 ( C1660, C1661, C1662 ) 
	ON
		DT429.C1185 = DT428.C1662
	)
WHERE
	(
		(
			DT429.C1184 <> DT429.C1182
		)
		AND
		(
			DT429.C1186 = DT429.C1178
		)
	)
	AND
	(
		(
			DT429.C1186 = DT429.C1182
		)
		AND
		(
			(
				DT429.C1186 = DT428.C1661
			)
			OR
			(
				DT429.C1181 = DT429.C1179
			)
		)
	)
GROUP BY
	DT429.C1189
	, DT429.C1176
	, DT429.C1187
	, DT429.C1179
	, DT428.C1661
ORDER BY
	DT429.C1179
LIMIT 856;


SELECT
	DT430.C140
FROM
	(
		T70 DT431
	INNER JOIN
		T10 DT430
	ON
		DT431.C856 <> DT430.C143
	)
WHERE
	(
		(
			DT431.C843 = DT430.C141
		)
		OR
		(
			(
				(
					DT431.C852 = DT431.C846
				)
				AND
				(
					DT430.C150 = DT431.C856
				)
			)
			OR
			(
				DT431.C858 < DT430.C144
			)
		)
	)
	AND
	(
		(
			DT430.C138 = DT430.C149
		)
		OR
		(
			(
				DT430.C147 > DT431.C839
			)
			OR
			(
				DT430.C148 < DT431.C844
			)
		)
	)
GROUP BY
	DT430.C140
	, DT430.C148
ORDER BY
	DT430.C140
LIMIT 203;


SELECT
	DT445.C1689
	, COUNT( DT445.C1689 )
FROM
	(
		T80 DT446
	INNER JOIN
		(
		SELECT
			COUNT( DT436.C297 )
			, DT444.C1685
		FROM
			(
				T26 DT436
			INNER JOIN
				(
					(
					SELECT
						DT434.C660
						, DT434.C666
						, MAX( DT434.C666 )
						, DT433.C73
						, AVG( DT434.C661 )
						, DT434.C661
					FROM
						(
							T55 DT434
						INNER JOIN
							(
								T60 DT432
							INNER JOIN
								T5 DT433
							ON
								DT432.C721 = DT433.C67
							)
						ON
							DT434.C665 <> DT433.C70
						)
					WHERE
						(
							DT434.C667 <> DT432.C717
						)
						OR
						(
							(
								(
									(
										DT433.C68 <> DT433.C70
									)
									AND
									(
										DT434.C662 < DT434.C664
									)
								)
								AND
								(
									(
										DT432.C722 = DT434.C667
									)
									OR
									(
										DT434.C667 = DT434.C660
									)
								)
							)
							OR
							(
								(
									(
										DT432.C720 = DT433.C74
									)
									OR
									(
										DT433.C68 = DT434.C659
									)
								)
								OR
								(
									DT432.C720 = DT432.C720
								)
							)
						)
					GROUP BY
						DT434.C666
						, DT434.C661
						, DT434.C660
						, DT433.C73
					ORDER BY
						DT434.C660
						, DT434.C666
						, MAX( DT434.C666 )
						, DT433.C73
						, AVG( DT434.C661 )
						, DT434.C661
					LIMIT 324
					)  DT435 ( C1669, C1670, C1671, C1672, C1673, C1674 ) 
				INNER JOIN
					(
					SELECT
						DT437.C637
						, COUNT( DT442.C841 )
						, COUNT( DT437.C637 )
						, COUNT( DT442.C849 )
						, DT437.C647
						, DT442.C841
						, DT442.C849
					FROM
						(
							(
								(
									T1 DT443
								INNER JOIN
									(
									SELECT
										DT440.C859
									FROM
										(
											(
												T22 DT439
											INNER JOIN
												T13 DT438
											ON
												DT439.C261 <> DT438.C177
											)
										INNER JOIN
											T70 DT440
										ON
											DT438.C170 = DT440.C840
										)
									WHERE
										(
											(
												DT438.C171 > DT440.C842
											)
											OR
											(
												DT438.C178 = DT440.C853
											)
										)
										AND
										(
											(
												(
													DT438.C177 < DT439.C267
												)
												OR
												(
													DT438.C169 = DT440.C846
												)
											)
											AND
											(
												(
													DT439.C267 < DT438.C173
												)
												AND
												(
													(
														(
															DT440.C859 <> DT440.C845
														)
														AND
														(
															DT438.C165 = DT440.C848
														)
													)
													AND
													(
														DT438.C169 = DT439.C263
													)
												)
											)
										)
									GROUP BY
										DT439.C269
										, DT440.C859
										, DT440.C844
										, DT440.C853
									ORDER BY
										DT440.C859
									LIMIT 433
									)  DT441 ( C1676 ) 
								ON
									DT443.C11 > DT441.C1676
								)
							INNER JOIN
								T70 DT442
							ON
								DT443.C10 > DT442.C857
							)
						INNER JOIN
							T53 DT437
						ON
							DT442.C846 = DT437.C637
						)
					WHERE
						(
							(
								DT437.C646 < DT437.C641
							)
							AND
							(
								(
									(
										DT442.C854 = DT442.C855
									)
									AND
									(
										DT442.C840 = DT437.C648
									)
								)
								OR
								(
									DT443.C7 = DT442.C849
								)
							)
						)
						OR
						(
							DT442.C846 > DT442.C846
						)
					GROUP BY
						DT437.C647
						, DT442.C841
						, DT442.C849
						, DT443.C12
						, DT437.C637
					ORDER BY
						DT437.C637
						, COUNT( DT442.C841 )
						, COUNT( DT437.C637 )
						, COUNT( DT442.C849 )
						, DT437.C647
						, DT442.C841
						, DT442.C849
					LIMIT 187
					) AS DT444 ( C1680, C1681, C1682, C1683, C1684, C1685, C1686 ) 
				ON
					DT435.C1673 <> DT444.C1680
				)
			ON
				DT436.C304 < DT435.C1673
			)
		WHERE
			(
				(
					DT436.C318 = DT444.C1684
				)
				AND
				(
					DT435.C1674 = DT435.C1673
				)
			)
			AND
			(
				(
					(
						(
							DT436.C314 > DT436.C301
						)
						OR
						(
							DT436.C312 < DT436.C305
						)
					)
					AND
					(
						DT436.C316 = DT435.C1673
					)
				)
				AND
				(
					(
						(
							DT436.C317 > DT435.C1670
						)
						AND
						(
							DT436.C300 = DT435.C1672
						)
					)
					AND
					(
						DT444.C1686 = DT436.C309
					)
				)
			)
		GROUP BY
			DT444.C1685
			, DT436.C297
		ORDER BY
			COUNT( DT436.C297 )
			, DT444.C1685
		LIMIT 481
		)  DT445 ( C1688, C1689 ) 
	ON
		DT446.C987 > DT445.C1688
	)
WHERE
	(
		(
			(
				(
					(
						DT446.C989 = DT446.C987
					)
					AND
					(
						DT446.C988 = DT445.C1689
					)
				)
				OR
				(
					DT445.C1688 > DT446.C988
				)
			)
			AND
			(
				(
					DT446.C986 = DT446.C989
				)
				AND
				(
					DT446.C987 = DT445.C1688
				)
			)
		)
		OR
		(
			(
				DT446.C988 <> DT446.C986
			)
			OR
			(
				DT446.C986 = DT446.C989
			)
		)
	)
	OR
	(
		DT446.C989 <> DT446.C986
	)
GROUP BY
	DT446.C986
	, DT446.C989
	, DT445.C1689
ORDER BY
	DT445.C1689
	, COUNT( DT445.C1689 )
LIMIT 414;


SELECT
	DT448.C1087
	, SUM( DT448.C1082 )
FROM
	(
		T39 DT449
	LEFT OUTER JOIN
		(
			T90 DT448
		INNER JOIN
			T9 DT447
		ON
			DT448.C1082 <> DT447.C127
		)
	ON
		DT449.C446 > DT448.C1092
	)
WHERE
	(
		(
			DT448.C1088 = DT448.C1086
		)
		AND
		(
			(
				(
					DT449.C446 = DT448.C1092
				)
				AND
				(
					DT447.C133 > DT448.C1079
				)
			)
			OR
			(
				(
					DT448.C1091 = DT449.C446
				)
				OR
				(
					(
						DT447.C130 < DT448.C1085
					)
					OR
					(
						DT448.C1084 = DT448.C1091
					)
				)
			)
		)
	)
	AND
	(
		(
			DT448.C1086 = DT447.C132
		)
		AND
		(
			DT447.C130 = DT447.C132
		)
	)
GROUP BY
	DT448.C1087
	, DT448.C1082
ORDER BY
	DT448.C1087
	, SUM( DT448.C1082 )
LIMIT 501;


SELECT
	MIN( DT453.C429 )
	, DT453.C429
FROM
	(
		(
			T36 DT453
		INNER JOIN
			T24 DT450
		ON
			DT453.C424 = DT450.C281
		)
	INNER JOIN
		(
			T36 DT451
		INNER JOIN
			T70 DT452
		ON
			DT451.C426 > DT452.C858
		)
	ON
		DT450.C282 = DT452.C859
	)
WHERE
	(
		(
			(
				(
					DT452.C858 < DT453.C424
				)
				OR
				(
					DT452.C852 > DT453.C426
				)
			)
			AND
			(
				(
					DT450.C279 = DT451.C423
				)
				AND
				(
					DT453.C425 = DT452.C853
				)
			)
		)
		AND
		(
			DT453.C419 = DT452.C840
		)
	)
	AND
	(
		DT453.C419 <> DT452.C859
	)
GROUP BY
	DT450.C281
	, DT453.C429
	, DT451.C434
	, DT453.C421
ORDER BY
	MIN( DT453.C429 )
	, DT453.C429
LIMIT 731;


SELECT
	DT454.C714
	, MIN( DT454.C715 )
	, DT461.C1704
FROM
	(
		T59 DT454
	INNER JOIN
		(
		SELECT
			DT457.C1700
			, DT459.C1028
		FROM
			(
				(
					(
					SELECT
						DT456.C363
						, DT455.C1076
					FROM
						(
							T89 DT455
						LEFT OUTER JOIN
							T31 DT456
						ON
							DT455.C1078 < DT456.C344
						)
					WHERE
						(
							(
								DT456.C354 = DT456.C352
							)
							AND
							(
								(
									DT456.C351 = DT456.C359
								)
								AND
								(
									(
										DT455.C1078 > DT456.C358
									)
									OR
									(
										DT456.C358 < DT456.C344
									)
								)
							)
						)
						AND
						(
							(
								DT456.C355 <> DT456.C347
							)
							OR
							(
								DT455.C1078 > DT456.C362
							)
						)
					GROUP BY
						DT455.C1076
						, DT456.C363
						, DT456.C358
						, DT456.C346
						, DT456.C344
					ORDER BY
						DT456.C363
						, DT455.C1076
					LIMIT 280
					) AS DT457 ( C1699, C1700 ) 
				INNER JOIN
					T4 DT458
				ON
					DT457.C1699 = DT458.C58
				)
			INNER JOIN
				(
					T84 DT459
				INNER JOIN
					T79 DT460
				ON
					DT459.C1011 > DT460.C979
				)
			ON
				DT458.C65 = DT459.C1015
			)
		WHERE
			(
				(
					(
						DT459.C1012 = DT460.C985
					)
					AND
					(
						DT460.C979 <> DT458.C59
					)
				)
				AND
				(
					(
						DT458.C65 = DT459.C1019
					)
					OR
					(
						(
							DT459.C1026 <> DT458.C61
						)
						OR
						(
							DT458.C55 = DT459.C1013
						)
					)
				)
			)
			OR
			(
				(
					DT459.C1008 <> DT459.C1019
				)
				OR
				(
					DT458.C61 < DT459.C1016
				)
			)
		GROUP BY
			DT459.C1028
			, DT459.C1027
			, DT458.C65
			, DT459.C1009
			, DT457.C1700
		ORDER BY
			DT457.C1700
			, DT459.C1028
		LIMIT 755
		) AS DT461 ( C1703, C1704 ) 
	ON
		DT454.C714 = DT461.C1703
	)
WHERE
	(
		(
			(
				(
					DT454.C714 > DT454.C714
				)
				AND
				(
					(
						DT454.C713 = DT454.C715
					)
					OR
					(
						DT454.C716 = DT454.C716
					)
				)
			)
			AND
			(
				DT461.C1704 = DT454.C715
			)
		)
		OR
		(
			DT461.C1703 = DT461.C1703
		)
	)
	OR
	(
		(
			DT454.C715 = DT454.C713
		)
		AND
		(
			DT454.C713 = DT454.C714
		)
	)
GROUP BY
	DT454.C714
	, DT454.C715
	, DT461.C1704
	, DT454.C713
	, DT454.C716
ORDER BY
	DT454.C714
	, MIN( DT454.C715 )
	, DT461.C1704
LIMIT 831;


SELECT
	DT463.C1108
	, SUM( DT463.C1100 )
	, DT463.C1100
	, DT463.C1099
	, DT463.C1111
	, MAX( DT463.C1108 )
FROM
	(
		(
			(
			SELECT
				DT465.C183
				, AVG( DT465.C183 )
				, DT464.C2
				, SUM( DT464.C3 )
				, MIN( DT464.C2 )
				, DT464.C3
			FROM
				(
					T14 DT465
				INNER JOIN
					(
						T0 DT464
					INNER JOIN
						T17 DT466
					ON
						DT464.C3 = DT466.C207
					)
				ON
					DT465.C183 > DT466.C207
				)
			WHERE
				(
					DT466.C209 <> DT464.C3
				)
				AND
				(
					(
						(
							(
								DT465.C183 <> DT466.C209
							)
							OR
							(
								DT466.C216 = DT464.C1
							)
						)
						OR
						(
							DT464.C2 = DT464.C3
						)
					)
					AND
					(
						DT466.C211 = DT466.C211
					)
				)
			GROUP BY
				DT465.C183
				, DT464.C3
				, DT464.C2
			ORDER BY
				DT465.C183
				, AVG( DT465.C183 )
				, DT464.C2
				, SUM( DT464.C3 )
				, MIN( DT464.C2 )
				, DT464.C3
			LIMIT 292
			)  DT467 ( C1710, C1711, C1712, C1713, C1714, C1715 ) 
		INNER JOIN
			T39 DT462
		ON
			DT467.C1711 <> DT462.C445
		)
	RIGHT OUTER JOIN
		T91 DT463
	ON
		DT467.C1710 < DT463.C1112
	)
WHERE
	(
		(
			(
				DT467.C1714 = DT463.C1114
			)
			OR
			(
				DT463.C1107 <> DT463.C1106
			)
		)
		OR
		(
			(
				DT467.C1710 <> DT463.C1107
			)
			OR
			(
				(
					DT467.C1712 < DT463.C1109
				)
				AND
				(
					DT462.C444 = DT463.C1105
				)
			)
		)
	)
	AND
	(
		DT463.C1102 <> DT467.C1712
	)
GROUP BY
	DT463.C1108
	, DT463.C1099
	, DT463.C1111
	, DT463.C1100
ORDER BY
	DT463.C1108
	, SUM( DT463.C1100 )
	, DT463.C1100
	, DT463.C1099
	, DT463.C1111
	, MAX( DT463.C1108 )
LIMIT 252;


SELECT
	MIN( DT468.C11 )
	, AVG( DT468.C14 )
FROM
	(
		T1 DT468
	INNER JOIN
		T27 DT469
	ON
		DT468.C7 = DT469.C321
	)
WHERE
	(
		(
			(
				DT468.C14 = DT469.C321
			)
			OR
			(
				DT469.C321 < DT468.C14
			)
		)
		AND
		(
			(
				(
					DT468.C8 = DT469.C324
				)
				AND
				(
					DT469.C321 > DT468.C5
				)
			)
			AND
			(
				DT468.C13 = DT468.C8
			)
		)
	)
	AND
	(
		(
			DT468.C14 = DT468.C8
		)
		OR
		(
			DT469.C321 < DT468.C14
		)
	)
GROUP BY
	DT468.C10
	, DT468.C11
	, DT468.C14
ORDER BY
	MIN( DT468.C11 )
	, AVG( DT468.C14 )
LIMIT 889;


SELECT
	MIN( DT482.C1734 )
	, DT482.C1734
	, to_char(AVG( DT482.C1742 ),'9999999.9999999')
	, DT478.C1729
	, DT482.C1742
	, SUM( DT478.C1729 )
FROM
	(
		(
		SELECT
			DT484.C330
			, MAX( DT484.C330 )
			, DT483.C1076
		FROM
			(
				T89 DT483
			INNER JOIN
				T28 DT484
			ON
				DT483.C1077 <> DT484.C330
			)
		WHERE
			(
				(
					DT484.C329 = DT484.C332
				)
				AND
				(
					DT484.C330 = DT484.C332
				)
			)
			OR
			(
				(
					DT483.C1076 > DT484.C332
				)
				OR
				(
					(
						(
							(
								DT484.C329 = DT484.C332
							)
							AND
							(
								DT483.C1076 < DT484.C330
							)
						)
						AND
						(
							DT483.C1078 = DT483.C1077
						)
					)
					AND
					(
						(
							DT484.C331 = DT483.C1077
						)
						OR
						(
							DT483.C1076 > DT484.C328
						)
					)
				)
			)
		GROUP BY
			DT484.C330
			, DT483.C1076
		ORDER BY
			DT484.C330
			, MAX( DT484.C330 )
			, DT483.C1076
		LIMIT 705
		)  DT485 ( C1745, C1746, C1747 ) 
	INNER JOIN
		(
			(
			SELECT
				DT480.C768
				, DT480.C782
				, DT479.C140
				, DT480.C776
				, DT480.C766
				, DT479.C148
				, DT481.C1203
				, DT480.C772
				, DT480.C780
				, DT481.C1201
				, DT479.C149
				, DT480.C764
				, DT479.C144
			FROM
				(
					T98 DT481
				INNER JOIN
					(
						T64 DT480
					INNER JOIN
						T10 DT479
					ON
						DT480.C771 = DT479.C142
					)
				ON
					DT481.C1203 > DT479.C140
				)
			WHERE
				(
					(
						DT480.C768 = DT481.C1201
					)
					OR
					(
						DT480.C771 > DT480.C764
					)
				)
				OR
				(
					(
						(
							DT480.C782 = DT479.C138
						)
						OR
						(
							DT480.C767 = DT480.C764
						)
					)
					AND
					(
						DT480.C765 < DT481.C1202
					)
				)
			ORDER BY
				DT480.C768
				, DT480.C782
				, DT479.C140
				, DT480.C776
				, DT480.C766
				, DT479.C148
				, DT481.C1203
				, DT480.C772
				, DT480.C780
				, DT481.C1201
				, DT479.C149
				, DT480.C764
				, DT479.C144
			LIMIT 900
			) AS DT482 ( C1731, C1732, C1733, C1734, C1735, C1736, C1737, C1738, C1739, C1740, C1741, C1742, C1743 ) 
		INNER JOIN
			(
			SELECT
				MIN( DT470.C572 )
				, DT470.C569
			FROM
				(
					(
					SELECT
						MAX( DT476.C1087 )
					FROM
						(
							(
							SELECT
								DT473.C1059
							FROM
								(
									(
										T87 DT473
									INNER JOIN
										T11 DT474
									ON
										DT473.C1059 > DT474.C154
									)
								INNER JOIN
									T22 DT472
								ON
									DT473.C1061 = DT472.C266
								)
							WHERE
								(
									DT474.C156 < DT473.C1063
								)
								OR
								(
									(
										(
											DT473.C1059 < DT472.C260
										)
										OR
										(
											DT472.C265 > DT472.C265
										)
									)
									AND
									(
										(
											DT472.C264 = DT472.C262
										)
										AND
										(
											(
												DT474.C155 <> DT473.C1063
											)
											OR
											(
												DT474.C153 = DT472.C260
											)
										)
									)
								)
							GROUP BY
								DT473.C1059
								, DT474.C155
							ORDER BY
								DT473.C1059
							LIMIT 961
							)  DT475 ( C1723 ) 
						INNER JOIN
							(
								T93 DT471
							INNER JOIN
								T90 DT476
							ON
								DT471.C1144 > DT476.C1089
							)
						ON
							DT475.C1723 <> DT476.C1089
						)
					WHERE
						(
							(
								DT476.C1081 = DT476.C1079
							)
							OR
							(
								DT471.C1144 <> DT476.C1089
							)
						)
						OR
						(
							(
								DT476.C1091 = DT471.C1138
							)
							OR
							(
								(
									DT476.C1092 = DT476.C1091
								)
								OR
								(
									DT476.C1092 <> DT476.C1087
								)
							)
						)
					GROUP BY
						DT475.C1723
						, DT476.C1083
						, DT476.C1087
						, DT471.C1141
						, DT476.C1090
					ORDER BY
						MAX( DT476.C1087 )
					LIMIT 755
					) AS DT477 ( C1727 ) 
				INNER JOIN
					T48 DT470
				ON
					DT477.C1727 < DT470.C568
				)
			WHERE
				(
					(
						(
							DT470.C578 = DT477.C1727
						)
						AND
						(
							(
								(
									DT470.C580 > DT477.C1727
								)
								OR
								(
									DT470.C569 = DT470.C581
								)
							)
							OR
							(
								DT470.C571 = DT470.C575
							)
						)
					)
					AND
					(
						(
							DT470.C585 < DT470.C576
						)
						OR
						(
							(
								DT470.C575 = DT470.C583
							)
							OR
							(
								DT470.C580 > DT470.C581
							)
						)
					)
				)
				OR
				(
					DT470.C579 = DT470.C585
				)
			GROUP BY
				DT470.C572
				, DT470.C569
			ORDER BY
				MIN( DT470.C572 )
				, DT470.C569
			LIMIT 643
			) AS DT478 ( C1729, C1730 ) 
		ON
			DT482.C1743 = DT478.C1730
		)
	ON
		DT485.C1747 = DT482.C1743
	)
WHERE
	(
		(
			DT482.C1737 < DT482.C1736
		)
		OR
		(
			DT482.C1743 <> DT482.C1738
		)
	)
	OR
	(
		(
			(
				(
					DT482.C1740 = DT482.C1731
				)
				OR
				(
					DT485.C1747 = DT482.C1741
				)
			)
			AND
			(
				DT485.C1746 = DT482.C1738
			)
		)
		AND
		(
			DT482.C1734 = DT482.C1735
		)
	)
GROUP BY
	DT478.C1729
	, DT482.C1734
	, DT482.C1742
	, DT482.C1743
ORDER BY
	MIN( DT482.C1734 )
	, DT482.C1734
	, AVG( DT482.C1742 )
	, DT478.C1729
	, DT482.C1742
	, SUM( DT478.C1729 )
LIMIT 442;


SELECT
	to_char(AVG( DT486.C1065 ),'9999999.9999999')
	, DT486.C1065
	, DT493.C1753
FROM
	(
		(
			(
			SELECT
				MIN( DT492.C981 )
				, DT492.C985
				, DT490.C268
				, DT492.C981
				, DT489.C152
				, COUNT( DT492.C985 )
			FROM
				(
					(
						T79 DT492
					INNER JOIN
						(
							T19 DT491
						INNER JOIN
							T22 DT490
						ON
							DT491.C230 > DT490.C269
						)
					ON
						DT492.C980 < DT490.C260
					)
				INNER JOIN
					T11 DT489
				ON
					DT490.C266 > DT489.C155
				)
			WHERE
				(
					(
						(
							DT490.C268 > DT490.C266
						)
						AND
						(
							DT492.C985 = DT492.C985
						)
					)
					AND
					(
						DT490.C260 < DT490.C263
					)
				)
				OR
				(
					(
						(
							DT492.C982 > DT489.C154
						)
						AND
						(
							DT490.C266 = DT490.C265
						)
					)
					OR
					(
						(
							DT491.C231 = DT491.C231
						)
						AND
						(
							DT490.C264 = DT492.C984
						)
					)
				)
			GROUP BY
				DT489.C152
				, DT492.C985
				, DT492.C981
				, DT489.C155
				, DT490.C268
			ORDER BY
				MIN( DT492.C981 )
				, DT492.C985
				, DT490.C268
				, DT492.C981
				, DT489.C152
				, COUNT( DT492.C985 )
			LIMIT 893
			)  DT493 ( C1753, C1754, C1755, C1756, C1757, C1758 ) 
		INNER JOIN
			T10 DT487
		ON
			DT493.C1755 <> DT487.C144
		)
	INNER JOIN
		(
			T88 DT486
		INNER JOIN
			T28 DT488
		ON
			DT486.C1070 < DT488.C328
		)
	ON
		DT487.C142 < DT486.C1064
	)
WHERE
	(
		(
			DT493.C1758 = DT493.C1754
		)
		OR
		(
			(
				DT487.C151 > DT487.C150
			)
			OR
			(
				(
					(
						DT487.C150 = DT493.C1753
					)
					OR
					(
						DT487.C141 <> DT487.C140
					)
				)
				AND
				(
					DT486.C1068 > DT486.C1066
				)
			)
		)
	)
	OR
	(
		(
			(
				DT486.C1066 > DT486.C1066
			)
			OR
			(
				DT486.C1064 < DT486.C1075
			)
		)
		OR
		(
			DT488.C330 = DT486.C1075
		)
	)
GROUP BY
	DT487.C143
	, DT487.C149
	, DT486.C1065
	, DT493.C1753
ORDER BY
	AVG( DT486.C1065 )
	, DT486.C1065
	, DT493.C1753
LIMIT 903;


SELECT
	DT499.C232
FROM
	(
		T19 DT499
	INNER JOIN
		(
		SELECT
			DT494.C265
		FROM
			(
				(
					T56 DT495
				INNER JOIN
					T22 DT494
				ON
					DT495.C680 = DT494.C268
				)
			INNER JOIN
				(
					T47 DT496
				INNER JOIN
					T45 DT497
				ON
					DT496.C551 = DT497.C515
				)
			ON
				DT494.C259 < DT496.C557
			)
		WHERE
			(
				(
					(
						(
							DT496.C555 > DT497.C524
						)
						OR
						(
							DT496.C564 = DT497.C517
						)
					)
					OR
					(
						DT495.C679 > DT494.C268
					)
				)
				OR
				(
					DT494.C267 = DT496.C560
				)
			)
			AND
			(
				(
					(
						DT497.C514 = DT497.C520
					)
					OR
					(
						(
							DT494.C261 < DT495.C671
						)
						AND
						(
							DT496.C555 > DT495.C671
						)
					)
				)
				OR
				(
					DT494.C267 <> DT496.C553
				)
			)
		GROUP BY
			DT495.C672
			, DT494.C269
			, DT497.C514
			, DT494.C265
		ORDER BY
			DT494.C265
		LIMIT 942
		)  DT498 ( C1763 ) 
	ON
		DT499.C231 = DT498.C1763
	)
WHERE
	(
		(
			DT498.C1763 = DT499.C231
		)
		OR
		(
			DT499.C231 = DT499.C232
		)
	)
	OR
	(
		(
			(
				(
					(
						DT498.C1763 <> DT499.C230
					)
					AND
					(
						DT498.C1763 = DT498.C1763
					)
				)
				OR
				(
					DT498.C1763 = DT499.C231
				)
			)
			AND
			(
				DT499.C230 = DT499.C230
			)
		)
		AND
		(
			DT499.C232 < DT499.C232
		)
	)
GROUP BY
	DT499.C230
	, DT499.C232
ORDER BY
	DT499.C232
LIMIT 617;


SELECT
	DT501.C262
	, to_char(AVG( DT501.C269 ),'9999999.9999999')
	, MAX( DT502.C979 )
	, DT501.C269
FROM
	(
		(
			(
				(
				SELECT
					DT505.C993
					, DT504.C621
					, DT504.C608
					, DT504.C614
					, MIN( DT504.C614 )
					, DT503.C340
				FROM
					(
						(
							T51 DT504
						INNER JOIN
							T81 DT505
						ON
							DT504.C617 < DT505.C993
						)
					INNER JOIN
						T29 DT503
					ON
						DT504.C615 = DT503.C334
					)
				WHERE
					(
						(
							DT503.C337 = DT503.C337
						)
						OR
						(
							(
								DT503.C338 > DT504.C623
							)
							AND
							(
								DT504.C623 = DT503.C340
							)
						)
					)
					OR
					(
						(
							DT504.C613 <> DT504.C622
						)
						OR
						(
							(
								DT504.C620 = DT504.C608
							)
							OR
							(
								DT504.C616 = DT504.C624
							)
						)
					)
				GROUP BY
					DT503.C340
					, DT505.C993
					, DT504.C608
					, DT504.C621
					, DT504.C614
				ORDER BY
					DT505.C993
					, DT504.C621
					, DT504.C608
					, DT504.C614
					, MIN( DT504.C614 )
					, DT503.C340
				LIMIT 345
				)  DT506 ( C1767, C1768, C1769, C1770, C1771, C1772 ) 
			INNER JOIN
				T22 DT501
			ON
				DT506.C1768 = DT501.C265
			)
		INNER JOIN
			T79 DT502
		ON
			DT501.C261 < DT502.C983
		)
	INNER JOIN
		T90 DT500
	ON
		DT506.C1771 = DT500.C1090
	)
WHERE
	(
		(
			DT500.C1088 = DT500.C1092
		)
		AND
		(
			(
				DT502.C984 <> DT502.C983
			)
			OR
			(
				DT500.C1092 <> DT502.C984
			)
		)
	)
	OR
	(
		(
			DT501.C259 <> DT500.C1080
		)
		OR
		(
			(
				DT500.C1083 <> DT506.C1770
			)
			OR
			(
				DT500.C1090 = DT500.C1089
			)
		)
	)
GROUP BY
	DT502.C979
	, DT501.C269
	, DT501.C262
	, DT501.C260
ORDER BY
	DT501.C262
	, AVG( DT501.C269 )
	, MAX( DT502.C979 )
	, DT501.C269
LIMIT 383;


SELECT
	MAX( DT508.C36 )
	, DT508.C36
	, DT508.C50
FROM
	(
		T3 DT508
	INNER JOIN
		T55 DT507
	ON
		DT508.C36 <> DT507.C662
	)
WHERE
	(
		(
			(
				DT508.C32 > DT508.C48
			)
			AND
			(
				DT508.C33 = DT507.C659
			)
		)
		OR
		(
			(
				DT507.C658 = DT507.C665
			)
			OR
			(
				DT508.C34 = DT508.C52
			)
		)
	)
	OR
	(
		(
			DT508.C40 = DT508.C45
		)
		AND
		(
			DT507.C663 = DT508.C37
		)
	)
GROUP BY
	DT508.C36
	, DT508.C50
ORDER BY
	MAX( DT508.C36 )
	, DT508.C36
	, DT508.C50
LIMIT 435;


SELECT
	DT509.C653
	, DT509.C648
FROM
	(
		T17 DT510
	INNER JOIN
		T53 DT509
	ON
		DT510.C218 > DT509.C652
	)
WHERE
	(
		DT509.C643 = DT510.C211
	)
	AND
	(
		(
			(
				DT510.C210 <> DT510.C209
			)
			AND
			(
				(
					(
						DT510.C207 = DT509.C646
					)
					AND
					(
						DT510.C214 = DT509.C646
					)
				)
				OR
				(
					DT509.C651 = DT509.C639
				)
			)
		)
		OR
		(
			(
				DT509.C641 > DT509.C646
			)
			AND
			(
				DT509.C636 = DT510.C218
			)
		)
	)
GROUP BY
	DT510.C209
	, DT509.C653
	, DT509.C648
ORDER BY
	DT509.C653
	, DT509.C648
LIMIT 178;


SELECT
	to_char(AVG( DT511.C934 ),'9999999.9999999')
FROM
	(
		T75 DT511
	INNER JOIN
		(
		SELECT
			AVG( DT512.C724 )
			, DT513.C407
			, DT512.C724
			, MAX( DT512.C723 )
			, DT512.C723
		FROM
			(
				T60 DT512
			INNER JOIN
				T34 DT513
			ON
				DT512.C721 <> DT513.C405
			)
		WHERE
			(
				(
					DT513.C405 = DT513.C409
				)
				OR
				(
					(
						(
							DT513.C404 < DT512.C719
						)
						AND
						(
							DT513.C405 = DT512.C718
						)
					)
					AND
					(
						DT513.C409 <> DT513.C405
					)
				)
			)
			OR
			(
				(
					(
						DT512.C718 = DT512.C719
					)
					OR
					(
						DT513.C409 = DT512.C719
					)
				)
				OR
				(
					(
						DT513.C402 = DT512.C718
					)
					AND
					(
						DT513.C404 = DT513.C406
					)
				)
			)
		GROUP BY
			DT512.C724
			, DT512.C723
			, DT513.C407
		ORDER BY
			AVG( DT512.C724 )
			, DT513.C407
			, DT512.C724
			, MAX( DT512.C723 )
			, DT512.C723
		LIMIT 814
		) AS DT514 ( C1780, C1781, C1782, C1783, C1784 ) 
	ON
		DT511.C937 <> DT514.C1781
	)
WHERE
	(
		DT511.C931 <> DT514.C1782
	)
	OR
	(
		(
			(
				DT511.C930 = DT511.C936
			)
			OR
			(
				(
					DT511.C933 = DT514.C1780
				)
				OR
				(
					(
						DT511.C934 < DT511.C931
					)
					OR
					(
						DT514.C1783 = DT514.C1783
					)
				)
			)
		)
		OR
		(
			(
				DT514.C1781 = DT511.C937
			)
			AND
			(
				(
					DT511.C930 <> DT511.C935
				)
				AND
				(
					DT511.C931 = DT511.C932
				)
			)
		)
	)
GROUP BY
	DT514.C1784
	, DT511.C936
	, DT511.C934
ORDER BY
	AVG( DT511.C934 )
LIMIT 213;


SELECT
	SUM( DT525.C1808 )
	, DT515.C200
	, DT526.C1173
	, MIN( DT526.C1173 )
	, DT525.C1808
FROM
	(
		(
			(
				(
				SELECT
					DT517.C438
					, SUM( DT516.C219 )
					, DT516.C225
					, DT517.C440
					, AVG( DT516.C225 )
					, DT516.C219
					, COUNT( DT516.C228 )
				FROM
					(
						T37 DT517
					INNER JOIN
						T18 DT516
					ON
						DT517.C440 = DT516.C226
					)
				WHERE
					(
						DT516.C223 = DT516.C221
					)
					AND
					(
						(
							DT517.C440 = DT516.C220
						)
						OR
						(
							(
								(
									DT516.C229 = DT517.C440
								)
								AND
								(
									DT517.C439 = DT516.C227
								)
							)
							OR
							(
								DT516.C224 < DT516.C219
							)
						)
					)
				GROUP BY
					DT516.C228
					, DT517.C438
					, DT516.C219
					, DT516.C225
					, DT517.C440
				ORDER BY
					DT517.C438
					, SUM( DT516.C219 )
					, DT516.C225
					, DT517.C440
					, AVG( DT516.C225 )
					, DT516.C219
					, COUNT( DT516.C228 )
				LIMIT 198
				)  DT518 ( C1792, C1793, C1794, C1795, C1796, C1797, C1798 ) 
			INNER JOIN
				T95 DT526
			ON
				DT518.C1794 < DT526.C1174
			)
		INNER JOIN
			T16 DT515
		ON
			DT518.C1792 > DT515.C205
		)
	INNER JOIN
		(
		SELECT
			DT519.C158
			, SUM( DT520.C533 )
			, COUNT( DT520.C542 )
			, COUNT( DT519.C158 )
			, DT520.C533
			, DT520.C542
			, AVG( DT520.C545 )
		FROM
			(
				(
				SELECT
					SUM( DT523.C708 )
				FROM
					(
						(
							T58 DT523
						INNER JOIN
							T28 DT521
						ON
							DT523.C703 = DT521.C332
						)
					INNER JOIN
						T60 DT522
					ON
						DT523.C706 = DT522.C722
					)
				WHERE
					(
						(
							DT523.C701 = DT523.C699
						)
						OR
						(
							DT523.C708 <> DT523.C708
						)
					)
					AND
					(
						(
							(
								DT523.C705 = DT523.C708
							)
							AND
							(
								DT521.C333 = DT521.C333
							)
						)
						OR
						(
							(
								DT523.C712 <> DT521.C329
							)
							OR
							(
								(
									DT521.C330 > DT523.C710
								)
								AND
								(
									DT523.C701 = DT523.C709
								)
							)
						)
					)
				GROUP BY
					DT522.C717
					, DT523.C708
					, DT523.C711
				ORDER BY
					SUM( DT523.C708 )
				LIMIT 894
				) AS DT524 ( C1802 ) 
			INNER JOIN
				(
					T46 DT520
				INNER JOIN
					T12 DT519
				ON
					DT520.C547 <> DT519.C160
				)
			ON
				DT524.C1802 = DT519.C163
			)
		WHERE
			(
				(
					(
						(
							DT520.C544 > DT520.C543
						)
						AND
						(
							DT520.C537 <> DT520.C534
						)
					)
					AND
					(
						(
							DT520.C535 <> DT519.C163
						)
						AND
						(
							DT519.C160 > DT520.C544
						)
					)
				)
				OR
				(
					DT520.C546 <> DT520.C529
				)
			)
			AND
			(
				(
					(
						DT520.C539 = DT520.C545
					)
					AND
					(
						DT520.C536 <> DT520.C540
					)
				)
				AND
				(
					DT520.C531 = DT520.C537
				)
			)
		GROUP BY
			DT520.C545
			, DT520.C533
			, DT519.C158
			, DT520.C542
		ORDER BY
			DT519.C158
			, SUM( DT520.C533 )
			, COUNT( DT520.C542 )
			, COUNT( DT519.C158 )
			, DT520.C533
			, DT520.C542
			, AVG( DT520.C545 )
		LIMIT 910
		)  DT525 ( C1807, C1808, C1809, C1810, C1811, C1812, C1813 ) 
	ON
		DT526.C1169 <> DT525.C1813
	)
WHERE
	(
		(
			(
				(
					DT518.C1794 <> DT515.C200
				)
				OR
				(
					DT518.C1793 = DT526.C1175
				)
			)
			AND
			(
				(
					(
						DT515.C206 <> DT526.C1172
					)
					OR
					(
						DT526.C1172 = DT515.C201
					)
				)
				AND
				(
					DT525.C1813 = DT525.C1807
				)
			)
		)
		OR
		(
			DT526.C1174 = DT515.C205
		)
	)
	AND
	(
		DT515.C203 > DT515.C204
	)
GROUP BY
	DT525.C1808
	, DT526.C1173
	, DT515.C200
ORDER BY
	SUM( DT525.C1808 )
	, DT515.C200
	, DT526.C1173
	, MIN( DT526.C1173 )
	, DT525.C1808
LIMIT 497;


SELECT
	SUM( DT527.C1167 )
	, DT527.C1174
FROM
	(
		T19 DT528
	INNER JOIN
		T95 DT527
	ON
		DT528.C230 = DT527.C1175
	)
WHERE
	(
		(
			DT527.C1171 = DT527.C1171
		)
		OR
		(
			DT528.C231 = DT527.C1167
		)
	)
	OR
	(
		(
			(
				DT527.C1167 = DT528.C231
			)
			AND
			(
				DT527.C1173 = DT527.C1171
			)
		)
		AND
		(
			DT527.C1169 > DT527.C1171
		)
	)
GROUP BY
	DT527.C1167
	, DT527.C1174
	, DT528.C231
ORDER BY
	SUM( DT527.C1167 )
	, DT527.C1174
LIMIT 408;


SELECT
	SUM( DT535.C1833 )
	, DT529.C1184
	, to_char(AVG( DT529.C1185 ),'9999999.9999999')
	, DT535.C1833
	, DT529.C1185
	, MIN( DT529.C1184 )
FROM
	(
		T96 DT529
	INNER JOIN
		(
		SELECT
			DT530.C683
			, AVG( DT530.C695 )
			, DT530.C696
			, DT530.C695
			, SUM( DT530.C696 )
			, MIN( DT530.C683 )
			, SUM( DT530.C692 )
		FROM
			(
				(
				SELECT
					DT531.C306
					, DT531.C303
				FROM
					(
						T26 DT531
					INNER JOIN
						(
							T60 DT532
						INNER JOIN
							T27 DT533
						ON
							DT532.C724 = DT533.C319
						)
					ON
						DT531.C304 = DT532.C721
					)
				WHERE
					(
						DT531.C308 = DT533.C321
					)
					OR
					(
						(
							(
								(
									DT531.C299 <> DT531.C317
								)
								AND
								(
									DT531.C306 = DT532.C722
								)
							)
							OR
							(
								DT531.C312 < DT531.C306
							)
						)
						AND
						(
							(
								DT533.C324 <> DT531.C302
							)
							OR
							(
								DT531.C305 = DT531.C299
							)
						)
					)
				GROUP BY
					DT531.C306
					, DT531.C303
					, DT531.C314
				ORDER BY
					DT531.C306
					, DT531.C303
				LIMIT 457
				)  DT534 ( C1821, C1822 ) 
			INNER JOIN
				T57 DT530
			ON
				DT534.C1822 > DT530.C682
			)
		WHERE
			(
				(
					DT534.C1822 <> DT530.C688
				)
				AND
				(
					(
						DT530.C691 < DT530.C682
					)
					OR
					(
						DT530.C689 = DT530.C691
					)
				)
			)
			OR
			(
				(
					DT530.C693 <> DT530.C692
				)
				OR
				(
					DT530.C696 = DT530.C694
				)
			)
		GROUP BY
			DT530.C683
			, DT530.C695
			, DT530.C689
			, DT530.C696
			, DT530.C692
		ORDER BY
			DT530.C683
			, AVG( DT530.C695 )
			, DT530.C696
			, DT530.C695
			, SUM( DT530.C696 )
			, MIN( DT530.C683 )
			, SUM( DT530.C692 )
		LIMIT 292
		)  DT535 ( C1827, C1828, C1829, C1830, C1831, C1832, C1833 ) 
	ON
		DT529.C1176 = DT535.C1831
	)
WHERE
	(
		(
			(
				DT535.C1833 < DT535.C1831
			)
			AND
			(
				DT535.C1828 = DT535.C1829
			)
		)
		AND
		(
			DT535.C1828 = DT535.C1831
		)
	)
	OR
	(
		(
			DT535.C1830 <> DT529.C1180
		)
		OR
		(
			(
				(
					DT529.C1186 = DT529.C1180
				)
				AND
				(
					DT535.C1831 <> DT529.C1184
				)
			)
			AND
			(
				DT529.C1183 < DT535.C1829
			)
		)
	)
GROUP BY
	DT535.C1833
	, DT529.C1185
	, DT529.C1184
ORDER BY
	SUM( DT535.C1833 )
	, DT529.C1184
	, AVG( DT529.C1185 )
	, DT535.C1833
	, DT529.C1185
	, MIN( DT529.C1184 )
LIMIT 732;


SELECT
	DT539.C1124
	, DT537.C673
	, DT538.C302
	, DT539.C1121
	, COUNT( DT537.C679 )
	, AVG( DT539.C1124 )
	, AVG( DT539.C1121 )
FROM
	(
		(
			T73 DT536
		INNER JOIN
			T92 DT539
		ON
			DT536.C891 = DT539.C1115
		)
	INNER JOIN
		(
			T26 DT538
		INNER JOIN
			T56 DT537
		ON
			DT538.C300 <> DT537.C679
		)
	ON
		DT539.C1118 = DT537.C670
	)
WHERE
	(
		DT536.C898 = DT536.C901
	)
	AND
	(
		(
			(
				(
					DT536.C907 = DT536.C904
				)
				OR
				(
					DT539.C1127 <> DT537.C668
				)
			)
			AND
			(
				(
					DT537.C680 = DT538.C302
				)
				OR
				(
					DT539.C1119 > DT537.C673
				)
			)
		)
		AND
		(
			(
				DT539.C1131 < DT539.C1132
			)
			OR
			(
				DT539.C1115 < DT536.C890
			)
		)
	)
GROUP BY
	DT539.C1121
	, DT539.C1124
	, DT537.C679
	, DT537.C673
	, DT538.C302
ORDER BY
	DT539.C1124
	, DT537.C673
	, DT538.C302
	, DT539.C1121
	, COUNT( DT537.C679 )
	, AVG( DT539.C1124 )
	, AVG( DT539.C1121 )
LIMIT 217;


SELECT
	MIN( DT546.C690 )
FROM
	(
		T59 DT540
	INNER JOIN
		(
			(
			SELECT
				DT541.C740
				, DT543.C617
				, DT541.C742
			FROM
				(
					(
						T51 DT543
					INNER JOIN
						T62 DT541
					ON
						DT543.C610 > DT541.C740
					)
				INNER JOIN
					(
						T50 DT542
					LEFT OUTER JOIN
						T24 DT544
					ON
						DT542.C607 = DT544.C281
					)
				ON
					DT543.C623 < DT542.C603
				)
			WHERE
				(
					(
						DT543.C624 = DT543.C622
					)
					AND
					(
						DT544.C282 = DT543.C611
					)
				)
				OR
				(
					(
						(
							DT543.C617 > DT543.C622
						)
						OR
						(
							(
								(
									DT543.C611 < DT541.C741
								)
								OR
								(
									DT543.C616 = DT543.C623
								)
							)
							AND
							(
								DT542.C606 = DT543.C624
							)
						)
					)
					AND
					(
						(
							DT544.C279 > DT544.C280
						)
						OR
						(
							DT543.C612 > DT543.C622
						)
					)
				)
			GROUP BY
				DT541.C740
				, DT541.C742
				, DT543.C617
			ORDER BY
				DT541.C740
				, DT543.C617
				, DT541.C742
			LIMIT 886
			)  DT545 ( C1842, C1843, C1844 ) 
		INNER JOIN
			T57 DT546
		ON
			DT545.C1843 = DT546.C697
		)
	ON
		DT540.C714 = DT546.C691
	)
WHERE
	(
		(
			DT540.C714 = DT540.C716
		)
		OR
		(
			DT540.C713 = DT546.C692
		)
	)
	OR
	(
		(
			DT546.C692 > DT546.C697
		)
		OR
		(
			(
				DT546.C689 < DT546.C685
			)
			AND
			(
				(
					(
						DT546.C691 < DT545.C1842
					)
					OR
					(
						DT540.C714 = DT546.C697
					)
				)
				AND
				(
					DT546.C696 = DT546.C696
				)
			)
		)
	)
GROUP BY
	DT540.C713
	, DT546.C690
ORDER BY
	MIN( DT546.C690 )
LIMIT 144;


SELECT
	COUNT( DT550.C377 )
	, DT550.C377
FROM
	(
		T0 DT551
	INNER JOIN
		(
			(
			SELECT
				DT547.C228
			FROM
				(
					T38 DT548
				INNER JOIN
					T18 DT547
				ON
					DT548.C441 <> DT547.C229
				)
			WHERE
				(
					(
						(
							DT547.C226 < DT547.C229
						)
						AND
						(
							DT548.C443 <> DT547.C223
						)
					)
					OR
					(
						DT547.C229 <> DT547.C229
					)
				)
				AND
				(
					(
						(
							DT547.C229 = DT547.C221
						)
						AND
						(
							DT547.C229 > DT547.C221
						)
					)
					OR
					(
						(
							DT547.C228 < DT547.C226
						)
						AND
						(
							DT548.C442 = DT547.C227
						)
					)
				)
			GROUP BY
				DT547.C228
				, DT547.C224
				, DT547.C223
				, DT548.C443
			ORDER BY
				DT547.C228
			LIMIT 763
			) AS DT549 ( C1850 ) 
		RIGHT OUTER JOIN
			T32 DT550
		ON
			DT549.C1850 = DT550.C368
		)
	ON
		DT551.C0 < DT550.C364
	)
WHERE
	(
		(
			DT550.C375 = DT550.C380
		)
		AND
		(
			(
				DT550.C381 = DT550.C380
			)
			OR
			(
				DT550.C378 = DT549.C1850
			)
		)
	)
	OR
	(
		(
			DT550.C382 > DT550.C378
		)
		OR
		(
			(
				DT550.C374 = DT550.C376
			)
			AND
			(
				DT550.C374 = DT550.C369
			)
		)
	)
GROUP BY
	DT550.C377
	, DT550.C369
ORDER BY
	COUNT( DT550.C377 )
	, DT550.C377
LIMIT 485;


SELECT
	MAX( DT552.C509 )
	, AVG( DT553.C1064 )
	, DT553.C1064
	, DT552.C507
	, DT552.C509
	, COUNT( DT552.C507 )
	, AVG( DT553.C1068 )
FROM
	(
		T60 DT554
	INNER JOIN
		(
			T44 DT552
		INNER JOIN
			T88 DT553
		ON
			DT552.C507 <> DT553.C1069
		)
	ON
		DT554.C724 > DT552.C505
	)
WHERE
	(
		(
			(
				(
					DT553.C1067 <> DT553.C1074
				)
				OR
				(
					DT552.C511 < DT553.C1075
				)
			)
			AND
			(
				(
					DT552.C507 < DT553.C1070
				)
				OR
				(
					DT553.C1067 = DT553.C1066
				)
			)
		)
		AND
		(
			DT554.C723 = DT553.C1075
		)
	)
	AND
	(
		DT554.C722 = DT553.C1073
	)
GROUP BY
	DT552.C509
	, DT553.C1068
	, DT552.C507
	, DT553.C1064
ORDER BY
	MAX( DT552.C509 )
	, AVG( DT553.C1064 )
	, DT553.C1064
	, DT552.C507
	, DT552.C509
	, COUNT( DT552.C507 )
	, AVG( DT553.C1068 )
LIMIT 308;


SELECT
	DT561.C331
	, DT560.C1868
	, DT561.C332
	, DT561.C330
FROM
	(
		T28 DT561
	INNER JOIN
		(
		SELECT
			DT557.C1861
		FROM
			(
				(
					(
					SELECT
						DT556.C480
						, COUNT( DT556.C480 )
						, MIN( DT556.C486 )
						, AVG( DT555.C72 )
						, MAX( DT556.C475 )
					FROM
						(
							T5 DT555
						INNER JOIN
							T42 DT556
						ON
							DT555.C66 = DT556.C486
						)
					WHERE
						(
							DT556.C486 = DT555.C72
						)
						AND
						(
							(
								(
									DT556.C486 = DT555.C66
								)
								OR
								(
									(
										DT555.C70 <> DT555.C66
									)
									AND
									(
										DT556.C473 = DT556.C480
									)
								)
							)
							OR
							(
								DT556.C478 = DT556.C485
							)
						)
					GROUP BY
						DT556.C475
						, DT555.C72
						, DT556.C480
						, DT556.C486
					ORDER BY
						DT556.C480
						, COUNT( DT556.C480 )
						, MIN( DT556.C486 )
						, AVG( DT555.C72 )
						, MAX( DT556.C475 )
					LIMIT 293
					) AS DT557 ( C1860, C1861, C1862, C1863, C1864 ) 
				INNER JOIN
					T18 DT559
				ON
					DT557.C1863 <> DT559.C226
				)
			INNER JOIN
				T38 DT558
			ON
				DT557.C1863 = DT558.C443
			)
		WHERE
			(
				(
					(
						DT557.C1861 = DT557.C1861
					)
					AND
					(
						DT558.C442 < DT557.C1860
					)
				)
				AND
				(
					DT559.C226 = DT558.C442
				)
			)
			AND
			(
				(
					DT557.C1860 < DT559.C224
				)
				AND
				(
					DT557.C1862 = DT558.C442
				)
			)
		GROUP BY
			DT558.C441
			, DT557.C1861
			, DT559.C229
			, DT557.C1860
		ORDER BY
			DT557.C1861
		LIMIT 479
		) AS DT560 ( C1868 ) 
	ON
		DT561.C330 <> DT560.C1868
	)
WHERE
	(
		(
			(
				DT561.C331 < DT561.C331
			)
			OR
			(
				(
					DT561.C331 = DT561.C331
				)
				AND
				(
					DT561.C329 = DT561.C331
				)
			)
		)
		OR
		(
			(
				(
					DT561.C331 = DT561.C333
				)
				AND
				(
					DT561.C328 = DT561.C331
				)
			)
			AND
			(
				DT561.C331 = DT560.C1868
			)
		)
	)
	AND
	(
		(
			DT561.C331 = DT561.C332
		)
		OR
		(
			DT561.C333 = DT561.C330
		)
	)
ORDER BY
	DT561.C331
	, DT560.C1868
	, DT561.C332
	, DT561.C330
LIMIT 713;


SELECT
	DT572.C190
	, DT572.C186
	, DT572.C199
	, SUM( DT572.C199 )
FROM
	(
		T15 DT572
	INNER JOIN
		(
		SELECT
			DT566.C387
			, DT566.C390
			, DT566.C392
			, AVG( DT566.C387 )
			, COUNT( DT566.C392 )
			, DT570.C438
			, MIN( DT566.C390 )
		FROM
			(
				T33 DT566
			INNER JOIN
				(
					(
						(
						SELECT
							DT563.C235
							, DT563.C245
						FROM
							(
								T34 DT564
							INNER JOIN
								(
									T93 DT562
								LEFT OUTER JOIN
									T20 DT563
								ON
									DT562.C1144 > DT563.C236
								)
							ON
								DT564.C404 = DT562.C1142
							)
						WHERE
							(
								(
									DT562.C1137 = DT562.C1142
								)
								AND
								(
									(
										(
											DT563.C241 > DT563.C243
										)
										AND
										(
											DT563.C236 = DT563.C240
										)
									)
									AND
									(
										(
											(
												DT564.C407 = DT564.C402
											)
											OR
											(
												DT563.C238 = DT562.C1137
											)
										)
										OR
										(
											DT564.C405 = DT562.C1141
										)
									)
								)
							)
							AND
							(
								(
									DT562.C1143 > DT562.C1136
								)
								OR
								(
									DT564.C408 > DT564.C403
								)
							)
						GROUP BY
							DT563.C235
							, DT563.C245
						ORDER BY
							DT563.C235
							, DT563.C245
						LIMIT 399
						) AS DT565 ( C1870, C1871 ) 
					RIGHT OUTER JOIN
						T37 DT570
					ON
						DT565.C1871 = DT570.C439
					)
				LEFT OUTER JOIN
					(
					SELECT
						MAX( DT568.C1117 )
						, DT568.C1124
					FROM
						(
							T28 DT567
						INNER JOIN
							T92 DT568
						ON
							DT567.C332 <> DT568.C1131
						)
					WHERE
						(
							(
								DT568.C1129 <> DT568.C1126
							)
							OR
							(
								(
									DT567.C328 <> DT568.C1122
								)
								OR
								(
									DT567.C333 <> DT567.C332
								)
							)
						)
						AND
						(
							(
								(
									DT567.C330 = DT568.C1125
								)
								OR
								(
									DT567.C328 < DT568.C1127
								)
							)
							OR
							(
								DT567.C328 = DT568.C1133
							)
						)
					GROUP BY
						DT568.C1124
						, DT568.C1117
					ORDER BY
						MAX( DT568.C1117 )
						, DT568.C1124
					LIMIT 192
					)  DT569 ( C1873, C1874 ) 
				ON
					DT570.C440 < DT569.C1874
				)
			ON
				DT566.C400 = DT570.C439
			)
		WHERE
			(
				(
					(
						(
							DT565.C1871 < DT566.C399
						)
						OR
						(
							(
								DT570.C438 = DT566.C390
							)
							OR
							(
								DT566.C389 > DT566.C396
							)
						)
					)
					OR
					(
						(
							DT566.C384 <> DT566.C399
						)
						OR
						(
							DT566.C392 = DT566.C390
						)
					)
				)
				OR
				(
					DT566.C395 = DT566.C385
				)
			)
			OR
			(
				(
					DT566.C397 = DT566.C385
				)
				OR
				(
					DT566.C396 > DT566.C400
				)
			)
		GROUP BY
			DT566.C400
			, DT566.C390
			, DT570.C438
			, DT566.C392
			, DT566.C387
		ORDER BY
			DT566.C387
			, DT566.C390
			, DT566.C392
			, AVG( DT566.C387 )
			, COUNT( DT566.C392 )
			, DT570.C438
			, MIN( DT566.C390 )
		LIMIT 499
		) AS DT571 ( C1878, C1879, C1880, C1881, C1882, C1883, C1884 ) 
	ON
		DT572.C196 < DT571.C1880
	)
WHERE
	(
		(
			DT572.C190 <> DT572.C186
		)
		OR
		(
			(
				(
					DT572.C190 = DT572.C192
				)
				AND
				(
					DT572.C187 = DT572.C192
				)
			)
			AND
			(
				DT572.C197 <> DT572.C196
			)
		)
	)
	OR
	(
		(
			(
				DT571.C1884 > DT571.C1883
			)
			AND
			(
				(
					DT571.C1883 = DT572.C187
				)
				OR
				(
					DT572.C192 = DT572.C192
				)
			)
		)
		OR
		(
			DT572.C199 < DT571.C1881
		)
	)
GROUP BY
	DT572.C190
	, DT571.C1879
	, DT572.C186
	, DT572.C199
ORDER BY
	DT572.C190
	, DT572.C186
	, DT572.C199
	, SUM( DT572.C199 )
LIMIT 110;


SELECT
	DT584.C945
	, DT583.C1899
	, DT584.C941
	, AVG( DT584.C941 )
	, AVG( DT584.C943 )
	, DT584.C943
	, COUNT( DT584.C940 )
	, DT584.C940
	, MAX( DT584.C945 )
FROM
	(
		T76 DT584
	INNER JOIN
		(
			(
			SELECT
				SUM( DT582.C629 )
				, DT577.C930
			FROM
				(
					(
						(
							T9 DT576
						INNER JOIN
							T75 DT577
						ON
							DT576.C135 < DT577.C931
						)
					INNER JOIN
						(
						SELECT
							DT580.C1132
						FROM
							(
								T54 DT578
							INNER JOIN
								(
									T25 DT579
								INNER JOIN
									T92 DT580
								ON
									DT579.C285 = DT580.C1118
								)
							ON
								DT578.C654 > DT579.C296
							)
						WHERE
							(
								(
									(
										DT580.C1135 < DT580.C1117
									)
									AND
									(
										DT579.C294 = DT580.C1135
									)
								)
								AND
								(
									(
										DT580.C1129 > DT579.C285
									)
									OR
									(
										DT579.C292 = DT580.C1125
									)
								)
							)
							OR
							(
								(
									DT580.C1130 < DT579.C292
								)
								OR
								(
									DT580.C1121 = DT578.C654
								)
							)
						GROUP BY
							DT580.C1133
							, DT580.C1132
						ORDER BY
							DT580.C1132
						LIMIT 922
						)  DT581 ( C1896 ) 
					ON
						DT577.C933 > DT581.C1896
					)
				INNER JOIN
					T52 DT582
				ON
					DT576.C135 <> DT582.C630
				)
			WHERE
				(
					(
						DT577.C931 <> DT577.C935
					)
					OR
					(
						(
							DT582.C630 > DT576.C126
						)
						AND
						(
							DT577.C934 > DT577.C931
						)
					)
				)
				OR
				(
					(
						(
							DT582.C633 <> DT582.C628
						)
						AND
						(
							DT577.C930 <> DT582.C629
						)
					)
					OR
					(
						DT582.C634 <> DT576.C129
					)
				)
			GROUP BY
				DT577.C930
				, DT582.C629
				, DT576.C129
			ORDER BY
				SUM( DT582.C629 )
				, DT577.C930
			LIMIT 708
			)  DT583 ( C1898, C1899 ) 
		INNER JOIN
			(
			SELECT
				DT573.C558
				, DT573.C557
			FROM
				(
					T32 DT574
				INNER JOIN
					T47 DT573
				ON
					DT574.C367 = DT573.C556
				)
			WHERE
				(
					(
						DT574.C378 > DT573.C564
					)
					AND
					(
						(
							DT574.C367 < DT574.C374
						)
						AND
						(
							DT574.C376 = DT574.C370
						)
					)
				)
				OR
				(
					(
						DT574.C368 < DT573.C550
					)
					AND
					(
						(
							DT574.C374 > DT573.C556
						)
						AND
						(
							DT574.C381 = DT574.C371
						)
					)
				)
			GROUP BY
				DT574.C380
				, DT573.C558
				, DT573.C557
				, DT573.C555
			ORDER BY
				DT573.C558
				, DT573.C557
			LIMIT 881
			) AS DT575 ( C1892, C1893 ) 
		ON
			DT583.C1899 < DT575.C1893
		)
	ON
		DT584.C938 = DT575.C1893
	)
WHERE
	(
		(
			(
				DT584.C944 < DT584.C941
			)
			AND
			(
				(
					DT584.C946 <> DT584.C943
				)
				OR
				(
					DT584.C941 > DT584.C942
				)
			)
		)
		AND
		(
			(
				DT584.C939 = DT584.C940
			)
			AND
			(
				DT583.C1899 = DT583.C1899
			)
		)
	)
	AND
	(
		(
			DT584.C940 < DT584.C945
		)
		OR
		(
			(
				DT584.C940 = DT575.C1892
			)
			AND
			(
				DT575.C1892 = DT584.C946
			)
		)
	)
GROUP BY
	DT584.C940
	, DT584.C943
	, DT584.C941
	, DT583.C1899
	, DT584.C945
ORDER BY
	DT584.C945
	, DT583.C1899
	, DT584.C941
	, AVG( DT584.C941 )
	, AVG( DT584.C943 )
	, DT584.C943
	, COUNT( DT584.C940 )
	, DT584.C940
	, MAX( DT584.C945 )
LIMIT 644;


SELECT
	COUNT( DT585.C1143 )
	, DT585.C1143
	, SUM( DT585.C1140 )
	, DT585.C1139
	, COUNT( DT585.C1138 )
	, DT585.C1140
FROM
	(
		(
		SELECT
			MIN( DT588.C123 )
			, COUNT( DT588.C114 )
			, DT588.C123
			, DT588.C114
			, MIN( DT588.C119 )
			, DT588.C119
		FROM
			(
				(
					(
						T45 DT589
					INNER JOIN
						T8 DT588
					ON
						DT589.C517 = DT588.C110
					)
				INNER JOIN
					T15 DT586
				ON
					DT589.C517 = DT586.C194
				)
			INNER JOIN
				T2 DT587
			ON
				DT588.C110 = DT587.C22
			)
		WHERE
			(
				(
					DT589.C519 < DT586.C195
				)
				OR
				(
					(
						(
							(
								(
									DT588.C125 = DT588.C120
								)
								OR
								(
									DT586.C189 > DT589.C526
								)
							)
							AND
							(
								DT586.C191 = DT588.C112
							)
						)
						OR
						(
							DT589.C527 < DT588.C119
						)
					)
					AND
					(
						(
							DT588.C116 = DT587.C15
						)
						AND
						(
							DT589.C523 = DT588.C123
						)
					)
				)
			)
			OR
			(
				DT589.C525 = DT589.C527
			)
		GROUP BY
			DT588.C114
			, DT588.C123
			, DT588.C119
		ORDER BY
			MIN( DT588.C123 )
			, COUNT( DT588.C114 )
			, DT588.C123
			, DT588.C114
			, MIN( DT588.C119 )
			, DT588.C119
		LIMIT 462
		)  DT590 ( C1907, C1908, C1909, C1910, C1911, C1912 ) 
	INNER JOIN
		T93 DT585
	ON
		DT590.C1910 < DT585.C1143
	)
WHERE
	(
		(
			DT585.C1139 > DT585.C1139
		)
		AND
		(
			(
				DT585.C1136 <> DT590.C1912
			)
			OR
			(
				DT585.C1137 <> DT585.C1141
			)
		)
	)
	OR
	(
		(
			(
				(
					DT585.C1136 <> DT590.C1909
				)
				AND
				(
					DT590.C1907 <> DT585.C1144
				)
			)
			OR
			(
				DT585.C1136 > DT585.C1144
			)
		)
		AND
		(
			DT590.C1909 <> DT585.C1136
		)
	)
GROUP BY
	DT585.C1143
	, DT585.C1140
	, DT585.C1139
	, DT585.C1138
	, DT590.C1907
ORDER BY
	COUNT( DT585.C1143 )
	, DT585.C1143
	, SUM( DT585.C1140 )
	, DT585.C1139
	, COUNT( DT585.C1138 )
	, DT585.C1140
LIMIT 669;


SELECT
	COUNT( DT592.C376 )
	, DT592.C367
	, DT592.C366
	, DT592.C376
	, MAX( DT592.C370 )
	, DT592.C370
FROM
	(
		(
			T75 DT591
		INNER JOIN
			T32 DT592
		ON
			DT591.C936 <> DT592.C375
		)
	INNER JOIN
		(
		SELECT
			COUNT( DT601.C965 )
		FROM
			(
				(
					T62 DT602
				LEFT OUTER JOIN
					(
					SELECT
						DT594.C685
					FROM
						(
							(
								(
								SELECT
									COUNT( DT596.C142 )
									, DT596.C146
								FROM
									(
										(
											T32 DT595
										INNER JOIN
											T10 DT596
										ON
											DT595.C375 > DT596.C149
										)
									INNER JOIN
										T69 DT597
									ON
										DT595.C371 = DT597.C827
									)
								WHERE
									(
										(
											(
												DT595.C374 = DT595.C369
											)
											OR
											(
												DT596.C147 <> DT596.C142
											)
										)
										AND
										(
											DT597.C833 = DT597.C836
										)
									)
									AND
									(
										(
											DT595.C375 <> DT595.C366
										)
										AND
										(
											(
												DT595.C364 <> DT595.C382
											)
											AND
											(
												DT597.C833 = DT596.C145
											)
										)
									)
								GROUP BY
									DT596.C146
									, DT596.C142
								ORDER BY
									COUNT( DT596.C142 )
									, DT596.C146
								LIMIT 964
								)  DT598 ( C1919, C1920 ) 
							INNER JOIN
								T20 DT593
							ON
								DT598.C1919 < DT593.C233
							)
						INNER JOIN
							(
								T82 DT599
							INNER JOIN
								T57 DT594
							ON
								DT599.C995 = DT594.C689
							)
						ON
							DT593.C244 = DT594.C685
						)
					WHERE
						(
							(
								(
									DT594.C692 = DT594.C686
								)
								OR
								(
									(
										(
											DT593.C243 = DT594.C685
										)
										OR
										(
											DT593.C239 > DT594.C682
										)
									)
									OR
									(
										DT594.C692 > DT593.C237
									)
								)
							)
							OR
							(
								(
									DT599.C996 < DT599.C995
								)
								OR
								(
									DT594.C685 = DT593.C233
								)
							)
						)
						OR
						(
							DT593.C242 = DT594.C688
						)
					GROUP BY
						DT594.C685
						, DT594.C684
					ORDER BY
						DT594.C685
					LIMIT 632
					) AS DT600 ( C1922 ) 
				ON
					DT602.C740 > DT600.C1922
				)
			INNER JOIN
				T78 DT601
			ON
				DT602.C740 <> DT601.C978
			)
		WHERE
			(
				(
					(
						DT601.C972 > DT601.C975
					)
					OR
					(
						DT601.C971 = DT601.C970
					)
				)
				AND
				(
					DT602.C740 < DT601.C975
				)
			)
			OR
			(
				(
					DT601.C973 < DT601.C974
				)
				OR
				(
					DT601.C965 <> DT601.C975
				)
			)
		GROUP BY
			DT601.C968
			, DT601.C965
		ORDER BY
			COUNT( DT601.C965 )
		LIMIT 545
		)  DT603 ( C1925 ) 
	ON
		DT591.C930 < DT603.C1925
	)
WHERE
	(
		DT603.C1925 = DT592.C364
	)
	OR
	(
		(
			(
				DT591.C934 > DT592.C368
			)
			AND
			(
				(
					DT592.C368 = DT592.C375
				)
				AND
				(
					DT591.C934 < DT592.C373
				)
			)
		)
		AND
		(
			(
				(
					DT591.C930 = DT592.C382
				)
				AND
				(
					DT592.C377 = DT603.C1925
				)
			)
			OR
			(
				DT591.C936 = DT592.C379
			)
		)
	)
GROUP BY
	DT592.C370
	, DT592.C367
	, DT592.C376
	, DT592.C366
	, DT591.C935
ORDER BY
	COUNT( DT592.C376 )
	, DT592.C367
	, DT592.C366
	, DT592.C376
	, MAX( DT592.C370 )
	, DT592.C370
LIMIT 948;


SELECT
	DT605.C572
	, SUM( DT605.C572 )
	, to_char(AVG( DT604.C691 ),'9999999.9999999')
	, DT604.C691
FROM
	(
		(
			T48 DT605
		INNER JOIN
			T7 DT611
		ON
			DT605.C580 = DT611.C107
		)
	INNER JOIN
		(
			(
			SELECT
				SUM( DT607.C453 )
				, SUM( DT609.C720 )
				, MIN( DT607.C468 )
				, DT607.C463
				, DT607.C468
				, DT607.C453
				, DT608.C275
				, DT609.C720
			FROM
				(
					T23 DT608
				INNER JOIN
					(
						T60 DT609
					INNER JOIN
						(
							T12 DT606
						LEFT OUTER JOIN
							T41 DT607
						ON
							DT606.C158 = DT607.C463
						)
					ON
						DT609.C718 < DT607.C460
					)
				ON
					DT608.C273 = DT606.C162
				)
			WHERE
				(
					(
						DT609.C723 = DT609.C722
					)
					OR
					(
						(
							(
								(
									(
										DT609.C721 = DT607.C457
									)
									AND
									(
										DT609.C718 = DT609.C724
									)
								)
								OR
								(
									DT608.C272 > DT607.C455
								)
							)
							AND
							(
								DT606.C158 = DT609.C723
							)
						)
						OR
						(
							DT607.C460 <> DT606.C158
						)
					)
				)
				AND
				(
					DT607.C453 <> DT607.C465
				)
			GROUP BY
				DT607.C463
				, DT607.C453
				, DT608.C275
				, DT607.C468
				, DT609.C720
			ORDER BY
				SUM( DT607.C453 )
				, SUM( DT609.C720 )
				, MIN( DT607.C468 )
				, DT607.C463
				, DT607.C468
				, DT607.C453
				, DT608.C275
				, DT609.C720
			LIMIT 489
			) AS DT610 ( C1931, C1932, C1933, C1934, C1935, C1936, C1937, C1938 ) 
		RIGHT OUTER JOIN
			T57 DT604
		ON
			DT610.C1937 = DT604.C682
		)
	ON
		DT611.C102 = DT604.C695
	)
WHERE
	(
		(
			(
				DT604.C690 > DT611.C109
			)
			AND
			(
				DT611.C106 = DT611.C89
			)
		)
		OR
		(
			(
				DT604.C683 = DT610.C1932
			)
			AND
			(
				DT605.C584 <> DT604.C683
			)
		)
	)
	OR
	(
		DT605.C574 = DT611.C109
	)
GROUP BY
	DT611.C97
	, DT604.C691
	, DT605.C572
ORDER BY
	DT605.C572
	, SUM( DT605.C572 )
	, AVG( DT604.C691 )
	, DT604.C691
LIMIT 741;


SELECT
	COUNT( DT612.C602 )
FROM
	(
		T68 DT613
	INNER JOIN
		T50 DT612
	ON
		DT613.C822 <> DT612.C603
	)
WHERE
	(
		(
			(
				DT613.C823 = DT612.C601
			)
			OR
			(
				DT612.C600 = DT612.C604
			)
		)
		OR
		(
			(
				DT612.C600 <> DT613.C821
			)
			AND
			(
				DT612.C605 > DT612.C604
			)
		)
	)
	AND
	(
		(
			(
				DT612.C606 = DT612.C601
			)
			OR
			(
				DT612.C600 = DT612.C605
			)
		)
		OR
		(
			(
				DT612.C602 > DT613.C823
			)
			AND
			(
				DT612.C605 = DT612.C601
			)
		)
	)
GROUP BY
	DT612.C602
	, DT613.C823
	, DT612.C607
ORDER BY
	COUNT( DT612.C602 )
LIMIT 384;


SELECT
	DT615.C1136
	, DT614.C280
	, DT615.C1141
	, DT614.C281
	, DT615.C1140
	, DT615.C1139
	, DT614.C279
	, DT615.C1144
	, DT615.C1137
	, DT615.C1142
	, DT615.C1138
	, DT615.C1143
	, DT614.C282
FROM
	(
		T24 DT614
	INNER JOIN
		T93 DT615
	ON
		DT614.C281 = DT615.C1143
	)
WHERE
	(
		(
			(
				DT615.C1139 < DT615.C1142
			)
			AND
			(
				DT615.C1136 = DT614.C279
			)
		)
		AND
		(
			DT614.C281 > DT614.C280
		)
	)
	AND
	(
		(
			DT615.C1140 <> DT614.C279
		)
		OR
		(
			DT614.C282 < DT614.C279
		)
	)
ORDER BY
	DT615.C1136
	, DT614.C280
	, DT615.C1141
	, DT614.C281
	, DT615.C1140
	, DT615.C1139
	, DT614.C279
	, DT615.C1144
	, DT615.C1137
	, DT615.C1142
	, DT615.C1138
	, DT615.C1143
	, DT614.C282
LIMIT 456;


SELECT
	DT622.C1960
	, COUNT( DT622.C1955 )
	, COUNT( DT622.C1954 )
	, MIN( DT622.C1960 )
	, DT622.C1954
FROM
	(
		(
		SELECT
			SUM( DT616.C384 )
			, DT621.C1948
			, SUM( DT621.C1949 )
			, DT616.C384
			, DT621.C1950
			, DT616.C389
			, DT621.C1949
			, COUNT( DT621.C1950 )
		FROM
			(
				T33 DT616
			INNER JOIN
				(
				SELECT
					MIN( DT619.C263 )
					, COUNT( DT618.C717 )
					, DT618.C717
				FROM
					(
						T22 DT619
					INNER JOIN
						(
							(
								T23 DT617
							INNER JOIN
								T60 DT618
							ON
								DT617.C273 > DT618.C721
							)
						INNER JOIN
							T14 DT620
						ON
							DT617.C276 = DT620.C180
						)
					ON
						DT619.C266 > DT618.C724
					)
				WHERE
					(
						DT617.C274 < DT617.C275
					)
					AND
					(
						(
							DT619.C259 = DT618.C724
						)
						AND
						(
							(
								DT619.C262 = DT619.C259
							)
							AND
							(
								(
									DT619.C261 = DT620.C185
								)
								OR
								(
									(
										DT618.C717 > DT617.C271
									)
									OR
									(
										DT619.C261 < DT619.C265
									)
								)
							)
						)
					)
				GROUP BY
					DT617.C273
					, DT618.C717
					, DT618.C722
					, DT617.C274
					, DT619.C263
				ORDER BY
					MIN( DT619.C263 )
					, COUNT( DT618.C717 )
					, DT618.C717
				LIMIT 208
				)  DT621 ( C1948, C1949, C1950 ) 
			ON
				DT616.C394 > DT621.C1948
			)
		WHERE
			(
				(
					DT616.C398 > DT616.C392
				)
				AND
				(
					(
						(
							DT616.C387 <> DT616.C398
						)
						OR
						(
							(
								DT616.C393 < DT616.C387
							)
							OR
							(
								DT616.C388 = DT616.C385
							)
						)
					)
					OR
					(
						DT616.C392 = DT616.C386
					)
				)
			)
			AND
			(
				(
					DT621.C1950 = DT616.C386
				)
				OR
				(
					DT616.C400 = DT616.C387
				)
			)
		GROUP BY
			DT621.C1948
			, DT621.C1950
			, DT621.C1949
			, DT616.C389
			, DT616.C384
		ORDER BY
			SUM( DT616.C384 )
			, DT621.C1948
			, SUM( DT621.C1949 )
			, DT616.C384
			, DT621.C1950
			, DT616.C389
			, DT621.C1949
			, COUNT( DT621.C1950 )
		LIMIT 969
		)  DT622 ( C1954, C1955, C1956, C1957, C1958, C1959, C1960, C1961 ) 
	RIGHT OUTER JOIN
		T25 DT623
	ON
		DT622.C1954 > DT623.C295
	)
WHERE
	(
		(
			(
				DT622.C1961 = DT623.C288
			)
			OR
			(
				DT622.C1957 = DT623.C296
			)
		)
		AND
		(
			DT622.C1955 < DT623.C296
		)
	)
	AND
	(
		(
			(
				DT622.C1956 = DT622.C1961
			)
			OR
			(
				(
					DT623.C286 < DT622.C1957
				)
				OR
				(
					DT622.C1955 <> DT623.C294
				)
			)
		)
		OR
		(
			DT623.C288 = DT623.C289
		)
	)
GROUP BY
	DT622.C1955
	, DT622.C1960
	, DT622.C1954
ORDER BY
	DT622.C1960
	, COUNT( DT622.C1955 )
	, COUNT( DT622.C1954 )
	, MIN( DT622.C1960 )
	, DT622.C1954
LIMIT 865;


SELECT
	DT640.C2013
	, DT640.C1998
FROM
	(
		(
			(
			SELECT
				DT633.C1980
				, DT627.C1968
				, DT627.C1970
				, DT627.C1971
				, DT634.C941
				, DT627.C1969
				, DT634.C938
				, DT634.C943
				, DT633.C1981
				, DT633.C1978
				, DT634.C942
				, DT634.C946
				, DT634.C944
				, DT633.C1982
			FROM
				(
					(
					SELECT
						DT628.C788
						, DT628.C787
						, DT628.C789
						, AVG( DT628.C788 )
						, DT628.C786
						, SUM( DT628.C789 )
					FROM
						(
							T65 DT628
						INNER JOIN
							(
							SELECT
								DT630.C644
							FROM
								(
									T6 DT631
								INNER JOIN
									(
										T53 DT630
									INNER JOIN
										T59 DT629
									ON
										DT630.C643 < DT629.C716
									)
								ON
									DT631.C80 <> DT630.C652
								)
							WHERE
								(
									(
										(
											(
												DT630.C649 = DT630.C636
											)
											AND
											(
												DT630.C645 = DT631.C87
											)
										)
										AND
										(
											DT630.C647 <> DT630.C640
										)
									)
									AND
									(
										DT629.C715 = DT630.C640
									)
								)
								OR
								(
									(
										(
											(
												DT630.C653 = DT629.C713
											)
											AND
											(
												DT630.C638 > DT630.C636
											)
										)
										OR
										(
											DT631.C88 > DT631.C82
										)
									)
									AND
									(
										DT631.C85 > DT629.C713
									)
								)
							GROUP BY
								DT631.C88
								, DT630.C636
								, DT630.C644
							ORDER BY
								DT630.C644
							LIMIT 804
							) AS DT632 ( C1974 ) 
						ON
							DT628.C786 > DT632.C1974
						)
					WHERE
						(
							(
								DT628.C795 = DT628.C793
							)
							OR
							(
								(
									DT628.C791 > DT628.C793
								)
								AND
								(
									(
										DT628.C789 <> DT628.C791
									)
									AND
									(
										DT628.C790 < DT628.C783
									)
								)
							)
						)
						AND
						(
							(
								DT628.C788 = DT632.C1974
							)
							OR
							(
								(
									DT628.C784 > DT628.C791
								)
								OR
								(
									DT628.C795 = DT628.C783
								)
							)
						)
					GROUP BY
						DT628.C787
						, DT628.C789
						, DT628.C788
						, DT628.C786
					ORDER BY
						DT628.C788
						, DT628.C787
						, DT628.C789
						, AVG( DT628.C788 )
						, DT628.C786
						, SUM( DT628.C789 )
					LIMIT 793
					) AS DT633 ( C1977, C1978, C1979, C1980, C1981, C1982 ) 
				INNER JOIN
					(
						T76 DT634
					INNER JOIN
						(
						SELECT
							DT625.C569
							, DT625.C583
							, MAX( DT625.C569 )
							, MAX( DT624.C62 )
							, DT625.C575
						FROM
							(
								(
									T27 DT626
								INNER JOIN
									T48 DT625
								ON
									DT626.C325 <> DT625.C570
								)
							INNER JOIN
								T4 DT624
							ON
								DT625.C568 = DT624.C63
							)
						WHERE
							(
								DT624.C54 = DT626.C320
							)
							AND
							(
								(
									(
										DT626.C326 < DT624.C54
									)
									AND
									(
										DT625.C571 < DT624.C64
									)
								)
								AND
								(
									(
										(
											(
												DT626.C327 = DT624.C61
											)
											OR
											(
												DT625.C585 = DT625.C582
											)
										)
										AND
										(
											DT624.C53 = DT624.C60
										)
									)
									AND
									(
										DT624.C60 = DT625.C585
									)
								)
							)
						GROUP BY
							DT624.C62
							, DT625.C583
							, DT625.C575
							, DT625.C569
						ORDER BY
							DT625.C569
							, DT625.C583
							, MAX( DT625.C569 )
							, MAX( DT624.C62 )
							, DT625.C575
						LIMIT 628
						) AS DT627 ( C1967, C1968, C1969, C1970, C1971 ) 
					ON
						DT634.C944 > DT627.C1967
					)
				ON
					DT633.C1978 = DT634.C942
				)
			WHERE
				(
					(
						DT633.C1978 > DT633.C1979
					)
					AND
					(
						DT633.C1981 <> DT633.C1982
					)
				)
				OR
				(
					(
						(
							DT633.C1980 = DT627.C1969
						)
						OR
						(
							DT633.C1978 = DT627.C1971
						)
					)
					OR
					(
						(
							DT633.C1980 = DT633.C1981
						)
						AND
						(
							(
								DT627.C1967 = DT634.C943
							)
							AND
							(
								DT633.C1977 = DT633.C1980
							)
						)
					)
				)
			ORDER BY
				DT633.C1980
				, DT627.C1968
				, DT627.C1970
				, DT627.C1971
				, DT634.C941
				, DT627.C1969
				, DT634.C938
				, DT634.C943
				, DT633.C1981
				, DT633.C1978
				, DT634.C942
				, DT634.C946
				, DT634.C944
				, DT633.C1982
			LIMIT 638
			)  DT635 ( C1983, C1984, C1985, C1986, C1987, C1988, C1989, C1990, C1991, C1992, C1993, C1994, C1995, C1996 ) 
		INNER JOIN
			(
				(
				SELECT
					DT639.C312
					, DT638.C998
					, DT639.C303
					, DT637.C178
					, DT637.C167
					, DT637.C176
					, DT639.C308
					, DT639.C298
					, DT639.C300
					, DT639.C313
					, DT637.C177
					, DT638.C1000
					, DT639.C299
					, DT637.C170
					, DT637.C175
					, DT637.C179
					, DT637.C165
					, DT637.C173
					, DT637.C174
					, DT637.C168
					, DT639.C304
					, DT639.C309
					, DT638.C995
					, DT639.C307
					, DT639.C302
				FROM
					(
						T26 DT639
					INNER JOIN
						(
							T13 DT637
						INNER JOIN
							T82 DT638
						ON
							DT637.C172 <> DT638.C995
						)
					ON
						DT639.C312 <> DT638.C995
					)
				WHERE
					(
						(
							(
								DT639.C316 = DT637.C173
							)
							OR
							(
								DT639.C313 < DT637.C175
							)
						)
						OR
						(
							(
								DT639.C307 > DT639.C316
							)
							AND
							(
								DT639.C297 < DT639.C310
							)
						)
					)
					AND
					(
						(
							DT639.C304 > DT637.C179
						)
						AND
						(
							(
								DT639.C307 < DT639.C307
							)
							OR
							(
								DT639.C313 < DT639.C311
							)
						)
					)
				ORDER BY
					DT639.C312
					, DT638.C998
					, DT639.C303
					, DT637.C178
					, DT637.C167
					, DT637.C176
					, DT639.C308
					, DT639.C298
					, DT639.C300
					, DT639.C313
					, DT637.C177
					, DT638.C1000
					, DT639.C299
					, DT637.C170
					, DT637.C175
					, DT637.C179
					, DT637.C165
					, DT637.C173
					, DT637.C174
					, DT637.C168
					, DT639.C304
					, DT639.C309
					, DT638.C995
					, DT639.C307
					, DT639.C302
				LIMIT 525
				) AS DT640 ( C1997, C1998, C1999, C2000, C2001, C2002, C2003, C2004, C2005, C2006, C2007, C2008, C2009, C2010, C2011, C2012, C2013, C2014, C2015, C2016, C2017, C2018, C2019, C2020, C2021 ) 
			INNER JOIN
				T22 DT636
			ON
				DT640.C2005 < DT636.C267
			)
		ON
			DT635.C1995 = DT640.C2009
		)
	INNER JOIN
		T45 DT641
	ON
		DT636.C268 <> DT641.C525
	)
WHERE
	(
		DT640.C2021 > DT641.C512
	)
	AND
	(
		(
			(
				DT636.C266 < DT640.C1997
			)
			AND
			(
				DT641.C515 = DT641.C521
			)
		)
		AND
		(
			(
				DT641.C514 = DT640.C1997
			)
			AND
			(
				(
					DT641.C524 <> DT640.C2018
				)
				OR
				(
					(
						DT636.C261 <> DT640.C2016
					)
					OR
					(
						(
							DT635.C1984 = DT640.C2011
						)
						OR
						(
							DT635.C1990 > DT641.C516
						)
					)
				)
			)
		)
	)
GROUP BY
	DT640.C2013
	, DT635.C1995
	, DT636.C259
	, DT640.C1998
ORDER BY
	DT640.C2013
	, DT640.C1998
LIMIT 105;


SELECT
	DT665.C2101
	, COUNT( DT665.C2101 )
	, DT667.C644
	, MIN( DT667.C637 )
	, DT667.C638
	, DT655.C2083
FROM
	(
		(
			T53 DT667
		INNER JOIN
			(
				(
				SELECT
					MIN( DT659.C2090 )
					, MAX( DT664.C869 )
					, DT664.C885
				FROM
					(
						(
							(
							SELECT
								SUM( DT657.C2 )
								, DT657.C2
								, AVG( DT658.C543 )
								, DT656.C510
								, MAX( DT656.C510 )
							FROM
								(
									T44 DT656
								INNER JOIN
									(
										T0 DT657
									INNER JOIN
										T46 DT658
									ON
										DT657.C2 > DT658.C531
									)
								ON
									DT656.C505 = DT658.C539
								)
							WHERE
								(
									(
										(
											DT656.C504 = DT656.C508
										)
										AND
										(
											(
												DT658.C532 = DT657.C2
											)
											AND
											(
												DT656.C509 = DT656.C502
											)
										)
									)
									AND
									(
										DT657.C2 = DT658.C535
									)
								)
								AND
								(
									(
										(
											(
												DT658.C542 = DT658.C545
											)
											OR
											(
												DT656.C502 = DT657.C0
											)
										)
										AND
										(
											DT658.C538 > DT656.C507
										)
									)
									AND
									(
										DT658.C531 < DT657.C0
									)
								)
							GROUP BY
								DT656.C510
								, DT658.C543
								, DT658.C544
								, DT658.C542
								, DT657.C2
							ORDER BY
								SUM( DT657.C2 )
								, DT657.C2
								, AVG( DT658.C543 )
								, DT656.C510
								, MAX( DT656.C510 )
							LIMIT 781
							) AS DT659 ( C2088, C2089, C2090, C2091, C2092 ) 
						INNER JOIN
							T72 DT664
						ON
							DT659.C2091 = DT664.C886
						)
					INNER JOIN
						(
							T6 DT660
						RIGHT OUTER JOIN
							(
							SELECT
								SUM( DT662.C459 )
								, DT661.C865
							FROM
								(
									T41 DT662
								INNER JOIN
									T71 DT661
								ON
									DT662.C468 = DT661.C866
								)
							WHERE
								(
									DT661.C863 > DT662.C465
								)
								AND
								(
									(
										(
											(
												(
													DT661.C862 <> DT662.C451
												)
												AND
												(
													DT662.C464 > DT662.C461
												)
											)
											OR
											(
												DT662.C458 = DT662.C456
											)
										)
										OR
										(
											(
												DT662.C455 < DT662.C463
											)
											OR
											(
												DT662.C464 <> DT662.C465
											)
										)
									)
									OR
									(
										DT662.C472 = DT661.C863
									)
								)
							GROUP BY
								DT661.C865
								, DT662.C468
								, DT662.C472
								, DT662.C463
								, DT662.C459
							ORDER BY
								SUM( DT662.C459 )
								, DT661.C865
							LIMIT 995
							)  DT663 ( C2096, C2097 ) 
						ON
							DT660.C79 = DT663.C2097
						)
					ON
						DT664.C879 < DT660.C78
					)
				WHERE
					(
						(
							(
								DT664.C869 <> DT660.C85
							)
							AND
							(
								(
									(
										DT660.C84 = DT660.C82
									)
									OR
									(
										DT664.C868 < DT664.C882
									)
								)
								AND
								(
									DT659.C2089 < DT664.C874
								)
							)
						)
						OR
						(
							DT664.C877 > DT664.C875
						)
					)
					OR
					(
						DT663.C2096 = DT664.C869
					)
				GROUP BY
					DT664.C885
					, DT659.C2090
					, DT664.C869
				ORDER BY
					MIN( DT659.C2090 )
					, MAX( DT664.C869 )
					, DT664.C885
				LIMIT 373
				) AS DT665 ( C2100, C2101, C2102 ) 
			INNER JOIN
				T71 DT666
			ON
				DT665.C2100 = DT666.C865
			)
		ON
			DT667.C639 = DT666.C862
		)
	INNER JOIN
		(
		SELECT
			SUM( DT644.C2044 )
			, DT654.C2070
			, MAX( DT654.C2072 )
			, DT644.C2043
			, DT644.C2038
			, SUM( DT644.C2043 )
			, DT644.C2044
			, DT654.C2072
		FROM
			(
				(
				SELECT
					DT645.C29
					, COUNT( DT649.C2048 )
					, AVG( DT649.C2051 )
					, DT649.C2051
					, AVG( DT645.C29 )
					, DT649.C2048
					, DT649.C2047
				FROM
					(
						(
						SELECT
							DT650.C799
							, AVG( DT650.C799 )
							, AVG( DT651.C371 )
							, DT651.C371
							, AVG( DT651.C381 )
							, SUM( DT651.C375 )
							, DT651.C375
						FROM
							(
								T55 DT652
							INNER JOIN
								(
									T32 DT651
								INNER JOIN
									T66 DT650
								ON
									DT651.C367 < DT650.C808
								)
							ON
								DT652.C665 = DT651.C366
							)
						WHERE
							(
								(
									(
										DT651.C364 > DT650.C803
									)
									AND
									(
										(
											DT652.C665 < DT651.C377
										)
										AND
										(
											DT651.C367 = DT652.C658
										)
									)
								)
								OR
								(
									(
										DT650.C805 < DT650.C800
									)
									OR
									(
										DT651.C381 = DT651.C379
									)
								)
							)
							OR
							(
								(
									DT651.C367 < DT651.C367
								)
								AND
								(
									DT650.C800 = DT650.C807
								)
							)
						GROUP BY
							DT651.C381
							, DT650.C799
							, DT651.C371
							, DT651.C375
						ORDER BY
							DT650.C799
							, AVG( DT650.C799 )
							, AVG( DT651.C371 )
							, DT651.C371
							, AVG( DT651.C381 )
							, SUM( DT651.C375 )
							, DT651.C375
						LIMIT 796
						) AS DT653 ( C2056, C2057, C2058, C2059, C2060, C2061, C2062 ) 
					INNER JOIN
						(
							(
							SELECT
								DT646.C450
								, COUNT( DT647.C742 )
								, DT648.C993
								, DT647.C742
								, DT646.C448
							FROM
								(
									T81 DT648
								INNER JOIN
									(
										T62 DT647
									INNER JOIN
										T40 DT646
									ON
										DT647.C740 > DT646.C448
									)
								ON
									DT648.C993 < DT646.C447
								)
							WHERE
								(
									(
										(
											(
												(
													DT647.C741 = DT646.C448
												)
												OR
												(
													DT646.C450 > DT648.C990
												)
											)
											AND
											(
												DT646.C447 = DT648.C990
											)
										)
										OR
										(
											(
												DT647.C742 = DT646.C447
											)
											AND
											(
												DT646.C449 > DT648.C992
											)
										)
									)
									OR
									(
										DT646.C447 = DT648.C994
									)
								)
								AND
								(
									DT647.C740 = DT648.C993
								)
							GROUP BY
								DT647.C742
								, DT646.C450
								, DT648.C991
								, DT646.C448
								, DT648.C993
							ORDER BY
								DT646.C450
								, COUNT( DT647.C742 )
								, DT648.C993
								, DT647.C742
								, DT646.C448
							LIMIT 323
							) AS DT649 ( C2047, C2048, C2049, C2050, C2051 ) 
						INNER JOIN
							T2 DT645
						ON
							DT649.C2047 < DT645.C28
						)
					ON
						DT653.C2059 <> DT645.C17
					)
				WHERE
					(
						(
							(
								DT645.C30 > DT649.C2050
							)
							AND
							(
								DT653.C2059 = DT645.C21
							)
						)
						AND
						(
							(
								(
									DT645.C30 > DT645.C19
								)
								OR
								(
									DT645.C31 > DT653.C2056
								)
							)
							AND
							(
								DT645.C29 = DT653.C2062
							)
						)
					)
					AND
					(
						DT653.C2060 > DT645.C16
					)
				GROUP BY
					DT645.C16
					, DT645.C29
					, DT649.C2048
					, DT649.C2051
					, DT649.C2047
				ORDER BY
					DT645.C29
					, COUNT( DT649.C2048 )
					, AVG( DT649.C2051 )
					, DT649.C2051
					, AVG( DT645.C29 )
					, DT649.C2048
					, DT649.C2047
				LIMIT 502
				)  DT654 ( C2066, C2067, C2068, C2069, C2070, C2071, C2072 ) 
			INNER JOIN
				(
				SELECT
					DT643.C579
					, DT643.C581
					, DT643.C576
					, DT642.C861
					, DT643.C574
					, DT643.C573
					, DT643.C584
					, DT643.C568
					, DT643.C580
					, DT642.C865
					, DT643.C571
					, DT642.C864
					, DT642.C863
					, DT642.C866
					, DT643.C572
					, DT643.C577
					, DT643.C585
					, DT643.C575
					, DT642.C862
					, DT643.C578
					, DT643.C583
				FROM
					(
						T48 DT643
					INNER JOIN
						T71 DT642
					ON
						DT643.C568 = DT642.C865
					)
				WHERE
					(
						(
							DT643.C568 = DT643.C585
						)
						OR
						(
							DT643.C583 = DT643.C573
						)
					)
					AND
					(
						(
							(
								(
									DT643.C575 = DT643.C576
								)
								AND
								(
									DT643.C577 < DT643.C570
								)
							)
							OR
							(
								DT643.C577 > DT643.C582
							)
						)
						AND
						(
							DT642.C865 = DT643.C576
						)
					)
				ORDER BY
					DT643.C579
					, DT643.C581
					, DT643.C576
					, DT642.C861
					, DT643.C574
					, DT643.C573
					, DT643.C584
					, DT643.C568
					, DT643.C580
					, DT642.C865
					, DT643.C571
					, DT642.C864
					, DT642.C863
					, DT642.C866
					, DT643.C572
					, DT643.C577
					, DT643.C585
					, DT643.C575
					, DT642.C862
					, DT643.C578
					, DT643.C583
				LIMIT 273
				) AS DT644 ( C2024, C2025, C2026, C2027, C2028, C2029, C2030, C2031, C2032, C2033, C2034, C2035, C2036, C2037, C2038, C2039, C2040, C2041, C2042, C2043, C2044 ) 
			ON
				DT654.C2069 = DT644.C2034
			)
		WHERE
			(
				(
					(
						DT644.C2027 <> DT644.C2044
					)
					OR
					(
						DT644.C2038 = DT644.C2030
					)
				)
				AND
				(
					(
						DT644.C2033 > DT644.C2041
					)
					OR
					(
						DT644.C2030 = DT644.C2033
					)
				)
			)
			AND
			(
				(
					DT644.C2042 = DT644.C2025
				)
				OR
				(
					DT644.C2028 = DT644.C2039
				)
			)
		GROUP BY
			DT644.C2043
			, DT654.C2072
			, DT644.C2038
			, DT644.C2044
			, DT654.C2070
		ORDER BY
			SUM( DT644.C2044 )
			, DT654.C2070
			, MAX( DT654.C2072 )
			, DT644.C2043
			, DT644.C2038
			, SUM( DT644.C2043 )
			, DT644.C2044
			, DT654.C2072
		LIMIT 317
		)  DT655 ( C2077, C2078, C2079, C2080, C2081, C2082, C2083, C2084 ) 
	ON
		DT666.C866 < DT655.C2078
	)
WHERE
	(
		(
			DT655.C2077 > DT666.C866
		)
		OR
		(
			DT667.C647 = DT666.C860
		)
	)
	OR
	(
		(
			DT667.C645 > DT655.C2078
		)
		AND
		(
			(
				DT655.C2080 = DT666.C866
			)
			OR
			(
				(
					(
						DT665.C2101 > DT666.C860
					)
					OR
					(
						DT667.C651 = DT666.C866
					)
				)
				AND
				(
					DT667.C648 = DT655.C2080
				)
			)
		)
	)
GROUP BY
	DT667.C644
	, DT667.C637
	, DT655.C2083
	, DT667.C638
	, DT665.C2101
ORDER BY
	DT665.C2101
	, COUNT( DT665.C2101 )
	, DT667.C644
	, MIN( DT667.C637 )
	, DT667.C638
	, DT655.C2083
LIMIT 782;


SELECT
	DT668.C741
	, COUNT( DT668.C741 )
	, DT668.C742
	, DT669.C281
FROM
	(
		T24 DT669
	INNER JOIN
		T62 DT668
	ON
		DT669.C282 <> DT668.C740
	)
WHERE
	(
		(
			DT668.C741 <> DT669.C279
		)
		AND
		(
			(
				(
					DT669.C280 <> DT669.C279
				)
				OR
				(
					DT669.C281 < DT669.C279
				)
			)
			OR
			(
				DT669.C282 = DT669.C281
			)
		)
	)
	OR
	(
		(
			DT669.C282 < DT669.C279
		)
		AND
		(
			(
				DT668.C741 = DT669.C281
			)
			AND
			(
				DT669.C279 <> DT668.C740
			)
		)
	)
GROUP BY
	DT668.C741
	, DT669.C281
	, DT668.C742
ORDER BY
	DT668.C741
	, COUNT( DT668.C741 )
	, DT668.C742
	, DT669.C281
LIMIT 433;


SELECT
	SUM( DT677.C984 )
	, MAX( DT675.C2118 )
	, DT675.C2118
	, DT677.C984
FROM
	(
		(
			(
				(
				SELECT
					AVG( DT685.C18 )
					, DT685.C31
				FROM
					(
						T2 DT685
					INNER JOIN
						(
						SELECT
							COUNT( DT681.C2127 )
							, DT681.C2127
							, DT682.C370
						FROM
							(
								T32 DT682
							INNER JOIN
								(
									(
									SELECT
										DT678.C769
										, MIN( DT679.C1099 )
										, DT678.C781
										, DT679.C1099
									FROM
										(
											(
												T64 DT678
											INNER JOIN
												T0 DT680
											ON
												DT678.C772 > DT680.C1
											)
										INNER JOIN
											T91 DT679
										ON
											DT678.C775 = DT679.C1094
										)
									WHERE
										(
											(
												(
													DT680.C0 = DT678.C771
												)
												AND
												(
													(
														DT678.C774 = DT678.C774
													)
													AND
													(
														DT679.C1094 < DT679.C1114
													)
												)
											)
											AND
											(
												DT679.C1098 = DT680.C0
											)
										)
										AND
										(
											(
												DT679.C1098 = DT678.C773
											)
											AND
											(
												DT679.C1109 <> DT678.C770
											)
										)
									GROUP BY
										DT679.C1099
										, DT678.C769
										, DT678.C781
									ORDER BY
										DT678.C769
										, MIN( DT679.C1099 )
										, DT678.C781
										, DT679.C1099
									LIMIT 579
									) AS DT681 ( C2124, C2125, C2126, C2127 ) 
								RIGHT OUTER JOIN
									T87 DT683
								ON
									DT681.C2126 = DT683.C1062
								)
							ON
								DT682.C372 > DT683.C1057
							)
						WHERE
							(
								(
									DT683.C1060 < DT683.C1061
								)
								OR
								(
									DT682.C375 > DT682.C373
								)
							)
							AND
							(
								(
									(
										DT682.C369 = DT681.C2125
									)
									OR
									(
										DT683.C1060 <> DT682.C365
									)
								)
								OR
								(
									DT683.C1063 > DT682.C378
								)
							)
						GROUP BY
							DT682.C370
							, DT681.C2127
						ORDER BY
							COUNT( DT681.C2127 )
							, DT681.C2127
							, DT682.C370
						LIMIT 652
						) AS DT684 ( C2130, C2131, C2132 ) 
					ON
						DT685.C15 > DT684.C2132
					)
				WHERE
					(
						DT684.C2130 > DT685.C26
					)
					AND
					(
						(
							(
								DT685.C23 <> DT685.C30
							)
							OR
							(
								DT685.C18 < DT685.C19
							)
						)
						AND
						(
							(
								DT685.C17 = DT685.C25
							)
							AND
							(
								DT684.C2130 = DT685.C31
							)
						)
					)
				GROUP BY
					DT685.C31
					, DT685.C18
				ORDER BY
					AVG( DT685.C18 )
					, DT685.C31
				LIMIT 803
				)  DT686 ( C2134, C2135 ) 
			INNER JOIN
				(
				SELECT
					DT674.C599
					, DT674.C591
					, DT670.C820
					, DT670.C817
				FROM
					(
						(
						SELECT
							MAX( DT672.C498 )
							, DT671.C342
							, SUM( DT672.C487 )
							, DT671.C341
						FROM
							(
								T43 DT672
							INNER JOIN
								T30 DT671
							ON
								DT672.C489 = DT671.C341
							)
						WHERE
							(
								(
									(
										(
											DT672.C493 = DT672.C498
										)
										AND
										(
											DT672.C500 < DT672.C495
										)
									)
									AND
									(
										DT672.C499 <> DT672.C490
									)
								)
								AND
								(
									(
										(
											DT672.C501 = DT672.C496
										)
										OR
										(
											DT671.C343 < DT672.C496
										)
									)
									AND
									(
										DT672.C501 < DT672.C497
									)
								)
							)
							AND
							(
								(
									DT672.C489 < DT672.C500
								)
								OR
								(
									DT672.C491 <> DT672.C495
								)
							)
						GROUP BY
							DT672.C495
							, DT671.C341
							, DT672.C498
							, DT671.C342
							, DT672.C487
						ORDER BY
							MAX( DT672.C498 )
							, DT671.C342
							, SUM( DT672.C487 )
							, DT671.C341
						LIMIT 997
						) AS DT673 ( C2111, C2112, C2113, C2114 ) 
					INNER JOIN
						(
							T67 DT670
						INNER JOIN
							T49 DT674
						ON
							DT670.C812 = DT674.C587
						)
					ON
						DT673.C2113 = DT674.C595
					)
				WHERE
					(
						(
							DT674.C595 > DT674.C599
						)
						OR
						(
							(
								DT674.C597 = DT670.C816
							)
							AND
							(
								(
									DT670.C819 < DT674.C592
								)
								OR
								(
									DT674.C596 <> DT674.C587
								)
							)
						)
					)
					AND
					(
						(
							(
								DT670.C813 < DT670.C817
							)
							OR
							(
								DT674.C595 = DT670.C810
							)
						)
						AND
						(
							(
								DT670.C818 < DT674.C598
							)
							OR
							(
								DT670.C815 > DT674.C590
							)
						)
					)
				GROUP BY
					DT674.C591
					, DT670.C817
					, DT670.C815
					, DT674.C599
					, DT670.C820
				ORDER BY
					DT674.C599
					, DT674.C591
					, DT670.C820
					, DT670.C817
				LIMIT 754
				) AS DT675 ( C2118, C2119, C2120, C2121 ) 
			ON
				DT686.C2134 = DT675.C2120
			)
		INNER JOIN
			T87 DT676
		ON
			DT686.C2134 = DT676.C1059
		)
	LEFT OUTER JOIN
		T79 DT677
	ON
		DT676.C1056 = DT677.C985
	)
WHERE
	(
		DT675.C2121 > DT677.C985
	)
	OR
	(
		(
			DT686.C2135 > DT677.C985
		)
		AND
		(
			(
				DT677.C984 < DT686.C2135
			)
			AND
			(
				(
					DT675.C2119 < DT677.C983
				)
				AND
				(
					DT675.C2119 = DT686.C2134
				)
			)
		)
	)
GROUP BY
	DT677.C984
	, DT675.C2118
ORDER BY
	SUM( DT677.C984 )
	, MAX( DT675.C2118 )
	, DT675.C2118
	, DT677.C984
LIMIT 422;


SELECT
	AVG( DT687.C365 )
	, DT688.C440
	, DT687.C365
	, DT698.C124
FROM
	(
		T32 DT687
	INNER JOIN
		(
			(
				T8 DT698
			INNER JOIN
				T37 DT688
			ON
				DT698.C112 = DT688.C439
			)
		INNER JOIN
			(
			SELECT
				MAX( DT695.C1150 )
				, MAX( DT695.C1166 )
				, DT694.C1175
				, DT695.C1150
				, DT695.C1166
			FROM
				(
					(
						(
							T94 DT695
						INNER JOIN
							(
							SELECT
								MAX( DT691.C209 )
								, DT691.C216
							FROM
								(
									(
										T87 DT690
									INNER JOIN
										T7 DT692
									ON
										DT690.C1057 <> DT692.C90
									)
								LEFT OUTER JOIN
									(
										T17 DT691
									INNER JOIN
										T21 DT689
									ON
										DT691.C209 = DT689.C250
									)
								ON
									DT692.C106 = DT691.C212
								)
							WHERE
								(
									(
										DT689.C256 > DT691.C215
									)
									AND
									(
										DT692.C100 = DT692.C95
									)
								)
								OR
								(
									(
										DT691.C213 <> DT690.C1061
									)
									OR
									(
										(
											(
												DT690.C1062 = DT691.C212
											)
											AND
											(
												DT692.C94 < DT689.C258
											)
										)
										AND
										(
											(
												DT689.C253 < DT691.C213
											)
											AND
											(
												DT689.C257 < DT689.C249
											)
										)
									)
								)
							GROUP BY
								DT691.C209
								, DT690.C1059
								, DT692.C105
								, DT691.C216
								, DT692.C103
							ORDER BY
								MAX( DT691.C209 )
								, DT691.C216
							LIMIT 226
							) AS DT693 ( C2142, C2143 ) 
						ON
							DT695.C1166 = DT693.C2143
						)
					INNER JOIN
						T95 DT694
					ON
						DT695.C1147 > DT694.C1172
					)
				INNER JOIN
					T23 DT696
				ON
					DT695.C1147 < DT696.C278
				)
			WHERE
				(
					DT696.C276 = DT695.C1153
				)
				AND
				(
					(
						DT695.C1165 = DT695.C1147
					)
					AND
					(
						(
							DT696.C277 <> DT694.C1168
						)
						AND
						(
							(
								DT695.C1152 <> DT696.C271
							)
							OR
							(
								DT694.C1167 <> DT696.C270
							)
						)
					)
				)
			GROUP BY
				DT696.C273
				, DT695.C1166
				, DT695.C1150
				, DT694.C1175
			ORDER BY
				MAX( DT695.C1150 )
				, MAX( DT695.C1166 )
				, DT694.C1175
				, DT695.C1150
				, DT695.C1166
			LIMIT 785
			) AS DT697 ( C2146, C2147, C2148, C2149, C2150 ) 
		ON
			DT688.C439 = DT697.C2149
		)
	ON
		DT687.C365 = DT698.C110
	)
WHERE
	(
		(
			(
				DT698.C123 = DT687.C372
			)
			OR
			(
				(
					(
						DT697.C2150 > DT688.C438
					)
					AND
					(
						DT698.C120 = DT698.C120
					)
				)
				OR
				(
					DT698.C117 > DT687.C372
				)
			)
		)
		AND
		(
			(
				DT687.C370 = DT687.C367
			)
			AND
			(
				DT688.C439 = DT687.C380
			)
		)
	)
	AND
	(
		DT698.C123 > DT698.C114
	)
GROUP BY
	DT688.C438
	, DT688.C440
	, DT687.C365
	, DT698.C124
	, DT687.C377
ORDER BY
	AVG( DT687.C365 )
	, DT688.C440
	, DT687.C365
	, DT698.C124
LIMIT 637;


SELECT
	DT703.C392
	, SUM( DT702.C2161 )
	, MAX( DT703.C388 )
	, DT702.C2161
	, DT703.C388
FROM
	(
		(
		SELECT
			COUNT( DT701.C884 )
			, DT701.C884
			, AVG( DT699.C72 )
			, MAX( DT700.C1066 )
			, MIN( DT700.C1068 )
		FROM
			(
				(
					T72 DT701
				INNER JOIN
					T88 DT700
				ON
					DT701.C870 < DT700.C1067
				)
			INNER JOIN
				T5 DT699
			ON
				DT701.C883 = DT699.C71
			)
		WHERE
			(
				(
					(
						DT700.C1072 = DT701.C880
					)
					AND
					(
						DT701.C882 = DT699.C67
					)
				)
				OR
				(
					(
						DT699.C74 <> DT699.C69
					)
					AND
					(
						DT700.C1067 <> DT701.C883
					)
				)
			)
			AND
			(
				(
					DT700.C1067 = DT699.C73
				)
				AND
				(
					DT700.C1064 < DT701.C878
				)
			)
		GROUP BY
			DT701.C884
			, DT700.C1068
			, DT700.C1066
			, DT699.C72
		ORDER BY
			COUNT( DT701.C884 )
			, DT701.C884
			, AVG( DT699.C72 )
			, MAX( DT700.C1066 )
			, MIN( DT700.C1068 )
		LIMIT 122
		)  DT702 ( C2159, C2160, C2161, C2162, C2163 ) 
	INNER JOIN
		T33 DT703
	ON
		DT702.C2159 = DT703.C390
	)
WHERE
	(
		DT703.C389 = DT703.C393
	)
	OR
	(
		(
			DT703.C388 <> DT702.C2163
		)
		OR
		(
			(
				(
					DT702.C2160 > DT703.C386
				)
				AND
				(
					(
						DT702.C2161 = DT703.C392
					)
					AND
					(
						DT703.C385 <> DT702.C2162
					)
				)
			)
			AND
			(
				DT703.C385 > DT703.C397
			)
		)
	)
GROUP BY
	DT703.C392
	, DT703.C388
	, DT703.C395
	, DT702.C2161
ORDER BY
	DT703.C392
	, SUM( DT702.C2161 )
	, MAX( DT703.C388 )
	, DT702.C2161
	, DT703.C388
LIMIT 345;


SELECT
	DT704.C534
	, MIN( DT704.C534 )
	, DT704.C528
FROM
	(
		T82 DT707
	INNER JOIN
		(
			T79 DT705
		INNER JOIN
			(
				T46 DT704
			INNER JOIN
				T59 DT706
			ON
				DT704.C536 > DT706.C715
			)
		ON
			DT705.C982 > DT704.C529
		)
	ON
		DT707.C995 < DT704.C537
	)
WHERE
	(
		(
			(
				DT704.C545 > DT707.C999
			)
			AND
			(
				DT707.C997 = DT704.C547
			)
		)
		OR
		(
			DT707.C998 <> DT705.C984
		)
	)
	AND
	(
		(
			(
				DT705.C985 = DT707.C995
			)
			AND
			(
				(
					DT707.C998 = DT706.C713
				)
				AND
				(
					DT704.C531 <> DT704.C532
				)
			)
		)
		OR
		(
			DT704.C532 = DT705.C980
		)
	)
GROUP BY
	DT704.C534
	, DT704.C528
ORDER BY
	DT704.C534
	, MIN( DT704.C534 )
	, DT704.C528
LIMIT 435;


SELECT
	DT708.C360
FROM
	(
		(
			(
			SELECT
				DT713.C488
				, DT712.C2172
				, COUNT( DT713.C488 )
				, DT712.C2173
			FROM
				(
					T43 DT713
				INNER JOIN
					(
					SELECT
						MAX( DT710.C426 )
						, COUNT( DT711.C163 )
						, DT711.C163
						, DT710.C426
					FROM
						(
							T12 DT711
						LEFT OUTER JOIN
							T36 DT710
						ON
							DT711.C157 = DT710.C437
						)
					WHERE
						(
							(
								(
									DT710.C436 < DT710.C426
								)
								AND
								(
									DT710.C422 <> DT710.C419
								)
							)
							AND
							(
								(
									(
										DT711.C160 = DT710.C432
									)
									AND
									(
										DT710.C429 <> DT710.C431
									)
								)
								OR
								(
									(
										DT710.C428 <> DT711.C158
									)
									AND
									(
										DT710.C436 <> DT711.C157
									)
								)
							)
						)
						OR
						(
							(
								DT711.C158 = DT710.C437
							)
							OR
							(
								DT710.C431 < DT710.C423
							)
						)
					GROUP BY
						DT710.C426
						, DT711.C163
					ORDER BY
						MAX( DT710.C426 )
						, COUNT( DT711.C163 )
						, DT711.C163
						, DT710.C426
					LIMIT 782
					) AS DT712 ( C2170, C2171, C2172, C2173 ) 
				ON
					DT713.C488 > DT712.C2173
				)
			WHERE
				(
					(
						DT713.C500 > DT713.C491
					)
					OR
					(
						(
							DT713.C493 = DT713.C495
						)
						AND
						(
							DT713.C490 > DT713.C501
						)
					)
				)
				OR
				(
					(
						DT713.C501 = DT713.C492
					)
					OR
					(
						(
							DT713.C490 <> DT712.C2171
						)
						AND
						(
							DT712.C2170 <> DT713.C493
						)
					)
				)
			GROUP BY
				DT712.C2173
				, DT712.C2172
				, DT713.C488
			ORDER BY
				DT713.C488
				, DT712.C2172
				, COUNT( DT713.C488 )
				, DT712.C2173
			LIMIT 281
			)  DT714 ( C2175, C2176, C2177, C2178 ) 
		INNER JOIN
			T11 DT709
		ON
			DT714.C2177 = DT709.C156
		)
	INNER JOIN
		(
			T31 DT708
		INNER JOIN
			(
			SELECT
				DT716.C750
				, DT717.C12
				, COUNT( DT716.C750 )
			FROM
				(
					(
						T11 DT715
					LEFT OUTER JOIN
						T63 DT716
					ON
						DT715.C156 = DT716.C754
					)
				INNER JOIN
					(
						T1 DT717
					INNER JOIN
						T2 DT718
					ON
						DT717.C7 <> DT718.C15
					)
				ON
					DT716.C763 = DT717.C4
				)
			WHERE
				(
					(
						(
							DT718.C26 = DT716.C745
						)
						OR
						(
							DT716.C748 > DT716.C751
						)
					)
					OR
					(
						DT715.C154 = DT716.C753
					)
				)
				OR
				(
					(
						DT718.C27 <> DT716.C746
					)
					AND
					(
						DT716.C758 < DT715.C153
					)
				)
			GROUP BY
				DT717.C12
				, DT716.C750
			ORDER BY
				DT716.C750
				, DT717.C12
				, COUNT( DT716.C750 )
			LIMIT 949
			)  DT719 ( C2181, C2182, C2183 ) 
		ON
			DT708.C355 > DT719.C2181
		)
	ON
		DT714.C2175 = DT708.C349
	)
WHERE
	(
		(
			(
				DT719.C2182 < DT708.C346
			)
			AND
			(
				DT708.C345 < DT708.C353
			)
		)
		OR
		(
			(
				(
					DT708.C350 = DT708.C346
				)
				OR
				(
					DT708.C362 = DT709.C154
				)
			)
			OR
			(
				DT708.C347 = DT714.C2177
			)
		)
	)
	OR
	(
		DT708.C363 = DT708.C356
	)
GROUP BY
	DT708.C362
	, DT708.C358
	, DT708.C352
	, DT708.C348
	, DT708.C360
ORDER BY
	DT708.C360
LIMIT 489;


SELECT
	AVG( DT727.C662 )
	, DT727.C660
	, DT720.C676
	, DT727.C662
	, DT720.C673
FROM
	(
		T56 DT720
	INNER JOIN
		(
			(
			SELECT
				DT724.C2189
				, DT724.C2190
				, MIN( DT725.C440 )
				, AVG( DT725.C439 )
				, DT725.C439
				, DT725.C440
			FROM
				(
					T37 DT725
				INNER JOIN
					(
					SELECT
						DT722.C693
						, COUNT( DT722.C697 )
					FROM
						(
							T24 DT721
						INNER JOIN
							(
								T76 DT723
							INNER JOIN
								T57 DT722
							ON
								DT723.C945 < DT722.C688
							)
						ON
							DT721.C280 < DT723.C938
						)
					WHERE
						(
							(
								DT722.C683 = DT723.C942
							)
							AND
							(
								(
									DT723.C944 = DT722.C689
								)
								AND
								(
									DT721.C281 = DT723.C939
								)
							)
						)
						AND
						(
							(
								(
									DT722.C682 = DT723.C945
								)
								OR
								(
									DT722.C697 = DT722.C684
								)
							)
							OR
							(
								(
									DT722.C694 < DT722.C687
								)
								AND
								(
									DT723.C942 <> DT722.C694
								)
							)
						)
					GROUP BY
						DT722.C697
						, DT722.C693
						, DT721.C282
					ORDER BY
						DT722.C693
						, COUNT( DT722.C697 )
					LIMIT 902
					)  DT724 ( C2189, C2190 ) 
				ON
					DT725.C440 <> DT724.C2189
				)
			WHERE
				(
					DT725.C440 = DT724.C2189
				)
				AND
				(
					(
						(
							DT725.C440 = DT725.C440
						)
						OR
						(
							DT725.C440 <> DT725.C438
						)
					)
					AND
					(
						(
							(
								DT725.C440 = DT724.C2189
							)
							OR
							(
								DT725.C438 = DT725.C440
							)
						)
						OR
						(
							DT725.C438 = DT725.C438
						)
					)
				)
			GROUP BY
				DT724.C2190
				, DT725.C440
				, DT724.C2189
				, DT725.C439
			ORDER BY
				DT724.C2189
				, DT724.C2190
				, MIN( DT725.C440 )
				, AVG( DT725.C439 )
				, DT725.C439
				, DT725.C440
			LIMIT 174
			) AS DT726 ( C2194, C2195, C2196, C2197, C2198, C2199 ) 
		INNER JOIN
			T55 DT727
		ON
			DT726.C2199 = DT727.C661
		)
	ON
		DT720.C679 < DT726.C2195
	)
WHERE
	(
		(
			(
				DT720.C676 <> DT726.C2199
			)
			AND
			(
				DT720.C673 > DT720.C673
			)
		)
		AND
		(
			(
				DT720.C677 < DT726.C2197
			)
			OR
			(
				DT720.C673 <> DT726.C2196
			)
		)
	)
	OR
	(
		(
			DT720.C671 = DT720.C669
		)
		OR
		(
			DT727.C660 <> DT727.C666
		)
	)
GROUP BY
	DT727.C660
	, DT720.C676
	, DT727.C662
	, DT727.C666
	, DT720.C673
ORDER BY
	AVG( DT727.C662 )
	, DT727.C660
	, DT720.C676
	, DT727.C662
	, DT720.C673
LIMIT 166;


SELECT
	MAX( DT731.C1202 )
	, DT731.C1202
	, DT730.C2203
	, MIN( DT730.C2203 )
FROM
	(
		(
		SELECT
			DT729.C848
			, MIN( DT728.C1141 )
			, MAX( DT729.C848 )
		FROM
			(
				T93 DT728
			INNER JOIN
				T70 DT729
			ON
				DT728.C1138 = DT729.C845
			)
		WHERE
			(
				DT728.C1137 < DT728.C1139
			)
			AND
			(
				(
					(
						(
							DT728.C1138 = DT729.C853
						)
						AND
						(
							DT729.C859 = DT729.C839
						)
					)
					AND
					(
						DT729.C858 <> DT728.C1143
					)
				)
				OR
				(
					DT728.C1137 = DT728.C1141
				)
			)
		GROUP BY
			DT728.C1141
			, DT729.C848
		ORDER BY
			DT729.C848
			, MIN( DT728.C1141 )
			, MAX( DT729.C848 )
		LIMIT 764
		)  DT730 ( C2203, C2204, C2205 ) 
	INNER JOIN
		T98 DT731
	ON
		DT730.C2203 < DT731.C1201
	)
WHERE
	(
		(
			(
				DT731.C1201 = DT731.C1202
			)
			AND
			(
				DT731.C1203 = DT731.C1203
			)
		)
		OR
		(
			DT731.C1203 < DT730.C2204
		)
	)
	AND
	(
		(
			(
				DT731.C1203 = DT730.C2203
			)
			AND
			(
				DT730.C2203 = DT731.C1202
			)
		)
		AND
		(
			DT731.C1202 <> DT731.C1202
		)
	)
GROUP BY
	DT731.C1202
	, DT730.C2203
	, DT730.C2205
ORDER BY
	MAX( DT731.C1202 )
	, DT731.C1202
	, DT730.C2203
	, MIN( DT730.C2203 )
LIMIT 446;


SELECT
	DT736.C243
	, DT732.C1193
	, DT735.C2210
	, DT732.C1199
	, DT732.C1190
	, DT736.C244
	, DT732.C1195
	, DT732.C1198
	, DT736.C233
	, DT735.C2211
	, DT736.C245
	, DT736.C237
	, DT736.C246
FROM
	(
		T20 DT736
	INNER JOIN
		(
			T97 DT732
		INNER JOIN
			(
			SELECT
				DT734.C985
				, SUM( DT734.C985 )
			FROM
				(
					T79 DT734
				INNER JOIN
					T65 DT733
				ON
					DT734.C985 = DT733.C797
				)
			WHERE
				(
					(
						(
							DT734.C982 = DT733.C797
						)
						OR
						(
							DT734.C982 > DT733.C783
						)
					)
					OR
					(
						(
							DT734.C983 <> DT733.C795
						)
						AND
						(
							(
								DT734.C980 = DT734.C984
							)
							AND
							(
								DT733.C786 > DT734.C981
							)
						)
					)
				)
				OR
				(
					DT733.C783 = DT734.C983
				)
			GROUP BY
				DT734.C985
				, DT734.C979
			ORDER BY
				DT734.C985
				, SUM( DT734.C985 )
			LIMIT 258
			) AS DT735 ( C2210, C2211 ) 
		ON
			DT732.C1200 > DT735.C2211
		)
	ON
		DT736.C246 = DT732.C1198
	)
WHERE
	(
		(
			DT732.C1197 > DT732.C1195
		)
		OR
		(
			DT736.C243 > DT736.C237
		)
	)
	OR
	(
		(
			DT736.C237 < DT736.C240
		)
		AND
		(
			(
				DT736.C244 > DT736.C243
			)
			AND
			(
				DT736.C233 <> DT732.C1197
			)
		)
	)
ORDER BY
	DT736.C243
	, DT732.C1193
	, DT735.C2210
	, DT732.C1199
	, DT732.C1190
	, DT736.C244
	, DT732.C1195
	, DT732.C1198
	, DT736.C233
	, DT735.C2211
	, DT736.C245
	, DT736.C237
	, DT736.C246
LIMIT 447;


SELECT
	SUM( DT740.C672 )
	, DT740.C672
	, DT740.C677
FROM
	(
		(
			(
				T56 DT740
			INNER JOIN
				T23 DT737
			ON
				DT740.C681 < DT737.C276
			)
		LEFT OUTER JOIN
			T28 DT739
		ON
			DT740.C678 < DT739.C329
		)
	INNER JOIN
		T69 DT738
	ON
		DT739.C328 < DT738.C833
	)
WHERE
	(
		(
			(
				DT740.C680 > DT739.C333
			)
			AND
			(
				(
					DT740.C676 <> DT740.C673
				)
				AND
				(
					DT740.C668 < DT738.C830
				)
			)
		)
		AND
		(
			DT738.C834 = DT738.C836
		)
	)
	OR
	(
		(
			DT740.C674 < DT737.C277
		)
		AND
		(
			DT738.C834 > DT738.C824
		)
	)
GROUP BY
	DT740.C677
	, DT737.C275
	, DT740.C672
ORDER BY
	SUM( DT740.C672 )
	, DT740.C672
	, DT740.C677
LIMIT 154;


SELECT
	DT742.C2
FROM
	(
		T98 DT741
	LEFT OUTER JOIN
		T0 DT742
	ON
		DT741.C1203 <> DT742.C2
	)
WHERE
	(
		(
			DT741.C1203 < DT742.C3
		)
		OR
		(
			(
				(
					(
						DT742.C2 = DT742.C3
					)
					OR
					(
						DT742.C1 <> DT742.C3
					)
				)
				OR
				(
					DT742.C2 < DT741.C1201
				)
			)
			AND
			(
				(
					DT741.C1203 = DT742.C1
				)
				OR
				(
					DT742.C1 > DT742.C0
				)
			)
		)
	)
	AND
	(
		DT741.C1201 = DT742.C3
	)
GROUP BY
	DT741.C1203
	, DT742.C2
	, DT741.C1202
ORDER BY
	DT742.C2
LIMIT 259;


SELECT
	DT743.C915
	, AVG( DT743.C918 )
	, DT743.C918
	, COUNT( DT743.C915 )
	, DT743.C923
	, DT743.C913
FROM
	(
		T74 DT743
	INNER JOIN
		T62 DT744
	ON
		DT743.C926 <> DT744.C742
	)
WHERE
	(
		DT743.C918 = DT743.C916
	)
	AND
	(
		(
			(
				DT744.C741 <> DT743.C923
			)
			OR
			(
				DT743.C917 < DT743.C925
			)
		)
		AND
		(
			(
				DT743.C922 < DT743.C923
			)
			AND
			(
				DT743.C926 = DT743.C915
			)
		)
	)
GROUP BY
	DT743.C923
	, DT743.C913
	, DT743.C915
	, DT743.C918
	, DT743.C910
ORDER BY
	DT743.C915
	, AVG( DT743.C918 )
	, DT743.C918
	, COUNT( DT743.C915 )
	, DT743.C923
	, DT743.C913
LIMIT 527;


SELECT
	COUNT( DT748.C64 )
	, MIN( DT748.C55 )
FROM
	(
		T4 DT748
	INNER JOIN
		(
		SELECT
			MIN( DT746.C279 )
		FROM
			(
				T30 DT745
			INNER JOIN
				T24 DT746
			ON
				DT745.C341 = DT746.C279
			)
		WHERE
			(
				(
					DT746.C279 < DT746.C282
				)
				AND
				(
					DT745.C341 < DT746.C279
				)
			)
			AND
			(
				(
					(
						(
							(
								DT745.C343 < DT745.C341
							)
							AND
							(
								DT745.C341 < DT745.C343
							)
						)
						OR
						(
							(
								DT746.C280 = DT746.C279
							)
							AND
							(
								DT745.C342 = DT746.C279
							)
						)
					)
					AND
					(
						DT745.C342 > DT746.C279
					)
				)
				AND
				(
					DT746.C282 = DT746.C280
				)
			)
		GROUP BY
			DT746.C279
			, DT746.C281
		ORDER BY
			MIN( DT746.C279 )
		LIMIT 517
		)  DT747 ( C2222 ) 
	ON
		DT748.C64 = DT747.C2222
	)
WHERE
	(
		(
			DT748.C64 = DT748.C53
		)
		AND
		(
			DT748.C56 = DT748.C65
		)
	)
	OR
	(
		(
			DT748.C54 > DT748.C59
		)
		OR
		(
			(
				DT748.C63 = DT748.C57
			)
			AND
			(
				DT748.C57 = DT748.C53
			)
		)
	)
GROUP BY
	DT748.C53
	, DT748.C64
	, DT748.C55
	, DT747.C2222
ORDER BY
	COUNT( DT748.C64 )
	, MIN( DT748.C55 )
LIMIT 540;


SELECT
	DT750.C444
	, SUM( DT749.C226 )
	, DT751.C569
FROM
	(
		T39 DT750
	INNER JOIN
		(
			T48 DT751
		INNER JOIN
			T18 DT749
		ON
			DT751.C577 > DT749.C221
		)
	ON
		DT750.C445 = DT751.C575
	)
WHERE
	(
		(
			(
				(
					DT749.C222 > DT751.C574
				)
				OR
				(
					DT749.C221 <> DT749.C219
				)
			)
			OR
			(
				(
					DT749.C227 <> DT749.C221
				)
				OR
				(
					DT749.C222 = DT751.C581
				)
			)
		)
		AND
		(
			DT751.C584 = DT751.C570
		)
	)
	OR
	(
		(
			DT749.C224 = DT751.C578
		)
		AND
		(
			DT749.C222 > DT751.C577
		)
	)
GROUP BY
	DT750.C444
	, DT749.C226
	, DT751.C569
	, DT751.C580
ORDER BY
	DT750.C444
	, SUM( DT749.C226 )
	, DT751.C569
LIMIT 327;


SELECT
	DT757.C446
	, DT752.C1141
FROM
	(
		T39 DT757
	INNER JOIN
		(
			(
			SELECT
				DT753.C1206
				, COUNT( DT753.C1206 )
				, AVG( DT755.C409 )
				, DT755.C409
			FROM
				(
					(
						T99 DT753
					INNER JOIN
						T42 DT754
					ON
						DT753.C1204 = DT754.C484
					)
				INNER JOIN
					T34 DT755
				ON
					DT753.C1207 < DT755.C409
				)
			WHERE
				(
					(
						(
							DT755.C410 <> DT754.C478
						)
						AND
						(
							DT754.C477 = DT754.C474
						)
					)
					AND
					(
						(
							DT754.C481 = DT755.C402
						)
						AND
						(
							(
								DT754.C483 = DT753.C1208
							)
							AND
							(
								DT754.C475 = DT753.C1208
							)
						)
					)
				)
				AND
				(
					(
						(
							DT754.C473 > DT754.C473
						)
						OR
						(
							DT754.C479 = DT754.C481
						)
					)
					AND
					(
						DT754.C478 <> DT754.C474
					)
				)
			GROUP BY
				DT753.C1206
				, DT754.C475
				, DT755.C409
			ORDER BY
				DT753.C1206
				, COUNT( DT753.C1206 )
				, AVG( DT755.C409 )
				, DT755.C409
			LIMIT 694
			) AS DT756 ( C2233, C2234, C2235, C2236 ) 
		INNER JOIN
			T93 DT752
		ON
			DT756.C2233 > DT752.C1138
		)
	ON
		DT757.C446 <> DT752.C1142
	)
WHERE
	(
		(
			DT752.C1136 = DT757.C446
		)
		AND
		(
			DT752.C1137 = DT757.C445
		)
	)
	AND
	(
		(
			(
				DT752.C1140 < DT752.C1138
			)
			OR
			(
				DT752.C1140 = DT752.C1136
			)
		)
		AND
		(
			(
				DT752.C1137 = DT757.C445
			)
			OR
			(
				DT752.C1143 > DT752.C1144
			)
		)
	)
GROUP BY
	DT752.C1141
	, DT757.C446
ORDER BY
	DT757.C446
	, DT752.C1141
LIMIT 947;


SELECT
	SUM( DT759.C93 )
	, DT759.C109
	, DT759.C101
FROM
	(
		T7 DT759
	INNER JOIN
		T68 DT758
	ON
		DT759.C100 = DT758.C823
	)
WHERE
	(
		(
			DT759.C104 > DT758.C822
		)
		OR
		(
			(
				DT759.C96 <> DT759.C109
			)
			AND
			(
				DT759.C98 < DT759.C99
			)
		)
	)
	OR
	(
		(
			DT758.C822 <> DT759.C102
		)
		OR
		(
			DT759.C103 = DT759.C103
		)
	)
GROUP BY
	DT759.C90
	, DT759.C93
	, DT759.C109
	, DT759.C101
ORDER BY
	SUM( DT759.C93 )
	, DT759.C109
	, DT759.C101
LIMIT 240;


SELECT
	DT763.C2245
	, DT760.C324
	, DT760.C323
	, DT760.C326
	, DT760.C319
FROM
	(
		(
			(
				(
				SELECT
					MIN( DT773.C634 )
					, DT767.C507
					, DT773.C634
				FROM
					(
						T44 DT767
					INNER JOIN
						(
							(
							SELECT
								MIN( DT770.C500 )
								, MIN( DT770.C493 )
							FROM
								(
									(
										T68 DT769
									INNER JOIN
										T0 DT771
									ON
										DT769.C821 < DT771.C1
									)
								INNER JOIN
									(
										T95 DT768
									RIGHT OUTER JOIN
										T43 DT770
									ON
										DT768.C1170 <> DT770.C491
									)
								ON
									DT771.C3 < DT770.C495
								)
							WHERE
								(
									DT770.C493 <> DT770.C491
								)
								OR
								(
									(
										(
											DT770.C496 > DT770.C496
										)
										OR
										(
											DT770.C496 < DT771.C3
										)
									)
									AND
									(
										(
											DT771.C2 = DT770.C489
										)
										OR
										(
											(
												DT768.C1175 > DT771.C2
											)
											AND
											(
												DT770.C490 = DT768.C1170
											)
										)
									)
								)
							GROUP BY
								DT770.C493
								, DT770.C487
								, DT770.C500
								, DT771.C0
							ORDER BY
								MIN( DT770.C500 )
								, MIN( DT770.C493 )
							LIMIT 858
							) AS DT772 ( C2261, C2262 ) 
						INNER JOIN
							T52 DT773
						ON
							DT772.C2261 < DT773.C634
						)
					ON
						DT767.C507 <> DT773.C629
					)
				WHERE
					(
						(
							DT773.C634 = DT773.C633
						)
						AND
						(
							(
								DT767.C504 = DT773.C632
							)
							OR
							(
								DT773.C628 > DT767.C503
							)
						)
					)
					AND
					(
						(
							DT767.C504 < DT773.C633
						)
						OR
						(
							DT772.C2262 < DT767.C503
						)
					)
				GROUP BY
					DT773.C634
					, DT767.C507
				ORDER BY
					MIN( DT773.C634 )
					, DT767.C507
					, DT773.C634
				LIMIT 311
				)  DT774 ( C2265, C2266, C2267 ) 
			INNER JOIN
				(
				SELECT
					COUNT( DT764.C659 )
					, DT764.C667
					, SUM( DT764.C661 )
					, AVG( DT764.C667 )
				FROM
					(
						T55 DT764
					INNER JOIN
						T52 DT765
					ON
						DT764.C658 = DT765.C625
					)
				WHERE
					(
						(
							DT765.C626 = DT764.C664
						)
						OR
						(
							(
								(
									DT764.C663 = DT765.C631
								)
								OR
								(
									DT764.C666 > DT764.C666
								)
							)
							OR
							(
								DT765.C632 > DT765.C629
							)
						)
					)
					OR
					(
						(
							DT765.C631 < DT765.C626
						)
						OR
						(
							DT764.C663 = DT764.C664
						)
					)
				GROUP BY
					DT764.C661
					, DT764.C667
					, DT765.C635
					, DT764.C659
					, DT765.C634
				ORDER BY
					COUNT( DT764.C659 )
					, DT764.C667
					, SUM( DT764.C661 )
					, AVG( DT764.C667 )
				LIMIT 204
				)  DT766 ( C2254, C2255, C2256, C2257 ) 
			ON
				DT774.C2265 > DT766.C2256
			)
		INNER JOIN
			(
			SELECT
				DT761.C492
				, DT762.C865
				, COUNT( DT762.C865 )
				, DT761.C489
				, DT762.C862
				, MIN( DT761.C499 )
			FROM
				(
					T43 DT761
				INNER JOIN
					T71 DT762
				ON
					DT761.C497 < DT762.C863
				)
			WHERE
				(
					DT761.C493 < DT762.C863
				)
				OR
				(
					(
						(
							(
								DT761.C498 > DT761.C497
							)
							AND
							(
								DT762.C864 > DT762.C860
							)
						)
						AND
						(
							DT761.C497 < DT762.C863
						)
					)
					AND
					(
						(
							DT761.C494 > DT761.C491
						)
						AND
						(
							(
								DT761.C501 < DT762.C864
							)
							AND
							(
								(
									DT762.C862 > DT762.C861
								)
								OR
								(
									DT761.C489 = DT761.C487
								)
							)
						)
					)
				)
			GROUP BY
				DT762.C862
				, DT761.C492
				, DT762.C865
				, DT761.C499
				, DT761.C489
			ORDER BY
				DT761.C492
				, DT762.C865
				, COUNT( DT762.C865 )
				, DT761.C489
				, DT762.C862
				, MIN( DT761.C499 )
			LIMIT 990
			)  DT763 ( C2245, C2246, C2247, C2248, C2249, C2250 ) 
		ON
			DT766.C2257 > DT763.C2247
		)
	INNER JOIN
		T27 DT760
	ON
		DT763.C2249 = DT760.C325
	)
WHERE
	(
		DT760.C324 = DT774.C2267
	)
	AND
	(
		(
			(
				DT766.C2255 <> DT760.C326
			)
			OR
			(
				(
					DT760.C323 < DT760.C320
				)
				AND
				(
					DT774.C2267 = DT763.C2250
				)
			)
		)
		AND
		(
			DT763.C2249 = DT766.C2254
		)
	)
GROUP BY
	DT760.C319
	, DT763.C2245
	, DT760.C323
	, DT760.C326
	, DT760.C324
ORDER BY
	DT763.C2245
	, DT760.C324
	, DT760.C323
	, DT760.C326
	, DT760.C319
LIMIT 718;


SELECT
	MAX( DT775.C438 )
	, DT776.C865
	, DT775.C438
FROM
	(
		T37 DT775
	INNER JOIN
		T71 DT776
	ON
		DT775.C439 < DT776.C860
	)
WHERE
	(
		(
			DT776.C862 = DT776.C860
		)
		OR
		(
			DT776.C863 = DT775.C438
		)
	)
	AND
	(
		(
			DT776.C860 = DT776.C862
		)
		AND
		(
			(
				(
					DT776.C866 = DT775.C440
				)
				AND
				(
					DT776.C866 = DT776.C861
				)
			)
			AND
			(
				(
					DT776.C861 > DT775.C439
				)
				OR
				(
					DT775.C438 = DT776.C862
				)
			)
		)
	)
GROUP BY
	DT776.C865
	, DT775.C438
ORDER BY
	MAX( DT775.C438 )
	, DT776.C865
	, DT775.C438
LIMIT 701;


SELECT
	MAX( DT777.C82 )
	, DT777.C82
	, to_char(AVG( DT780.C934 ),'9999999.9999999')
FROM
	(
		T75 DT780
	INNER JOIN
		(
			(
				T31 DT778
			INNER JOIN
				T6 DT777
			ON
				DT778.C353 = DT777.C75
			)
		INNER JOIN
			T22 DT779
		ON
			DT778.C361 = DT779.C264
		)
	ON
		DT780.C935 = DT779.C264
	)
WHERE
	(
		(
			DT778.C354 < DT780.C937
		)
		AND
		(
			(
				(
					DT777.C87 <> DT778.C360
				)
				OR
				(
					DT779.C260 = DT779.C264
				)
			)
			OR
			(
				DT778.C352 < DT778.C350
			)
		)
	)
	AND
	(
		DT779.C268 < DT780.C933
	)
GROUP BY
	DT777.C82
	, DT780.C934
ORDER BY
	MAX( DT777.C82 )
	, DT777.C82
	, AVG( DT780.C934 )
LIMIT 491;


SELECT
	DT784.C2276
	, DT805.C2326
FROM
	(
		(
		SELECT
			DT783.C435
			, MAX( DT783.C423 )
			, DT783.C423
		FROM
			(
				T80 DT782
			INNER JOIN
				(
					T33 DT781
				RIGHT OUTER JOIN
					T36 DT783
				ON
					DT781.C399 = DT783.C434
				)
			ON
				DT782.C987 > DT781.C383
			)
		WHERE
			(
				(
					(
						DT781.C385 = DT781.C392
					)
					AND
					(
						DT782.C989 < DT781.C394
					)
				)
				OR
				(
					(
						DT782.C988 > DT781.C386
					)
					OR
					(
						DT781.C391 = DT781.C399
					)
				)
			)
			OR
			(
				DT782.C987 < DT781.C400
			)
		GROUP BY
			DT783.C435
			, DT783.C423
		ORDER BY
			DT783.C435
			, MAX( DT783.C423 )
			, DT783.C423
		LIMIT 345
		) AS DT784 ( C2274, C2275, C2276 ) 
	INNER JOIN
		(
		SELECT
			MAX( DT804.C935 )
			, DT804.C935
			, DT785.C870
			, MIN( DT785.C870 )
		FROM
			(
				T72 DT785
			INNER JOIN
				(
					T75 DT804
				INNER JOIN
					(
						(
						SELECT
							AVG( DT795.C1095 )
							, DT795.C1095
							, MIN( DT795.C1102 )
							, DT795.C1111
							, DT795.C1102
						FROM
							(
								(
									(
									SELECT
										SUM( DT792.C286 )
										, DT793.C204
										, MAX( DT792.C284 )
										, DT791.C2293
										, DT792.C291
										, DT792.C284
									FROM
										(
											T16 DT793
										LEFT OUTER JOIN
											(
												T25 DT792
											INNER JOIN
												(
												SELECT
													DT790.C1041
													, SUM( DT790.C1038 )
													, DT790.C1038
													, DT790.C1031
													, MAX( DT789.C2280 )
													, DT790.C1039
													, AVG( DT790.C1031 )
													, DT789.C2280
													, COUNT( DT790.C1039 )
												FROM
													(
														T85 DT790
													INNER JOIN
														(
														SELECT
															AVG( DT786.C351 )
															, COUNT( DT788.C836 )
														FROM
															(
																T13 DT787
															RIGHT OUTER JOIN
																(
																	T69 DT788
																INNER JOIN
																	T31 DT786
																ON
																	DT788.C835 > DT786.C359
																)
															ON
																DT787.C172 = DT788.C830
															)
														WHERE
															(
																(
																	DT787.C174 = DT788.C828
																)
																AND
																(
																	DT786.C360 > DT786.C352
																)
															)
															OR
															(
																(
																	DT786.C361 = DT786.C357
																)
																AND
																(
																	(
																		(
																			DT786.C353 = DT786.C352
																		)
																		AND
																		(
																			DT788.C828 = DT786.C357
																		)
																	)
																	OR
																	(
																		(
																			DT788.C830 = DT786.C353
																		)
																		OR
																		(
																			DT788.C825 < DT787.C164
																		)
																	)
																)
															)
														GROUP BY
															DT786.C351
															, DT788.C836
															, DT786.C348
														ORDER BY
															AVG( DT786.C351 )
															, COUNT( DT788.C836 )
														LIMIT 946
														)  DT789 ( C2279, C2280 ) 
													ON
														DT790.C1040 <> DT789.C2279
													)
												WHERE
													(
														(
															DT789.C2279 = DT790.C1044
														)
														OR
														(
															(
																(
																	DT790.C1036 > DT790.C1031
																)
																OR
																(
																	(
																		DT790.C1031 > DT790.C1041
																	)
																	OR
																	(
																		DT790.C1037 = DT790.C1029
																	)
																)
															)
															AND
															(
																DT790.C1030 = DT790.C1039
															)
														)
													)
													AND
													(
														DT790.C1031 = DT790.C1046
													)
												GROUP BY
													DT790.C1038
													, DT790.C1041
													, DT790.C1039
													, DT789.C2280
													, DT790.C1031
												ORDER BY
													DT790.C1041
													, SUM( DT790.C1038 )
													, DT790.C1038
													, DT790.C1031
													, MAX( DT789.C2280 )
													, DT790.C1039
													, AVG( DT790.C1031 )
													, DT789.C2280
													, COUNT( DT790.C1039 )
												LIMIT 238
												) AS DT791 ( C2285, C2286, C2287, C2288, C2289, C2290, C2291, C2292, C2293 ) 
											ON
												DT792.C287 <> DT791.C2287
											)
										ON
											DT793.C202 = DT792.C288
										)
									WHERE
										(
											(
												(
													(
														DT792.C287 = DT792.C293
													)
													AND
													(
														DT792.C291 = DT791.C2290
													)
												)
												OR
												(
													DT792.C292 > DT793.C205
												)
											)
											OR
											(
												DT792.C295 = DT791.C2292
											)
										)
										OR
										(
											(
												DT792.C284 = DT793.C201
											)
											AND
											(
												(
													DT792.C291 < DT792.C286
												)
												AND
												(
													(
														DT792.C288 = DT792.C292
													)
													OR
													(
														DT793.C202 <> DT791.C2285
													)
												)
											)
										)
									GROUP BY
										DT793.C204
										, DT792.C286
										, DT792.C291
										, DT791.C2293
										, DT792.C284
									ORDER BY
										SUM( DT792.C286 )
										, DT793.C204
										, MAX( DT792.C284 )
										, DT791.C2293
										, DT792.C291
										, DT792.C284
									LIMIT 949
									)  DT794 ( C2296, C2297, C2298, C2299, C2300, C2301 ) 
								INNER JOIN
									T91 DT795
								ON
									DT794.C2296 = DT795.C1100
								)
							INNER JOIN
								T40 DT796
							ON
								DT795.C1103 = DT796.C448
							)
						WHERE
							(
								(
									(
										DT795.C1098 = DT795.C1111
									)
									AND
									(
										DT795.C1095 < DT794.C2299
									)
								)
								AND
								(
									DT795.C1113 = DT795.C1097
								)
							)
							AND
							(
								(
									DT795.C1107 = DT795.C1094
								)
								AND
								(
									DT794.C2301 > DT795.C1105
								)
							)
						GROUP BY
							DT795.C1102
							, DT795.C1111
							, DT795.C1095
						ORDER BY
							AVG( DT795.C1095 )
							, DT795.C1095
							, MIN( DT795.C1102 )
							, DT795.C1111
							, DT795.C1102
						LIMIT 299
						)  DT797 ( C2304, C2305, C2306, C2307, C2308 ) 
					INNER JOIN
						(
						SELECT
							DT802.C343
							, AVG( DT802.C343 )
							, DT802.C342
							, AVG( DT802.C342 )
							, DT802.C341
							, COUNT( DT802.C341 )
						FROM
							(
								(
								SELECT
									COUNT( DT799.C262 )
									, DT799.C262
									, MAX( DT798.C341 )
									, DT798.C341
								FROM
									(
										T22 DT799
									LEFT OUTER JOIN
										(
											T30 DT800
										INNER JOIN
											T30 DT798
										ON
											DT800.C343 < DT798.C341
										)
									ON
										DT799.C264 = DT800.C343
									)
								WHERE
									(
										(
											DT798.C341 <> DT798.C342
										)
										AND
										(
											(
												DT798.C343 <> DT799.C260
											)
											AND
											(
												(
													DT799.C267 = DT799.C262
												)
												AND
												(
													DT800.C341 = DT800.C343
												)
											)
										)
									)
									AND
									(
										DT799.C268 = DT798.C342
									)
								GROUP BY
									DT799.C262
									, DT798.C341
								ORDER BY
									COUNT( DT799.C262 )
									, DT799.C262
									, MAX( DT798.C341 )
									, DT798.C341
								LIMIT 435
								) AS DT801 ( C2311, C2312, C2313, C2314 ) 
							INNER JOIN
								T30 DT802
							ON
								DT801.C2311 <> DT802.C341
							)
						WHERE
							(
								(
									(
										DT801.C2314 = DT801.C2313
									)
									AND
									(
										DT801.C2314 <> DT801.C2312
									)
								)
								OR
								(
									DT801.C2314 < DT801.C2313
								)
							)
							AND
							(
								(
									DT802.C342 <> DT801.C2312
								)
								OR
								(
									DT802.C343 > DT802.C341
								)
							)
						GROUP BY
							DT802.C341
							, DT802.C342
							, DT802.C343
						ORDER BY
							DT802.C343
							, AVG( DT802.C343 )
							, DT802.C342
							, AVG( DT802.C342 )
							, DT802.C341
							, COUNT( DT802.C341 )
						LIMIT 832
						) AS DT803 ( C2318, C2319, C2320, C2321, C2322, C2323 ) 
					ON
						DT797.C2305 <> DT803.C2319
					)
				ON
					DT804.C935 <> DT803.C2319
				)
			ON
				DT785.C882 <> DT804.C937
			)
		WHERE
			(
				(
					DT803.C2318 <> DT785.C874
				)
				OR
				(
					(
						(
							DT785.C886 <> DT785.C872
						)
						AND
						(
							DT797.C2305 = DT785.C886
						)
					)
					OR
					(
						DT785.C872 = DT804.C936
					)
				)
			)
			AND
			(
				(
					(
						DT797.C2308 < DT785.C885
					)
					AND
					(
						(
							DT785.C868 <> DT785.C867
						)
						AND
						(
							DT803.C2320 < DT804.C935
						)
					)
				)
				OR
				(
					DT785.C873 = DT785.C871
				)
			)
		GROUP BY
			DT804.C935
			, DT785.C870
		ORDER BY
			MAX( DT804.C935 )
			, DT804.C935
			, DT785.C870
			, MIN( DT785.C870 )
		LIMIT 548
		) AS DT805 ( C2326, C2327, C2328, C2329 ) 
	ON
		DT784.C2275 = DT805.C2326
	)
WHERE
	(
		(
			(
				DT805.C2329 = DT784.C2274
			)
			OR
			(
				DT805.C2326 = DT784.C2274
			)
		)
		AND
		(
			DT805.C2329 = DT784.C2275
		)
	)
	OR
	(
		(
			DT805.C2326 = DT805.C2329
		)
		OR
		(
			DT784.C2274 = DT805.C2329
		)
	)
GROUP BY
	DT805.C2329
	, DT805.C2326
	, DT805.C2328
	, DT784.C2276
ORDER BY
	DT784.C2276
	, DT805.C2326
LIMIT 899;


SELECT
	SUM( DT807.C558 )
	, DT807.C558
FROM
	(
		T47 DT807
	INNER JOIN
		T1 DT806
	ON
		DT807.C548 = DT806.C6
	)
WHERE
	(
		DT806.C10 <> DT807.C550
	)
	OR
	(
		(
			(
				(
					DT807.C548 < DT806.C11
				)
				OR
				(
					DT807.C565 = DT806.C14
				)
			)
			AND
			(
				DT807.C556 < DT806.C12
			)
		)
		AND
		(
			(
				(
					(
						DT807.C552 = DT806.C4
					)
					OR
					(
						DT806.C5 = DT806.C9
					)
				)
				OR
				(
					DT807.C555 = DT807.C560
				)
			)
			OR
			(
				DT806.C14 < DT807.C555
			)
		)
	)
GROUP BY
	DT807.C559
	, DT807.C554
	, DT807.C548
	, DT807.C558
ORDER BY
	SUM( DT807.C558 )
	, DT807.C558
LIMIT 982;


SELECT
	DT815.C2346
FROM
	(
		T24 DT817
	INNER JOIN
		(
			(
			SELECT
				DT822.C649
				, DT824.C509
				, DT824.C505
				, DT822.C638
				, MIN( DT822.C649 )
				, MAX( DT824.C505 )
				, AVG( DT822.C638 )
			FROM
				(
					(
						(
							T86 DT823
						INNER JOIN
							(
							SELECT
								COUNT( DT820.C75 )
								, COUNT( DT819.C37 )
								, DT818.C271
								, DT820.C75
								, MAX( DT819.C51 )
								, DT818.C274
								, DT819.C37
							FROM
								(
									T3 DT819
								INNER JOIN
									(
										T23 DT818
									INNER JOIN
										T6 DT820
									ON
										DT818.C270 <> DT820.C84
									)
								ON
									DT819.C43 <> DT818.C272
								)
							WHERE
								(
									(
										DT819.C52 > DT819.C34
									)
									AND
									(
										(
											DT818.C276 <> DT820.C82
										)
										OR
										(
											(
												DT819.C47 = DT819.C43
											)
											OR
											(
												DT820.C80 < DT820.C81
											)
										)
									)
								)
								AND
								(
									(
										(
											DT819.C45 < DT819.C52
										)
										OR
										(
											DT819.C42 <> DT819.C43
										)
									)
									AND
									(
										(
											DT820.C84 <> DT819.C49
										)
										AND
										(
											DT820.C84 = DT819.C50
										)
									)
								)
							GROUP BY
								DT820.C75
								, DT818.C271
								, DT819.C37
								, DT818.C274
								, DT819.C51
							ORDER BY
								COUNT( DT820.C75 )
								, COUNT( DT819.C37 )
								, DT818.C271
								, DT820.C75
								, MAX( DT819.C51 )
								, DT818.C274
								, DT819.C37
							LIMIT 903
							) AS DT821 ( C2352, C2353, C2354, C2355, C2356, C2357, C2358 ) 
						ON
							DT823.C1048 <> DT821.C2357
						)
					INNER JOIN
						T53 DT822
					ON
						DT823.C1049 = DT822.C653
					)
				INNER JOIN
					T44 DT824
				ON
					DT822.C646 = DT824.C509
				)
			WHERE
				(
					(
						DT821.C2354 > DT824.C509
					)
					OR
					(
						(
							DT823.C1051 = DT824.C508
						)
						OR
						(
							DT823.C1047 = DT824.C503
						)
					)
				)
				OR
				(
					(
						(
							DT822.C649 = DT822.C647
						)
						OR
						(
							DT821.C2355 = DT822.C640
						)
					)
					OR
					(
						DT823.C1047 < DT823.C1053
					)
				)
			GROUP BY
				DT824.C509
				, DT822.C649
				, DT824.C505
				, DT822.C638
			ORDER BY
				DT822.C649
				, DT824.C509
				, DT824.C505
				, DT822.C638
				, MIN( DT822.C649 )
				, MAX( DT824.C505 )
				, AVG( DT822.C638 )
			LIMIT 829
			)  DT825 ( C2363, C2364, C2365, C2366, C2367, C2368, C2369 ) 
		INNER JOIN
			(
				T47 DT816
			RIGHT OUTER JOIN
				(
				SELECT
					DT813.C265
					, DT813.C267
					, MIN( DT813.C265 )
					, DT813.C261
				FROM
					(
						(
						SELECT
							DT808.C641
							, COUNT( DT808.C641 )
							, MIN( DT811.C553 )
							, DT811.C555
							, DT811.C553
						FROM
							(
								(
									T35 DT810
								INNER JOIN
									(
										T22 DT809
									INNER JOIN
										T47 DT811
									ON
										DT809.C269 <> DT811.C553
									)
								ON
									DT810.C415 <> DT811.C553
								)
							INNER JOIN
								T53 DT808
							ON
								DT811.C565 = DT808.C651
							)
						WHERE
							(
								(
									(
										DT811.C567 = DT811.C558
									)
									OR
									(
										(
											DT810.C416 = DT808.C650
										)
										AND
										(
											(
												DT808.C637 < DT811.C557
											)
											OR
											(
												DT808.C644 > DT811.C561
											)
										)
									)
								)
								AND
								(
									(
										(
											DT811.C550 > DT808.C647
										)
										OR
										(
											DT811.C556 <> DT808.C648
										)
									)
									AND
									(
										DT811.C564 < DT808.C645
									)
								)
							)
							OR
							(
								DT808.C651 < DT809.C263
							)
						GROUP BY
							DT811.C553
							, DT811.C555
							, DT808.C641
						ORDER BY
							DT808.C641
							, COUNT( DT808.C641 )
							, MIN( DT811.C553 )
							, DT811.C555
							, DT811.C553
						LIMIT 839
						)  DT812 ( C2338, C2339, C2340, C2341, C2342 ) 
					INNER JOIN
						(
							T22 DT813
						INNER JOIN
							T68 DT814
						ON
							DT813.C262 < DT814.C822
						)
					ON
						DT812.C2339 = DT813.C259
					)
				WHERE
					(
						DT814.C821 = DT813.C269
					)
					OR
					(
						(
							(
								DT813.C268 < DT813.C267
							)
							OR
							(
								(
									DT813.C264 < DT814.C822
								)
								OR
								(
									DT813.C265 > DT814.C821
								)
							)
						)
						OR
						(
							DT814.C822 = DT813.C259
						)
					)
				GROUP BY
					DT813.C267
					, DT813.C265
					, DT813.C261
				ORDER BY
					DT813.C265
					, DT813.C267
					, MIN( DT813.C265 )
					, DT813.C261
				LIMIT 599
				)  DT815 ( C2344, C2345, C2346, C2347 ) 
			ON
				DT816.C556 = DT815.C2346
			)
		ON
			DT825.C2366 > DT815.C2344
		)
	ON
		DT817.C281 = DT816.C559
	)
WHERE
	(
		DT817.C280 > DT816.C555
	)
	AND
	(
		(
			(
				(
					(
						DT816.C554 < DT825.C2369
					)
					OR
					(
						DT816.C563 <> DT816.C552
					)
				)
				AND
				(
					(
						DT816.C548 > DT816.C560
					)
					AND
					(
						DT816.C561 = DT825.C2368
					)
				)
			)
			OR
			(
				(
					DT817.C279 < DT816.C557
				)
				OR
				(
					DT825.C2363 < DT816.C562
				)
			)
		)
		AND
		(
			DT815.C2344 <> DT816.C550
		)
	)
GROUP BY
	DT816.C563
	, DT815.C2346
ORDER BY
	DT815.C2346
LIMIT 350;


SELECT
	DT826.C327
	, MIN( DT826.C327 )
	, AVG( DT827.C1198 )
	, AVG( DT827.C1200 )
	, MAX( DT835.C68 )
	, DT827.C1200
	, DT835.C68
FROM
	(
		(
			T97 DT827
		INNER JOIN
			T27 DT826
		ON
			DT827.C1198 < DT826.C324
		)
	INNER JOIN
		(
			T5 DT835
		INNER JOIN
			(
			SELECT
				DT832.C2379
				, SUM( DT833.C146 )
				, AVG( DT832.C2379 )
			FROM
				(
					(
						(
						SELECT
							DT830.C669
							, MAX( DT831.C24 )
							, DT831.C15
							, COUNT( DT831.C15 )
							, DT831.C30
						FROM
							(
								T56 DT830
							INNER JOIN
								T2 DT831
							ON
								DT830.C669 < DT831.C30
							)
						WHERE
							(
								(
									(
										DT830.C677 > DT830.C673
									)
									OR
									(
										DT830.C672 = DT831.C23
									)
								)
								AND
								(
									DT830.C668 = DT831.C22
								)
							)
							AND
							(
								(
									DT831.C26 = DT830.C681
								)
								OR
								(
									DT830.C677 = DT830.C675
								)
							)
						GROUP BY
							DT831.C30
							, DT831.C24
							, DT831.C20
							, DT830.C669
							, DT831.C15
						ORDER BY
							DT830.C669
							, MAX( DT831.C24 )
							, DT831.C15
							, COUNT( DT831.C15 )
							, DT831.C30
						LIMIT 220
						)  DT832 ( C2375, C2376, C2377, C2378, C2379 ) 
					INNER JOIN
						(
							T96 DT828
						INNER JOIN
							T10 DT833
						ON
							DT828.C1176 <> DT833.C139
						)
					ON
						DT832.C2375 > DT833.C145
					)
				INNER JOIN
					T12 DT829
				ON
					DT828.C1178 = DT829.C159
				)
			WHERE
				(
					(
						DT832.C2378 = DT828.C1176
					)
					OR
					(
						(
							DT828.C1182 > DT829.C157
						)
						OR
						(
							DT833.C138 > DT833.C141
						)
					)
				)
				AND
				(
					(
						DT829.C160 > DT832.C2377
					)
					OR
					(
						DT828.C1186 = DT829.C157
					)
				)
			GROUP BY
				DT832.C2379
				, DT833.C146
				, DT828.C1180
			ORDER BY
				DT832.C2379
				, SUM( DT833.C146 )
				, AVG( DT832.C2379 )
			LIMIT 326
			)  DT834 ( C2382, C2383, C2384 ) 
		ON
			DT835.C74 > DT834.C2384
		)
	ON
		DT826.C322 = DT834.C2383
	)
WHERE
	(
		(
			(
				DT827.C1193 = DT835.C70
			)
			AND
			(
				(
					DT827.C1196 <> DT835.C67
				)
				OR
				(
					DT826.C321 = DT835.C70
				)
			)
		)
		OR
		(
			DT827.C1198 <> DT827.C1198
		)
	)
	AND
	(
		DT826.C320 < DT826.C327
	)
GROUP BY
	DT826.C327
	, DT827.C1200
	, DT827.C1198
	, DT835.C68
ORDER BY
	DT826.C327
	, MIN( DT826.C327 )
	, AVG( DT827.C1198 )
	, AVG( DT827.C1200 )
	, MAX( DT835.C68 )
	, DT827.C1200
	, DT835.C68
LIMIT 339;


SELECT
	MAX( DT838.C2396 )
FROM
	(
		T94 DT839
	RIGHT OUTER JOIN
		(
		SELECT
			DT836.C705
			, DT837.C702
			, DT836.C712
			, DT837.C701
			, DT836.C707
			, SUM( DT836.C707 )
		FROM
			(
				T58 DT836
			INNER JOIN
				T58 DT837
			ON
				DT836.C709 <> DT837.C698
			)
		WHERE
			(
				(
					(
						DT836.C708 < DT836.C703
					)
					OR
					(
						DT837.C707 <> DT836.C709
					)
				)
				OR
				(
					(
						DT837.C700 = DT836.C708
					)
					AND
					(
						DT836.C710 <> DT837.C712
					)
				)
			)
			OR
			(
				(
					DT836.C711 > DT836.C705
				)
				OR
				(
					DT836.C712 = DT837.C703
				)
			)
		GROUP BY
			DT836.C705
			, DT837.C701
			, DT837.C702
			, DT836.C707
			, DT836.C712
		ORDER BY
			DT836.C705
			, DT837.C702
			, DT836.C712
			, DT837.C701
			, DT836.C707
			, SUM( DT836.C707 )
		LIMIT 867
		)  DT838 ( C2392, C2393, C2394, C2395, C2396, C2397 ) 
	ON
		DT839.C1164 > DT838.C2392
	)
WHERE
	(
		(
			(
				DT839.C1155 < DT839.C1145
			)
			OR
			(
				DT839.C1162 < DT839.C1162
			)
		)
		OR
		(
			DT839.C1162 > DT838.C2395
		)
	)
	AND
	(
		(
			(
				DT839.C1164 > DT839.C1157
			)
			OR
			(
				(
					DT839.C1153 <> DT839.C1156
				)
				OR
				(
					DT839.C1154 = DT839.C1149
				)
			)
		)
		OR
		(
			(
				DT839.C1159 > DT839.C1147
			)
			OR
			(
				DT839.C1155 = DT839.C1148
			)
		)
	)
GROUP BY
	DT838.C2396
	, DT838.C2394
ORDER BY
	MAX( DT838.C2396 )
LIMIT 639;


SELECT
	DT848.C2409
	, MAX( DT848.C2409 )
	, DT845.C1202
FROM
	(
		(
		SELECT
			MIN( DT847.C781 )
			, MAX( DT847.C772 )
			, DT847.C781
			, DT847.C772
		FROM
			(
				T34 DT846
			INNER JOIN
				T64 DT847
			ON
				DT846.C404 = DT847.C768
			)
		WHERE
			(
				(
					DT847.C780 = DT847.C778
				)
				AND
				(
					(
						(
							DT847.C772 = DT847.C768
						)
						AND
						(
							DT846.C405 <> DT847.C778
						)
					)
					AND
					(
						(
							DT846.C402 = DT846.C406
						)
						OR
						(
							DT847.C781 < DT847.C765
						)
					)
				)
			)
			AND
			(
				(
					DT847.C768 = DT846.C403
				)
				AND
				(
					DT847.C767 > DT847.C778
				)
			)
		GROUP BY
			DT846.C407
			, DT847.C772
			, DT847.C781
		ORDER BY
			MIN( DT847.C781 )
			, MAX( DT847.C772 )
			, DT847.C781
			, DT847.C772
		LIMIT 385
		)  DT848 ( C2407, C2408, C2409, C2410 ) 
	INNER JOIN
		(
			T98 DT845
		INNER JOIN
			(
			SELECT
				DT842.C427
				, SUM( DT840.C173 )
				, DT840.C173
				, DT841.C777
			FROM
				(
					T36 DT842
				INNER JOIN
					(
						(
							T13 DT840
						INNER JOIN
							T64 DT841
						ON
							DT840.C177 < DT841.C769
						)
					INNER JOIN
						T83 DT843
					ON
						DT841.C781 < DT843.C1007
					)
				ON
					DT842.C423 = DT840.C174
				)
			WHERE
				(
					(
						(
							(
								DT842.C419 <> DT842.C431
							)
							OR
							(
								DT841.C770 < DT842.C432
							)
						)
						OR
						(
							DT842.C436 < DT842.C419
						)
					)
					AND
					(
						DT843.C1007 = DT842.C436
					)
				)
				AND
				(
					(
						(
							DT842.C428 < DT843.C1006
						)
						AND
						(
							DT843.C1003 = DT840.C176
						)
					)
					OR
					(
						DT841.C770 < DT840.C178
					)
				)
			GROUP BY
				DT841.C777
				, DT841.C766
				, DT842.C427
				, DT840.C173
			ORDER BY
				DT842.C427
				, SUM( DT840.C173 )
				, DT840.C173
				, DT841.C777
			LIMIT 970
			)  DT844 ( C2401, C2402, C2403, C2404 ) 
		ON
			DT845.C1201 <> DT844.C2401
		)
	ON
		DT848.C2409 <> DT844.C2401
	)
WHERE
	(
		(
			DT848.C2410 < DT844.C2401
		)
		OR
		(
			DT844.C2401 = DT844.C2401
		)
	)
	AND
	(
		(
			(
				DT844.C2402 <> DT848.C2408
			)
			OR
			(
				DT845.C1202 = DT844.C2402
			)
		)
		AND
		(
			DT848.C2410 > DT848.C2409
		)
	)
GROUP BY
	DT845.C1202
	, DT848.C2410
	, DT848.C2409
	, DT844.C2404
ORDER BY
	DT848.C2409
	, MAX( DT848.C2409 )
	, DT845.C1202
LIMIT 280;


SELECT
	to_char(AVG( DT851.C332 ),'9999999.9999999')
	, DT849.C145
	, SUM( DT849.C148 )
	, DT851.C332
FROM
	(
		(
			T28 DT851
		INNER JOIN
			(
				T38 DT850
			INNER JOIN
				(
				SELECT
					DT854.C777
					, DT854.C780
					, MIN( DT854.C777 )
				FROM
					(
						(
							T12 DT852
						INNER JOIN
							(
								T64 DT854
							INNER JOIN
								T23 DT853
							ON
								DT854.C767 = DT853.C273
							)
						ON
							DT852.C158 = DT854.C777
						)
					INNER JOIN
						T89 DT855
					ON
						DT852.C163 = DT855.C1076
					)
				WHERE
					(
						(
							(
								DT852.C163 = DT854.C774
							)
							AND
							(
								(
									DT854.C764 = DT855.C1077
								)
								OR
								(
									DT853.C272 <> DT854.C771
								)
							)
						)
						AND
						(
							(
								DT853.C276 = DT854.C780
							)
							OR
							(
								(
									DT854.C766 = DT854.C779
								)
								OR
								(
									DT854.C764 = DT854.C781
								)
							)
						)
					)
					OR
					(
						(
							DT852.C157 <> DT854.C782
						)
						OR
						(
							DT853.C276 > DT854.C774
						)
					)
				GROUP BY
					DT854.C780
					, DT854.C777
				ORDER BY
					DT854.C777
					, DT854.C780
					, MIN( DT854.C777 )
				LIMIT 344
				) AS DT856 ( C2416, C2417, C2418 ) 
			ON
				DT850.C442 < DT856.C2416
			)
		ON
			DT851.C333 = DT850.C443
		)
	INNER JOIN
		T10 DT849
	ON
		DT851.C332 = DT849.C147
	)
WHERE
	(
		(
			DT850.C441 <> DT850.C442
		)
		AND
		(
			(
				(
					DT849.C150 = DT851.C332
				)
				OR
				(
					DT849.C143 > DT849.C138
				)
			)
			OR
			(
				(
					DT849.C149 = DT849.C151
				)
				AND
				(
					DT849.C151 < DT849.C151
				)
			)
		)
	)
	OR
	(
		(
			(
				DT849.C141 <> DT849.C147
			)
			AND
			(
				DT849.C146 > DT856.C2416
			)
		)
		AND
		(
			DT851.C331 <> DT856.C2418
		)
	)
GROUP BY
	DT851.C332
	, DT849.C148
	, DT849.C149
	, DT849.C145
	, DT849.C146
ORDER BY
	AVG( DT851.C332 )
	, DT849.C145
	, SUM( DT849.C148 )
	, DT851.C332
LIMIT 960;


SELECT
	DT873.C870
	, MAX( DT873.C870 )
FROM
	(
		(
			(
			SELECT
				AVG( DT868.C885 )
				, DT871.C378
				, SUM( DT871.C378 )
				, DT868.C871
			FROM
				(
					(
						T4 DT870
					INNER JOIN
						(
							T32 DT871
						INNER JOIN
							T79 DT869
						ON
							DT871.C380 > DT869.C981
						)
					ON
						DT870.C53 < DT871.C367
					)
				LEFT OUTER JOIN
					T72 DT868
				ON
					DT870.C63 <> DT868.C871
				)
			WHERE
				(
					(
						DT868.C870 = DT871.C380
					)
					AND
					(
						(
							DT868.C878 = DT870.C62
						)
						AND
						(
							DT868.C874 <> DT868.C885
						)
					)
				)
				AND
				(
					(
						DT870.C62 > DT868.C879
					)
					AND
					(
						DT870.C56 <> DT868.C868
					)
				)
			GROUP BY
				DT870.C63
				, DT868.C885
				, DT868.C871
				, DT871.C378
			ORDER BY
				AVG( DT868.C885 )
				, DT871.C378
				, SUM( DT871.C378 )
				, DT868.C871
			LIMIT 264
			) AS DT872 ( C2442, C2443, C2444, C2445 ) 
		INNER JOIN
			(
			SELECT
				COUNT( DT866.C2430 )
				, DT858.C167
				, DT858.C172
				, DT857.C880
				, AVG( DT857.C880 )
			FROM
				(
					(
						(
						SELECT
							DT864.C1118
							, DT864.C1124
							, DT865.C997
							, DT864.C1131
							, MAX( DT864.C1118 )
						FROM
							(
								T82 DT865
							INNER JOIN
								T92 DT864
							ON
								DT865.C1000 > DT864.C1115
							)
						WHERE
							(
								(
									(
										DT864.C1119 <> DT865.C995
									)
									OR
									(
										DT864.C1130 = DT864.C1135
									)
								)
								OR
								(
									DT864.C1117 < DT864.C1118
								)
							)
							OR
							(
								(
									DT864.C1116 < DT864.C1134
								)
								OR
								(
									(
										DT864.C1124 = DT864.C1130
									)
									AND
									(
										DT864.C1116 > DT864.C1134
									)
								)
							)
						GROUP BY
							DT864.C1131
							, DT865.C997
							, DT864.C1118
							, DT864.C1124
						ORDER BY
							DT864.C1118
							, DT864.C1124
							, DT865.C997
							, DT864.C1131
							, MAX( DT864.C1118 )
						LIMIT 659
						)  DT866 ( C2428, C2429, C2430, C2431, C2432 ) 
					INNER JOIN
						(
							T13 DT858
						INNER JOIN
							T72 DT857
						ON
							DT858.C172 < DT857.C878
						)
					ON
						DT866.C2430 < DT858.C164
					)
				INNER JOIN
					(
					SELECT
						DT861.C122
						, DT861.C120
						, DT861.C113
						, MAX( DT861.C120 )
						, DT861.C112
					FROM
						(
							(
								T86 DT862
							INNER JOIN
								T15 DT859
							ON
								DT862.C1052 = DT859.C186
							)
						INNER JOIN
							(
								T39 DT860
							INNER JOIN
								T8 DT861
							ON
								DT860.C446 <> DT861.C122
							)
						ON
							DT862.C1047 > DT861.C119
						)
					WHERE
						(
							(
								(
									(
										DT861.C118 = DT861.C117
									)
									AND
									(
										DT861.C116 <> DT861.C112
									)
								)
								AND
								(
									DT861.C125 = DT859.C198
								)
							)
							AND
							(
								DT862.C1051 = DT861.C113
							)
						)
						AND
						(
							(
								DT861.C115 < DT861.C113
							)
							OR
							(
								(
									DT860.C445 > DT861.C110
								)
								OR
								(
									(
										DT861.C110 = DT861.C112
									)
									AND
									(
										DT862.C1050 < DT859.C197
									)
								)
							)
						)
					GROUP BY
						DT861.C113
						, DT861.C112
						, DT861.C114
						, DT861.C120
						, DT861.C122
					ORDER BY
						DT861.C122
						, DT861.C120
						, DT861.C113
						, MAX( DT861.C120 )
						, DT861.C112
					LIMIT 770
					)  DT863 ( C2422, C2423, C2424, C2425, C2426 ) 
				ON
					DT857.C875 > DT863.C2424
				)
			WHERE
				(
					DT866.C2431 < DT857.C875
				)
				OR
				(
					(
						(
							DT858.C165 <> DT857.C867
						)
						OR
						(
							DT857.C873 = DT857.C885
						)
					)
					AND
					(
						(
							(
								(
									DT866.C2430 = DT857.C879
								)
								AND
								(
									DT858.C175 < DT857.C882
								)
							)
							OR
							(
								DT863.C2423 < DT858.C175
							)
						)
						AND
						(
							(
								DT858.C167 > DT857.C874
							)
							OR
							(
								DT858.C167 = DT866.C2431
							)
						)
					)
				)
			GROUP BY
				DT858.C167
				, DT866.C2430
				, DT857.C880
				, DT858.C172
			ORDER BY
				COUNT( DT866.C2430 )
				, DT858.C167
				, DT858.C172
				, DT857.C880
				, AVG( DT857.C880 )
			LIMIT 665
			)  DT867 ( C2435, C2436, C2437, C2438, C2439 ) 
		ON
			DT872.C2442 < DT867.C2436
		)
	INNER JOIN
		T72 DT873
	ON
		DT867.C2436 = DT873.C872
	)
WHERE
	(
		(
			DT873.C888 <> DT872.C2442
		)
		AND
		(
			(
				(
					DT872.C2443 = DT873.C887
				)
				OR
				(
					DT867.C2439 = DT873.C875
				)
			)
			AND
			(
				DT873.C874 <> DT873.C871
			)
		)
	)
	OR
	(
		DT873.C876 = DT873.C873
	)
GROUP BY
	DT867.C2436
	, DT873.C870
ORDER BY
	DT873.C870
	, MAX( DT873.C870 )
LIMIT 446;


SELECT
	DT876.C214
	, DT876.C216
	, DT874.C525
	, MIN( DT874.C525 )
	, MIN( DT876.C216 )
FROM
	(
		T45 DT874
	INNER JOIN
		(
			T60 DT875
		RIGHT OUTER JOIN
			T17 DT876
		ON
			DT875.C719 < DT876.C217
		)
	ON
		DT874.C513 = DT876.C210
	)
WHERE
	(
		(
			DT874.C522 < DT876.C208
		)
		OR
		(
			DT876.C209 < DT875.C719
		)
	)
	OR
	(
		(
			(
				DT876.C211 = DT876.C216
			)
			OR
			(
				DT876.C216 <> DT874.C526
			)
		)
		OR
		(
			DT874.C518 = DT874.C518
		)
	)
GROUP BY
	DT875.C721
	, DT876.C216
	, DT876.C214
	, DT874.C525
ORDER BY
	DT876.C214
	, DT876.C216
	, DT874.C525
	, MIN( DT874.C525 )
	, MIN( DT876.C216 )
LIMIT 337;


SELECT
	COUNT( DT900.C2481 )
	, DT900.C2478
	, DT900.C2481
FROM
	(
		(
		SELECT
			MAX( DT903.C303 )
			, DT903.C308
			, DT903.C303
		FROM
			(
				(
					T17 DT902
				INNER JOIN
					T26 DT903
				ON
					DT902.C213 = DT903.C307
				)
			INNER JOIN
				T89 DT901
			ON
				DT902.C207 = DT901.C1076
			)
		WHERE
			(
				DT903.C302 <> DT903.C305
			)
			OR
			(
				(
					(
						DT903.C311 > DT903.C314
					)
					AND
					(
						DT903.C312 = DT902.C208
					)
				)
				AND
				(
					(
						(
							DT903.C304 = DT902.C212
						)
						OR
						(
							DT903.C300 <> DT903.C312
						)
					)
					OR
					(
						(
							DT903.C316 > DT903.C301
						)
						AND
						(
							DT901.C1077 <> DT901.C1076
						)
					)
				)
			)
		GROUP BY
			DT903.C303
			, DT902.C214
			, DT903.C315
			, DT903.C308
		ORDER BY
			MAX( DT903.C303 )
			, DT903.C308
			, DT903.C303
		LIMIT 745
		) AS DT904 ( C2484, C2485, C2486 ) 
	INNER JOIN
		(
			(
				(
				SELECT
					DT893.C769
				FROM
					(
						(
							T64 DT893
						INNER JOIN
							T98 DT891
						ON
							DT893.C774 = DT891.C1202
						)
					INNER JOIN
						T82 DT892
					ON
						DT893.C779 = DT892.C998
					)
				WHERE
					(
						(
							(
								DT891.C1201 < DT893.C764
							)
							AND
							(
								DT893.C768 = DT893.C770
							)
						)
						OR
						(
							DT892.C998 <> DT893.C779
						)
					)
					AND
					(
						(
							DT893.C778 < DT893.C772
						)
						AND
						(
							DT893.C779 <> DT893.C765
						)
					)
				GROUP BY
					DT893.C769
					, DT893.C780
					, DT893.C782
				ORDER BY
					DT893.C769
				LIMIT 178
				)  DT894 ( C2468 ) 
			INNER JOIN
				(
				SELECT
					DT882.C787
					, MAX( DT882.C787 )
					, DT882.C784
				FROM
					(
						(
						SELECT
							DT888.C757
						FROM
							(
								(
									T49 DT887
								INNER JOIN
									(
										(
										SELECT
											AVG( DT883.C731 )
											, DT883.C731
											, AVG( DT884.C223 )
											, DT884.C223
										FROM
											(
												T18 DT884
											LEFT OUTER JOIN
												T61 DT883
											ON
												DT884.C228 > DT883.C735
											)
										WHERE
											(
												(
													(
														(
															DT884.C227 = DT884.C219
														)
														OR
														(
															DT884.C228 = DT883.C737
														)
													)
													AND
													(
														DT884.C227 = DT884.C225
													)
												)
												OR
												(
													DT884.C221 < DT883.C729
												)
											)
											OR
											(
												(
													DT883.C728 <> DT884.C228
												)
												OR
												(
													(
														DT884.C223 = DT883.C734
													)
													AND
													(
														DT883.C730 = DT884.C222
													)
												)
											)
										GROUP BY
											DT883.C731
											, DT884.C223
										ORDER BY
											AVG( DT883.C731 )
											, DT883.C731
											, AVG( DT884.C223 )
											, DT884.C223
										LIMIT 692
										) AS DT885 ( C2454, C2455, C2456, C2457 ) 
									INNER JOIN
										T8 DT886
									ON
										DT885.C2455 <> DT886.C114
									)
								ON
									DT887.C597 < DT886.C118
								)
							INNER JOIN
								T63 DT888
							ON
								DT885.C2455 = DT888.C758
							)
						WHERE
							(
								(
									(
										DT887.C596 = DT888.C762
									)
									OR
									(
										DT888.C757 = DT887.C592
									)
								)
								AND
								(
									(
										DT886.C120 > DT886.C114
									)
									OR
									(
										DT888.C751 < DT886.C117
									)
								)
							)
							AND
							(
								DT886.C123 = DT888.C751
							)
						GROUP BY
							DT886.C116
							, DT888.C757
						ORDER BY
							DT888.C757
						LIMIT 957
						) AS DT889 ( C2460 ) 
					INNER JOIN
						(
							(
							SELECT
								DT880.C1097
							FROM
								(
									T9 DT877
								INNER JOIN
									(
										(
											T44 DT879
										INNER JOIN
											T91 DT880
										ON
											DT879.C509 = DT880.C1100
										)
									INNER JOIN
										T81 DT878
									ON
										DT880.C1103 > DT878.C991
									)
								ON
									DT877.C135 = DT879.C504
								)
							WHERE
								(
									(
										DT880.C1105 > DT878.C993
									)
									AND
									(
										(
											DT880.C1097 = DT880.C1102
										)
										OR
										(
											(
												DT878.C990 < DT878.C992
											)
											AND
											(
												DT878.C993 = DT879.C508
											)
										)
									)
								)
								AND
								(
									(
										(
											DT880.C1112 = DT877.C134
										)
										AND
										(
											DT879.C510 = DT878.C993
										)
									)
									OR
									(
										DT880.C1095 > DT877.C131
									)
								)
							GROUP BY
								DT878.C994
								, DT877.C137
								, DT880.C1097
								, DT880.C1100
							ORDER BY
								DT880.C1097
							LIMIT 987
							) AS DT881 ( C2451 ) 
						INNER JOIN
							T65 DT882
						ON
							DT881.C2451 = DT882.C786
						)
					ON
						DT889.C2460 > DT882.C790
					)
				WHERE
					(
						DT882.C784 < DT882.C794
					)
					AND
					(
						(
							(
								(
									(
										DT889.C2460 <> DT882.C785
									)
									AND
									(
										DT882.C789 = DT882.C790
									)
								)
								AND
								(
									(
										DT882.C791 <> DT882.C793
									)
									AND
									(
										DT882.C784 = DT882.C796
									)
								)
							)
							AND
							(
								DT882.C792 > DT882.C788
							)
						)
						AND
						(
							(
								DT882.C783 = DT882.C794
							)
							OR
							(
								DT882.C796 = DT882.C783
							)
						)
					)
				GROUP BY
					DT882.C787
					, DT882.C784
				ORDER BY
					DT882.C787
					, MAX( DT882.C787 )
					, DT882.C784
				LIMIT 338
				) AS DT890 ( C2462, C2463, C2464 ) 
			ON
				DT894.C2468 = DT890.C2464
			)
		INNER JOIN
			(
			SELECT
				COUNT( DT895.C784 )
				, DT895.C785
				, MIN( DT895.C785 )
				, DT895.C784
				, DT895.C792
			FROM
				(
					(
					SELECT
						DT896.C11
						, DT896.C14
						, SUM( DT896.C6 )
						, DT897.C1047
					FROM
						(
							(
								T86 DT897
							INNER JOIN
								T82 DT898
							ON
								DT897.C1049 = DT898.C998
							)
						INNER JOIN
							T1 DT896
						ON
							DT897.C1047 = DT896.C14
						)
					WHERE
						(
							(
								DT897.C1051 = DT897.C1054
							)
							AND
							(
								DT896.C8 = DT898.C997
							)
						)
						OR
						(
							(
								(
									DT896.C13 <> DT897.C1053
								)
								AND
								(
									DT897.C1048 = DT896.C11
								)
							)
							AND
							(
								DT896.C4 = DT898.C996
							)
						)
					GROUP BY
						DT897.C1047
						, DT896.C6
						, DT896.C14
						, DT896.C11
						, DT896.C4
					ORDER BY
						DT896.C11
						, DT896.C14
						, SUM( DT896.C6 )
						, DT897.C1047
					LIMIT 935
					) AS DT899 ( C2471, C2472, C2473, C2474 ) 
				INNER JOIN
					T65 DT895
				ON
					DT899.C2473 = DT895.C790
				)
			WHERE
				(
					(
						DT895.C786 = DT895.C797
					)
					OR
					(
						DT895.C785 = DT895.C787
					)
				)
				AND
				(
					(
						(
							DT895.C785 <> DT895.C787
						)
						OR
						(
							DT899.C2474 > DT895.C789
						)
					)
					OR
					(
						DT899.C2471 = DT895.C794
					)
				)
			GROUP BY
				DT895.C792
				, DT895.C785
				, DT895.C784
			ORDER BY
				COUNT( DT895.C784 )
				, DT895.C785
				, MIN( DT895.C785 )
				, DT895.C784
				, DT895.C792
			LIMIT 775
			) AS DT900 ( C2477, C2478, C2479, C2480, C2481 ) 
		ON
			DT894.C2468 > DT900.C2477
		)
	ON
		DT904.C2485 = DT900.C2480
	)
WHERE
	(
		(
			(
				DT900.C2481 = DT904.C2485
			)
			OR
			(
				DT904.C2484 > DT890.C2462
			)
		)
		AND
		(
			DT904.C2486 <> DT900.C2479
		)
	)
	AND
	(
		(
			(
				(
					DT900.C2478 > DT900.C2477
				)
				OR
				(
					DT900.C2477 = DT900.C2479
				)
			)
			AND
			(
				DT900.C2480 = DT904.C2485
			)
		)
		OR
		(
			(
				DT900.C2477 = DT900.C2479
			)
			AND
			(
				DT900.C2478 = DT900.C2477
			)
		)
	)
GROUP BY
	DT900.C2481
	, DT900.C2478
	, DT894.C2468
ORDER BY
	COUNT( DT900.C2481 )
	, DT900.C2478
	, DT900.C2481
LIMIT 719;


SELECT
	DT907.C718
	, SUM( DT907.C718 )
	, DT906.C1031
FROM
	(
		T60 DT907
	INNER JOIN
		(
			T99 DT905
		INNER JOIN
			(
				T36 DT908
			RIGHT OUTER JOIN
				T85 DT906
			ON
				DT908.C429 = DT906.C1044
			)
		ON
			DT905.C1205 = DT906.C1046
		)
	ON
		DT907.C723 = DT908.C426
	)
WHERE
	(
		(
			DT908.C427 = DT906.C1046
		)
		AND
		(
			(
				DT908.C434 = DT908.C436
			)
			OR
			(
				DT908.C432 < DT905.C1205
			)
		)
	)
	AND
	(
		(
			DT908.C434 <> DT906.C1035
		)
		AND
		(
			(
				DT908.C437 > DT908.C436
			)
			OR
			(
				DT907.C722 <> DT906.C1034
			)
		)
	)
GROUP BY
	DT907.C718
	, DT906.C1031
ORDER BY
	DT907.C718
	, SUM( DT907.C718 )
	, DT906.C1031
LIMIT 344;


SELECT
	COUNT( DT919.C2506 )
	, DT919.C2502
	, DT919.C2507
	, AVG( DT919.C2504 )
	, DT919.C2504
	, DT919.C2506
FROM
	(
		(
		SELECT
			DT918.C292
			, AVG( DT918.C296 )
			, DT917.C157
			, DT918.C296
			, DT917.C161
			, AVG( DT917.C161 )
		FROM
			(
				(
					T71 DT912
				INNER JOIN
					T12 DT917
				ON
					DT912.C861 = DT917.C160
				)
			INNER JOIN
				(
					T25 DT918
				INNER JOIN
					(
					SELECT
						SUM( DT915.C371 )
						, DT915.C370
					FROM
						(
							(
								T54 DT913
							INNER JOIN
								T32 DT915
							ON
								DT913.C657 < DT915.C376
							)
						INNER JOIN
							T51 DT914
						ON
							DT915.C371 < DT914.C620
						)
					WHERE
						(
							(
								DT914.C612 = DT915.C373
							)
							AND
							(
								DT915.C382 = DT915.C367
							)
						)
						OR
						(
							(
								(
									DT913.C655 = DT914.C611
								)
								AND
								(
									DT914.C617 > DT915.C376
								)
							)
							OR
							(
								DT913.C654 < DT915.C371
							)
						)
					GROUP BY
						DT915.C370
						, DT915.C371
						, DT914.C624
						, DT915.C382
					ORDER BY
						SUM( DT915.C371 )
						, DT915.C370
					LIMIT 401
					) AS DT916 ( C2497, C2498 ) 
				ON
					DT918.C296 = DT916.C2498
				)
			ON
				DT917.C160 > DT918.C284
			)
		WHERE
			(
				DT918.C289 < DT918.C294
			)
			AND
			(
				(
					(
						(
							DT918.C285 <> DT917.C158
						)
						AND
						(
							DT918.C288 < DT912.C860
						)
					)
					AND
					(
						DT918.C293 = DT917.C160
					)
				)
				OR
				(
					(
						DT918.C296 = DT918.C286
					)
					OR
					(
						(
							DT918.C284 > DT916.C2498
						)
						AND
						(
							DT917.C157 = DT918.C284
						)
					)
				)
			)
		GROUP BY
			DT918.C296
			, DT917.C157
			, DT918.C292
			, DT917.C161
			, DT916.C2498
		ORDER BY
			DT918.C292
			, AVG( DT918.C296 )
			, DT917.C157
			, DT918.C296
			, DT917.C161
			, AVG( DT917.C161 )
		LIMIT 909
		) AS DT919 ( C2502, C2503, C2504, C2505, C2506, C2507 ) 
	INNER JOIN
		(
		SELECT
			DT910.C447
			, DT909.C1016
		FROM
			(
				T84 DT909
			RIGHT OUTER JOIN
				T40 DT910
			ON
				DT909.C1013 > DT910.C448
			)
		WHERE
			(
				(
					DT909.C1023 < DT909.C1022
				)
				OR
				(
					DT909.C1021 <> DT909.C1025
				)
			)
			AND
			(
				(
					(
						DT909.C1027 = DT909.C1011
					)
					AND
					(
						(
							(
								DT909.C1015 <> DT909.C1016
							)
							AND
							(
								DT909.C1027 < DT909.C1008
							)
						)
						AND
						(
							DT909.C1022 < DT909.C1014
						)
					)
				)
				OR
				(
					(
						DT909.C1018 <> DT909.C1009
					)
					AND
					(
						DT910.C450 = DT909.C1026
					)
				)
			)
		GROUP BY
			DT910.C447
			, DT909.C1016
		ORDER BY
			DT910.C447
			, DT909.C1016
		LIMIT 794
		)  DT911 ( C2493, C2494 ) 
	ON
		DT919.C2502 = DT911.C2493
	)
WHERE
	(
		DT911.C2493 = DT919.C2504
	)
	OR
	(
		(
			(
				DT911.C2493 = DT911.C2493
			)
			AND
			(
				(
					DT911.C2493 = DT919.C2506
				)
				OR
				(
					DT919.C2505 = DT919.C2507
				)
			)
		)
		AND
		(
			DT911.C2493 > DT919.C2504
		)
	)
GROUP BY
	DT919.C2502
	, DT919.C2506
	, DT919.C2504
	, DT919.C2507
ORDER BY
	COUNT( DT919.C2506 )
	, DT919.C2502
	, DT919.C2507
	, AVG( DT919.C2504 )
	, DT919.C2504
	, DT919.C2506
LIMIT 690;


SELECT
	COUNT( DT924.C2514 )
	, DT924.C2514
	, DT925.C272
	, MIN( DT925.C272 )
	, DT925.C275
	, MAX( DT925.C275 )
FROM
	(
		(
			(
			SELECT
				DT922.C67
				, DT923.C961
			FROM
				(
					T77 DT923
				INNER JOIN
					T5 DT922
				ON
					DT923.C948 = DT922.C66
				)
			WHERE
				(
					(
						(
							(
								DT923.C947 = DT923.C962
							)
							AND
							(
								DT923.C964 = DT922.C68
							)
						)
						OR
						(
							DT922.C68 > DT922.C69
						)
					)
					OR
					(
						DT923.C950 = DT923.C948
					)
				)
				AND
				(
					DT923.C950 <> DT923.C947
				)
			GROUP BY
				DT923.C950
				, DT922.C66
				, DT922.C67
				, DT923.C961
			ORDER BY
				DT922.C67
				, DT923.C961
			LIMIT 480
			)  DT924 ( C2514, C2515 ) 
		INNER JOIN
			T23 DT925
		ON
			DT924.C2514 = DT925.C276
		)
	INNER JOIN
		(
			T18 DT921
		INNER JOIN
			T68 DT920
		ON
			DT921.C223 = DT920.C823
		)
	ON
		DT924.C2515 = DT921.C223
	)
WHERE
	(
		DT921.C221 = DT925.C275
	)
	AND
	(
		(
			(
				DT921.C220 = DT925.C272
			)
			OR
			(
				(
					DT925.C274 <> DT925.C272
				)
				OR
				(
					(
						DT924.C2514 > DT921.C220
					)
					OR
					(
						DT925.C276 = DT921.C226
					)
				)
			)
		)
		OR
		(
			(
				DT925.C273 <> DT920.C821
			)
			AND
			(
				DT924.C2514 < DT921.C228
			)
		)
	)
GROUP BY
	DT925.C272
	, DT925.C275
	, DT924.C2514
ORDER BY
	COUNT( DT924.C2514 )
	, DT924.C2514
	, DT925.C272
	, MIN( DT925.C272 )
	, DT925.C275
	, MAX( DT925.C275 )
LIMIT 527;


SELECT
	MIN( DT926.C109 )
	, COUNT( DT926.C108 )
FROM
	(
		T7 DT926
	INNER JOIN
		(
			(
				T13 DT933
			RIGHT OUTER JOIN
				T57 DT934
			ON
				DT933.C166 < DT934.C690
			)
		INNER JOIN
			(
			SELECT
				COUNT( DT931.C1194 )
				, DT931.C1194
				, DT930.C2524
			FROM
				(
					(
					SELECT
						DT928.C147
						, AVG( DT928.C144 )
						, DT927.C255
						, DT929.C705
						, DT929.C704
					FROM
						(
							(
								T21 DT927
							RIGHT OUTER JOIN
								T58 DT929
							ON
								DT927.C247 = DT929.C711
							)
						INNER JOIN
							T10 DT928
						ON
							DT929.C706 > DT928.C138
						)
					WHERE
						(
							(
								DT929.C708 < DT928.C141
							)
							AND
							(
								DT929.C705 = DT928.C143
							)
						)
						AND
						(
							(
								(
									DT927.C254 = DT929.C699
								)
								AND
								(
									DT927.C251 = DT928.C150
								)
							)
							AND
							(
								DT927.C249 = DT928.C142
							)
						)
					GROUP BY
						DT929.C704
						, DT929.C705
						, DT928.C147
						, DT928.C144
						, DT927.C255
					ORDER BY
						DT928.C147
						, AVG( DT928.C144 )
						, DT927.C255
						, DT929.C705
						, DT929.C704
					LIMIT 543
					)  DT930 ( C2520, C2521, C2522, C2523, C2524 ) 
				INNER JOIN
					T97 DT931
				ON
					DT930.C2523 < DT931.C1192
				)
			WHERE
				(
					(
						(
							DT930.C2523 <> DT931.C1197
						)
						AND
						(
							DT931.C1195 < DT931.C1200
						)
					)
					OR
					(
						DT931.C1192 = DT931.C1200
					)
				)
				OR
				(
					(
						(
							DT930.C2521 < DT930.C2521
						)
						AND
						(
							DT931.C1198 < DT931.C1196
						)
					)
					OR
					(
						DT930.C2523 < DT931.C1195
					)
				)
			GROUP BY
				DT931.C1194
				, DT931.C1193
				, DT930.C2524
			ORDER BY
				COUNT( DT931.C1194 )
				, DT931.C1194
				, DT930.C2524
			LIMIT 221
			) AS DT932 ( C2526, C2527, C2528 ) 
		ON
			DT934.C687 = DT932.C2527
		)
	ON
		DT926.C91 = DT932.C2528
	)
WHERE
	(
		(
			DT934.C687 = DT926.C92
		)
		OR
		(
			DT933.C173 <> DT933.C167
		)
	)
	AND
	(
		(
			DT933.C167 = DT926.C106
		)
		OR
		(
			(
				DT926.C89 = DT934.C685
			)
			AND
			(
				DT934.C689 > DT932.C2528
			)
		)
	)
GROUP BY
	DT926.C89
	, DT926.C109
	, DT926.C108
ORDER BY
	MIN( DT926.C109 )
	, COUNT( DT926.C108 )
LIMIT 767;


SELECT
	DT935.C516
	, DT935.C512
	, DT936.C1029
	, DT937.C1203
	, DT938.C155
	, DT935.C513
	, DT936.C1045
	, DT938.C156
	, DT935.C525
	, DT936.C1032
	, DT935.C526
	, DT935.C527
	, DT937.C1201
	, DT935.C523
	, DT936.C1040
	, DT936.C1034
	, DT935.C524
	, DT936.C1039
	, DT936.C1043
	, DT936.C1033
	, DT935.C514
	, DT938.C154
	, DT938.C153
	, DT936.C1044
FROM
	(
		T85 DT936
	LEFT OUTER JOIN
		(
			(
				T45 DT935
			INNER JOIN
				T11 DT938
			ON
				DT935.C513 = DT938.C155
			)
		RIGHT OUTER JOIN
			T98 DT937
		ON
			DT935.C526 = DT937.C1203
		)
	ON
		DT936.C1033 < DT935.C513
	)
WHERE
	(
		(
			(
				DT938.C154 = DT935.C524
			)
			AND
			(
				(
					DT936.C1035 <> DT935.C524
				)
				OR
				(
					DT937.C1202 > DT936.C1031
				)
			)
		)
		AND
		(
			DT938.C154 = DT936.C1043
		)
	)
	AND
	(
		(
			DT936.C1030 = DT935.C518
		)
		OR
		(
			DT936.C1035 = DT936.C1043
		)
	)
ORDER BY
	DT935.C516
	, DT935.C512
	, DT936.C1029
	, DT937.C1203
	, DT938.C155
	, DT935.C513
	, DT936.C1045
	, DT938.C156
	, DT935.C525
	, DT936.C1032
	, DT935.C526
	, DT935.C527
	, DT937.C1201
	, DT935.C523
	, DT936.C1040
	, DT936.C1034
	, DT935.C524
	, DT936.C1039
	, DT936.C1043
	, DT936.C1033
	, DT935.C514
	, DT938.C154
	, DT938.C153
	, DT936.C1044
LIMIT 217;


SELECT
	DT944.C2537
	, DT946.C270
	, MAX( DT946.C276 )
	, MIN( DT946.C270 )
	, MIN( DT939.C938 )
	, DT946.C276
	, DT939.C938
	, DT939.C942
FROM
	(
		(
			T76 DT939
		INNER JOIN
			(
				T23 DT946
			INNER JOIN
				(
				SELECT
					DT943.C855
					, DT943.C859
					, DT942.C263
					, DT942.C261
					, DT943.C857
				FROM
					(
						(
							(
								T22 DT942
							INNER JOIN
								T75 DT940
							ON
								DT942.C265 <> DT940.C934
							)
						INNER JOIN
							T94 DT941
						ON
							DT940.C935 <> DT941.C1150
						)
					INNER JOIN
						T70 DT943
					ON
						DT942.C261 <> DT943.C853
					)
				WHERE
					(
						(
							DT943.C849 > DT942.C269
						)
						OR
						(
							DT942.C269 < DT940.C937
						)
					)
					OR
					(
						(
							DT940.C930 = DT941.C1152
						)
						OR
						(
							(
								DT942.C267 = DT943.C848
							)
							OR
							(
								DT943.C857 <> DT941.C1149
							)
						)
					)
				GROUP BY
					DT943.C857
					, DT942.C261
					, DT943.C855
					, DT943.C859
					, DT942.C263
				ORDER BY
					DT943.C855
					, DT943.C859
					, DT942.C263
					, DT942.C261
					, DT943.C857
				LIMIT 468
				) AS DT944 ( C2533, C2534, C2535, C2536, C2537 ) 
			ON
				DT946.C278 <> DT944.C2536
			)
		ON
			DT939.C946 = DT946.C274
		)
	INNER JOIN
		T29 DT945
	ON
		DT946.C271 = DT945.C335
	)
WHERE
	(
		(
			DT945.C335 = DT945.C340
		)
		OR
		(
			(
				DT944.C2533 = DT939.C946
			)
			OR
			(
				(
					DT939.C939 = DT944.C2535
				)
				AND
				(
					DT945.C338 <> DT946.C272
				)
			)
		)
	)
	OR
	(
		(
			(
				DT944.C2534 < DT946.C278
			)
			AND
			(
				DT939.C942 <> DT946.C274
			)
		)
		AND
		(
			DT939.C946 > DT945.C338
		)
	)
GROUP BY
	DT944.C2537
	, DT939.C938
	, DT946.C270
	, DT939.C942
	, DT946.C276
ORDER BY
	DT944.C2537
	, DT946.C270
	, MAX( DT946.C276 )
	, MIN( DT946.C270 )
	, MIN( DT939.C938 )
	, DT946.C276
	, DT939.C938
	, DT939.C942
LIMIT 229;


SELECT
	MAX( DT948.C51 )
	, DT948.C35
	, to_char(AVG( DT951.C2546 ),'9999999.9999999')
	, COUNT( DT948.C35 )
FROM
	(
		T29 DT947
	INNER JOIN
		(
			T3 DT948
		INNER JOIN
			(
			SELECT
				DT949.C135
				, MAX( DT949.C128 )
				, DT950.C246
				, DT949.C128
				, DT950.C237
			FROM
				(
					T20 DT950
				INNER JOIN
					T9 DT949
				ON
					DT950.C238 = DT949.C129
				)
			WHERE
				(
					(
						DT949.C136 < DT950.C241
					)
					AND
					(
						(
							DT950.C233 = DT950.C241
						)
						OR
						(
							DT949.C136 = DT949.C131
						)
					)
				)
				OR
				(
					(
						(
							DT950.C234 = DT949.C136
						)
						AND
						(
							DT949.C133 < DT949.C134
						)
					)
					OR
					(
						DT949.C127 = DT949.C126
					)
				)
			GROUP BY
				DT950.C235
				, DT949.C128
				, DT950.C246
				, DT950.C237
				, DT949.C135
			ORDER BY
				DT949.C135
				, MAX( DT949.C128 )
				, DT950.C246
				, DT949.C128
				, DT950.C237
			LIMIT 645
			)  DT951 ( C2542, C2543, C2544, C2545, C2546 ) 
		ON
			DT948.C48 < DT951.C2542
		)
	ON
		DT947.C338 <> DT948.C48
	)
WHERE
	(
		(
			DT948.C41 <> DT948.C36
		)
		AND
		(
			DT948.C46 <> DT948.C47
		)
	)
	AND
	(
		(
			(
				DT948.C38 = DT948.C49
			)
			OR
			(
				DT951.C2544 = DT951.C2546
			)
		)
		OR
		(
			DT948.C32 = DT948.C32
		)
	)
GROUP BY
	DT951.C2546
	, DT948.C35
	, DT948.C51
ORDER BY
	MAX( DT948.C51 )
	, DT948.C35
	, AVG( DT951.C2546 )
	, COUNT( DT948.C35 )
LIMIT 185;


SELECT
	MIN( DT955.C2555 )
	, DT955.C2554
	, MAX( DT958.C2558 )
	, DT955.C2555
	, DT958.C2558
FROM
	(
		(
		SELECT
			MAX( DT956.C914 )
			, DT956.C914
		FROM
			(
				T35 DT957
			INNER JOIN
				T74 DT956
			ON
				DT957.C414 = DT956.C920
			)
		WHERE
			(
				(
					DT957.C416 <> DT957.C414
				)
				AND
				(
					DT957.C418 = DT957.C413
				)
			)
			OR
			(
				(
					DT957.C417 = DT957.C414
				)
				AND
				(
					(
						DT956.C926 = DT956.C918
					)
					OR
					(
						(
							DT956.C913 = DT957.C415
						)
						OR
						(
							DT956.C914 > DT957.C416
						)
					)
				)
			)
		GROUP BY
			DT956.C914
			, DT956.C916
			, DT956.C925
		ORDER BY
			MAX( DT956.C914 )
			, DT956.C914
		LIMIT 269
		)  DT958 ( C2557, C2558 ) 
	INNER JOIN
		(
		SELECT
			DT952.C74
			, SUM( DT953.C677 )
			, SUM( DT952.C74 )
		FROM
			(
				T56 DT953
			INNER JOIN
				(
					T5 DT952
				INNER JOIN
					T30 DT954
				ON
					DT952.C70 > DT954.C343
				)
			ON
				DT953.C676 = DT954.C341
			)
		WHERE
			(
				(
					(
						DT953.C669 <> DT953.C676
					)
					AND
					(
						DT953.C670 < DT954.C342
					)
				)
				AND
				(
					DT952.C66 = DT953.C673
				)
			)
			OR
			(
				(
					(
						DT953.C669 > DT953.C674
					)
					OR
					(
						DT952.C72 < DT952.C71
					)
				)
				OR
				(
					DT953.C678 = DT952.C69
				)
			)
		GROUP BY
			DT953.C677
			, DT952.C74
			, DT953.C679
		ORDER BY
			DT952.C74
			, SUM( DT953.C677 )
			, SUM( DT952.C74 )
		LIMIT 988
		) AS DT955 ( C2553, C2554, C2555 ) 
	ON
		DT958.C2557 < DT955.C2555
	)
WHERE
	(
		(
			(
				DT955.C2554 > DT958.C2557
			)
			AND
			(
				(
					DT958.C2558 < DT955.C2554
				)
				AND
				(
					DT955.C2553 = DT955.C2553
				)
			)
		)
		AND
		(
			DT955.C2555 < DT955.C2555
		)
	)
	OR
	(
		DT955.C2553 <> DT955.C2553
	)
GROUP BY
	DT955.C2554
	, DT955.C2555
	, DT958.C2558
ORDER BY
	MIN( DT955.C2555 )
	, DT955.C2554
	, MAX( DT958.C2558 )
	, DT955.C2555
	, DT958.C2558
LIMIT 815;


SELECT
	DT967.C142
FROM
	(
		T10 DT967
	INNER JOIN
		(
			(
			SELECT
				DT963.C131
			FROM
				(
					T9 DT963
				INNER JOIN
					(
					SELECT
						DT961.C866
						, DT959.C378
						, MAX( DT959.C376 )
						, DT959.C376
					FROM
						(
							T32 DT959
						INNER JOIN
							(
								T3 DT960
							INNER JOIN
								T71 DT961
							ON
								DT960.C44 = DT961.C864
							)
						ON
							DT959.C364 <> DT960.C45
						)
					WHERE
						(
							DT959.C373 <> DT959.C369
						)
						AND
						(
							(
								(
									DT959.C364 = DT960.C37
								)
								OR
								(
									DT960.C46 = DT960.C48
								)
							)
							OR
							(
								(
									DT961.C860 > DT960.C46
								)
								AND
								(
									DT961.C864 > DT959.C371
								)
							)
						)
					GROUP BY
						DT959.C378
						, DT960.C37
						, DT961.C866
						, DT959.C377
						, DT959.C376
					ORDER BY
						DT961.C866
						, DT959.C378
						, MAX( DT959.C376 )
						, DT959.C376
					LIMIT 982
					) AS DT962 ( C2563, C2564, C2565, C2566 ) 
				ON
					DT963.C126 = DT962.C2566
				)
			WHERE
				(
					(
						(
							DT962.C2564 > DT962.C2564
						)
						OR
						(
							(
								(
									DT963.C127 <> DT962.C2565
								)
								AND
								(
									DT962.C2564 > DT963.C136
								)
							)
							OR
							(
								DT963.C133 > DT962.C2563
							)
						)
					)
					AND
					(
						(
							DT963.C126 = DT963.C132
						)
						AND
						(
							(
								DT963.C131 <> DT963.C129
							)
							AND
							(
								DT963.C127 > DT963.C134
							)
						)
					)
				)
				OR
				(
					DT962.C2564 > DT963.C129
				)
			GROUP BY
				DT963.C129
				, DT963.C135
				, DT963.C131
			ORDER BY
				DT963.C131
			LIMIT 705
			) AS DT964 ( C2568 ) 
		INNER JOIN
			(
				T17 DT965
			INNER JOIN
				T5 DT966
			ON
				DT965.C214 <> DT966.C70
			)
		ON
			DT964.C2568 < DT966.C69
		)
	ON
		DT967.C143 = DT966.C74
	)
WHERE
	(
		(
			DT967.C144 = DT966.C69
		)
		OR
		(
			(
				(
					DT966.C74 <> DT965.C212
				)
				OR
				(
					DT965.C207 = DT965.C209
				)
			)
			AND
			(
				(
					DT967.C147 = DT966.C67
				)
				AND
				(
					DT966.C67 <> DT967.C145
				)
			)
		)
	)
	AND
	(
		DT966.C67 = DT965.C218
	)
GROUP BY
	DT965.C218
	, DT967.C142
ORDER BY
	DT967.C142
LIMIT 817;


SELECT
	DT969.C608
	, DT969.C623
	, DT969.C615
	, MIN( DT971.C266 )
	, COUNT( DT969.C623 )
FROM
	(
		(
			(
				T51 DT969
			INNER JOIN
				T82 DT970
			ON
				DT969.C617 = DT970.C997
			)
		LEFT OUTER JOIN
			T22 DT971
		ON
			DT969.C620 = DT971.C266
		)
	INNER JOIN
		T28 DT968
	ON
		DT970.C995 > DT968.C330
	)
WHERE
	(
		DT969.C619 = DT969.C619
	)
	AND
	(
		(
			(
				(
					(
						DT969.C621 < DT971.C267
					)
					AND
					(
						DT969.C622 < DT968.C332
					)
				)
				AND
				(
					(
						DT971.C263 < DT971.C263
					)
					AND
					(
						DT971.C264 <> DT968.C331
					)
				)
			)
			AND
			(
				DT969.C615 < DT969.C614
			)
		)
		OR
		(
			DT971.C268 < DT969.C611
		)
	)
GROUP BY
	DT969.C623
	, DT971.C266
	, DT969.C608
	, DT969.C615
ORDER BY
	DT969.C608
	, DT969.C623
	, DT969.C615
	, MIN( DT971.C266 )
	, COUNT( DT969.C623 )
LIMIT 559;


SELECT
	MIN( DT980.C131 )
	, DT980.C126
	, DT980.C137
	, SUM( DT980.C137 )
	, MAX( DT980.C126 )
FROM
	(
		T9 DT980
	INNER JOIN
		(
		SELECT
			MAX( DT973.C732 )
			, SUM( DT977.C2579 )
			, DT973.C732
			, DT977.C2579
		FROM
			(
				(
					T61 DT973
				INNER JOIN
					T83 DT978
				ON
					DT973.C730 <> DT978.C1001
				)
			INNER JOIN
				(
					(
					SELECT
						AVG( DT975.C141 )
						, COUNT( DT976.C982 )
						, DT976.C982
						, MIN( DT975.C144 )
					FROM
						(
							(
								T89 DT974
							INNER JOIN
								T10 DT975
							ON
								DT974.C1077 = DT975.C143
							)
						INNER JOIN
							T79 DT976
						ON
							DT974.C1077 = DT976.C982
						)
					WHERE
						(
							(
								DT975.C150 = DT976.C979
							)
							OR
							(
								DT975.C148 < DT976.C983
							)
						)
						OR
						(
							(
								DT974.C1076 <> DT975.C138
							)
							AND
							(
								(
									DT975.C147 > DT974.C1078
								)
								OR
								(
									(
										DT976.C980 <> DT975.C150
									)
									OR
									(
										DT975.C139 = DT976.C982
									)
								)
							)
						)
					GROUP BY
						DT976.C982
						, DT975.C141
						, DT975.C144
						, DT974.C1076
					ORDER BY
						AVG( DT975.C141 )
						, COUNT( DT976.C982 )
						, DT976.C982
						, MIN( DT975.C144 )
					LIMIT 203
					) AS DT977 ( C2576, C2577, C2578, C2579 ) 
				INNER JOIN
					T40 DT972
				ON
					DT977.C2577 > DT972.C450
				)
			ON
				DT973.C726 = DT972.C447
			)
		WHERE
			(
				(
					DT978.C1001 = DT973.C728
				)
				OR
				(
					DT978.C1001 <> DT972.C449
				)
			)
			AND
			(
				(
					DT978.C1001 < DT977.C2578
				)
				AND
				(
					(
						(
							(
								DT978.C1006 <> DT977.C2577
							)
							AND
							(
								DT973.C727 = DT977.C2578
							)
						)
						AND
						(
							DT972.C447 = DT973.C735
						)
					)
					OR
					(
						DT978.C1003 < DT973.C728
					)
				)
			)
		GROUP BY
			DT973.C732
			, DT977.C2579
		ORDER BY
			MAX( DT973.C732 )
			, SUM( DT977.C2579 )
			, DT973.C732
			, DT977.C2579
		LIMIT 674
		)  DT979 ( C2582, C2583, C2584, C2585 ) 
	ON
		DT980.C129 = DT979.C2585
	)
WHERE
	(
		(
			DT979.C2583 <> DT980.C127
		)
		AND
		(
			(
				(
					(
						(
							DT979.C2582 < DT979.C2583
						)
						OR
						(
							DT980.C135 < DT980.C135
						)
					)
					OR
					(
						DT980.C135 <> DT980.C126
					)
				)
				AND
				(
					DT979.C2583 <> DT980.C136
				)
			)
			AND
			(
				DT980.C126 <> DT980.C127
			)
		)
	)
	OR
	(
		(
			DT980.C127 = DT980.C127
		)
		OR
		(
			DT979.C2585 > DT980.C135
		)
	)
GROUP BY
	DT980.C126
	, DT980.C137
	, DT980.C131
	, DT979.C2584
ORDER BY
	MIN( DT980.C131 )
	, DT980.C126
	, DT980.C137
	, SUM( DT980.C137 )
	, MAX( DT980.C126 )
LIMIT 869;


SELECT
	DT986.C343
	, AVG( DT981.C1003 )
	, DT981.C1002
FROM
	(
		(
		SELECT
			MIN( DT983.C418 )
		FROM
			(
				T35 DT983
			INNER JOIN
				(
					T48 DT984
				INNER JOIN
					T31 DT982
				ON
					DT984.C579 > DT982.C361
				)
			ON
				DT983.C414 <> DT984.C576
			)
		WHERE
			(
				(
					DT983.C417 = DT983.C416
				)
				AND
				(
					DT982.C350 = DT983.C417
				)
			)
			AND
			(
				(
					(
						(
							DT982.C354 > DT984.C579
						)
						OR
						(
							DT984.C584 <> DT984.C568
						)
					)
					OR
					(
						DT982.C353 > DT983.C415
					)
				)
				OR
				(
					(
						DT982.C354 = DT984.C572
					)
					OR
					(
						DT984.C575 > DT983.C414
					)
				)
			)
		GROUP BY
			DT984.C569
			, DT984.C575
			, DT982.C357
			, DT983.C418
			, DT982.C346
		ORDER BY
			MIN( DT983.C418 )
		LIMIT 698
		) AS DT985 ( C2592 ) 
	RIGHT OUTER JOIN
		(
			T30 DT986
		LEFT OUTER JOIN
			(
				T83 DT981
			LEFT OUTER JOIN
				T30 DT987
			ON
				DT981.C1003 = DT987.C342
			)
		ON
			DT986.C343 < DT981.C1002
		)
	ON
		DT985.C2592 = DT986.C343
	)
WHERE
	(
		DT981.C1001 <> DT986.C343
	)
	AND
	(
		(
			(
				DT981.C1005 = DT981.C1006
			)
			OR
			(
				DT981.C1001 = DT981.C1004
			)
		)
		AND
		(
			(
				DT985.C2592 = DT987.C341
			)
			AND
			(
				(
					DT981.C1004 < DT981.C1007
				)
				AND
				(
					DT985.C2592 = DT987.C341
				)
			)
		)
	)
GROUP BY
	DT981.C1006
	, DT986.C343
	, DT981.C1002
	, DT981.C1003
ORDER BY
	DT986.C343
	, AVG( DT981.C1003 )
	, DT981.C1002
LIMIT 759;


SELECT
	SUM( DT990.C399 )
	, DT990.C399
	, DT988.C16
FROM
	(
		(
		SELECT
			DT991.C459
			, DT991.C455
			, COUNT( DT991.C469 )
			, DT992.C130
			, COUNT( DT991.C459 )
		FROM
			(
				T9 DT992
			LEFT OUTER JOIN
				T41 DT991
			ON
				DT992.C132 = DT991.C454
			)
		WHERE
			(
				(
					(
						DT991.C468 > DT991.C454
					)
					OR
					(
						DT991.C466 < DT992.C131
					)
				)
				OR
				(
					DT991.C459 < DT991.C469
				)
			)
			AND
			(
				(
					DT991.C472 = DT992.C135
				)
				OR
				(
					DT991.C469 > DT991.C472
				)
			)
		GROUP BY
			DT991.C459
			, DT992.C130
			, DT991.C455
			, DT991.C469
		ORDER BY
			DT991.C459
			, DT991.C455
			, COUNT( DT991.C469 )
			, DT992.C130
			, COUNT( DT991.C459 )
		LIMIT 657
		)  DT993 ( C2600, C2601, C2602, C2603, C2604 ) 
	INNER JOIN
		(
			T24 DT989
		INNER JOIN
			(
				T2 DT988
			RIGHT OUTER JOIN
				T33 DT990
			ON
				DT988.C15 <> DT990.C391
			)
		ON
			DT989.C282 = DT988.C16
		)
	ON
		DT993.C2602 < DT990.C393
	)
WHERE
	(
		(
			(
				(
					DT988.C28 = DT990.C384
				)
				AND
				(
					DT988.C26 > DT993.C2601
				)
			)
			OR
			(
				(
					(
						DT988.C24 < DT993.C2600
					)
					AND
					(
						DT990.C384 = DT990.C401
					)
				)
				OR
				(
					DT989.C279 <> DT988.C24
				)
			)
		)
		OR
		(
			DT990.C400 = DT990.C383
		)
	)
	AND
	(
		(
			DT988.C27 = DT988.C31
		)
		OR
		(
			DT990.C392 < DT990.C383
		)
	)
GROUP BY
	DT988.C21
	, DT990.C399
	, DT988.C16
ORDER BY
	SUM( DT990.C399 )
	, DT990.C399
	, DT988.C16
LIMIT 448;


SELECT
	DT994.C791
	, DT995.C610
FROM
	(
		(
			T27 DT997
		RIGHT OUTER JOIN
			(
				T65 DT994
			INNER JOIN
				T51 DT995
			ON
				DT994.C793 = DT995.C619
			)
		ON
			DT997.C325 < DT995.C620
		)
	INNER JOIN
		T77 DT996
	ON
		DT997.C325 > DT996.C962
	)
WHERE
	(
		(
			DT996.C955 < DT995.C610
		)
		AND
		(
			(
				(
					DT996.C952 = DT996.C954
				)
				AND
				(
					DT994.C797 = DT994.C785
				)
			)
			OR
			(
				(
					DT994.C783 < DT996.C955
				)
				AND
				(
					DT996.C948 < DT997.C321
				)
			)
		)
	)
	OR
	(
		DT997.C326 = DT996.C952
	)
GROUP BY
	DT995.C610
	, DT996.C951
	, DT994.C791
ORDER BY
	DT994.C791
	, DT995.C610
LIMIT 197;


SELECT
	DT1000.C2611
	, MIN( DT1001.C1044 )
FROM
	(
		(
			T85 DT1001
		INNER JOIN
			(
				T15 DT1007
			INNER JOIN
				(
				SELECT
					DT999.C850
					, MAX( DT999.C841 )
					, DT998.C573
					, DT998.C581
					, DT999.C841
					, AVG( DT999.C845 )
				FROM
					(
						T48 DT998
					INNER JOIN
						T70 DT999
					ON
						DT998.C585 = DT999.C850
					)
				WHERE
					(
						(
							(
								DT998.C584 < DT999.C857
							)
							AND
							(
								DT998.C584 = DT999.C851
							)
						)
						AND
						(
							(
								DT998.C583 = DT999.C848
							)
							OR
							(
								DT998.C574 = DT998.C576
							)
						)
					)
					OR
					(
						(
							(
								(
									DT998.C584 > DT998.C581
								)
								OR
								(
									DT999.C856 > DT998.C576
								)
							)
							OR
							(
								DT999.C840 = DT999.C848
							)
						)
						AND
						(
							DT999.C847 <> DT998.C582
						)
					)
				GROUP BY
					DT999.C841
					, DT999.C845
					, DT998.C581
					, DT999.C850
					, DT998.C573
				ORDER BY
					DT999.C850
					, MAX( DT999.C841 )
					, DT998.C573
					, DT998.C581
					, DT999.C841
					, AVG( DT999.C845 )
				LIMIT 536
				) AS DT1000 ( C2610, C2611, C2612, C2613, C2614, C2615 ) 
			ON
				DT1007.C188 = DT1000.C2614
			)
		ON
			DT1001.C1029 = DT1000.C2612
		)
	INNER JOIN
		(
		SELECT
			DT1002.C1069
			, DT1002.C1073
			, DT1005.C702
			, DT1003.C435
			, DT1003.C423
			, DT1005.C711
		FROM
			(
				T88 DT1002
			LEFT OUTER JOIN
				(
					(
						T91 DT1004
					INNER JOIN
						T36 DT1003
					ON
						DT1004.C1094 <> DT1003.C434
					)
				INNER JOIN
					T58 DT1005
				ON
					DT1004.C1100 < DT1005.C702
				)
			ON
				DT1002.C1074 = DT1003.C419
			)
		WHERE
			(
				DT1004.C1112 = DT1005.C698
			)
			OR
			(
				(
					DT1004.C1098 < DT1003.C436
				)
				OR
				(
					(
						(
							DT1002.C1072 <> DT1002.C1070
						)
						AND
						(
							DT1004.C1103 <> DT1004.C1096
						)
					)
					AND
					(
						(
							DT1003.C434 = DT1003.C429
						)
						OR
						(
							(
								DT1003.C420 <> DT1005.C701
							)
							AND
							(
								(
									DT1004.C1111 = DT1005.C700
								)
								OR
								(
									DT1004.C1110 = DT1003.C430
								)
							)
						)
					)
				)
			)
		ORDER BY
			DT1002.C1069
			, DT1002.C1073
			, DT1005.C702
			, DT1003.C435
			, DT1003.C423
			, DT1005.C711
		LIMIT 730
		)  DT1006 ( C2616, C2617, C2618, C2619, C2620, C2621 ) 
	ON
		DT1007.C191 = DT1006.C2621
	)
WHERE
	(
		(
			DT1001.C1038 > DT1000.C2610
		)
		AND
		(
			DT1000.C2610 = DT1006.C2618
		)
	)
	AND
	(
		(
			DT1001.C1029 = DT1000.C2612
		)
		AND
		(
			(
				DT1007.C194 <> DT1006.C2619
			)
			OR
			(
				(
					DT1006.C2616 < DT1001.C1031
				)
				AND
				(
					DT1001.C1045 = DT1001.C1041
				)
			)
		)
	)
GROUP BY
	DT1000.C2611
	, DT1001.C1044
ORDER BY
	DT1000.C2611
	, MIN( DT1001.C1044 )
LIMIT 610;


SELECT
	DT1012.C2625
	, DT1013.C1138
	, DT1013.C1142
	, MIN( DT1013.C1137 )
	, DT1013.C1140
FROM
	(
		T93 DT1013
	INNER JOIN
		(
		SELECT
			AVG( DT1010.C1157 )
			, DT1009.C269
			, DT1010.C1157
		FROM
			(
				(
					T19 DT1011
				INNER JOIN
					T94 DT1010
				ON
					DT1011.C231 = DT1010.C1159
				)
			INNER JOIN
				(
					T89 DT1008
				INNER JOIN
					T22 DT1009
				ON
					DT1008.C1078 = DT1009.C262
				)
			ON
				DT1011.C232 = DT1009.C262
			)
		WHERE
			(
				(
					(
						DT1010.C1148 = DT1009.C260
					)
					OR
					(
						DT1010.C1166 < DT1010.C1157
					)
				)
				AND
				(
					(
						(
							(
								DT1009.C260 <> DT1010.C1158
							)
							OR
							(
								DT1010.C1147 > DT1009.C260
							)
						)
						OR
						(
							DT1009.C266 < DT1010.C1154
						)
					)
					OR
					(
						DT1009.C267 <> DT1010.C1157
					)
				)
			)
			OR
			(
				(
					DT1011.C231 <> DT1010.C1157
				)
				AND
				(
					DT1009.C265 = DT1010.C1152
				)
			)
		GROUP BY
			DT1009.C269
			, DT1010.C1155
			, DT1010.C1157
			, DT1010.C1156
		ORDER BY
			AVG( DT1010.C1157 )
			, DT1009.C269
			, DT1010.C1157
		LIMIT 402
		) AS DT1012 ( C2625, C2626, C2627 ) 
	ON
		DT1013.C1139 = DT1012.C2627
	)
WHERE
	(
		(
			DT1013.C1136 < DT1013.C1140
		)
		OR
		(
			DT1012.C2626 <> DT1013.C1144
		)
	)
	AND
	(
		(
			(
				DT1012.C2625 <> DT1013.C1136
			)
			AND
			(
				(
					DT1013.C1139 <> DT1012.C2626
				)
				AND
				(
					DT1013.C1139 < DT1013.C1139
				)
			)
		)
		AND
		(
			(
				DT1012.C2627 < DT1013.C1142
			)
			AND
			(
				DT1013.C1144 = DT1013.C1142
			)
		)
	)
GROUP BY
	DT1013.C1138
	, DT1012.C2625
	, DT1013.C1142
	, DT1013.C1140
	, DT1013.C1137
ORDER BY
	DT1012.C2625
	, DT1013.C1138
	, DT1013.C1142
	, MIN( DT1013.C1137 )
	, DT1013.C1140
LIMIT 810;


SELECT
	DT1014.C982
	, DT1016.C1205
	, DT1017.C74
FROM
	(
		T23 DT1015
	INNER JOIN
		(
			T99 DT1016
		INNER JOIN
			(
				T79 DT1014
			INNER JOIN
				T5 DT1017
			ON
				DT1014.C985 < DT1017.C74
			)
		ON
			DT1016.C1204 > DT1014.C983
		)
	ON
		DT1015.C274 = DT1017.C74
	)
WHERE
	(
		(
			DT1015.C277 > DT1017.C69
		)
		AND
		(
			(
				(
					DT1016.C1208 = DT1014.C981
				)
				OR
				(
					DT1016.C1205 <> DT1014.C981
				)
			)
			AND
			(
				(
					(
						DT1016.C1204 = DT1014.C985
					)
					OR
					(
						DT1014.C985 = DT1017.C72
					)
				)
				AND
				(
					(
						DT1017.C68 < DT1016.C1204
					)
					OR
					(
						DT1014.C981 <> DT1015.C275
					)
				)
			)
		)
	)
	OR
	(
		DT1015.C273 = DT1014.C985
	)
GROUP BY
	DT1017.C74
	, DT1016.C1205
	, DT1014.C982
ORDER BY
	DT1014.C982
	, DT1016.C1205
	, DT1017.C74
LIMIT 379;


SELECT
	DT1022.C566
	, DT1022.C548
	, SUM( DT1022.C556 )
FROM
	(
		T47 DT1022
	RIGHT OUTER JOIN
		(
		SELECT
			DT1019.C1123
			, SUM( DT1019.C1115 )
			, DT1018.C810
		FROM
			(
				T54 DT1020
			INNER JOIN
				(
					T92 DT1019
				INNER JOIN
					T67 DT1018
				ON
					DT1019.C1132 <> DT1018.C810
				)
			ON
				DT1020.C654 <> DT1019.C1125
			)
		WHERE
			(
				DT1018.C811 < DT1019.C1127
			)
			OR
			(
				(
					DT1018.C820 = DT1019.C1115
				)
				AND
				(
					(
						(
							DT1020.C654 > DT1019.C1126
						)
						AND
						(
							DT1018.C809 < DT1018.C814
						)
					)
					OR
					(
						DT1019.C1118 = DT1018.C820
					)
				)
			)
		GROUP BY
			DT1019.C1130
			, DT1018.C810
			, DT1019.C1123
			, DT1019.C1115
		ORDER BY
			DT1019.C1123
			, SUM( DT1019.C1115 )
			, DT1018.C810
		LIMIT 145
		) AS DT1021 ( C2634, C2635, C2636 ) 
	ON
		DT1022.C561 > DT1021.C2635
	)
WHERE
	(
		(
			DT1022.C555 = DT1022.C563
		)
		OR
		(
			DT1022.C558 = DT1022.C555
		)
	)
	AND
	(
		(
			(
				(
					DT1022.C549 < DT1022.C554
				)
				AND
				(
					DT1022.C567 <> DT1022.C551
				)
			)
			AND
			(
				(
					DT1022.C559 > DT1022.C560
				)
				AND
				(
					(
						DT1022.C565 = DT1022.C554
					)
					AND
					(
						DT1022.C557 = DT1022.C549
					)
				)
			)
		)
		OR
		(
			DT1022.C554 = DT1022.C562
		)
	)
GROUP BY
	DT1022.C550
	, DT1022.C566
	, DT1022.C548
	, DT1022.C556
ORDER BY
	DT1022.C566
	, DT1022.C548
	, SUM( DT1022.C556 )
LIMIT 913;


SELECT
	MIN( DT1043.C2668 )
	, DT1043.C2667
FROM
	(
		T45 DT1024
	INNER JOIN
		(
			T62 DT1023
		INNER JOIN
			(
			SELECT
				COUNT( DT1042.C208 )
				, DT1042.C207
				, DT1042.C208
				, AVG( DT1042.C207 )
				, DT1033.C2649
				, MAX( DT1033.C2649 )
			FROM
				(
					(
						(
						SELECT
							DT1025.C28
							, DT1026.C788
						FROM
							(
								(
									T65 DT1026
								RIGHT OUTER JOIN
									T38 DT1027
								ON
									DT1026.C783 <> DT1027.C443
								)
							INNER JOIN
								(
									(
									SELECT
										SUM( DT1028.C1104 )
										, DT1030.C962
										, COUNT( DT1029.C502 )
										, DT1028.C1104
										, DT1029.C502
										, DT1030.C949
									FROM
										(
											(
												T44 DT1029
											INNER JOIN
												(
													T34 DT1031
												INNER JOIN
													T77 DT1030
												ON
													DT1031.C404 = DT1030.C962
												)
											ON
												DT1029.C505 > DT1031.C404
											)
										INNER JOIN
											T91 DT1028
										ON
											DT1031.C405 > DT1028.C1097
										)
									WHERE
										(
											(
												DT1031.C408 = DT1030.C962
											)
											OR
											(
												(
													(
														DT1029.C511 < DT1028.C1111
													)
													OR
													(
														DT1028.C1096 < DT1030.C950
													)
												)
												OR
												(
													DT1028.C1107 < DT1030.C963
												)
											)
										)
										AND
										(
											(
												(
													(
														DT1028.C1107 = DT1030.C953
													)
													OR
													(
														DT1029.C507 > DT1031.C410
													)
												)
												AND
												(
													DT1030.C956 = DT1028.C1108
												)
											)
											OR
											(
												DT1028.C1114 < DT1028.C1108
											)
										)
									GROUP BY
										DT1030.C949
										, DT1030.C962
										, DT1029.C502
										, DT1028.C1104
									ORDER BY
										SUM( DT1028.C1104 )
										, DT1030.C962
										, COUNT( DT1029.C502 )
										, DT1028.C1104
										, DT1029.C502
										, DT1030.C949
									LIMIT 783
									)  DT1032 ( C2642, C2643, C2644, C2645, C2646, C2647 ) 
								INNER JOIN
									T2 DT1025
								ON
									DT1032.C2645 > DT1025.C22
								)
							ON
								DT1026.C792 = DT1025.C30
							)
						WHERE
							(
								(
									DT1026.C796 > DT1026.C790
								)
								AND
								(
									(
										(
											(
												(
													DT1032.C2646 = DT1025.C15
												)
												OR
												(
													DT1027.C443 = DT1026.C797
												)
											)
											OR
											(
												DT1032.C2646 <> DT1026.C793
											)
										)
										OR
										(
											DT1027.C441 <> DT1025.C30
										)
									)
									AND
									(
										DT1025.C28 < DT1025.C22
									)
								)
							)
							OR
							(
								(
									DT1025.C26 > DT1025.C26
								)
								OR
								(
									DT1025.C30 > DT1026.C790
								)
							)
						GROUP BY
							DT1025.C28
							, DT1027.C442
							, DT1032.C2643
							, DT1025.C19
							, DT1026.C788
						ORDER BY
							DT1025.C28
							, DT1026.C788
						LIMIT 781
						)  DT1033 ( C2649, C2650 ) 
					INNER JOIN
						(
						SELECT
							MIN( DT1034.C145 )
							, DT1034.C145
							, DT1034.C139
							, AVG( DT1034.C140 )
						FROM
							(
								(
									(
										T10 DT1036
									RIGHT OUTER JOIN
										T8 DT1035
									ON
										DT1036.C141 = DT1035.C124
									)
								INNER JOIN
									(
									SELECT
										DT1037.C407
										, AVG( DT1039.C644 )
										, SUM( DT1039.C636 )
									FROM
										(
											(
												T34 DT1037
											INNER JOIN
												T19 DT1038
											ON
												DT1037.C407 = DT1038.C230
											)
										INNER JOIN
											T53 DT1039
										ON
											DT1037.C402 = DT1039.C638
										)
									WHERE
										(
											(
												(
													DT1037.C404 = DT1037.C405
												)
												OR
												(
													DT1039.C637 < DT1039.C644
												)
											)
											OR
											(
												DT1039.C649 <> DT1039.C653
											)
										)
										OR
										(
											(
												DT1037.C406 < DT1038.C232
											)
											AND
											(
												(
													DT1039.C647 = DT1039.C639
												)
												AND
												(
													DT1039.C638 < DT1037.C409
												)
											)
										)
									GROUP BY
										DT1039.C641
										, DT1037.C407
										, DT1037.C404
										, DT1039.C636
										, DT1039.C644
									ORDER BY
										DT1037.C407
										, AVG( DT1039.C644 )
										, SUM( DT1039.C636 )
									LIMIT 592
									)  DT1040 ( C2654, C2655, C2656 ) 
								ON
									DT1036.C148 = DT1040.C2656
								)
							INNER JOIN
								T10 DT1034
							ON
								DT1035.C120 = DT1034.C149
							)
						WHERE
							(
								DT1035.C113 < DT1035.C116
							)
							OR
							(
								(
									(
										DT1034.C138 = DT1035.C110
									)
									AND
									(
										(
											DT1034.C141 <> DT1034.C146
										)
										OR
										(
											DT1034.C143 > DT1034.C143
										)
									)
								)
								AND
								(
									(
										DT1040.C2656 < DT1036.C141
									)
									AND
									(
										DT1035.C110 <> DT1040.C2656
									)
								)
							)
						GROUP BY
							DT1034.C140
							, DT1040.C2655
							, DT1034.C139
							, DT1034.C145
						ORDER BY
							MIN( DT1034.C145 )
							, DT1034.C145
							, DT1034.C139
							, AVG( DT1034.C140 )
						LIMIT 915
						)  DT1041 ( C2659, C2660, C2661, C2662 ) 
					ON
						DT1033.C2649 > DT1041.C2660
					)
				INNER JOIN
					T17 DT1042
				ON
					DT1041.C2662 = DT1042.C215
				)
			WHERE
				(
					(
						(
							DT1042.C216 = DT1042.C209
						)
						AND
						(
							DT1042.C215 < DT1042.C214
						)
					)
					OR
					(
						(
							(
								DT1042.C216 <> DT1042.C216
							)
							OR
							(
								DT1033.C2649 = DT1041.C2660
							)
						)
						OR
						(
							(
								DT1042.C209 > DT1042.C212
							)
							AND
							(
								DT1042.C215 > DT1042.C208
							)
						)
					)
				)
				OR
				(
					DT1042.C215 < DT1042.C208
				)
			GROUP BY
				DT1042.C208
				, DT1042.C207
				, DT1033.C2649
			ORDER BY
				COUNT( DT1042.C208 )
				, DT1042.C207
				, DT1042.C208
				, AVG( DT1042.C207 )
				, DT1033.C2649
				, MAX( DT1033.C2649 )
			LIMIT 262
			)  DT1043 ( C2666, C2667, C2668, C2669, C2670, C2671 ) 
		ON
			DT1023.C740 > DT1043.C2666
		)
	ON
		DT1024.C524 = DT1043.C2668
	)
WHERE
	(
		DT1024.C514 = DT1024.C520
	)
	OR
	(
		(
			(
				DT1024.C517 = DT1024.C516
			)
			OR
			(
				(
					DT1024.C525 <> DT1024.C521
				)
				AND
				(
					DT1024.C521 = DT1024.C521
				)
			)
		)
		OR
		(
			(
				(
					DT1024.C514 < DT1024.C516
				)
				AND
				(
					DT1024.C520 = DT1024.C527
				)
			)
			AND
			(
				(
					DT1024.C527 > DT1024.C523
				)
				OR
				(
					DT1024.C527 = DT1024.C524
				)
			)
		)
	)
GROUP BY
	DT1024.C518
	, DT1024.C521
	, DT1043.C2668
	, DT1023.C742
	, DT1043.C2667
ORDER BY
	MIN( DT1043.C2668 )
	, DT1043.C2667
LIMIT 229;


SELECT
	DT1053.C2685
	, DT1053.C2684
	, DT1054.C505
	, DT1053.C2682
	, DT1053.C2683
	, DT1054.C507
	, DT1054.C510
	, DT1054.C506
FROM
	(
		(
			(
			SELECT
				MIN( DT1045.C282 )
				, DT1044.C1055
			FROM
				(
					T86 DT1044
				LEFT OUTER JOIN
					T24 DT1045
				ON
					DT1044.C1053 = DT1045.C282
				)
			WHERE
				(
					(
						(
							DT1044.C1047 = DT1044.C1049
						)
						AND
						(
							DT1045.C282 <> DT1044.C1051
						)
					)
					AND
					(
						(
							(
								DT1045.C280 > DT1045.C281
							)
							AND
							(
								DT1044.C1047 = DT1045.C279
							)
						)
						AND
						(
							DT1044.C1051 = DT1045.C282
						)
					)
				)
				AND
				(
					DT1045.C280 > DT1044.C1053
				)
			GROUP BY
				DT1045.C282
				, DT1044.C1055
			ORDER BY
				MIN( DT1045.C282 )
				, DT1044.C1055
			LIMIT 908
			)  DT1046 ( C2675, C2676 ) 
		INNER JOIN
			(
			SELECT
				DT1052.C963
				, DT1051.C924
				, DT1052.C952
				, AVG( DT1051.C924 )
			FROM
				(
					(
						(
						SELECT
							SUM( DT1048.C716 )
						FROM
							(
								T59 DT1048
							INNER JOIN
								T33 DT1047
							ON
								DT1048.C716 = DT1047.C390
							)
						WHERE
							(
								(
									DT1048.C714 = DT1047.C396
								)
								OR
								(
									(
										(
											DT1047.C390 < DT1047.C390
										)
										OR
										(
											DT1047.C401 = DT1047.C399
										)
									)
									OR
									(
										(
											DT1047.C396 < DT1047.C398
										)
										OR
										(
											DT1047.C396 > DT1047.C384
										)
									)
								)
							)
							AND
							(
								DT1047.C395 < DT1047.C391
							)
						GROUP BY
							DT1047.C397
							, DT1048.C716
							, DT1047.C388
						ORDER BY
							SUM( DT1048.C716 )
						LIMIT 846
						)  DT1049 ( C2678 ) 
					INNER JOIN
						T46 DT1050
					ON
						DT1049.C2678 = DT1050.C534
					)
				INNER JOIN
					(
						T74 DT1051
					INNER JOIN
						T77 DT1052
					ON
						DT1051.C927 > DT1052.C963
					)
				ON
					DT1050.C547 = DT1051.C915
				)
			WHERE
				(
					(
						DT1050.C542 = DT1051.C918
					)
					OR
					(
						DT1052.C955 = DT1050.C534
					)
				)
				AND
				(
					(
						(
							DT1051.C920 <> DT1052.C953
						)
						OR
						(
							(
								DT1051.C919 > DT1051.C919
							)
							OR
							(
								DT1050.C532 <> DT1051.C912
							)
						)
					)
					AND
					(
						(
							DT1052.C950 > DT1050.C535
						)
						OR
						(
							DT1052.C955 = DT1051.C924
						)
					)
				)
			GROUP BY
				DT1052.C963
				, DT1052.C952
				, DT1051.C924
			ORDER BY
				DT1052.C963
				, DT1051.C924
				, DT1052.C952
				, AVG( DT1051.C924 )
			LIMIT 258
			)  DT1053 ( C2682, C2683, C2684, C2685 ) 
		ON
			DT1046.C2675 > DT1053.C2685
		)
	INNER JOIN
		T44 DT1054
	ON
		DT1053.C2682 <> DT1054.C509
	)
WHERE
	(
		(
			(
				DT1046.C2676 <> DT1046.C2675
			)
			AND
			(
				DT1053.C2684 = DT1054.C508
			)
		)
		OR
		(
			DT1053.C2685 = DT1053.C2685
		)
	)
	OR
	(
		(
			(
				(
					DT1054.C507 = DT1054.C504
				)
				OR
				(
					DT1046.C2675 = DT1053.C2683
				)
			)
			AND
			(
				DT1054.C503 <> DT1054.C505
			)
		)
		AND
		(
			DT1053.C2684 = DT1054.C504
		)
	)
ORDER BY
	DT1053.C2685
	, DT1053.C2684
	, DT1054.C505
	, DT1053.C2682
	, DT1053.C2683
	, DT1054.C507
	, DT1054.C510
	, DT1054.C506
LIMIT 434;


SELECT
	DT1056.C1199
	, DT1055.C723
	, DT1056.C1193
	, DT1056.C1195
FROM
	(
		(
			T39 DT1057
		INNER JOIN
			(
			SELECT
				SUM( DT1058.C239 )
			FROM
				(
					(
					SELECT
						DT1059.C614
					FROM
						(
							T51 DT1059
						LEFT OUTER JOIN
							(
							SELECT
								DT1060.C985
								, MAX( DT1061.C403 )
								, DT1061.C403
								, DT1060.C981
							FROM
								(
									T34 DT1061
								INNER JOIN
									T79 DT1060
								ON
									DT1061.C409 <> DT1060.C983
								)
							WHERE
								(
									(
										(
											DT1060.C979 = DT1060.C980
										)
										OR
										(
											(
												DT1061.C407 = DT1061.C403
											)
											OR
											(
												DT1061.C409 = DT1061.C406
											)
										)
									)
									AND
									(
										(
											DT1060.C985 > DT1061.C405
										)
										OR
										(
											(
												DT1061.C402 > DT1061.C408
											)
											OR
											(
												DT1060.C984 < DT1060.C984
											)
										)
									)
								)
								AND
								(
									(
										DT1060.C979 < DT1060.C984
									)
									OR
									(
										DT1061.C402 = DT1060.C980
									)
								)
							GROUP BY
								DT1060.C981
								, DT1060.C985
								, DT1061.C403
							ORDER BY
								DT1060.C985
								, MAX( DT1061.C403 )
								, DT1061.C403
								, DT1060.C981
							LIMIT 1000
							) AS DT1062 ( C2687, C2688, C2689, C2690 ) 
						ON
							DT1059.C620 <> DT1062.C2690
						)
					WHERE
						(
							(
								DT1062.C2690 > DT1059.C610
							)
							OR
							(
								(
									DT1062.C2687 = DT1062.C2690
								)
								OR
								(
									DT1059.C617 <> DT1059.C610
								)
							)
						)
						OR
						(
							(
								(
									DT1062.C2688 > DT1059.C616
								)
								OR
								(
									(
										DT1059.C619 < DT1062.C2687
									)
									OR
									(
										DT1059.C612 = DT1059.C609
									)
								)
							)
							AND
							(
								DT1062.C2688 = DT1059.C612
							)
						)
					GROUP BY
						DT1059.C619
						, DT1059.C614
					ORDER BY
						DT1059.C614
					LIMIT 391
					) AS DT1063 ( C2693 ) 
				LEFT OUTER JOIN
					T20 DT1058
				ON
					DT1063.C2693 = DT1058.C233
				)
			WHERE
				(
					DT1058.C246 = DT1058.C246
				)
				AND
				(
					(
						(
							DT1058.C233 <> DT1058.C237
						)
						OR
						(
							DT1058.C245 > DT1058.C246
						)
					)
					OR
					(
						(
							(
								DT1058.C238 <> DT1058.C245
							)
							AND
							(
								DT1058.C244 = DT1058.C234
							)
						)
						OR
						(
							DT1058.C233 <> DT1058.C245
						)
					)
				)
			GROUP BY
				DT1058.C239
				, DT1058.C235
				, DT1058.C233
			ORDER BY
				SUM( DT1058.C239 )
			LIMIT 659
			)  DT1064 ( C2695 ) 
		ON
			DT1057.C445 <> DT1064.C2695
		)
	INNER JOIN
		(
			T60 DT1055
		INNER JOIN
			T97 DT1056
		ON
			DT1055.C721 > DT1056.C1196
		)
	ON
		DT1064.C2695 = DT1055.C720
	)
WHERE
	(
		(
			DT1055.C719 = DT1055.C722
		)
		AND
		(
			DT1056.C1192 > DT1057.C444
		)
	)
	AND
	(
		(
			(
				DT1056.C1200 < DT1055.C720
			)
			AND
			(
				DT1056.C1190 = DT1056.C1195
			)
		)
		AND
		(
			DT1055.C723 = DT1056.C1196
		)
	)
GROUP BY
	DT1055.C719
	, DT1055.C723
	, DT1056.C1193
	, DT1056.C1199
	, DT1056.C1195
ORDER BY
	DT1056.C1199
	, DT1055.C723
	, DT1056.C1193
	, DT1056.C1195
LIMIT 602;


SELECT
	MAX( DT1067.C855 )
FROM
	(
		(
			T70 DT1067
		INNER JOIN
			T36 DT1065
		ON
			DT1067.C845 = DT1065.C428
		)
	INNER JOIN
		(
			T16 DT1068
		INNER JOIN
			T0 DT1066
		ON
			DT1068.C205 <> DT1066.C0
		)
	ON
		DT1067.C855 = DT1068.C206
	)
WHERE
	(
		DT1065.C430 = DT1065.C429
	)
	AND
	(
		(
			(
				DT1065.C433 = DT1067.C842
			)
			OR
			(
				DT1067.C850 > DT1068.C202
			)
		)
		OR
		(
			(
				DT1067.C853 > DT1067.C852
			)
			AND
			(
				DT1066.C2 = DT1065.C425
			)
		)
	)
GROUP BY
	DT1067.C843
	, DT1067.C855
	, DT1067.C841
	, DT1065.C431
ORDER BY
	MAX( DT1067.C855 )
LIMIT 295;


SELECT
	MIN( DT1070.C503 )
	, DT1070.C503
	, SUM( DT1070.C507 )
	, DT1070.C507
FROM
	(
		T35 DT1069
	INNER JOIN
		T44 DT1070
	ON
		DT1069.C412 = DT1070.C504
	)
WHERE
	(
		(
			DT1069.C415 > DT1070.C502
		)
		OR
		(
			DT1070.C506 = DT1069.C411
		)
	)
	OR
	(
		(
			DT1070.C504 = DT1069.C416
		)
		OR
		(
			(
				DT1070.C504 = DT1069.C417
			)
			AND
			(
				DT1069.C415 < DT1070.C507
			)
		)
	)
GROUP BY
	DT1070.C507
	, DT1070.C503
ORDER BY
	MIN( DT1070.C503 )
	, DT1070.C503
	, SUM( DT1070.C507 )
	, DT1070.C507
LIMIT 577;


SELECT
	DT1071.C801
	, SUM( DT1071.C801 )
FROM
	(
		T66 DT1071
	INNER JOIN
		T27 DT1072
	ON
		DT1071.C798 <> DT1072.C325
	)
WHERE
	(
		(
			DT1072.C324 = DT1072.C325
		)
		AND
		(
			DT1071.C808 = DT1072.C321
		)
	)
	AND
	(
		(
			DT1071.C801 > DT1072.C327
		)
		OR
		(
			(
				DT1071.C799 = DT1072.C320
			)
			AND
			(
				DT1071.C799 = DT1071.C800
			)
		)
	)
GROUP BY
	DT1071.C801
	, DT1071.C802
ORDER BY
	DT1071.C801
	, SUM( DT1071.C801 )
LIMIT 434;


SELECT
	DT1083.C748
	, DT1083.C760
	, DT1083.C746
	, DT1083.C754
	, DT1083.C750
	, DT1083.C752
	, DT1083.C756
	, DT1083.C759
	, DT1083.C757
	, DT1083.C763
	, DT1078.C2707
	, DT1083.C761
	, DT1083.C747
	, DT1075.C2705
	, DT1083.C745
	, DT1082.C2710
	, DT1083.C753
	, DT1083.C749
	, DT1083.C744
	, DT1083.C755
	, DT1083.C751
	, DT1083.C762
	, DT1082.C2712
	, DT1083.C743
	, DT1082.C2711
	, DT1083.C758
FROM
	(
		(
			(
				(
				SELECT
					DT1073.C718
				FROM
					(
						T60 DT1073
					RIGHT OUTER JOIN
						T0 DT1074
					ON
						DT1073.C723 > DT1074.C1
					)
				WHERE
					(
						(
							(
								(
									DT1073.C723 > DT1074.C0
								)
								AND
								(
									DT1073.C717 <> DT1074.C2
								)
							)
							OR
							(
								DT1074.C3 = DT1073.C718
							)
						)
						OR
						(
							(
								DT1073.C717 <> DT1073.C719
							)
							OR
							(
								DT1073.C722 = DT1073.C724
							)
						)
					)
					AND
					(
						DT1074.C0 < DT1074.C3
					)
				GROUP BY
					DT1074.C3
					, DT1073.C718
				ORDER BY
					DT1073.C718
				LIMIT 738
				)  DT1075 ( C2705 ) 
			INNER JOIN
				(
				SELECT
					DT1080.C655
					, AVG( DT1080.C655 )
					, DT1081.C600
				FROM
					(
						(
							T50 DT1081
						INNER JOIN
							T54 DT1080
						ON
							DT1081.C602 = DT1080.C657
						)
					INNER JOIN
						T19 DT1079
					ON
						DT1081.C602 = DT1079.C230
					)
				WHERE
					(
						DT1081.C602 = DT1079.C232
					)
					OR
					(
						(
							(
								(
									DT1081.C607 < DT1080.C654
								)
								AND
								(
									DT1080.C656 = DT1080.C656
								)
							)
							OR
							(
								DT1081.C602 = DT1079.C230
							)
						)
						AND
						(
							(
								DT1079.C230 <> DT1079.C230
							)
							AND
							(
								DT1079.C230 < DT1080.C656
							)
						)
					)
				GROUP BY
					DT1081.C600
					, DT1080.C655
				ORDER BY
					DT1080.C655
					, AVG( DT1080.C655 )
					, DT1081.C600
				LIMIT 327
				)  DT1082 ( C2710, C2711, C2712 ) 
			ON
				DT1075.C2705 <> DT1082.C2711
			)
		INNER JOIN
			T63 DT1083
		ON
			DT1075.C2705 = DT1083.C752
		)
	INNER JOIN
		(
		SELECT
			MAX( DT1076.C442 )
		FROM
			(
				T38 DT1076
			INNER JOIN
				T46 DT1077
			ON
				DT1076.C442 = DT1077.C547
			)
		WHERE
			(
				(
					DT1077.C543 > DT1077.C539
				)
				OR
				(
					DT1077.C533 > DT1076.C441
				)
			)
			AND
			(
				(
					(
						DT1077.C545 <> DT1076.C441
					)
					AND
					(
						(
							DT1076.C442 > DT1076.C442
						)
						OR
						(
							DT1077.C534 <> DT1077.C539
						)
					)
				)
				AND
				(
					DT1077.C538 = DT1077.C545
				)
			)
		GROUP BY
			DT1077.C535
			, DT1077.C540
			, DT1076.C442
		ORDER BY
			MAX( DT1076.C442 )
		LIMIT 331
		)  DT1078 ( C2707 ) 
	ON
		DT1083.C744 = DT1078.C2707
	)
WHERE
	(
		(
			(
				DT1083.C750 > DT1075.C2705
			)
			AND
			(
				(
					DT1083.C746 = DT1083.C745
				)
				AND
				(
					DT1082.C2712 = DT1083.C760
				)
			)
		)
		OR
		(
			(
				DT1083.C746 < DT1083.C759
			)
			OR
			(
				DT1083.C748 = DT1083.C757
			)
		)
	)
	AND
	(
		(
			DT1083.C747 = DT1083.C761
		)
		AND
		(
			DT1083.C746 = DT1082.C2710
		)
	)
ORDER BY
	DT1083.C748
	, DT1083.C760
	, DT1083.C746
	, DT1083.C754
	, DT1083.C750
	, DT1083.C752
	, DT1083.C756
	, DT1083.C759
	, DT1083.C757
	, DT1083.C763
	, DT1078.C2707
	, DT1083.C761
	, DT1083.C747
	, DT1075.C2705
	, DT1083.C745
	, DT1082.C2710
	, DT1083.C753
	, DT1083.C749
	, DT1083.C744
	, DT1083.C755
	, DT1083.C751
	, DT1083.C762
	, DT1082.C2712
	, DT1083.C743
	, DT1082.C2711
	, DT1083.C758
LIMIT 383;


SELECT
	DT1086.C209
FROM
	(
		(
			T40 DT1085
		INNER JOIN
			(
			SELECT
				DT1087.C246
				, DT1087.C245
			FROM
				(
					T20 DT1087
				INNER JOIN
					(
						T44 DT1088
					INNER JOIN
						T38 DT1089
					ON
						DT1088.C504 = DT1089.C441
					)
				ON
					DT1087.C237 < DT1088.C508
				)
			WHERE
				(
					(
						DT1088.C510 <> DT1087.C240
					)
					OR
					(
						(
							(
								DT1088.C510 > DT1088.C507
							)
							OR
							(
								DT1088.C503 = DT1088.C508
							)
						)
						AND
						(
							DT1089.C442 = DT1087.C238
						)
					)
				)
				OR
				(
					(
						DT1087.C245 = DT1087.C241
					)
					AND
					(
						(
							DT1089.C442 <> DT1087.C234
						)
						OR
						(
							DT1088.C504 = DT1087.C235
						)
					)
				)
			GROUP BY
				DT1087.C246
				, DT1088.C504
				, DT1087.C245
				, DT1088.C502
			ORDER BY
				DT1087.C246
				, DT1087.C245
			LIMIT 841
			)  DT1090 ( C2714, C2715 ) 
		ON
			DT1085.C448 = DT1090.C2715
		)
	INNER JOIN
		(
			T17 DT1086
		INNER JOIN
			T18 DT1084
		ON
			DT1086.C210 = DT1084.C229
		)
	ON
		DT1090.C2715 = DT1084.C225
	)
WHERE
	(
		(
			DT1086.C214 = DT1086.C211
		)
		AND
		(
			DT1086.C209 = DT1086.C208
		)
	)
	AND
	(
		(
			(
				DT1086.C212 = DT1084.C225
			)
			OR
			(
				DT1084.C223 = DT1084.C223
			)
		)
		OR
		(
			DT1086.C207 = DT1084.C220
		)
	)
GROUP BY
	DT1086.C209
	, DT1084.C225
ORDER BY
	DT1086.C209
LIMIT 700;


SELECT
	COUNT( DT1093.C102 )
	, MIN( DT1094.C693 )
	, DT1093.C100
	, to_char(AVG( DT1093.C103 ),'9999999.9999999')
	, DT1093.C103
	, DT1093.C102
FROM
	(
		(
			T12 DT1092
		INNER JOIN
			T13 DT1091
		ON
			DT1092.C162 < DT1091.C167
		)
	INNER JOIN
		(
			T57 DT1094
		INNER JOIN
			T7 DT1093
		ON
			DT1094.C686 < DT1093.C90
		)
	ON
		DT1091.C173 = DT1094.C697
	)
WHERE
	(
		DT1094.C684 <> DT1092.C161
	)
	AND
	(
		(
			(
				DT1093.C109 = DT1094.C682
			)
			OR
			(
				DT1092.C157 = DT1093.C98
			)
		)
		AND
		(
			(
				DT1093.C90 < DT1094.C695
			)
			AND
			(
				DT1091.C168 < DT1093.C98
			)
		)
	)
GROUP BY
	DT1093.C102
	, DT1093.C103
	, DT1093.C100
	, DT1094.C693
ORDER BY
	COUNT( DT1093.C102 )
	, MIN( DT1094.C693 )
	, DT1093.C100
	, AVG( DT1093.C103 )
	, DT1093.C103
	, DT1093.C102
LIMIT 847;


SELECT
	MAX( DT1096.C1092 )
	, DT1096.C1084
	, MIN( DT1096.C1086 )
	, DT1097.C865
	, DT1096.C1086
FROM
	(
		T59 DT1095
	INNER JOIN
		(
			T71 DT1097
		INNER JOIN
			T90 DT1096
		ON
			DT1097.C860 = DT1096.C1084
		)
	ON
		DT1095.C713 = DT1096.C1088
	)
WHERE
	(
		DT1096.C1088 = DT1096.C1081
	)
	OR
	(
		(
			(
				(
					DT1096.C1085 = DT1096.C1084
				)
				OR
				(
					DT1096.C1084 = DT1096.C1086
				)
			)
			OR
			(
				DT1096.C1080 = DT1095.C714
			)
		)
		AND
		(
			DT1096.C1083 < DT1096.C1083
		)
	)
GROUP BY
	DT1096.C1086
	, DT1095.C715
	, DT1097.C865
	, DT1096.C1092
	, DT1096.C1084
ORDER BY
	MAX( DT1096.C1092 )
	, DT1096.C1084
	, MIN( DT1096.C1086 )
	, DT1097.C865
	, DT1096.C1086
LIMIT 665;


SELECT
	DT1098.C1010
	, DT1098.C1012
FROM
	(
		(
		SELECT
			DT1106.C1164
			, DT1106.C1145
			, DT1100.C850
			, DT1106.C1153
		FROM
			(
				(
					T70 DT1100
				INNER JOIN
					(
						T59 DT1101
					INNER JOIN
						(
						SELECT
							DT1102.C69
							, DT1103.C999
						FROM
							(
								(
									T82 DT1103
								INNER JOIN
									T80 DT1104
								ON
									DT1103.C997 = DT1104.C986
								)
							INNER JOIN
								T5 DT1102
							ON
								DT1103.C999 <> DT1102.C66
							)
						WHERE
							(
								DT1102.C66 < DT1102.C67
							)
							AND
							(
								(
									DT1102.C69 = DT1102.C66
								)
								OR
								(
									(
										(
											DT1102.C67 = DT1102.C74
										)
										OR
										(
											DT1102.C72 = DT1103.C999
										)
									)
									AND
									(
										(
											DT1104.C988 = DT1103.C995
										)
										OR
										(
											DT1102.C72 = DT1102.C74
										)
									)
								)
							)
						GROUP BY
							DT1103.C999
							, DT1102.C73
							, DT1102.C69
						ORDER BY
							DT1102.C69
							, DT1103.C999
						LIMIT 926
						)  DT1105 ( C2726, C2727 ) 
					ON
						DT1101.C715 = DT1105.C2727
					)
				ON
					DT1100.C857 = DT1101.C716
				)
			INNER JOIN
				T94 DT1106
			ON
				DT1101.C714 > DT1106.C1166
			)
		WHERE
			(
				(
					DT1100.C859 <> DT1100.C841
				)
				OR
				(
					(
						DT1106.C1160 <> DT1100.C840
					)
					AND
					(
						(
							DT1106.C1160 < DT1100.C840
						)
						OR
						(
							DT1100.C844 > DT1100.C844
						)
					)
				)
			)
			AND
			(
				(
					DT1106.C1163 > DT1106.C1151
				)
				OR
				(
					(
						DT1106.C1165 = DT1100.C855
					)
					OR
					(
						DT1106.C1146 = DT1106.C1149
					)
				)
			)
		GROUP BY
			DT1106.C1145
			, DT1106.C1164
			, DT1100.C850
			, DT1106.C1153
			, DT1106.C1162
		ORDER BY
			DT1106.C1164
			, DT1106.C1145
			, DT1100.C850
			, DT1106.C1153
		LIMIT 765
		) AS DT1107 ( C2731, C2732, C2733, C2734 ) 
	RIGHT OUTER JOIN
		(
			T0 DT1099
		INNER JOIN
			T84 DT1098
		ON
			DT1099.C1 = DT1098.C1012
		)
	ON
		DT1107.C2734 < DT1098.C1024
	)
WHERE
	(
		(
			DT1098.C1014 < DT1107.C2731
		)
		OR
		(
			DT1098.C1026 > DT1098.C1015
		)
	)
	OR
	(
		(
			DT1099.C0 > DT1098.C1020
		)
		OR
		(
			(
				DT1098.C1020 > DT1098.C1022
			)
			OR
			(
				(
					DT1098.C1022 <> DT1098.C1025
				)
				OR
				(
					DT1098.C1025 = DT1098.C1014
				)
			)
		)
	)
GROUP BY
	DT1098.C1012
	, DT1099.C2
	, DT1098.C1010
ORDER BY
	DT1098.C1010
	, DT1098.C1012
LIMIT 950;


SELECT
	COUNT( DT1112.C1107 )
	, MIN( DT1112.C1094 )
	, DT1112.C1107
FROM
	(
		(
			(
				(
				SELECT
					AVG( DT1113.C1097 )
					, DT1115.C248
					, DT1116.C480
					, MIN( DT1114.C737 )
					, DT1116.C479
					, SUM( DT1115.C248 )
					, DT1114.C737
					, DT1113.C1097
				FROM
					(
						(
							(
								T21 DT1115
							INNER JOIN
								T61 DT1114
							ON
								DT1115.C255 = DT1114.C726
							)
						INNER JOIN
							T42 DT1116
						ON
							DT1114.C734 = DT1116.C479
						)
					INNER JOIN
						T91 DT1113
					ON
						DT1114.C729 < DT1113.C1107
					)
				WHERE
					(
						(
							(
								DT1114.C736 < DT1116.C478
							)
							OR
							(
								DT1115.C257 < DT1114.C736
							)
						)
						OR
						(
							(
								DT1114.C727 = DT1113.C1098
							)
							OR
							(
								(
									DT1116.C479 < DT1116.C475
								)
								OR
								(
									DT1116.C473 = DT1113.C1112
								)
							)
						)
					)
					AND
					(
						(
							DT1116.C481 = DT1116.C482
						)
						OR
						(
							DT1115.C257 = DT1114.C737
						)
					)
				GROUP BY
					DT1113.C1097
					, DT1116.C479
					, DT1115.C248
					, DT1114.C737
					, DT1116.C480
				ORDER BY
					AVG( DT1113.C1097 )
					, DT1115.C248
					, DT1116.C480
					, MIN( DT1114.C737 )
					, DT1116.C479
					, SUM( DT1115.C248 )
					, DT1114.C737
					, DT1113.C1097
				LIMIT 943
				)  DT1117 ( C2747, C2748, C2749, C2750, C2751, C2752, C2753, C2754 ) 
			INNER JOIN
				T98 DT1118
			ON
				DT1117.C2749 = DT1118.C1203
			)
		INNER JOIN
			T91 DT1112
		ON
			DT1118.C1202 < DT1112.C1108
		)
	INNER JOIN
		(
		SELECT
			DT1109.C992
			, DT1109.C990
			, MIN( DT1109.C990 )
			, MAX( DT1109.C992 )
			, DT1110.C1173
			, DT1109.C991
		FROM
			(
				T19 DT1108
			INNER JOIN
				(
					T81 DT1109
				INNER JOIN
					T95 DT1110
				ON
					DT1109.C992 = DT1110.C1167
				)
			ON
				DT1108.C230 = DT1110.C1169
			)
		WHERE
			(
				(
					(
						(
							DT1108.C231 = DT1109.C991
						)
						OR
						(
							(
								DT1108.C231 <> DT1108.C231
							)
							OR
							(
								DT1110.C1175 > DT1110.C1172
							)
						)
					)
					AND
					(
						DT1109.C994 < DT1110.C1168
					)
				)
				AND
				(
					DT1110.C1175 = DT1110.C1168
				)
			)
			OR
			(
				DT1108.C231 = DT1110.C1170
			)
		GROUP BY
			DT1109.C991
			, DT1110.C1173
			, DT1110.C1171
			, DT1109.C992
			, DT1109.C990
		ORDER BY
			DT1109.C992
			, DT1109.C990
			, MIN( DT1109.C990 )
			, MAX( DT1109.C992 )
			, DT1110.C1173
			, DT1109.C991
		LIMIT 788
		) AS DT1111 ( C2738, C2739, C2740, C2741, C2742, C2743 ) 
	ON
		DT1112.C1099 = DT1111.C2742
	)
WHERE
	(
		DT1112.C1093 = DT1111.C2743
	)
	AND
	(
		(
			(
				DT1111.C2743 < DT1117.C2754
			)
			AND
			(
				(
					DT1111.C2743 = DT1112.C1114
				)
				OR
				(
					DT1117.C2753 = DT1117.C2751
				)
			)
		)
		AND
		(
			(
				DT1111.C2743 > DT1112.C1107
			)
			AND
			(
				(
					DT1112.C1103 > DT1111.C2740
				)
				OR
				(
					DT1112.C1105 = DT1112.C1109
				)
			)
		)
	)
GROUP BY
	DT1112.C1107
	, DT1112.C1111
	, DT1112.C1094
ORDER BY
	COUNT( DT1112.C1107 )
	, MIN( DT1112.C1094 )
	, DT1112.C1107
LIMIT 131;


SELECT
	DT1120.C461
	, DT1119.C478
	, DT1119.C480
	, DT1119.C475
	, to_char(AVG( DT1119.C475 ),'9999999.9999999')
	, to_char(AVG( DT1120.C461 ),'9999999.9999999')
FROM
	(
		T41 DT1120
	INNER JOIN
		T42 DT1119
	ON
		DT1120.C463 <> DT1119.C477
	)
WHERE
	(
		(
			(
				(
					(
						DT1120.C472 <> DT1119.C486
					)
					OR
					(
						DT1120.C469 = DT1120.C470
					)
				)
				OR
				(
					DT1119.C482 > DT1120.C459
				)
			)
			OR
			(
				(
					DT1120.C460 = DT1119.C474
				)
				AND
				(
					DT1120.C453 < DT1119.C477
				)
			)
		)
		AND
		(
			DT1120.C458 < DT1120.C462
		)
	)
	AND
	(
		DT1120.C467 < DT1119.C475
	)
GROUP BY
	DT1119.C480
	, DT1119.C478
	, DT1120.C461
	, DT1119.C475
ORDER BY
	DT1120.C461
	, DT1119.C478
	, DT1119.C480
	, DT1119.C475
	, AVG( DT1119.C475 )
	, AVG( DT1120.C461 )
LIMIT 755;


SELECT
	DT1121.C808
	, DT1123.C183
	, COUNT( DT1123.C183 )
	, COUNT( DT1121.C808 )
FROM
	(
		(
			T76 DT1122
		INNER JOIN
			T66 DT1121
		ON
			DT1122.C938 < DT1121.C801
		)
	INNER JOIN
		T14 DT1123
	ON
		DT1121.C808 > DT1123.C181
	)
WHERE
	(
		(
			DT1122.C944 = DT1121.C798
		)
		AND
		(
			(
				DT1121.C806 = DT1121.C808
			)
			AND
			(
				DT1123.C181 <> DT1123.C180
			)
		)
	)
	AND
	(
		(
			(
				DT1123.C185 > DT1121.C801
			)
			AND
			(
				(
					DT1123.C183 = DT1121.C798
				)
				OR
				(
					DT1122.C938 < DT1121.C801
				)
			)
		)
		OR
		(
			DT1121.C803 = DT1122.C946
		)
	)
GROUP BY
	DT1121.C808
	, DT1123.C183
ORDER BY
	DT1121.C808
	, DT1123.C183
	, COUNT( DT1123.C183 )
	, COUNT( DT1121.C808 )
LIMIT 215;


SELECT
	DT1124.C153
FROM
	(
		T14 DT1125
	INNER JOIN
		T11 DT1124
	ON
		DT1125.C183 = DT1124.C155
	)
WHERE
	(
		DT1125.C183 = DT1124.C156
	)
	AND
	(
		(
			(
				(
					DT1124.C154 <> DT1124.C156
				)
				OR
				(
					DT1124.C153 < DT1124.C154
				)
			)
			OR
			(
				DT1124.C153 = DT1124.C154
			)
		)
		OR
		(
			(
				DT1125.C180 = DT1124.C154
			)
			OR
			(
				DT1125.C184 > DT1125.C181
			)
		)
	)
GROUP BY
	DT1124.C153
	, DT1125.C185
	, DT1125.C182
ORDER BY
	DT1124.C153
LIMIT 914;


SELECT
	DT1131.C705
	, MAX( DT1129.C2768 )
	, COUNT( DT1131.C705 )
FROM
	(
		(
			T18 DT1132
		INNER JOIN
			T58 DT1131
		ON
			DT1132.C229 <> DT1131.C703
		)
	INNER JOIN
		(
			T37 DT1130
		INNER JOIN
			(
			SELECT
				DT1128.C365
				, DT1128.C372
				, SUM( DT1128.C365 )
			FROM
				(
					T5 DT1126
				INNER JOIN
					(
						T16 DT1127
					INNER JOIN
						T32 DT1128
					ON
						DT1127.C201 > DT1128.C373
					)
				ON
					DT1126.C73 > DT1128.C377
				)
			WHERE
				(
					(
						(
							(
								DT1128.C374 = DT1128.C366
							)
							AND
							(
								DT1128.C373 <> DT1128.C377
							)
						)
						OR
						(
							DT1126.C69 < DT1128.C372
						)
					)
					AND
					(
						(
							DT1127.C200 = DT1127.C203
						)
						OR
						(
							DT1126.C71 > DT1126.C68
						)
					)
				)
				OR
				(
					(
						DT1128.C378 = DT1126.C70
					)
					OR
					(
						DT1128.C365 = DT1128.C364
					)
				)
			GROUP BY
				DT1128.C365
				, DT1128.C372
			ORDER BY
				DT1128.C365
				, DT1128.C372
				, SUM( DT1128.C365 )
			LIMIT 219
			)  DT1129 ( C2766, C2767, C2768 ) 
		ON
			DT1130.C440 < DT1129.C2766
		)
	ON
		DT1131.C701 < DT1129.C2768
	)
WHERE
	(
		DT1131.C698 > DT1131.C708
	)
	AND
	(
		(
			(
				(
					DT1131.C706 <> DT1132.C223
				)
				AND
				(
					DT1131.C703 < DT1131.C706
				)
			)
			OR
			(
				(
					DT1131.C698 <> DT1131.C702
				)
				OR
				(
					DT1131.C712 = DT1132.C220
				)
			)
		)
		AND
		(
			(
				DT1131.C699 < DT1131.C698
			)
			OR
			(
				DT1130.C440 = DT1131.C703
			)
		)
	)
GROUP BY
	DT1131.C705
	, DT1129.C2768
	, DT1131.C702
ORDER BY
	DT1131.C705
	, MAX( DT1129.C2768 )
	, COUNT( DT1131.C705 )
LIMIT 987;


SELECT
	MIN( DT1148.C1033 )
	, DT1147.C2789
	, DT1148.C1038
	, DT1148.C1040
FROM
	(
		(
		SELECT
			SUM( DT1140.C281 )
			, SUM( DT1145.C2783 )
			, DT1140.C279
			, DT1145.C2783
		FROM
			(
				(
					T24 DT1140
				INNER JOIN
					(
						(
						SELECT
							MAX( DT1143.C445 )
							, DT1141.C988
							, COUNT( DT1141.C988 )
							, DT1143.C445
							, DT1144.C652
							, MIN( DT1144.C652 )
						FROM
							(
								(
									T53 DT1144
								INNER JOIN
									(
										T80 DT1141
									INNER JOIN
										T39 DT1143
									ON
										DT1141.C987 > DT1143.C446
									)
								ON
									DT1144.C649 = DT1141.C987
								)
							INNER JOIN
								T41 DT1142
							ON
								DT1144.C644 = DT1142.C465
							)
						WHERE
							(
								(
									(
										(
											DT1141.C986 = DT1143.C444
										)
										OR
										(
											DT1142.C466 > DT1142.C461
										)
									)
									AND
									(
										DT1142.C471 < DT1142.C461
									)
								)
								AND
								(
									DT1142.C457 > DT1144.C652
								)
							)
							OR
							(
								DT1144.C650 = DT1142.C451
							)
						GROUP BY
							DT1141.C988
							, DT1144.C652
							, DT1143.C445
						ORDER BY
							MAX( DT1143.C445 )
							, DT1141.C988
							, COUNT( DT1141.C988 )
							, DT1143.C445
							, DT1144.C652
							, MIN( DT1144.C652 )
						LIMIT 756
						)  DT1145 ( C2779, C2780, C2781, C2782, C2783, C2784 ) 
					INNER JOIN
						T95 DT1139
					ON
						DT1145.C2783 > DT1139.C1175
					)
				ON
					DT1140.C280 <> DT1139.C1171
				)
			INNER JOIN
				T28 DT1146
			ON
				DT1145.C2782 = DT1146.C331
			)
		WHERE
			(
				(
					DT1146.C329 = DT1140.C280
				)
				AND
				(
					DT1145.C2779 < DT1139.C1168
				)
			)
			OR
			(
				(
					(
						DT1146.C329 = DT1146.C332
					)
					AND
					(
						(
							DT1146.C329 = DT1146.C328
						)
						OR
						(
							DT1146.C328 = DT1146.C332
						)
					)
				)
				OR
				(
					(
						DT1139.C1175 = DT1139.C1167
					)
					AND
					(
						DT1145.C2779 = DT1146.C333
					)
				)
			)
		GROUP BY
			DT1139.C1167
			, DT1140.C281
			, DT1140.C279
			, DT1145.C2783
		ORDER BY
			SUM( DT1140.C281 )
			, SUM( DT1145.C2783 )
			, DT1140.C279
			, DT1145.C2783
		LIMIT 802
		) AS DT1147 ( C2787, C2788, C2789, C2790 ) 
	INNER JOIN
		(
			(
			SELECT
				AVG( DT1136.C507 )
			FROM
				(
					(
						T55 DT1135
					INNER JOIN
						T82 DT1133
					ON
						DT1135.C659 < DT1133.C996
					)
				INNER JOIN
					(
						T44 DT1136
					INNER JOIN
						T28 DT1134
					ON
						DT1136.C508 <> DT1134.C331
					)
				ON
					DT1133.C997 < DT1136.C505
				)
			WHERE
				(
					(
						DT1136.C503 = DT1133.C1000
					)
					OR
					(
						(
							DT1135.C663 = DT1134.C332
						)
						AND
						(
							(
								DT1136.C509 <> DT1135.C665
							)
							AND
							(
								DT1133.C995 = DT1133.C999
							)
						)
					)
				)
				AND
				(
					(
						(
							DT1136.C507 <> DT1135.C661
						)
						OR
						(
							DT1136.C510 = DT1133.C1000
						)
					)
					AND
					(
						(
							DT1135.C666 > DT1134.C333
						)
						AND
						(
							DT1136.C509 = DT1136.C511
						)
					)
				)
			GROUP BY
				DT1136.C507
				, DT1134.C328
				, DT1134.C333
				, DT1136.C505
			ORDER BY
				AVG( DT1136.C507 )
			LIMIT 173
			) AS DT1137 ( C2775 ) 
		INNER JOIN
			(
				T85 DT1148
			INNER JOIN
				T97 DT1138
			ON
				DT1148.C1036 <> DT1138.C1190
			)
		ON
			DT1137.C2775 = DT1138.C1200
		)
	ON
		DT1147.C2790 = DT1138.C1200
	)
WHERE
	(
		(
			(
				(
					DT1138.C1200 > DT1148.C1029
				)
				AND
				(
					DT1138.C1194 = DT1147.C2787
				)
			)
			OR
			(
				(
					DT1147.C2789 > DT1138.C1199
				)
				AND
				(
					DT1138.C1200 = DT1138.C1191
				)
			)
		)
		OR
		(
			DT1138.C1198 < DT1148.C1034
		)
	)
	AND
	(
		DT1147.C2788 <> DT1138.C1196
	)
GROUP BY
	DT1148.C1040
	, DT1148.C1038
	, DT1147.C2789
	, DT1148.C1033
ORDER BY
	MIN( DT1148.C1033 )
	, DT1147.C2789
	, DT1148.C1038
	, DT1148.C1040
LIMIT 361;


SELECT
	DT1152.C773
	, DT1152.C775
	, DT1151.C2798
	, MAX( DT1151.C2798 )
	, DT1152.C765
	, MAX( DT1152.C775 )
FROM
	(
		(
			(
			SELECT
				DT1154.C113
				, DT1154.C119
			FROM
				(
					T8 DT1154
				INNER JOIN
					T16 DT1153
				ON
					DT1154.C117 = DT1153.C202
				)
			WHERE
				(
					(
						DT1154.C111 = DT1154.C119
					)
					AND
					(
						(
							DT1153.C201 <> DT1153.C205
						)
						OR
						(
							(
								DT1154.C115 > DT1153.C206
							)
							OR
							(
								DT1153.C200 = DT1154.C114
							)
						)
					)
				)
				AND
				(
					DT1154.C110 = DT1154.C115
				)
			GROUP BY
				DT1154.C113
				, DT1154.C119
			ORDER BY
				DT1154.C113
				, DT1154.C119
			LIMIT 946
			)  DT1155 ( C2802, C2803 ) 
		INNER JOIN
			(
			SELECT
				DT1149.C654
				, SUM( DT1150.C273 )
				, DT1150.C272
				, DT1150.C273
				, MIN( DT1149.C654 )
			FROM
				(
					T23 DT1150
				INNER JOIN
					T54 DT1149
				ON
					DT1150.C278 = DT1149.C657
				)
			WHERE
				(
					(
						(
							(
								DT1150.C276 > DT1149.C656
							)
							OR
							(
								DT1150.C278 = DT1149.C656
							)
						)
						AND
						(
							DT1150.C272 < DT1149.C657
						)
					)
					AND
					(
						(
							DT1150.C276 > DT1149.C654
						)
						OR
						(
							DT1149.C657 = DT1150.C276
						)
					)
				)
				OR
				(
					(
						DT1149.C656 > DT1150.C273
					)
					AND
					(
						DT1149.C657 > DT1150.C275
					)
				)
			GROUP BY
				DT1150.C275
				, DT1149.C654
				, DT1150.C273
				, DT1150.C272
			ORDER BY
				DT1149.C654
				, SUM( DT1150.C273 )
				, DT1150.C272
				, DT1150.C273
				, MIN( DT1149.C654 )
			LIMIT 454
			) AS DT1151 ( C2795, C2796, C2797, C2798, C2799 ) 
		ON
			DT1155.C2802 > DT1151.C2795
		)
	INNER JOIN
		T64 DT1152
	ON
		DT1155.C2802 <> DT1152.C765
	)
WHERE
	(
		(
			DT1151.C2799 <> DT1152.C778
		)
		OR
		(
			(
				DT1152.C771 = DT1152.C774
			)
			OR
			(
				DT1152.C774 < DT1152.C769
			)
		)
	)
	AND
	(
		(
			(
				DT1152.C774 = DT1152.C766
			)
			AND
			(
				DT1151.C2798 = DT1155.C2803
			)
		)
		OR
		(
			(
				(
					DT1152.C773 <> DT1151.C2798
				)
				AND
				(
					DT1152.C767 = DT1152.C777
				)
			)
			OR
			(
				DT1155.C2803 = DT1152.C781
			)
		)
	)
GROUP BY
	DT1151.C2798
	, DT1152.C765
	, DT1152.C773
	, DT1152.C775
	, DT1155.C2802
ORDER BY
	DT1152.C773
	, DT1152.C775
	, DT1151.C2798
	, MAX( DT1151.C2798 )
	, DT1152.C765
	, MAX( DT1152.C775 )
LIMIT 974;


SELECT
	SUM( DT1157.C1207 )
FROM
	(
		(
			T99 DT1157
		INNER JOIN
			(
			SELECT
				DT1161.C2812
				, AVG( DT1158.C36 )
				, MAX( DT1161.C2812 )
				, DT1158.C36
			FROM
				(
					(
					SELECT
						DT1160.C248
						, COUNT( DT1160.C258 )
						, MIN( DT1159.C998 )
						, DT1159.C999
						, DT1159.C998
						, DT1160.C250
					FROM
						(
							T21 DT1160
						INNER JOIN
							T82 DT1159
						ON
							DT1160.C254 = DT1159.C998
						)
					WHERE
						(
							DT1160.C254 <> DT1160.C249
						)
						AND
						(
							(
								(
									DT1160.C256 = DT1160.C254
								)
								AND
								(
									(
										(
											DT1160.C250 > DT1160.C255
										)
										AND
										(
											DT1160.C252 = DT1160.C258
										)
									)
									AND
									(
										DT1159.C999 = DT1160.C248
									)
								)
							)
							AND
							(
								DT1159.C997 = DT1160.C257
							)
						)
					GROUP BY
						DT1160.C258
						, DT1160.C248
						, DT1160.C250
						, DT1159.C999
						, DT1159.C998
					ORDER BY
						DT1160.C248
						, COUNT( DT1160.C258 )
						, MIN( DT1159.C998 )
						, DT1159.C999
						, DT1159.C998
						, DT1160.C250
					LIMIT 687
					)  DT1161 ( C2808, C2809, C2810, C2811, C2812, C2813 ) 
				INNER JOIN
					T3 DT1158
				ON
					DT1161.C2813 < DT1158.C45
				)
			WHERE
				(
					(
						(
							DT1161.C2809 = DT1161.C2810
						)
						OR
						(
							(
								DT1158.C35 > DT1158.C35
							)
							OR
							(
								DT1161.C2809 = DT1158.C52
							)
						)
					)
					OR
					(
						(
							DT1158.C39 = DT1158.C36
						)
						AND
						(
							DT1161.C2813 < DT1158.C36
						)
					)
				)
				OR
				(
					(
						DT1158.C41 <> DT1158.C33
					)
					AND
					(
						DT1161.C2810 = DT1158.C46
					)
				)
			GROUP BY
				DT1161.C2812
				, DT1158.C36
			ORDER BY
				DT1161.C2812
				, AVG( DT1158.C36 )
				, MAX( DT1161.C2812 )
				, DT1158.C36
			LIMIT 209
			)  DT1162 ( C2816, C2817, C2818, C2819 ) 
		ON
			DT1157.C1204 > DT1162.C2816
		)
	INNER JOIN
		T95 DT1156
	ON
		DT1157.C1207 < DT1156.C1167
	)
WHERE
	(
		(
			(
				DT1156.C1170 > DT1162.C2818
			)
			AND
			(
				(
					(
						DT1162.C2819 <> DT1156.C1175
					)
					AND
					(
						DT1162.C2817 > DT1157.C1206
					)
				)
				AND
				(
					(
						DT1156.C1172 = DT1162.C2817
					)
					AND
					(
						(
							DT1157.C1207 < DT1162.C2817
						)
						OR
						(
							DT1156.C1170 < DT1156.C1170
						)
					)
				)
			)
		)
		OR
		(
			DT1157.C1208 > DT1156.C1173
		)
	)
	OR
	(
		DT1156.C1167 = DT1157.C1204
	)
GROUP BY
	DT1156.C1173
	, DT1157.C1207
	, DT1162.C2816
ORDER BY
	SUM( DT1157.C1207 )
LIMIT 709;


SELECT
	MAX( DT1172.C1077 )
	, DT1171.C2840
	, DT1172.C1077
	, DT1171.C2841
	, COUNT( DT1171.C2843 )
	, MAX( DT1172.C1076 )
FROM
	(
		T89 DT1172
	INNER JOIN
		(
		SELECT
			MAX( DT1170.C878 )
			, AVG( DT1170.C873 )
			, DT1170.C878
			, DT1170.C873
		FROM
			(
				(
					T72 DT1170
				INNER JOIN
					(
					SELECT
						DT1167.C1157
						, DT1167.C1165
						, DT1167.C1166
						, COUNT( DT1167.C1157 )
					FROM
						(
							T31 DT1168
						INNER JOIN
							T94 DT1167
						ON
							DT1168.C349 = DT1167.C1147
						)
					WHERE
						(
							DT1168.C352 <> DT1167.C1155
						)
						OR
						(
							(
								DT1167.C1152 = DT1167.C1162
							)
							AND
							(
								(
									(
										DT1168.C356 = DT1167.C1159
									)
									OR
									(
										DT1167.C1147 <> DT1167.C1160
									)
								)
								AND
								(
									DT1168.C352 <> DT1167.C1155
								)
							)
						)
					GROUP BY
						DT1167.C1165
						, DT1167.C1149
						, DT1167.C1157
						, DT1168.C345
						, DT1167.C1166
					ORDER BY
						DT1167.C1157
						, DT1167.C1165
						, DT1167.C1166
						, COUNT( DT1167.C1157 )
					LIMIT 545
					)  DT1169 ( C2834, C2835, C2836, C2837 ) 
				ON
					DT1170.C873 = DT1169.C2835
				)
			INNER JOIN
				(
				SELECT
					AVG( DT1165.C896 )
					, MIN( DT1164.C1162 )
					, DT1164.C1156
					, MAX( DT1164.C1163 )
					, DT1165.C896
					, DT1164.C1162
					, DT1164.C1163
				FROM
					(
						T94 DT1164
					INNER JOIN
						(
							T38 DT1163
						RIGHT OUTER JOIN
							T73 DT1165
						ON
							DT1163.C441 = DT1165.C906
						)
					ON
						DT1164.C1160 < DT1165.C896
					)
				WHERE
					(
						(
							(
								DT1165.C903 = DT1165.C908
							)
							AND
							(
								(
									DT1165.C891 = DT1163.C441
								)
								AND
								(
									DT1164.C1159 < DT1164.C1149
								)
							)
						)
						AND
						(
							DT1163.C443 > DT1165.C901
						)
					)
					AND
					(
						DT1165.C908 = DT1165.C900
					)
				GROUP BY
					DT1164.C1156
					, DT1164.C1162
					, DT1165.C896
					, DT1164.C1163
				ORDER BY
					AVG( DT1165.C896 )
					, MIN( DT1164.C1162 )
					, DT1164.C1156
					, MAX( DT1164.C1163 )
					, DT1165.C896
					, DT1164.C1162
					, DT1164.C1163
				LIMIT 859
				)  DT1166 ( C2826, C2827, C2828, C2829, C2830, C2831, C2832 ) 
			ON
				DT1170.C874 = DT1166.C2826
			)
		WHERE
			(
				DT1166.C2827 = DT1170.C876
			)
			OR
			(
				(
					(
						DT1166.C2830 = DT1166.C2830
					)
					OR
					(
						DT1170.C870 = DT1170.C882
					)
				)
				AND
				(
					(
						DT1170.C886 = DT1170.C888
					)
					AND
					(
						DT1170.C878 < DT1170.C871
					)
				)
			)
		GROUP BY
			DT1170.C878
			, DT1170.C873
		ORDER BY
			MAX( DT1170.C878 )
			, AVG( DT1170.C873 )
			, DT1170.C878
			, DT1170.C873
		LIMIT 215
		) AS DT1171 ( C2840, C2841, C2842, C2843 ) 
	ON
		DT1172.C1077 <> DT1171.C2841
	)
WHERE
	(
		DT1172.C1077 = DT1172.C1076
	)
	OR
	(
		(
			(
				DT1171.C2841 > DT1171.C2841
			)
			AND
			(
				DT1172.C1077 = DT1171.C2841
			)
		)
		OR
		(
			(
				DT1171.C2842 = DT1171.C2842
			)
			AND
			(
				DT1172.C1076 > DT1172.C1078
			)
		)
	)
GROUP BY
	DT1172.C1076
	, DT1171.C2843
	, DT1172.C1077
	, DT1171.C2841
	, DT1171.C2840
ORDER BY
	MAX( DT1172.C1077 )
	, DT1171.C2840
	, DT1172.C1077
	, DT1171.C2841
	, COUNT( DT1171.C2843 )
	, MAX( DT1172.C1076 )
LIMIT 580;


SELECT
	DT1177.C899
FROM
	(
		(
		SELECT
			MIN( DT1173.C269 )
		FROM
			(
				(
					T22 DT1173
				INNER JOIN
					T31 DT1175
				ON
					DT1173.C268 = DT1175.C346
				)
			INNER JOIN
				T74 DT1174
			ON
				DT1173.C259 <> DT1174.C911
			)
		WHERE
			(
				DT1175.C349 <> DT1175.C348
			)
			AND
			(
				(
					(
						(
							DT1175.C355 <> DT1174.C919
						)
						OR
						(
							(
								DT1174.C917 <> DT1174.C922
							)
							AND
							(
								DT1174.C929 <> DT1174.C925
							)
						)
					)
					OR
					(
						DT1174.C922 < DT1173.C260
					)
				)
				OR
				(
					(
						DT1174.C915 = DT1174.C914
					)
					OR
					(
						(
							DT1174.C925 = DT1175.C347
						)
						AND
						(
							DT1174.C919 = DT1173.C262
						)
					)
				)
			)
		GROUP BY
			DT1173.C264
			, DT1173.C269
			, DT1174.C910
			, DT1175.C351
			, DT1175.C346
		ORDER BY
			MIN( DT1173.C269 )
		LIMIT 497
		)  DT1176 ( C2848 ) 
	INNER JOIN
		(
			(
			SELECT
				COUNT( DT1182.C2854 )
				, COUNT( DT1187.C970 )
				, DT1182.C2854
				, DT1186.C2861
			FROM
				(
					(
						(
						SELECT
							DT1181.C806
							, MIN( DT1180.C201 )
							, DT1180.C201
						FROM
							(
								(
									T43 DT1179
								INNER JOIN
									T16 DT1180
								ON
									DT1179.C490 <> DT1180.C205
								)
							INNER JOIN
								(
									T14 DT1178
								INNER JOIN
									T66 DT1181
								ON
									DT1178.C182 < DT1181.C808
								)
							ON
								DT1179.C500 > DT1181.C803
							)
						WHERE
							(
								(
									DT1181.C798 <> DT1181.C798
								)
								AND
								(
									DT1181.C804 = DT1179.C493
								)
							)
							OR
							(
								(
									DT1179.C494 = DT1179.C490
								)
								OR
								(
									(
										DT1179.C492 = DT1179.C501
									)
									AND
									(
										DT1181.C800 = DT1181.C798
									)
								)
							)
						GROUP BY
							DT1179.C498
							, DT1180.C201
							, DT1181.C806
						ORDER BY
							DT1181.C806
							, MIN( DT1180.C201 )
							, DT1180.C201
						LIMIT 689
						) AS DT1182 ( C2852, C2853, C2854 ) 
					INNER JOIN
						T78 DT1187
					ON
						DT1182.C2853 > DT1187.C976
					)
				INNER JOIN
					(
					SELECT
						DT1185.C165
						, MIN( DT1185.C167 )
						, DT1185.C171
						, DT1185.C170
					FROM
						(
							T13 DT1185
						INNER JOIN
							(
								T19 DT1184
							INNER JOIN
								T14 DT1183
							ON
								DT1184.C231 < DT1183.C182
							)
						ON
							DT1185.C164 = DT1183.C181
						)
					WHERE
						(
							DT1183.C184 > DT1185.C170
						)
						OR
						(
							(
								(
									(
										DT1184.C230 < DT1183.C183
									)
									OR
									(
										DT1185.C174 = DT1183.C181
									)
								)
								AND
								(
									DT1183.C185 = DT1184.C231
								)
							)
							OR
							(
								(
									DT1185.C177 <> DT1185.C168
								)
								AND
								(
									(
										(
											DT1183.C185 <> DT1185.C170
										)
										AND
										(
											DT1185.C169 < DT1183.C180
										)
									)
									OR
									(
										DT1185.C164 > DT1185.C168
									)
								)
							)
						)
					GROUP BY
						DT1185.C171
						, DT1185.C165
						, DT1185.C170
						, DT1185.C167
					ORDER BY
						DT1185.C165
						, MIN( DT1185.C167 )
						, DT1185.C171
						, DT1185.C170
					LIMIT 310
					) AS DT1186 ( C2858, C2859, C2860, C2861 ) 
				ON
					DT1187.C965 = DT1186.C2859
				)
			WHERE
				(
					(
						DT1187.C976 <> DT1187.C974
					)
					AND
					(
						(
							DT1186.C2858 = DT1187.C966
						)
						OR
						(
							DT1187.C972 <> DT1186.C2859
						)
					)
				)
				OR
				(
					(
						(
							DT1187.C973 = DT1182.C2852
						)
						AND
						(
							(
								(
									DT1187.C978 = DT1187.C966
								)
								AND
								(
									DT1187.C972 = DT1187.C977
								)
							)
							OR
							(
								DT1187.C969 < DT1186.C2858
							)
						)
					)
					OR
					(
						DT1182.C2852 = DT1187.C965
					)
				)
			GROUP BY
				DT1186.C2861
				, DT1182.C2854
				, DT1187.C970
			ORDER BY
				COUNT( DT1182.C2854 )
				, COUNT( DT1187.C970 )
				, DT1182.C2854
				, DT1186.C2861
			LIMIT 659
			)  DT1188 ( C2865, C2866, C2867, C2868 ) 
		INNER JOIN
			T73 DT1177
		ON
			DT1188.C2865 = DT1177.C897
		)
	ON
		DT1176.C2848 > DT1177.C895
	)
WHERE
	(
		(
			(
				DT1177.C901 <> DT1177.C896
			)
			AND
			(
				(
					(
						DT1177.C900 = DT1177.C900
					)
					AND
					(
						DT1177.C903 = DT1177.C897
					)
				)
				OR
				(
					DT1188.C2866 = DT1188.C2868
				)
			)
		)
		AND
		(
			(
				DT1177.C900 <> DT1177.C894
			)
			OR
			(
				DT1177.C908 = DT1177.C897
			)
		)
	)
	AND
	(
		DT1177.C889 = DT1177.C906
	)
GROUP BY
	DT1177.C902
	, DT1177.C901
	, DT1177.C899
	, DT1177.C904
ORDER BY
	DT1177.C899
LIMIT 537;


SELECT
	AVG( DT1191.C1075 )
FROM
	(
		(
			T38 DT1192
		INNER JOIN
			T77 DT1189
		ON
			DT1192.C441 = DT1189.C947
		)
	INNER JOIN
		(
			T88 DT1191
		LEFT OUTER JOIN
			T50 DT1190
		ON
			DT1191.C1075 = DT1190.C606
		)
	ON
		DT1189.C962 <> DT1191.C1064
	)
WHERE
	(
		(
			DT1191.C1071 = DT1189.C964
		)
		AND
		(
			DT1189.C951 = DT1189.C958
		)
	)
	AND
	(
		(
			(
				(
					(
						DT1189.C954 = DT1189.C959
					)
					OR
					(
						DT1190.C600 <> DT1189.C961
					)
				)
				AND
				(
					(
						DT1189.C953 = DT1189.C957
					)
					AND
					(
						DT1189.C957 < DT1190.C605
					)
				)
			)
			AND
			(
				DT1189.C956 <> DT1190.C604
			)
		)
		AND
		(
			DT1191.C1069 = DT1189.C963
		)
	)
GROUP BY
	DT1191.C1075
	, DT1191.C1069
ORDER BY
	AVG( DT1191.C1075 )
LIMIT 642;


SELECT
	DT1215.C2901
	, DT1193.C895
FROM
	(
		(
			(
			SELECT
				AVG( DT1198.C2876 )
			FROM
				(
					(
						(
						SELECT
							AVG( DT1202.C1142 )
							, DT1201.C458
						FROM
							(
								T41 DT1201
							INNER JOIN
								T93 DT1202
							ON
								DT1201.C456 <> DT1202.C1141
							)
						WHERE
							(
								(
									(
										(
											DT1202.C1139 <> DT1201.C466
										)
										AND
										(
											(
												DT1201.C453 <> DT1201.C467
											)
											OR
											(
												DT1201.C462 = DT1201.C452
											)
										)
									)
									AND
									(
										DT1201.C453 <> DT1201.C467
									)
								)
								AND
								(
									(
										DT1201.C454 = DT1201.C470
									)
									AND
									(
										DT1201.C465 = DT1201.C470
									)
								)
							)
							AND
							(
								DT1202.C1141 < DT1201.C466
							)
						GROUP BY
							DT1201.C451
							, DT1202.C1142
							, DT1202.C1139
							, DT1202.C1138
							, DT1201.C458
						ORDER BY
							AVG( DT1202.C1142 )
							, DT1201.C458
						LIMIT 913
						) AS DT1203 ( C2882, C2883 ) 
					INNER JOIN
						(
						SELECT
							DT1194.C851
							, AVG( DT1194.C851 )
							, DT1195.C1039
						FROM
							(
								T70 DT1194
							INNER JOIN
								(
									(
										T78 DT1197
									INNER JOIN
										T85 DT1195
									ON
										DT1197.C974 <> DT1195.C1040
									)
								INNER JOIN
									T4 DT1196
								ON
									DT1195.C1038 = DT1196.C60
								)
							ON
								DT1194.C839 > DT1196.C57
							)
						WHERE
							(
								(
									DT1196.C53 = DT1196.C63
								)
								OR
								(
									DT1197.C976 = DT1195.C1043
								)
							)
							OR
							(
								(
									(
										(
											DT1194.C842 = DT1195.C1039
										)
										AND
										(
											DT1197.C968 = DT1196.C54
										)
									)
									OR
									(
										DT1196.C62 < DT1196.C54
									)
								)
								OR
								(
									(
										DT1194.C858 <> DT1197.C968
									)
									OR
									(
										DT1194.C839 = DT1197.C971
									)
								)
							)
						GROUP BY
							DT1195.C1039
							, DT1194.C851
						ORDER BY
							DT1194.C851
							, AVG( DT1194.C851 )
							, DT1195.C1039
						LIMIT 369
						) AS DT1198 ( C2875, C2876, C2877 ) 
					ON
						DT1203.C2883 = DT1198.C2875
					)
				INNER JOIN
					(
						T55 DT1199
					INNER JOIN
						T36 DT1200
					ON
						DT1199.C664 <> DT1200.C435
					)
				ON
					DT1203.C2882 <> DT1200.C427
				)
			WHERE
				(
					(
						DT1200.C422 > DT1200.C436
					)
					AND
					(
						(
							(
								DT1199.C665 = DT1200.C422
							)
							AND
							(
								DT1199.C658 > DT1200.C436
							)
						)
						OR
						(
							DT1200.C435 = DT1200.C429
						)
					)
				)
				OR
				(
					(
						(
							DT1200.C424 > DT1199.C667
						)
						OR
						(
							DT1200.C430 = DT1199.C659
						)
					)
					AND
					(
						DT1199.C663 < DT1200.C435
					)
				)
			GROUP BY
				DT1199.C662
				, DT1200.C435
				, DT1199.C660
				, DT1198.C2876
				, DT1199.C663
			ORDER BY
				AVG( DT1198.C2876 )
			LIMIT 251
			)  DT1204 ( C2887 ) 
		INNER JOIN
			T22 DT1216
		ON
			DT1204.C2887 > DT1216.C263
		)
	INNER JOIN
		(
			T73 DT1193
		INNER JOIN
			(
			SELECT
				MAX( DT1205.C803 )
				, AVG( DT1205.C799 )
				, DT1206.C111
				, DT1205.C803
			FROM
				(
					T8 DT1206
				INNER JOIN
					(
						T66 DT1205
					INNER JOIN
						(
						SELECT
							AVG( DT1213.C1042 )
							, DT1207.C1091
							, DT1213.C1032
						FROM
							(
								T90 DT1207
							INNER JOIN
								(
									(
										(
										SELECT
											AVG( DT1208.C1024 )
											, DT1210.C782
										FROM
											(
												T84 DT1208
											INNER JOIN
												(
													T91 DT1209
												INNER JOIN
													T64 DT1210
												ON
													DT1209.C1110 = DT1210.C768
												)
											ON
												DT1208.C1028 = DT1210.C777
											)
										WHERE
											(
												DT1208.C1020 <> DT1209.C1103
											)
											AND
											(
												(
													DT1210.C780 > DT1210.C764
												)
												AND
												(
													(
														(
															DT1210.C782 = DT1210.C768
														)
														AND
														(
															DT1210.C778 = DT1208.C1009
														)
													)
													OR
													(
														DT1209.C1096 = DT1210.C768
													)
												)
											)
										GROUP BY
											DT1208.C1026
											, DT1210.C775
											, DT1208.C1024
											, DT1209.C1112
											, DT1210.C782
										ORDER BY
											AVG( DT1208.C1024 )
											, DT1210.C782
										LIMIT 800
										) AS DT1211 ( C2891, C2892 ) 
									INNER JOIN
										T78 DT1212
									ON
										DT1211.C2892 = DT1212.C969
									)
								RIGHT OUTER JOIN
									T85 DT1213
								ON
									DT1212.C967 = DT1213.C1036
								)
							ON
								DT1207.C1084 = DT1213.C1042
							)
						WHERE
							(
								DT1212.C974 <> DT1207.C1087
							)
							AND
							(
								(
									(
										DT1207.C1081 <> DT1213.C1031
									)
									AND
									(
										(
											DT1211.C2892 = DT1207.C1086
										)
										AND
										(
											DT1212.C975 <> DT1213.C1031
										)
									)
								)
								OR
								(
									(
										(
											DT1213.C1037 < DT1213.C1030
										)
										OR
										(
											DT1211.C2891 < DT1213.C1035
										)
									)
									OR
									(
										DT1212.C975 = DT1213.C1033
									)
								)
							)
						GROUP BY
							DT1207.C1084
							, DT1213.C1032
							, DT1213.C1042
							, DT1207.C1091
						ORDER BY
							AVG( DT1213.C1042 )
							, DT1207.C1091
							, DT1213.C1032
						LIMIT 336
						)  DT1214 ( C2894, C2895, C2896 ) 
					ON
						DT1205.C804 <> DT1214.C2896
					)
				ON
					DT1206.C123 > DT1205.C800
				)
			WHERE
				(
					DT1205.C799 < DT1205.C808
				)
				AND
				(
					(
						(
							DT1205.C799 = DT1206.C112
						)
						AND
						(
							DT1205.C802 <> DT1205.C799
						)
					)
					AND
					(
						(
							DT1206.C112 = DT1206.C114
						)
						AND
						(
							DT1205.C800 = DT1205.C806
						)
					)
				)
			GROUP BY
				DT1205.C799
				, DT1206.C111
				, DT1205.C804
				, DT1205.C803
			ORDER BY
				MAX( DT1205.C803 )
				, AVG( DT1205.C799 )
				, DT1206.C111
				, DT1205.C803
			LIMIT 771
			) AS DT1215 ( C2901, C2902, C2903, C2904 ) 
		ON
			DT1193.C899 > DT1215.C2903
		)
	ON
		DT1216.C268 = DT1193.C903
	)
WHERE
	(
		(
			DT1216.C267 = DT1193.C893
		)
		AND
		(
			(
				DT1216.C267 > DT1216.C269
			)
			AND
			(
				(
					DT1204.C2887 > DT1216.C265
				)
				AND
				(
					DT1193.C891 <> DT1193.C892
				)
			)
		)
	)
	OR
	(
		(
			DT1216.C265 < DT1216.C268
		)
		AND
		(
			DT1216.C264 = DT1193.C903
		)
	)
GROUP BY
	DT1193.C895
	, DT1215.C2901
	, DT1215.C2904
ORDER BY
	DT1215.C2901
	, DT1193.C895
LIMIT 969;


SELECT
	DT1218.C636
	, to_char(AVG( DT1218.C636 ),'9999999.9999999')
	, to_char(AVG( DT1217.C1185 ),'9999999.9999999')
FROM
	(
		T53 DT1218
	INNER JOIN
		T96 DT1217
	ON
		DT1218.C637 <> DT1217.C1183
	)
WHERE
	(
		(
			(
				DT1218.C637 = DT1217.C1179
			)
			AND
			(
				DT1217.C1182 = DT1218.C650
			)
		)
		AND
		(
			DT1218.C640 = DT1218.C639
		)
	)
	OR
	(
		(
			(
				(
					DT1218.C647 = DT1217.C1176
				)
				AND
				(
					DT1218.C644 = DT1218.C643
				)
			)
			OR
			(
				DT1217.C1182 = DT1217.C1178
			)
		)
		AND
		(
			(
				DT1217.C1177 = DT1218.C648
			)
			AND
			(
				DT1217.C1182 = DT1217.C1187
			)
		)
	)
GROUP BY
	DT1218.C636
	, DT1217.C1185
ORDER BY
	DT1218.C636
	, AVG( DT1218.C636 )
	, AVG( DT1217.C1185 )
LIMIT 665;


SELECT
	DT1227.C1109
	, DT1227.C1101
	, DT1227.C1106
FROM
	(
		(
			(
			SELECT
				DT1224.C2912
				, MAX( DT1225.C658 )
				, DT1225.C659
				, DT1225.C667
				, DT1225.C658
				, MAX( DT1225.C667 )
				, COUNT( DT1224.C2912 )
			FROM
				(
					T55 DT1225
				INNER JOIN
					(
					SELECT
						DT1220.C600
					FROM
						(
							(
								T34 DT1223
							INNER JOIN
								(
									T98 DT1222
								INNER JOIN
									T50 DT1220
								ON
									DT1222.C1201 <> DT1220.C606
								)
							ON
								DT1223.C408 > DT1220.C601
							)
						LEFT OUTER JOIN
							T39 DT1221
						ON
							DT1220.C603 < DT1221.C446
						)
					WHERE
						(
							(
								DT1221.C444 > DT1221.C445
							)
							AND
							(
								DT1220.C605 > DT1221.C444
							)
						)
						AND
						(
							(
								(
									DT1223.C403 = DT1223.C407
								)
								OR
								(
									DT1221.C446 > DT1223.C404
								)
							)
							OR
							(
								(
									DT1220.C600 = DT1220.C605
								)
								AND
								(
									DT1223.C404 > DT1220.C606
								)
							)
						)
					GROUP BY
						DT1223.C408
						, DT1223.C404
						, DT1222.C1202
						, DT1220.C600
					ORDER BY
						DT1220.C600
					LIMIT 460
					)  DT1224 ( C2912 ) 
				ON
					DT1225.C667 = DT1224.C2912
				)
			WHERE
				(
					DT1225.C664 < DT1225.C663
				)
				OR
				(
					(
						(
							DT1225.C663 > DT1225.C662
						)
						OR
						(
							DT1225.C663 = DT1225.C659
						)
					)
					OR
					(
						(
							DT1225.C663 = DT1224.C2912
						)
						OR
						(
							DT1225.C664 = DT1225.C661
						)
					)
				)
			GROUP BY
				DT1224.C2912
				, DT1225.C667
				, DT1225.C658
				, DT1225.C662
				, DT1225.C659
			ORDER BY
				DT1224.C2912
				, MAX( DT1225.C658 )
				, DT1225.C659
				, DT1225.C667
				, DT1225.C658
				, MAX( DT1225.C667 )
				, COUNT( DT1224.C2912 )
			LIMIT 809
			) AS DT1226 ( C2917, C2918, C2919, C2920, C2921, C2922, C2923 ) 
		INNER JOIN
			T91 DT1227
		ON
			DT1226.C2921 < DT1227.C1109
		)
	INNER JOIN
		T71 DT1219
	ON
		DT1227.C1101 < DT1219.C864
	)
WHERE
	(
		(
			DT1227.C1110 <> DT1227.C1095
		)
		OR
		(
			(
				DT1227.C1107 = DT1219.C865
			)
			OR
			(
				(
					DT1226.C2919 > DT1226.C2917
				)
				AND
				(
					DT1227.C1098 < DT1227.C1107
				)
			)
		)
	)
	OR
	(
		(
			(
				DT1227.C1096 = DT1227.C1104
			)
			OR
			(
				(
					DT1227.C1114 = DT1227.C1110
				)
				AND
				(
					DT1227.C1107 <> DT1227.C1094
				)
			)
		)
		OR
		(
			DT1227.C1095 > DT1219.C861
		)
	)
GROUP BY
	DT1227.C1106
	, DT1227.C1109
	, DT1227.C1101
	, DT1227.C1103
ORDER BY
	DT1227.C1109
	, DT1227.C1101
	, DT1227.C1106
LIMIT 613;


SELECT
	MIN( DT1232.C1100 )
	, DT1231.C1105
	, DT1232.C1100
	, SUM( DT1231.C1095 )
FROM
	(
		(
			T91 DT1231
		INNER JOIN
			T91 DT1232
		ON
			DT1231.C1106 = DT1232.C1098
		)
	INNER JOIN
		(
		SELECT
			DT1229.C354
			, SUM( DT1228.C545 )
			, DT1229.C352
			, SUM( DT1229.C349 )
		FROM
			(
				T31 DT1229
			INNER JOIN
				T46 DT1228
			ON
				DT1229.C350 < DT1228.C532
			)
		WHERE
			(
				(
					(
						DT1228.C533 = DT1229.C349
					)
					AND
					(
						DT1228.C547 < DT1229.C345
					)
				)
				AND
				(
					(
						DT1229.C362 = DT1229.C350
					)
					AND
					(
						(
							(
								DT1229.C361 <> DT1229.C355
							)
							AND
							(
								(
									DT1228.C541 = DT1229.C347
								)
								AND
								(
									DT1228.C530 = DT1229.C349
								)
							)
						)
						OR
						(
							DT1229.C351 = DT1229.C352
						)
					)
				)
			)
			OR
			(
				DT1229.C345 = DT1229.C344
			)
		GROUP BY
			DT1228.C545
			, DT1229.C354
			, DT1229.C352
			, DT1229.C349
		ORDER BY
			DT1229.C354
			, SUM( DT1228.C545 )
			, DT1229.C352
			, SUM( DT1229.C349 )
		LIMIT 726
		) AS DT1230 ( C2929, C2930, C2931, C2932 ) 
	ON
		DT1232.C1106 <> DT1230.C2931
	)
WHERE
	(
		(
			DT1231.C1107 = DT1232.C1113
		)
		OR
		(
			DT1231.C1114 > DT1230.C2932
		)
	)
	OR
	(
		(
			(
				DT1232.C1108 <> DT1232.C1108
			)
			OR
			(
				DT1231.C1112 <> DT1231.C1098
			)
		)
		AND
		(
			(
				DT1231.C1114 > DT1231.C1100
			)
			OR
			(
				DT1231.C1112 = DT1231.C1106
			)
		)
	)
GROUP BY
	DT1231.C1095
	, DT1232.C1100
	, DT1231.C1105
ORDER BY
	MIN( DT1232.C1100 )
	, DT1231.C1105
	, DT1232.C1100
	, SUM( DT1231.C1095 )
LIMIT 916;


SELECT
	DT1241.C2945
	, DT1234.C988
	, DT1241.C2942
	, DT1233.C626
	, DT1233.C631
	, DT1233.C634
	, DT1234.C986
FROM
	(
		(
			T52 DT1233
		INNER JOIN
			T80 DT1234
		ON
			DT1233.C627 = DT1234.C986
		)
	INNER JOIN
		(
		SELECT
			DT1240.C428
			, DT1240.C426
			, MAX( DT1240.C426 )
			, MIN( DT1240.C428 )
		FROM
			(
				(
				SELECT
					MAX( DT1236.C498 )
				FROM
					(
						(
							(
								T43 DT1236
							INNER JOIN
								T66 DT1238
							ON
								DT1236.C500 <> DT1238.C804
							)
						INNER JOIN
							T24 DT1237
						ON
							DT1236.C500 > DT1237.C281
						)
					INNER JOIN
						T35 DT1235
					ON
						DT1236.C494 <> DT1235.C413
					)
				WHERE
					(
						DT1235.C416 = DT1235.C414
					)
					OR
					(
						(
							DT1235.C413 > DT1235.C411
						)
						OR
						(
							(
								(
									DT1236.C495 = DT1236.C499
								)
								OR
								(
									DT1236.C501 < DT1235.C414
								)
							)
							AND
							(
								DT1236.C496 = DT1236.C497
							)
						)
					)
				GROUP BY
					DT1236.C499
					, DT1236.C501
					, DT1235.C418
					, DT1236.C498
				ORDER BY
					MAX( DT1236.C498 )
				LIMIT 900
				) AS DT1239 ( C2939 ) 
			INNER JOIN
				T36 DT1240
			ON
				DT1239.C2939 = DT1240.C420
			)
		WHERE
			(
				DT1240.C422 = DT1240.C434
			)
			AND
			(
				(
					(
						DT1240.C429 <> DT1240.C422
					)
					AND
					(
						DT1240.C433 = DT1240.C434
					)
				)
				OR
				(
					(
						(
							(
								DT1240.C427 < DT1240.C421
							)
							AND
							(
								DT1240.C430 = DT1240.C419
							)
						)
						OR
						(
							DT1240.C425 < DT1240.C430
						)
					)
					OR
					(
						DT1240.C430 = DT1240.C432
					)
				)
			)
		GROUP BY
			DT1240.C426
			, DT1240.C428
		ORDER BY
			DT1240.C428
			, DT1240.C426
			, MAX( DT1240.C426 )
			, MIN( DT1240.C428 )
		LIMIT 467
		) AS DT1241 ( C2942, C2943, C2944, C2945 ) 
	ON
		DT1233.C627 > DT1241.C2942
	)
WHERE
	(
		(
			DT1241.C2944 = DT1241.C2942
		)
		OR
		(
			DT1233.C629 <> DT1233.C629
		)
	)
	OR
	(
		(
			DT1234.C986 = DT1233.C631
		)
		OR
		(
			(
				DT1234.C989 < DT1233.C632
			)
			OR
			(
				DT1233.C627 > DT1233.C628
			)
		)
	)
ORDER BY
	DT1241.C2945
	, DT1234.C988
	, DT1241.C2942
	, DT1233.C626
	, DT1233.C631
	, DT1233.C634
	, DT1234.C986
LIMIT 968;


SELECT
	AVG( DT1266.C2984 )
FROM
	(
		(
			(
			SELECT
				DT1250.C2959
				, DT1251.C28
			FROM
				(
					T2 DT1251
				INNER JOIN
					(
						(
						SELECT
							DT1247.C380
							, COUNT( DT1247.C380 )
							, AVG( DT1247.C366 )
							, DT1248.C340
							, MIN( DT1249.C1180 )
						FROM
							(
								(
									T32 DT1247
								INNER JOIN
									T29 DT1248
								ON
									DT1247.C379 <> DT1248.C337
								)
							INNER JOIN
								T96 DT1249
							ON
								DT1247.C380 = DT1249.C1187
							)
						WHERE
							(
								DT1249.C1178 < DT1249.C1185
							)
							AND
							(
								(
									(
										(
											DT1249.C1184 = DT1249.C1188
										)
										OR
										(
											(
												DT1248.C340 > DT1248.C335
											)
											AND
											(
												DT1249.C1184 <> DT1249.C1184
											)
										)
									)
									OR
									(
										(
											DT1248.C339 <> DT1247.C365
										)
										OR
										(
											DT1247.C373 > DT1247.C376
										)
									)
								)
								OR
								(
									DT1247.C382 = DT1249.C1182
								)
							)
						GROUP BY
							DT1248.C340
							, DT1247.C380
							, DT1247.C366
							, DT1249.C1180
							, DT1247.C375
						ORDER BY
							DT1247.C380
							, COUNT( DT1247.C380 )
							, AVG( DT1247.C366 )
							, DT1248.C340
							, MIN( DT1249.C1180 )
						LIMIT 160
						)  DT1250 ( C2955, C2956, C2957, C2958, C2959 ) 
					INNER JOIN
						(
						SELECT
							DT1253.C245
							, SUM( DT1253.C245 )
						FROM
							(
								T20 DT1253
							INNER JOIN
								T42 DT1252
							ON
								DT1253.C244 < DT1252.C484
							)
						WHERE
							(
								(
									(
										DT1253.C233 = DT1252.C478
									)
									OR
									(
										DT1252.C473 = DT1253.C240
									)
								)
								AND
								(
									(
										DT1252.C481 < DT1253.C237
									)
									AND
									(
										DT1253.C238 = DT1253.C233
									)
								)
							)
							OR
							(
								(
									(
										DT1252.C485 < DT1252.C485
									)
									OR
									(
										(
											DT1252.C483 = DT1253.C235
										)
										OR
										(
											DT1252.C480 < DT1253.C236
										)
									)
								)
								OR
								(
									DT1253.C237 = DT1253.C233
								)
							)
						GROUP BY
							DT1252.C486
							, DT1253.C245
							, DT1253.C246
						ORDER BY
							DT1253.C245
							, SUM( DT1253.C245 )
						LIMIT 391
						)  DT1254 ( C2963, C2964 ) 
					ON
						DT1250.C2956 = DT1254.C2963
					)
				ON
					DT1251.C31 = DT1254.C2964
				)
			WHERE
				(
					(
						(
							DT1251.C29 = DT1250.C2956
						)
						OR
						(
							DT1251.C24 = DT1254.C2963
						)
					)
					AND
					(
						DT1251.C30 > DT1251.C18
					)
				)
				AND
				(
					(
						DT1251.C31 > DT1250.C2955
					)
					AND
					(
						DT1251.C22 < DT1254.C2963
					)
				)
			GROUP BY
				DT1251.C30
				, DT1251.C25
				, DT1250.C2955
				, DT1251.C28
				, DT1250.C2959
			ORDER BY
				DT1250.C2959
				, DT1251.C28
			LIMIT 231
			)  DT1255 ( C2966, C2967 ) 
		INNER JOIN
			(
			SELECT
				COUNT( DT1258.C317 )
				, DT1258.C311
				, MIN( DT1258.C298 )
				, DT1258.C298
				, DT1258.C317
				, DT1258.C301
				, AVG( DT1258.C311 )
			FROM
				(
					T47 DT1256
				INNER JOIN
					(
						(
							T26 DT1258
						INNER JOIN
							(
							SELECT
								MAX( DT1259.C1144 )
								, DT1260.C402
							FROM
								(
									T93 DT1259
								LEFT OUTER JOIN
									T34 DT1260
								ON
									DT1259.C1143 = DT1260.C402
								)
							WHERE
								(
									(
										DT1259.C1141 <> DT1259.C1144
									)
									AND
									(
										DT1259.C1137 <> DT1259.C1142
									)
								)
								OR
								(
									(
										(
											DT1260.C408 = DT1259.C1140
										)
										OR
										(
											DT1260.C410 = DT1259.C1143
										)
									)
									AND
									(
										DT1259.C1138 = DT1260.C403
									)
								)
							GROUP BY
								DT1260.C402
								, DT1259.C1144
								, DT1259.C1136
							ORDER BY
								MAX( DT1259.C1144 )
								, DT1260.C402
							LIMIT 210
							)  DT1261 ( C2970, C2971 ) 
						ON
							DT1258.C298 = DT1261.C2971
						)
					INNER JOIN
						T48 DT1257
					ON
						DT1258.C299 <> DT1257.C584
					)
				ON
					DT1256.C557 = DT1258.C313
				)
			WHERE
				(
					(
						DT1257.C577 <> DT1258.C304
					)
					OR
					(
						(
							(
								DT1258.C302 <> DT1258.C300
							)
							AND
							(
								DT1258.C318 = DT1257.C580
							)
						)
						OR
						(
							(
								DT1256.C551 <> DT1256.C557
							)
							AND
							(
								DT1257.C585 = DT1258.C315
							)
						)
					)
				)
				OR
				(
					DT1256.C567 = DT1258.C306
				)
			GROUP BY
				DT1258.C317
				, DT1258.C298
				, DT1258.C301
				, DT1258.C311
			ORDER BY
				COUNT( DT1258.C317 )
				, DT1258.C311
				, MIN( DT1258.C298 )
				, DT1258.C298
				, DT1258.C317
				, DT1258.C301
				, AVG( DT1258.C311 )
			LIMIT 798
			)  DT1262 ( C2975, C2976, C2977, C2978, C2979, C2980, C2981 ) 
		ON
			DT1255.C2966 = DT1262.C2978
		)
	INNER JOIN
		(
			(
			SELECT
				DT1243.C100
				, DT1243.C93
			FROM
				(
					(
						T80 DT1244
					INNER JOIN
						T7 DT1243
					ON
						DT1244.C988 = DT1243.C92
					)
				INNER JOIN
					(
						T75 DT1242
					RIGHT OUTER JOIN
						T95 DT1245
					ON
						DT1242.C931 <> DT1245.C1167
					)
				ON
					DT1243.C100 = DT1245.C1171
				)
			WHERE
				(
					(
						(
							DT1242.C936 = DT1242.C932
						)
						AND
						(
							(
								DT1245.C1171 = DT1245.C1175
							)
							OR
							(
								DT1245.C1174 > DT1244.C987
							)
						)
					)
					OR
					(
						(
							DT1242.C933 = DT1245.C1175
						)
						AND
						(
							DT1243.C89 > DT1242.C930
						)
					)
				)
				OR
				(
					DT1243.C102 = DT1244.C988
				)
			GROUP BY
				DT1243.C93
				, DT1245.C1168
				, DT1243.C89
				, DT1243.C100
			ORDER BY
				DT1243.C100
				, DT1243.C93
			LIMIT 269
			) AS DT1246 ( C2950, C2951 ) 
		INNER JOIN
			(
			SELECT
				DT1263.C789
				, DT1263.C796
				, DT1264.C559
				, DT1264.C549
			FROM
				(
					T65 DT1263
				INNER JOIN
					(
						T47 DT1264
					INNER JOIN
						T83 DT1265
					ON
						DT1264.C550 > DT1265.C1004
					)
				ON
					DT1263.C791 = DT1265.C1003
				)
			WHERE
				(
					(
						(
							DT1264.C552 = DT1265.C1007
						)
						AND
						(
							DT1264.C561 > DT1263.C784
						)
					)
					OR
					(
						DT1264.C565 > DT1263.C788
					)
				)
				OR
				(
					(
						DT1264.C565 <> DT1265.C1001
					)
					AND
					(
						DT1264.C554 = DT1265.C1004
					)
				)
			GROUP BY
				DT1263.C789
				, DT1264.C558
				, DT1264.C549
				, DT1264.C559
				, DT1263.C796
			ORDER BY
				DT1263.C789
				, DT1263.C796
				, DT1264.C559
				, DT1264.C549
			LIMIT 889
			)  DT1266 ( C2983, C2984, C2985, C2986 ) 
		ON
			DT1246.C2951 = DT1266.C2985
		)
	ON
		DT1262.C2976 = DT1266.C2985
	)
WHERE
	(
		(
			DT1266.C2984 < DT1262.C2978
		)
		AND
		(
			DT1255.C2966 <> DT1255.C2966
		)
	)
	OR
	(
		(
			DT1262.C2980 = DT1262.C2980
		)
		AND
		(
			(
				(
					(
						DT1255.C2966 = DT1255.C2966
					)
					OR
					(
						DT1266.C2983 <> DT1246.C2951
					)
				)
				OR
				(
					DT1255.C2967 < DT1266.C2984
				)
			)
			OR
			(
				DT1266.C2983 > DT1266.C2985
			)
		)
	)
GROUP BY
	DT1255.C2967
	, DT1266.C2984
	, DT1262.C2975
	, DT1266.C2985
	, DT1262.C2977
ORDER BY
	AVG( DT1266.C2984 )
LIMIT 273;


SELECT
	DT1269.C233
	, COUNT( DT1267.C80 )
FROM
	(
		(
			T20 DT1269
		INNER JOIN
			T6 DT1267
		ON
			DT1269.C245 > DT1267.C80
		)
	RIGHT OUTER JOIN
		T87 DT1268
	ON
		DT1269.C235 > DT1268.C1062
	)
WHERE
	(
		(
			DT1269.C236 < DT1268.C1059
		)
		OR
		(
			(
				DT1267.C76 > DT1267.C81
			)
			AND
			(
				DT1267.C81 = DT1267.C85
			)
		)
	)
	OR
	(
		(
			DT1269.C240 = DT1269.C235
		)
		OR
		(
			DT1269.C240 = DT1267.C75
		)
	)
GROUP BY
	DT1269.C243
	, DT1269.C233
	, DT1267.C80
ORDER BY
	DT1269.C233
	, COUNT( DT1267.C80 )
LIMIT 234;


SELECT
	SUM( DT1270.C469 )
	, AVG( DT1270.C468 )
	, DT1270.C468
FROM
	(
		(
		SELECT
			MAX( DT1276.C2997 )
		FROM
			(
				(
					T78 DT1271
				INNER JOIN
					(
						T79 DT1273
					RIGHT OUTER JOIN
						T20 DT1272
					ON
						DT1273.C979 <> DT1272.C244
					)
				ON
					DT1271.C965 = DT1272.C241
				)
			INNER JOIN
				(
				SELECT
					DT1275.C118
					, COUNT( DT1274.C834 )
					, AVG( DT1274.C826 )
					, AVG( DT1275.C118 )
					, MIN( DT1274.C824 )
					, DT1274.C826
				FROM
					(
						T69 DT1274
					RIGHT OUTER JOIN
						T8 DT1275
					ON
						DT1274.C834 <> DT1275.C123
					)
				WHERE
					(
						DT1275.C121 = DT1275.C122
					)
					AND
					(
						(
							(
								(
									DT1274.C838 <> DT1274.C829
								)
								AND
								(
									DT1275.C124 > DT1274.C832
								)
							)
							AND
							(
								(
									DT1275.C117 = DT1275.C119
								)
								AND
								(
									(
										DT1275.C114 > DT1275.C110
									)
									OR
									(
										DT1275.C121 = DT1275.C116
									)
								)
							)
						)
						OR
						(
							DT1275.C123 > DT1275.C118
						)
					)
				GROUP BY
					DT1275.C118
					, DT1274.C824
					, DT1274.C834
					, DT1274.C826
				ORDER BY
					DT1275.C118
					, COUNT( DT1274.C834 )
					, AVG( DT1274.C826 )
					, AVG( DT1275.C118 )
					, MIN( DT1274.C824 )
					, DT1274.C826
				LIMIT 223
				) AS DT1276 ( C2995, C2996, C2997, C2998, C2999, C3000 ) 
			ON
				DT1272.C242 <> DT1276.C2998
			)
		WHERE
			(
				(
					(
						DT1272.C244 = DT1271.C971
					)
					AND
					(
						DT1271.C969 = DT1271.C968
					)
				)
				AND
				(
					(
						DT1273.C979 < DT1271.C975
					)
					OR
					(
						DT1271.C967 = DT1272.C236
					)
				)
			)
			AND
			(
				(
					(
						DT1272.C244 = DT1271.C970
					)
					AND
					(
						DT1272.C239 <> DT1271.C973
					)
				)
				AND
				(
					(
						DT1276.C2995 > DT1276.C2996
					)
					OR
					(
						DT1276.C3000 = DT1271.C972
					)
				)
			)
		GROUP BY
			DT1276.C2997
			, DT1272.C239
			, DT1276.C2998
			, DT1272.C237
			, DT1272.C246
		ORDER BY
			MAX( DT1276.C2997 )
		LIMIT 653
		) AS DT1277 ( C3004 ) 
	INNER JOIN
		T41 DT1270
	ON
		DT1277.C3004 = DT1270.C461
	)
WHERE
	(
		(
			(
				DT1270.C462 = DT1270.C466
			)
			AND
			(
				(
					DT1270.C453 = DT1270.C470
				)
				OR
				(
					DT1270.C451 = DT1270.C462
				)
			)
		)
		AND
		(
			(
				(
					DT1270.C471 < DT1270.C471
				)
				AND
				(
					DT1270.C467 <> DT1270.C454
				)
			)
			OR
			(
				DT1270.C470 = DT1277.C3004
			)
		)
	)
	AND
	(
		DT1270.C458 = DT1270.C472
	)
GROUP BY
	DT1270.C468
	, DT1270.C469
ORDER BY
	SUM( DT1270.C469 )
	, AVG( DT1270.C468 )
	, DT1270.C468
LIMIT 981;


SELECT
	DT1285.C3016
FROM
	(
		(
			(
				(
				SELECT
					DT1283.C1121
					, DT1283.C1127
					, DT1283.C1119
					, AVG( DT1283.C1119 )
					, DT1283.C1116
				FROM
					(
						T95 DT1284
					INNER JOIN
						T92 DT1283
					ON
						DT1284.C1169 = DT1283.C1122
					)
				WHERE
					(
						(
							(
								DT1283.C1128 <> DT1283.C1132
							)
							AND
							(
								DT1284.C1170 = DT1284.C1170
							)
						)
						AND
						(
							DT1283.C1130 = DT1283.C1118
						)
					)
					OR
					(
						(
							(
								DT1283.C1122 > DT1284.C1167
							)
							OR
							(
								DT1283.C1130 > DT1283.C1134
							)
						)
						AND
						(
							DT1283.C1115 = DT1284.C1167
						)
					)
				GROUP BY
					DT1283.C1121
					, DT1283.C1127
					, DT1283.C1119
					, DT1283.C1116
				ORDER BY
					DT1283.C1121
					, DT1283.C1127
					, DT1283.C1119
					, AVG( DT1283.C1119 )
					, DT1283.C1116
				LIMIT 760
				) AS DT1285 ( C3012, C3013, C3014, C3015, C3016 ) 
			INNER JOIN
				(
				SELECT
					DT1278.C401
				FROM
					(
						(
							(
								T61 DT1281
							INNER JOIN
								T53 DT1279
							ON
								DT1281.C739 = DT1279.C645
							)
						INNER JOIN
							T47 DT1280
						ON
							DT1281.C728 = DT1280.C563
						)
					INNER JOIN
						T33 DT1278
					ON
						DT1281.C730 = DT1278.C383
					)
				WHERE
					(
						(
							(
								DT1279.C651 <> DT1279.C644
							)
							AND
							(
								DT1280.C565 = DT1279.C650
							)
						)
						AND
						(
							(
								(
									DT1279.C651 = DT1280.C556
								)
								AND
								(
									DT1278.C393 = DT1278.C394
								)
							)
							OR
							(
								DT1280.C556 = DT1280.C556
							)
						)
					)
					AND
					(
						(
							DT1281.C738 = DT1279.C641
						)
						OR
						(
							DT1278.C384 = DT1278.C384
						)
					)
				GROUP BY
					DT1280.C553
					, DT1278.C401
				ORDER BY
					DT1278.C401
				LIMIT 629
				) AS DT1282 ( C3009 ) 
			ON
				DT1285.C3013 = DT1282.C3009
			)
		INNER JOIN
			T39 DT1287
		ON
			DT1285.C3014 > DT1287.C444
		)
	INNER JOIN
		T50 DT1286
	ON
		DT1285.C3016 <> DT1286.C605
	)
WHERE
	(
		DT1286.C601 = DT1285.C3016
	)
	AND
	(
		(
			(
				(
					DT1287.C446 < DT1285.C3012
				)
				OR
				(
					DT1286.C603 <> DT1287.C446
				)
			)
			AND
			(
				DT1282.C3009 = DT1286.C602
			)
		)
		AND
		(
			(
				(
					DT1286.C603 = DT1286.C602
				)
				AND
				(
					DT1286.C600 <> DT1285.C3014
				)
			)
			OR
			(
				DT1287.C445 <> DT1286.C606
			)
		)
	)
GROUP BY
	DT1285.C3012
	, DT1286.C604
	, DT1287.C446
	, DT1285.C3016
ORDER BY
	DT1285.C3016
LIMIT 131;


SELECT
	DT1293.C66
	, MIN( DT1293.C70 )
FROM
	(
		(
		SELECT
			DT1290.C633
			, MIN( DT1289.C666 )
			, DT1289.C666
		FROM
			(
				(
					T52 DT1290
				INNER JOIN
					T55 DT1289
				ON
					DT1290.C635 = DT1289.C667
				)
			INNER JOIN
				(
					T7 DT1291
				INNER JOIN
					T82 DT1288
				ON
					DT1291.C104 < DT1288.C998
				)
			ON
				DT1290.C633 = DT1291.C96
			)
		WHERE
			(
				(
					(
						DT1291.C98 = DT1291.C105
					)
					OR
					(
						DT1291.C108 = DT1288.C996
					)
				)
				OR
				(
					(
						DT1290.C631 > DT1288.C997
					)
					OR
					(
						DT1289.C660 = DT1290.C629
					)
				)
			)
			AND
			(
				(
					DT1290.C635 = DT1290.C631
				)
				OR
				(
					DT1291.C106 > DT1290.C634
				)
			)
		GROUP BY
			DT1289.C666
			, DT1290.C633
		ORDER BY
			DT1290.C633
			, MIN( DT1289.C666 )
			, DT1289.C666
		LIMIT 256
		)  DT1292 ( C3021, C3022, C3023 ) 
	INNER JOIN
		(
			T5 DT1293
		INNER JOIN
			(
			SELECT
				MIN( DT1295.C1144 )
				, MIN( DT1294.C1188 )
				, DT1294.C1176
			FROM
				(
					T93 DT1295
				INNER JOIN
					(
						T30 DT1296
					INNER JOIN
						T96 DT1294
					ON
						DT1296.C341 = DT1294.C1185
					)
				ON
					DT1295.C1137 < DT1296.C342
				)
			WHERE
				(
					DT1294.C1181 = DT1294.C1176
				)
				OR
				(
					(
						DT1294.C1183 = DT1295.C1137
					)
					AND
					(
						(
							(
								DT1294.C1182 = DT1294.C1180
							)
							OR
							(
								(
									DT1296.C341 > DT1294.C1183
								)
								OR
								(
									DT1295.C1142 <> DT1294.C1181
								)
							)
						)
						AND
						(
							(
								DT1294.C1185 <> DT1294.C1183
							)
							OR
							(
								DT1294.C1180 < DT1294.C1177
							)
						)
					)
				)
			GROUP BY
				DT1294.C1188
				, DT1295.C1144
				, DT1294.C1177
				, DT1294.C1176
				, DT1295.C1140
			ORDER BY
				MIN( DT1295.C1144 )
				, MIN( DT1294.C1188 )
				, DT1294.C1176
			LIMIT 475
			) AS DT1297 ( C3028, C3029, C3030 ) 
		ON
			DT1293.C70 = DT1297.C3030
		)
	ON
		DT1292.C3022 = DT1293.C70
	)
WHERE
	(
		(
			DT1292.C3022 <> DT1293.C69
		)
		AND
		(
			(
				(
					DT1292.C3021 < DT1293.C71
				)
				OR
				(
					DT1293.C74 = DT1293.C74
				)
			)
			OR
			(
				DT1293.C70 > DT1293.C69
			)
		)
	)
	AND
	(
		DT1293.C73 < DT1292.C3021
	)
GROUP BY
	DT1293.C66
	, DT1293.C70
ORDER BY
	DT1293.C66
	, MIN( DT1293.C70 )
LIMIT 596;


SELECT
	MAX( DT1299.C840 )
	, DT1299.C840
	, MIN( DT1298.C369 )
FROM
	(
		(
			T70 DT1299
		RIGHT OUTER JOIN
			T38 DT1300
		ON
			DT1299.C856 < DT1300.C441
		)
	INNER JOIN
		T32 DT1298
	ON
		DT1299.C851 = DT1298.C379
	)
WHERE
	(
		(
			DT1299.C855 > DT1299.C839
		)
		AND
		(
			(
				DT1299.C851 = DT1299.C847
			)
			AND
			(
				DT1299.C857 > DT1299.C842
			)
		)
	)
	OR
	(
		(
			DT1299.C852 = DT1299.C856
		)
		OR
		(
			DT1299.C849 = DT1298.C378
		)
	)
GROUP BY
	DT1299.C840
	, DT1299.C839
	, DT1298.C369
	, DT1298.C374
ORDER BY
	MAX( DT1299.C840 )
	, DT1299.C840
	, MIN( DT1298.C369 )
LIMIT 404;


SELECT
	DT1301.C888
	, AVG( DT1301.C880 )
	, COUNT( DT1301.C868 )
	, AVG( DT1301.C888 )
	, COUNT( DT1301.C874 )
	, DT1301.C868
	, DT1301.C874
	, DT1301.C877
	, DT1301.C880
FROM
	(
		T22 DT1302
	INNER JOIN
		(
			(
				T20 DT1307
			INNER JOIN
				T72 DT1301
			ON
				DT1307.C234 = DT1301.C872
			)
		INNER JOIN
			(
			SELECT
				DT1303.C25
				, DT1305.C586
			FROM
				(
					T49 DT1305
				INNER JOIN
					(
						T2 DT1303
					INNER JOIN
						T67 DT1304
					ON
						DT1303.C15 = DT1304.C816
					)
				ON
					DT1305.C597 = DT1303.C27
				)
			WHERE
				(
					DT1303.C15 > DT1303.C19
				)
				AND
				(
					(
						(
							(
								DT1305.C596 = DT1304.C818
							)
							OR
							(
								DT1305.C594 < DT1304.C818
							)
						)
						OR
						(
							DT1305.C599 <> DT1303.C20
						)
					)
					AND
					(
						DT1303.C23 = DT1303.C26
					)
				)
			GROUP BY
				DT1303.C18
				, DT1305.C586
				, DT1303.C20
				, DT1303.C25
				, DT1305.C596
			ORDER BY
				DT1303.C25
				, DT1305.C586
			LIMIT 875
			)  DT1306 ( C3036, C3037 ) 
		ON
			DT1301.C875 = DT1306.C3036
		)
	ON
		DT1302.C267 < DT1301.C868
	)
WHERE
	(
		(
			DT1302.C263 > DT1301.C876
		)
		OR
		(
			DT1307.C242 <> DT1301.C872
		)
	)
	OR
	(
		(
			(
				DT1307.C239 <> DT1307.C245
			)
			OR
			(
				DT1301.C868 > DT1307.C245
			)
		)
		OR
		(
			DT1302.C259 = DT1301.C874
		)
	)
GROUP BY
	DT1301.C880
	, DT1301.C874
	, DT1301.C888
	, DT1301.C877
	, DT1301.C868
ORDER BY
	DT1301.C888
	, AVG( DT1301.C880 )
	, COUNT( DT1301.C868 )
	, AVG( DT1301.C888 )
	, COUNT( DT1301.C874 )
	, DT1301.C868
	, DT1301.C874
	, DT1301.C877
	, DT1301.C880
LIMIT 712;


SELECT
	MAX( DT1313.C3046 )
	, DT1313.C3046
	, DT1308.C428
FROM
	(
		(
			(
			SELECT
				DT1314.C342
				, MIN( DT1316.C836 )
				, DT1316.C836
				, MAX( DT1316.C838 )
				, DT1316.C824
			FROM
				(
					T69 DT1316
				INNER JOIN
					(
						T30 DT1314
					INNER JOIN
						T28 DT1315
					ON
						DT1314.C343 = DT1315.C330
					)
				ON
					DT1316.C825 > DT1315.C333
				)
			WHERE
				(
					DT1316.C825 = DT1316.C836
				)
				AND
				(
					(
						DT1315.C328 < DT1314.C341
					)
					OR
					(
						(
							(
								DT1315.C330 = DT1315.C331
							)
							OR
							(
								DT1316.C829 <> DT1316.C836
							)
						)
						AND
						(
							(
								DT1316.C828 = DT1316.C829
							)
							AND
							(
								DT1316.C827 > DT1315.C332
							)
						)
					)
				)
			GROUP BY
				DT1316.C825
				, DT1316.C836
				, DT1314.C342
				, DT1316.C838
				, DT1316.C824
			ORDER BY
				DT1314.C342
				, MIN( DT1316.C836 )
				, DT1316.C836
				, MAX( DT1316.C838 )
				, DT1316.C824
			LIMIT 532
			)  DT1317 ( C3053, C3054, C3055, C3056, C3057 ) 
		INNER JOIN
			T36 DT1308
		ON
			DT1317.C3055 <> DT1308.C431
		)
	INNER JOIN
		(
		SELECT
			COUNT( DT1310.C777 )
			, DT1310.C777
			, AVG( DT1310.C773 )
			, SUM( DT1312.C1000 )
			, DT1312.C1000
		FROM
			(
				T39 DT1311
			RIGHT OUTER JOIN
				(
					T48 DT1309
				INNER JOIN
					(
						T64 DT1310
					INNER JOIN
						T82 DT1312
					ON
						DT1310.C768 = DT1312.C998
					)
				ON
					DT1309.C570 = DT1310.C768
				)
			ON
				DT1311.C445 < DT1310.C767
			)
		WHERE
			(
				(
					DT1309.C582 = DT1310.C775
				)
				AND
				(
					(
						DT1309.C569 > DT1312.C997
					)
					AND
					(
						DT1310.C768 > DT1309.C578
					)
				)
			)
			OR
			(
				(
					DT1312.C999 = DT1309.C571
				)
				OR
				(
					DT1309.C583 = DT1309.C579
				)
			)
		GROUP BY
			DT1312.C1000
			, DT1310.C773
			, DT1310.C777
		ORDER BY
			COUNT( DT1310.C777 )
			, DT1310.C777
			, AVG( DT1310.C773 )
			, SUM( DT1312.C1000 )
			, DT1312.C1000
		LIMIT 920
		) AS DT1313 ( C3045, C3046, C3047, C3048, C3049 ) 
	ON
		DT1308.C421 <> DT1313.C3046
	)
WHERE
	(
		(
			(
				DT1308.C434 = DT1317.C3053
			)
			AND
			(
				DT1308.C420 > DT1313.C3045
			)
		)
		OR
		(
			DT1308.C426 <> DT1308.C432
		)
	)
	OR
	(
		(
			(
				DT1308.C424 > DT1308.C436
			)
			AND
			(
				DT1308.C433 = DT1308.C423
			)
		)
		OR
		(
			(
				(
					DT1308.C436 > DT1313.C3047
				)
				AND
				(
					DT1313.C3046 <> DT1308.C425
				)
			)
			OR
			(
				DT1317.C3054 < DT1313.C3045
			)
		)
	)
GROUP BY
	DT1308.C428
	, DT1313.C3046
ORDER BY
	MAX( DT1313.C3046 )
	, DT1313.C3046
	, DT1308.C428
LIMIT 101;


SELECT
	DT1320.C3070
	, DT1320.C3071
	, DT1327.C1062
	, DT1320.C3068
	, SUM( DT1320.C3065 )
	, AVG( DT1320.C3068 )
	, DT1320.C3065
	, MAX( DT1320.C3071 )
FROM
	(
		T87 DT1327
	INNER JOIN
		(
			(
			SELECT
				DT1322.C128
				, COUNT( DT1321.C1192 )
			FROM
				(
					T97 DT1321
				LEFT OUTER JOIN
					(
						(
						SELECT
							COUNT( DT1323.C588 )
							, DT1323.C589
						FROM
							(
								T43 DT1324
							INNER JOIN
								T49 DT1323
							ON
								DT1324.C493 < DT1323.C595
							)
						WHERE
							(
								(
									DT1323.C587 = DT1323.C589
								)
								AND
								(
									(
										DT1323.C596 = DT1324.C487
									)
									AND
									(
										DT1323.C595 > DT1324.C491
									)
								)
							)
							AND
							(
								(
									DT1323.C586 = DT1324.C500
								)
								AND
								(
									DT1324.C491 = DT1324.C501
								)
							)
						GROUP BY
							DT1323.C588
							, DT1323.C589
						ORDER BY
							COUNT( DT1323.C588 )
							, DT1323.C589
						LIMIT 268
						) AS DT1325 ( C3073, C3074 ) 
					INNER JOIN
						T9 DT1322
					ON
						DT1325.C3074 > DT1322.C128
					)
				ON
					DT1321.C1194 = DT1322.C137
				)
			WHERE
				(
					(
						(
							DT1322.C133 <> DT1325.C3073
						)
						AND
						(
							DT1325.C3073 < DT1321.C1192
						)
					)
					OR
					(
						DT1322.C126 = DT1322.C130
					)
				)
				AND
				(
					(
						(
							(
								DT1322.C129 > DT1322.C129
							)
							AND
							(
								DT1321.C1190 <> DT1322.C134
							)
						)
						AND
						(
							(
								DT1321.C1195 = DT1321.C1196
							)
							AND
							(
								DT1325.C3074 < DT1322.C129
							)
						)
					)
					OR
					(
						DT1322.C129 <> DT1322.C127
					)
				)
			GROUP BY
				DT1322.C128
				, DT1321.C1192
			ORDER BY
				DT1322.C128
				, COUNT( DT1321.C1192 )
			LIMIT 717
			)  DT1326 ( C3077, C3078 ) 
		INNER JOIN
			(
			SELECT
				COUNT( DT1318.C1108 )
				, DT1318.C1099
				, DT1319.C1169
				, DT1318.C1108
				, DT1319.C1167
				, MIN( DT1319.C1169 )
				, AVG( DT1318.C1100 )
				, DT1318.C1100
			FROM
				(
					T91 DT1318
				INNER JOIN
					T95 DT1319
				ON
					DT1318.C1102 = DT1319.C1173
				)
			WHERE
				(
					(
						DT1318.C1101 = DT1318.C1098
					)
					OR
					(
						DT1319.C1173 = DT1318.C1109
					)
				)
				OR
				(
					(
						DT1318.C1107 > DT1318.C1106
					)
					OR
					(
						(
							DT1319.C1172 < DT1318.C1109
						)
						AND
						(
							(
								DT1318.C1112 = DT1318.C1107
							)
							OR
							(
								DT1318.C1106 = DT1318.C1109
							)
						)
					)
				)
			GROUP BY
				DT1318.C1099
				, DT1318.C1108
				, DT1319.C1167
				, DT1319.C1169
				, DT1318.C1100
			ORDER BY
				COUNT( DT1318.C1108 )
				, DT1318.C1099
				, DT1319.C1169
				, DT1318.C1108
				, DT1319.C1167
				, MIN( DT1319.C1169 )
				, AVG( DT1318.C1100 )
				, DT1318.C1100
			LIMIT 849
			) AS DT1320 ( C3064, C3065, C3066, C3067, C3068, C3069, C3070, C3071 ) 
		ON
			DT1326.C3078 = DT1320.C3068
		)
	ON
		DT1327.C1060 > DT1320.C3069
	)
WHERE
	(
		(
			DT1320.C3067 = DT1320.C3065
		)
		OR
		(
			DT1326.C3078 = DT1320.C3069
		)
	)
	OR
	(
		(
			(
				(
					DT1327.C1063 = DT1327.C1062
				)
				OR
				(
					(
						DT1320.C3065 <> DT1320.C3066
					)
					AND
					(
						DT1320.C3065 = DT1327.C1058
					)
				)
			)
			AND
			(
				DT1320.C3070 = DT1327.C1056
			)
		)
		OR
		(
			(
				DT1320.C3069 <> DT1320.C3069
			)
			AND
			(
				DT1327.C1061 = DT1320.C3066
			)
		)
	)
GROUP BY
	DT1320.C3070
	, DT1320.C3071
	, DT1327.C1062
	, DT1320.C3065
	, DT1320.C3068
ORDER BY
	DT1320.C3070
	, DT1320.C3071
	, DT1327.C1062
	, DT1320.C3068
	, SUM( DT1320.C3065 )
	, AVG( DT1320.C3068 )
	, DT1320.C3065
	, MAX( DT1320.C3071 )
LIMIT 867;


SELECT
	to_char(AVG( DT1328.C958 ),'9999999.9999999')
	, MAX( DT1328.C949 )
	, DT1328.C958
FROM
	(
		T60 DT1329
	INNER JOIN
		T77 DT1328
	ON
		DT1329.C721 <> DT1328.C950
	)
WHERE
	(
		(
			(
				DT1328.C962 <> DT1328.C949
			)
			AND
			(
				DT1329.C721 > DT1328.C952
			)
		)
		AND
		(
			(
				DT1328.C954 < DT1329.C717
			)
			OR
			(
				(
					DT1328.C961 < DT1328.C956
				)
				OR
				(
					DT1328.C964 = DT1329.C718
				)
			)
		)
	)
	OR
	(
		DT1328.C959 < DT1329.C719
	)
GROUP BY
	DT1328.C956
	, DT1328.C949
	, DT1328.C958
ORDER BY
	AVG( DT1328.C958 )
	, MAX( DT1328.C949 )
	, DT1328.C958
LIMIT 933;


SELECT
	DT1335.C917
	, to_char(AVG( DT1333.C581 ),'9999999.9999999')
	, DT1333.C581
	, COUNT( DT1335.C917 )
	, to_char(AVG( DT1335.C927 ),'9999999.9999999')
FROM
	(
		T74 DT1335
	INNER JOIN
		(
			(
				T48 DT1333
			INNER JOIN
				T1 DT1334
			ON
				DT1333.C573 < DT1334.C6
			)
		INNER JOIN
			(
			SELECT
				DT1331.C398
			FROM
				(
					T8 DT1330
				INNER JOIN
					T33 DT1331
				ON
					DT1330.C110 = DT1331.C387
				)
			WHERE
				(
					DT1330.C119 > DT1331.C392
				)
				OR
				(
					(
						(
							(
								(
									DT1330.C112 > DT1331.C390
								)
								AND
								(
									DT1331.C395 <> DT1330.C110
								)
							)
							AND
							(
								DT1330.C119 > DT1330.C119
							)
						)
						AND
						(
							DT1331.C399 = DT1330.C125
						)
					)
					AND
					(
						(
							(
								DT1331.C389 = DT1330.C114
							)
							OR
							(
								DT1331.C394 = DT1331.C387
							)
						)
						AND
						(
							DT1330.C113 = DT1331.C387
						)
					)
				)
			GROUP BY
				DT1331.C393
				, DT1331.C391
				, DT1331.C398
			ORDER BY
				DT1331.C398
			LIMIT 210
			) AS DT1332 ( C3086 ) 
		ON
			DT1333.C585 = DT1332.C3086
		)
	ON
		DT1335.C914 = DT1334.C13
	)
WHERE
	(
		(
			(
				DT1333.C584 > DT1333.C569
			)
			AND
			(
				DT1335.C920 <> DT1333.C581
			)
		)
		AND
		(
			DT1334.C4 <> DT1333.C584
		)
	)
	OR
	(
		(
			DT1335.C927 = DT1335.C911
		)
		AND
		(
			DT1335.C910 = DT1335.C928
		)
	)
GROUP BY
	DT1335.C927
	, DT1335.C917
	, DT1333.C581
ORDER BY
	DT1335.C917
	, AVG( DT1333.C581 )
	, DT1333.C581
	, COUNT( DT1335.C917 )
	, AVG( DT1335.C927 )
LIMIT 208;


SELECT
	DT1339.C539
	, DT1339.C531
	, DT1339.C547
	, DT1339.C533
	, AVG( DT1339.C531 )
FROM
	(
		T46 DT1339
	INNER JOIN
		(
		SELECT
			MIN( DT1337.C532 )
			, DT1337.C540
		FROM
			(
				T46 DT1337
			RIGHT OUTER JOIN
				T11 DT1336
			ON
				DT1337.C542 > DT1336.C155
			)
		WHERE
			(
				(
					DT1337.C535 <> DT1336.C156
				)
				OR
				(
					(
						(
							DT1337.C543 > DT1337.C539
						)
						AND
						(
							(
								DT1337.C543 > DT1336.C152
							)
							OR
							(
								DT1337.C530 = DT1336.C154
							)
						)
					)
					AND
					(
						DT1337.C541 < DT1337.C531
					)
				)
			)
			AND
			(
				DT1336.C156 <> DT1337.C530
			)
		GROUP BY
			DT1337.C540
			, DT1337.C532
		ORDER BY
			MIN( DT1337.C532 )
			, DT1337.C540
		LIMIT 430
		) AS DT1338 ( C3092, C3093 ) 
	ON
		DT1339.C533 = DT1338.C3092
	)
WHERE
	(
		DT1339.C534 = DT1339.C534
	)
	AND
	(
		(
			(
				DT1339.C534 = DT1339.C544
			)
			AND
			(
				DT1338.C3092 = DT1338.C3093
			)
		)
		AND
		(
			(
				(
					DT1339.C538 <> DT1339.C544
				)
				AND
				(
					DT1339.C531 = DT1339.C528
				)
			)
			AND
			(
				DT1338.C3093 = DT1338.C3092
			)
		)
	)
GROUP BY
	DT1339.C533
	, DT1339.C531
	, DT1339.C547
	, DT1339.C539
	, DT1339.C540
ORDER BY
	DT1339.C539
	, DT1339.C531
	, DT1339.C547
	, DT1339.C533
	, AVG( DT1339.C531 )
LIMIT 230;


SELECT
	DT1357.C3118
	, MAX( DT1357.C3118 )
	, DT1344.C311
FROM
	(
		T26 DT1344
	LEFT OUTER JOIN
		(
			T85 DT1358
		INNER JOIN
			(
				(
				SELECT
					DT1345.C417
					, MIN( DT1356.C1008 )
					, DT1356.C1023
					, DT1356.C1015
					, SUM( DT1345.C417 )
					, DT1356.C1008
				FROM
					(
						(
							T35 DT1345
						INNER JOIN
							(
							SELECT
								DT1348.C666
							FROM
								(
									T45 DT1347
								RIGHT OUTER JOIN
									(
										T96 DT1354
									INNER JOIN
										(
											(
											SELECT
												DT1350.C1142
											FROM
												(
													(
														T54 DT1349
													INNER JOIN
														T55 DT1352
													ON
														DT1349.C657 < DT1352.C666
													)
												INNER JOIN
													(
														T93 DT1350
													INNER JOIN
														T54 DT1351
													ON
														DT1350.C1140 <> DT1351.C654
													)
												ON
													DT1352.C659 > DT1350.C1143
												)
											WHERE
												(
													DT1352.C666 = DT1349.C656
												)
												OR
												(
													(
														(
															(
																DT1352.C667 < DT1352.C666
															)
															OR
															(
																DT1349.C656 <> DT1350.C1143
															)
														)
														AND
														(
															DT1352.C659 = DT1352.C661
														)
													)
													AND
													(
														DT1352.C666 <> DT1350.C1136
													)
												)
											GROUP BY
												DT1350.C1144
												, DT1352.C665
												, DT1351.C657
												, DT1350.C1142
											ORDER BY
												DT1350.C1142
											LIMIT 979
											) AS DT1353 ( C3107 ) 
										INNER JOIN
											T55 DT1348
										ON
											DT1353.C3107 = DT1348.C665
										)
									ON
										DT1354.C1177 <> DT1353.C3107
									)
								ON
									DT1347.C527 = DT1348.C667
								)
							WHERE
								(
									DT1354.C1186 = DT1354.C1182
								)
								OR
								(
									(
										(
											DT1347.C522 = DT1348.C663
										)
										AND
										(
											DT1347.C512 <> DT1354.C1187
										)
									)
									OR
									(
										(
											DT1348.C658 > DT1354.C1178
										)
										AND
										(
											(
												DT1347.C525 = DT1347.C512
											)
											OR
											(
												(
													DT1354.C1186 <> DT1347.C522
												)
												AND
												(
													DT1347.C513 = DT1354.C1184
												)
											)
										)
									)
								)
							GROUP BY
								DT1348.C666
								, DT1354.C1182
							ORDER BY
								DT1348.C666
							LIMIT 622
							)  DT1355 ( C3110 ) 
						ON
							DT1345.C417 = DT1355.C3110
						)
					INNER JOIN
						(
							T84 DT1356
						INNER JOIN
							T11 DT1346
						ON
							DT1356.C1027 > DT1346.C153
						)
					ON
						DT1345.C413 = DT1356.C1017
					)
				WHERE
					(
						(
							(
								DT1356.C1010 > DT1345.C416
							)
							AND
							(
								DT1356.C1023 > DT1345.C416
							)
						)
						OR
						(
							(
								(
									DT1356.C1017 = DT1356.C1028
								)
								AND
								(
									DT1356.C1015 = DT1356.C1019
								)
							)
							AND
							(
								(
									DT1346.C154 = DT1356.C1026
								)
								AND
								(
									(
										DT1356.C1010 < DT1356.C1019
									)
									OR
									(
										DT1356.C1026 > DT1346.C156
									)
								)
							)
						)
					)
					AND
					(
						DT1356.C1027 = DT1356.C1019
					)
				GROUP BY
					DT1356.C1008
					, DT1345.C417
					, DT1356.C1023
					, DT1356.C1015
				ORDER BY
					DT1345.C417
					, MIN( DT1356.C1008 )
					, DT1356.C1023
					, DT1356.C1015
					, SUM( DT1345.C417 )
					, DT1356.C1008
				LIMIT 505
				) AS DT1357 ( C3113, C3114, C3115, C3116, C3117, C3118 ) 
			INNER JOIN
				(
				SELECT
					DT1341.C1187
					, DT1342.C424
					, DT1342.C432
					, DT1342.C421
					, MIN( DT1342.C432 )
					, AVG( DT1342.C421 )
				FROM
					(
						(
							T96 DT1341
						RIGHT OUTER JOIN
							T36 DT1342
						ON
							DT1341.C1181 = DT1342.C424
						)
					INNER JOIN
						T38 DT1340
					ON
						DT1342.C430 < DT1340.C441
					)
				WHERE
					(
						(
							(
								(
									DT1341.C1177 < DT1342.C434
								)
								AND
								(
									(
										DT1341.C1184 = DT1342.C433
									)
									AND
									(
										DT1342.C432 < DT1342.C434
									)
								)
							)
							AND
							(
								DT1341.C1189 > DT1342.C435
							)
						)
						OR
						(
							(
								(
									DT1341.C1179 = DT1340.C442
								)
								AND
								(
									DT1341.C1177 > DT1341.C1177
								)
							)
							OR
							(
								DT1342.C427 < DT1342.C425
							)
						)
					)
					AND
					(
						DT1341.C1179 = DT1342.C420
					)
				GROUP BY
					DT1342.C421
					, DT1342.C424
					, DT1341.C1187
					, DT1342.C432
					, DT1341.C1183
				ORDER BY
					DT1341.C1187
					, DT1342.C424
					, DT1342.C432
					, DT1342.C421
					, MIN( DT1342.C432 )
					, AVG( DT1342.C421 )
				LIMIT 545
				) AS DT1343 ( C3097, C3098, C3099, C3100, C3101, C3102 ) 
			ON
				DT1357.C3115 = DT1343.C3098
			)
		ON
			DT1358.C1039 = DT1357.C3117
		)
	ON
		DT1344.C307 > DT1343.C3098
	)
WHERE
	(
		(
			DT1358.C1034 = DT1358.C1034
		)
		OR
		(
			(
				(
					DT1358.C1030 > DT1358.C1032
				)
				OR
				(
					DT1343.C3097 = DT1344.C312
				)
			)
			OR
			(
				DT1344.C310 < DT1344.C309
			)
		)
	)
	OR
	(
		DT1357.C3116 = DT1344.C314
	)
GROUP BY
	DT1344.C305
	, DT1358.C1030
	, DT1357.C3118
	, DT1344.C311
	, DT1344.C308
ORDER BY
	DT1357.C3118
	, MAX( DT1357.C3118 )
	, DT1344.C311
LIMIT 905;


SELECT
	DT1360.C1128
	, SUM( DT1360.C1128 )
FROM
	(
		T92 DT1360
	INNER JOIN
		T55 DT1359
	ON
		DT1360.C1125 = DT1359.C660
	)
WHERE
	(
		(
			(
				DT1360.C1126 = DT1359.C662
			)
			OR
			(
				DT1360.C1126 = DT1359.C658
			)
		)
		AND
		(
			DT1360.C1123 = DT1360.C1115
		)
	)
	AND
	(
		(
			DT1360.C1117 <> DT1360.C1127
		)
		AND
		(
			(
				DT1359.C664 > DT1359.C662
			)
			OR
			(
				DT1360.C1117 > DT1360.C1128
			)
		)
	)
GROUP BY
	DT1360.C1128
	, DT1360.C1120
ORDER BY
	DT1360.C1128
	, SUM( DT1360.C1128 )
LIMIT 735;


SELECT
	DT1361.C408
	, COUNT( DT1361.C402 )
	, MAX( DT1361.C406 )
	, DT1361.C406
	, AVG( DT1361.C408 )
	, DT1361.C402
	, DT1361.C407
FROM
	(
		(
		SELECT
			DT1364.C607
			, DT1364.C603
		FROM
			(
				T6 DT1362
			INNER JOIN
				(
					T50 DT1364
				INNER JOIN
					T69 DT1363
				ON
					DT1364.C602 = DT1363.C838
				)
			ON
				DT1362.C87 = DT1364.C606
			)
		WHERE
			(
				(
					DT1362.C83 <> DT1364.C606
				)
				AND
				(
					(
						DT1364.C604 <> DT1364.C606
					)
					AND
					(
						DT1363.C835 = DT1362.C80
					)
				)
			)
			AND
			(
				(
					DT1363.C833 = DT1363.C830
				)
				AND
				(
					DT1362.C80 = DT1362.C81
				)
			)
		GROUP BY
			DT1364.C603
			, DT1363.C829
			, DT1364.C607
		ORDER BY
			DT1364.C607
			, DT1364.C603
		LIMIT 401
		) AS DT1365 ( C3124, C3125 ) 
	INNER JOIN
		T34 DT1361
	ON
		DT1365.C3125 < DT1361.C408
	)
WHERE
	(
		(
			(
				DT1361.C408 = DT1361.C406
			)
			OR
			(
				DT1361.C403 = DT1361.C403
			)
		)
		OR
		(
			(
				DT1361.C410 = DT1361.C410
			)
			AND
			(
				DT1361.C405 > DT1361.C410
			)
		)
	)
	AND
	(
		DT1361.C405 = DT1361.C405
	)
GROUP BY
	DT1361.C406
	, DT1361.C407
	, DT1361.C408
	, DT1361.C402
ORDER BY
	DT1361.C408
	, COUNT( DT1361.C402 )
	, MAX( DT1361.C406 )
	, DT1361.C406
	, AVG( DT1361.C408 )
	, DT1361.C402
	, DT1361.C407
LIMIT 652;


SELECT
	DT1366.C799
FROM
	(
		T66 DT1366
	INNER JOIN
		T69 DT1367
	ON
		DT1366.C802 = DT1367.C834
	)
WHERE
	(
		(
			DT1367.C833 > DT1366.C805
		)
		OR
		(
			DT1366.C801 = DT1367.C831
		)
	)
	OR
	(
		(
			(
				(
					DT1367.C826 = DT1367.C829
				)
				AND
				(
					DT1367.C838 = DT1367.C838
				)
			)
			OR
			(
				DT1367.C826 > DT1367.C825
			)
		)
		OR
		(
			(
				DT1367.C828 = DT1367.C833
			)
			OR
			(
				DT1367.C836 = DT1366.C807
			)
		)
	)
GROUP BY
	DT1366.C806
	, DT1366.C799
ORDER BY
	DT1366.C799
LIMIT 239;


SELECT
	SUM( DT1381.C3161 )
FROM
	(
		(
			(
			SELECT
				MAX( DT1372.C1006 )
				, DT1371.C3137
				, DT1372.C1006
				, DT1372.C1007
				, MIN( DT1372.C1007 )
				, DT1372.C1001
				, DT1372.C1002
			FROM
				(
					(
					SELECT
						DT1370.C990
						, AVG( DT1369.C263 )
						, SUM( DT1369.C268 )
						, DT1369.C264
						, DT1369.C267
					FROM
						(
							(
								T22 DT1369
							INNER JOIN
								T81 DT1370
							ON
								DT1369.C259 > DT1370.C994
							)
						INNER JOIN
							T39 DT1368
						ON
							DT1369.C265 = DT1368.C446
						)
					WHERE
						(
							(
								(
									DT1370.C992 <> DT1369.C266
								)
								AND
								(
									DT1369.C269 = DT1369.C263
								)
							)
							AND
							(
								(
									DT1368.C445 <> DT1370.C993
								)
								OR
								(
									DT1369.C259 = DT1370.C993
								)
							)
						)
						AND
						(
							(
								(
									DT1368.C446 = DT1369.C267
								)
								AND
								(
									DT1368.C446 = DT1369.C268
								)
							)
							AND
							(
								DT1368.C445 > DT1370.C994
							)
						)
					GROUP BY
						DT1370.C990
						, DT1369.C268
						, DT1369.C263
						, DT1369.C264
						, DT1369.C267
					ORDER BY
						DT1370.C990
						, AVG( DT1369.C263 )
						, SUM( DT1369.C268 )
						, DT1369.C264
						, DT1369.C267
					LIMIT 484
					)  DT1371 ( C3133, C3134, C3135, C3136, C3137 ) 
				INNER JOIN
					T83 DT1372
				ON
					DT1371.C3134 = DT1372.C1004
				)
			WHERE
				(
					DT1372.C1006 > DT1372.C1005
				)
				OR
				(
					(
						(
							DT1372.C1005 <> DT1371.C3133
						)
						OR
						(
							DT1371.C3134 = DT1371.C3134
						)
					)
					AND
					(
						(
							DT1372.C1005 < DT1372.C1002
						)
						OR
						(
							DT1372.C1002 = DT1372.C1001
						)
					)
				)
			GROUP BY
				DT1372.C1006
				, DT1372.C1007
				, DT1371.C3137
				, DT1372.C1002
				, DT1372.C1001
			ORDER BY
				MAX( DT1372.C1006 )
				, DT1371.C3137
				, DT1372.C1006
				, DT1372.C1007
				, MIN( DT1372.C1007 )
				, DT1372.C1001
				, DT1372.C1002
			LIMIT 102
			)  DT1373 ( C3140, C3141, C3142, C3143, C3144, C3145, C3146 ) 
		INNER JOIN
			(
			SELECT
				DT1380.C307
				, COUNT( DT1380.C309 )
				, DT1375.C488
				, DT1380.C313
				, DT1380.C309
				, DT1375.C492
				, MIN( DT1375.C492 )
				, MIN( DT1380.C313 )
			FROM
				(
					(
						T26 DT1380
					INNER JOIN
						(
						SELECT
							DT1377.C265
							, DT1377.C260
						FROM
							(
								T22 DT1377
							INNER JOIN
								T80 DT1376
							ON
								DT1377.C268 < DT1376.C986
							)
						WHERE
							(
								(
									(
										DT1377.C264 = DT1377.C260
									)
									AND
									(
										DT1377.C266 = DT1377.C263
									)
								)
								AND
								(
									(
										(
											DT1376.C988 = DT1377.C261
										)
										OR
										(
											DT1377.C263 = DT1376.C989
										)
									)
									AND
									(
										DT1377.C266 > DT1377.C260
									)
								)
							)
							AND
							(
								(
									DT1377.C265 > DT1376.C986
								)
								AND
								(
									DT1376.C988 = DT1377.C267
								)
							)
						GROUP BY
							DT1377.C260
							, DT1377.C265
							, DT1377.C264
							, DT1376.C986
							, DT1377.C269
						ORDER BY
							DT1377.C265
							, DT1377.C260
						LIMIT 632
						)  DT1378 ( C3151, C3152 ) 
					ON
						DT1380.C316 > DT1378.C3152
					)
				INNER JOIN
					(
						T16 DT1379
					INNER JOIN
						T43 DT1375
					ON
						DT1379.C206 < DT1375.C500
					)
				ON
					DT1380.C302 = DT1379.C202
				)
			WHERE
				(
					(
						(
							DT1375.C492 <> DT1380.C299
						)
						AND
						(
							(
								(
									DT1380.C311 > DT1380.C311
								)
								AND
								(
									DT1375.C497 = DT1375.C500
								)
							)
							AND
							(
								(
									DT1378.C3152 = DT1375.C490
								)
								OR
								(
									DT1380.C318 <> DT1375.C491
								)
							)
						)
					)
					AND
					(
						(
							DT1375.C489 = DT1380.C316
						)
						OR
						(
							DT1380.C311 > DT1375.C496
						)
					)
				)
				OR
				(
					DT1378.C3152 <> DT1379.C203
				)
			GROUP BY
				DT1380.C307
				, DT1380.C313
				, DT1380.C309
				, DT1375.C492
				, DT1375.C488
			ORDER BY
				DT1380.C307
				, COUNT( DT1380.C309 )
				, DT1375.C488
				, DT1380.C313
				, DT1380.C309
				, DT1375.C492
				, MIN( DT1375.C492 )
				, MIN( DT1380.C313 )
			LIMIT 629
			) AS DT1381 ( C3156, C3157, C3158, C3159, C3160, C3161, C3162, C3163 ) 
		ON
			DT1373.C3143 = DT1381.C3158
		)
	INNER JOIN
		T67 DT1374
	ON
		DT1373.C3143 <> DT1374.C809
	)
WHERE
	(
		DT1374.C820 < DT1381.C3162
	)
	OR
	(
		(
			(
				(
					DT1381.C3163 = DT1381.C3162
				)
				AND
				(
					DT1381.C3163 = DT1374.C810
				)
			)
			OR
			(
				(
					DT1374.C812 = DT1381.C3160
				)
				AND
				(
					DT1381.C3159 <> DT1373.C3145
				)
			)
		)
		OR
		(
			DT1381.C3160 <> DT1374.C811
		)
	)
GROUP BY
	DT1381.C3161
	, DT1374.C816
ORDER BY
	SUM( DT1381.C3161 )
LIMIT 850;


SELECT
	DT1382.C336
FROM
	(
		T28 DT1384
	INNER JOIN
		(
			(
				T90 DT1385
			INNER JOIN
				T29 DT1382
			ON
				DT1385.C1085 = DT1382.C338
			)
		INNER JOIN
			T50 DT1383
		ON
			DT1385.C1087 < DT1383.C605
		)
	ON
		DT1384.C329 <> DT1383.C607
	)
WHERE
	(
		(
			(
				DT1383.C600 <> DT1382.C338
			)
			OR
			(
				DT1382.C340 = DT1382.C340
			)
		)
		AND
		(
			DT1383.C602 = DT1382.C340
		)
	)
	AND
	(
		(
			(
				DT1385.C1091 > DT1385.C1087
			)
			OR
			(
				DT1385.C1090 = DT1382.C338
			)
		)
		AND
		(
			DT1382.C337 = DT1382.C334
		)
	)
GROUP BY
	DT1385.C1084
	, DT1385.C1090
	, DT1384.C329
	, DT1382.C336
ORDER BY
	DT1382.C336
LIMIT 968;


SELECT
	DT1393.C3177
FROM
	(
		(
		SELECT
			SUM( DT1387.C729 )
			, MIN( DT1387.C731 )
			, DT1387.C731
			, DT1387.C729
		FROM
			(
				(
					T32 DT1392
				INNER JOIN
					T76 DT1391
				ON
					DT1392.C381 = DT1391.C946
				)
			INNER JOIN
				(
					(
					SELECT
						SUM( DT1388.C218 )
						, DT1388.C218
					FROM
						(
							T29 DT1389
						INNER JOIN
							T17 DT1388
						ON
							DT1389.C337 <> DT1388.C213
						)
					WHERE
						(
							(
								DT1388.C218 < DT1389.C336
							)
							OR
							(
								DT1389.C337 = DT1388.C208
							)
						)
						AND
						(
							(
								DT1389.C338 = DT1388.C211
							)
							AND
							(
								(
									(
										(
											DT1388.C210 < DT1389.C336
										)
										OR
										(
											DT1388.C209 = DT1389.C334
										)
									)
									AND
									(
										DT1388.C213 < DT1388.C216
									)
								)
								OR
								(
									DT1388.C212 = DT1389.C334
								)
							)
						)
					GROUP BY
						DT1388.C218
						, DT1388.C211
					ORDER BY
						SUM( DT1388.C218 )
						, DT1388.C218
					LIMIT 951
					)  DT1390 ( C3171, C3172 ) 
				INNER JOIN
					T61 DT1387
				ON
					DT1390.C3171 = DT1387.C726
				)
			ON
				DT1392.C378 = DT1387.C735
			)
		WHERE
			(
				(
					(
						(
							DT1392.C380 < DT1391.C946
						)
						AND
						(
							DT1387.C734 = DT1392.C374
						)
					)
					AND
					(
						(
							(
								DT1392.C370 = DT1392.C373
							)
							AND
							(
								DT1387.C734 = DT1391.C941
							)
						)
						AND
						(
							DT1392.C381 = DT1392.C375
						)
					)
				)
				AND
				(
					DT1392.C366 = DT1392.C382
				)
			)
			AND
			(
				DT1387.C731 <> DT1392.C374
			)
		GROUP BY
			DT1387.C729
			, DT1387.C731
		ORDER BY
			SUM( DT1387.C729 )
			, MIN( DT1387.C731 )
			, DT1387.C731
			, DT1387.C729
		LIMIT 103
		)  DT1393 ( C3175, C3176, C3177, C3178 ) 
	INNER JOIN
		T19 DT1386
	ON
		DT1393.C3177 = DT1386.C232
	)
WHERE
	(
		DT1393.C3177 = DT1386.C231
	)
	OR
	(
		(
			(
				(
					DT1393.C3177 <> DT1386.C230
				)
				AND
				(
					DT1386.C230 < DT1393.C3175
				)
			)
			AND
			(
				DT1393.C3177 < DT1393.C3176
			)
		)
		AND
		(
			DT1393.C3177 = DT1386.C232
		)
	)
GROUP BY
	DT1386.C231
	, DT1386.C232
	, DT1386.C230
	, DT1393.C3177
ORDER BY
	DT1393.C3177
LIMIT 313;


SELECT
	DT1397.C3183
	, DT1394.C625
	, DT1394.C633
	, MAX( DT1394.C625 )
	, AVG( DT1394.C633 )
FROM
	(
		T62 DT1398
	INNER JOIN
		(
			(
			SELECT
				DT1395.C450
			FROM
				(
					T90 DT1396
				LEFT OUTER JOIN
					T40 DT1395
				ON
					DT1396.C1086 = DT1395.C447
				)
			WHERE
				(
					(
						DT1396.C1086 = DT1396.C1086
					)
					OR
					(
						(
							(
								DT1396.C1090 < DT1396.C1088
							)
							OR
							(
								DT1396.C1082 <> DT1396.C1090
							)
						)
						OR
						(
							DT1396.C1081 <> DT1396.C1082
						)
					)
				)
				OR
				(
					(
						(
							DT1396.C1090 > DT1396.C1092
						)
						OR
						(
							DT1395.C449 = DT1396.C1092
						)
					)
					OR
					(
						(
							DT1396.C1081 <> DT1395.C447
						)
						OR
						(
							DT1396.C1086 = DT1396.C1079
						)
					)
				)
			ORDER BY
				DT1395.C450
			LIMIT 947
			) AS DT1397 ( C3183 ) 
		INNER JOIN
			T52 DT1394
		ON
			DT1397.C3183 = DT1394.C635
		)
	ON
		DT1398.C742 = DT1394.C629
	)
WHERE
	(
		DT1394.C631 > DT1394.C630
	)
	AND
	(
		(
			(
				DT1394.C633 = DT1398.C740
			)
			AND
			(
				DT1398.C742 <> DT1394.C634
			)
		)
		AND
		(
			(
				DT1398.C742 = DT1394.C627
			)
			OR
			(
				(
					(
						DT1394.C628 = DT1394.C634
					)
					AND
					(
						DT1394.C635 = DT1394.C633
					)
				)
				AND
				(
					(
						DT1394.C634 <> DT1394.C633
					)
					OR
					(
						DT1394.C630 <> DT1394.C626
					)
				)
			)
		)
	)
GROUP BY
	DT1394.C633
	, DT1397.C3183
	, DT1394.C625
ORDER BY
	DT1397.C3183
	, DT1394.C625
	, DT1394.C633
	, MAX( DT1394.C625 )
	, AVG( DT1394.C633 )
LIMIT 102;


SELECT
	MIN( DT1402.C105 )
	, DT1402.C105
	, DT1402.C103
	, MAX( DT1402.C106 )
	, DT1402.C106
FROM
	(
		(
			T7 DT1402
		RIGHT OUTER JOIN
			T59 DT1404
		ON
			DT1402.C97 < DT1404.C714
		)
	INNER JOIN
		(
			(
			SELECT
				MAX( DT1400.C367 )
				, DT1400.C368
				, DT1400.C365
				, DT1399.C243
				, DT1400.C367
				, DT1400.C371
			FROM
				(
					T32 DT1400
				INNER JOIN
					T20 DT1399
				ON
					DT1400.C375 > DT1399.C236
				)
			WHERE
				(
					DT1400.C381 = DT1399.C244
				)
				AND
				(
					(
						DT1400.C374 < DT1399.C240
					)
					AND
					(
						(
							DT1400.C372 = DT1400.C365
						)
						AND
						(
							(
								DT1400.C364 = DT1399.C237
							)
							AND
							(
								(
									DT1399.C235 = DT1399.C234
								)
								AND
								(
									(
										DT1400.C370 = DT1399.C239
									)
									AND
									(
										DT1400.C366 = DT1400.C382
									)
								)
							)
						)
					)
				)
			GROUP BY
				DT1400.C365
				, DT1399.C243
				, DT1400.C367
				, DT1400.C368
				, DT1400.C371
			ORDER BY
				MAX( DT1400.C367 )
				, DT1400.C368
				, DT1400.C365
				, DT1399.C243
				, DT1400.C367
				, DT1400.C371
			LIMIT 985
			)  DT1401 ( C3187, C3188, C3189, C3190, C3191, C3192 ) 
		INNER JOIN
			T88 DT1403
		ON
			DT1401.C3190 > DT1403.C1073
		)
	ON
		DT1402.C95 = DT1403.C1072
	)
WHERE
	(
		(
			(
				(
					DT1401.C3187 > DT1402.C92
				)
				OR
				(
					(
						DT1402.C95 < DT1404.C716
					)
					AND
					(
						DT1402.C100 <> DT1403.C1068
					)
				)
			)
			OR
			(
				DT1402.C104 = DT1403.C1068
			)
		)
		OR
		(
			(
				DT1402.C90 > DT1402.C93
			)
			AND
			(
				(
					DT1402.C99 = DT1404.C714
				)
				AND
				(
					DT1402.C97 = DT1403.C1070
				)
			)
		)
	)
	OR
	(
		DT1402.C93 <> DT1403.C1066
	)
GROUP BY
	DT1401.C3192
	, DT1402.C105
	, DT1402.C103
	, DT1402.C106
ORDER BY
	MIN( DT1402.C105 )
	, DT1402.C105
	, DT1402.C103
	, MAX( DT1402.C106 )
	, DT1402.C106
LIMIT 870;


SELECT
	DT1405.C915
	, DT1405.C918
	, DT1405.C926
	, DT1405.C928
	, DT1414.C219
	, DT1413.C242
	, DT1405.C913
	, DT1405.C927
	, DT1414.C223
	, DT1412.C3205
	, DT1405.C922
	, DT1405.C924
	, DT1414.C229
	, DT1413.C244
	, DT1405.C923
	, DT1405.C917
	, DT1413.C240
	, DT1414.C227
	, DT1405.C912
	, DT1405.C925
	, DT1405.C910
	, DT1405.C916
	, DT1413.C234
	, DT1413.C245
	, DT1412.C3206
	, DT1413.C237
	, DT1414.C228
	, DT1414.C220
	, DT1405.C921
	, DT1413.C241
FROM
	(
		(
		SELECT
			DT1409.C107
			, MIN( DT1411.C543 )
		FROM
			(
				(
					T3 DT1410
				INNER JOIN
					(
						T46 DT1411
					INNER JOIN
						T7 DT1409
					ON
						DT1411.C528 = DT1409.C98
					)
				ON
					DT1410.C34 > DT1411.C543
				)
			INNER JOIN
				(
				SELECT
					AVG( DT1406.C262 )
					, SUM( DT1407.C1006 )
					, AVG( DT1406.C260 )
					, DT1406.C260
					, DT1406.C262
					, DT1407.C1006
				FROM
					(
						T22 DT1406
					INNER JOIN
						T83 DT1407
					ON
						DT1406.C261 > DT1407.C1006
					)
				WHERE
					(
						(
							DT1407.C1002 = DT1407.C1005
						)
						AND
						(
							(
								(
									DT1406.C265 = DT1406.C264
								)
								AND
								(
									DT1406.C264 < DT1406.C260
								)
							)
							AND
							(
								DT1406.C264 = DT1406.C264
							)
						)
					)
					AND
					(
						(
							(
								DT1407.C1003 > DT1406.C261
							)
							AND
							(
								(
									DT1406.C268 = DT1406.C268
								)
								AND
								(
									DT1406.C259 = DT1406.C264
								)
							)
						)
						OR
						(
							DT1406.C261 = DT1406.C260
						)
					)
				GROUP BY
					DT1407.C1001
					, DT1407.C1006
					, DT1406.C260
					, DT1406.C262
				ORDER BY
					AVG( DT1406.C262 )
					, SUM( DT1407.C1006 )
					, AVG( DT1406.C260 )
					, DT1406.C260
					, DT1406.C262
					, DT1407.C1006
				LIMIT 423
				) AS DT1408 ( C3198, C3199, C3200, C3201, C3202, C3203 ) 
			ON
				DT1409.C97 = DT1408.C3199
			)
		WHERE
			(
				(
					(
						DT1409.C103 <> DT1409.C97
					)
					OR
					(
						DT1410.C38 <> DT1409.C91
					)
				)
				OR
				(
					(
						DT1411.C533 < DT1411.C543
					)
					AND
					(
						DT1409.C95 > DT1410.C45
					)
				)
			)
			AND
			(
				(
					DT1409.C97 < DT1409.C90
				)
				OR
				(
					DT1410.C46 = DT1409.C104
				)
			)
		GROUP BY
			DT1409.C107
			, DT1411.C543
		ORDER BY
			DT1409.C107
			, MIN( DT1411.C543 )
		LIMIT 642
		)  DT1412 ( C3205, C3206 ) 
	INNER JOIN
		(
			(
				T20 DT1413
			INNER JOIN
				T74 DT1405
			ON
				DT1413.C233 = DT1405.C928
			)
		INNER JOIN
			T18 DT1414
		ON
			DT1413.C234 > DT1414.C223
		)
	ON
		DT1412.C3206 > DT1405.C919
	)
WHERE
	(
		(
			DT1405.C915 = DT1413.C242
		)
		OR
		(
			(
				(
					DT1405.C927 <> DT1405.C929
				)
				AND
				(
					DT1405.C928 > DT1405.C917
				)
			)
			AND
			(
				DT1405.C923 = DT1405.C926
			)
		)
	)
	AND
	(
		(
			(
				DT1412.C3206 = DT1414.C226
			)
			OR
			(
				DT1413.C242 > DT1405.C921
			)
		)
		OR
		(
			(
				DT1405.C918 = DT1413.C246
			)
			AND
			(
				DT1414.C223 = DT1413.C236
			)
		)
	)
ORDER BY
	DT1405.C915
	, DT1405.C918
	, DT1405.C926
	, DT1405.C928
	, DT1414.C219
	, DT1413.C242
	, DT1405.C913
	, DT1405.C927
	, DT1414.C223
	, DT1412.C3205
	, DT1405.C922
	, DT1405.C924
	, DT1414.C229
	, DT1413.C244
	, DT1405.C923
	, DT1405.C917
	, DT1413.C240
	, DT1414.C227
	, DT1405.C912
	, DT1405.C925
	, DT1405.C910
	, DT1405.C916
	, DT1413.C234
	, DT1413.C245
	, DT1412.C3206
	, DT1413.C237
	, DT1414.C228
	, DT1414.C220
	, DT1405.C921
	, DT1413.C241
LIMIT 865;


SELECT
	DT1422.C335
FROM
	(
		(
		SELECT
			COUNT( DT1419.C716 )
			, DT1420.C417
			, DT1419.C716
			, MAX( DT1420.C417 )
			, DT1420.C418
			, DT1419.C713
		FROM
			(
				T35 DT1420
			INNER JOIN
				(
					(
					SELECT
						MAX( DT1415.C301 )
					FROM
						(
							(
								T26 DT1415
							INNER JOIN
								T23 DT1416
							ON
								DT1415.C308 = DT1416.C274
							)
						INNER JOIN
							T50 DT1417
						ON
							DT1416.C273 = DT1417.C600
						)
					WHERE
						(
							(
								(
									DT1415.C305 = DT1415.C300
								)
								AND
								(
									DT1415.C299 = DT1416.C277
								)
							)
							AND
							(
								(
									(
										DT1415.C318 < DT1416.C270
									)
									AND
									(
										DT1415.C313 > DT1416.C275
									)
								)
								OR
								(
									DT1416.C277 < DT1415.C309
								)
							)
						)
						AND
						(
							(
								(
									DT1415.C316 = DT1415.C311
								)
								OR
								(
									DT1415.C297 = DT1415.C305
								)
							)
							OR
							(
								DT1415.C300 > DT1415.C312
							)
						)
					GROUP BY
						DT1415.C311
						, DT1415.C301
						, DT1416.C271
					ORDER BY
						MAX( DT1415.C301 )
					LIMIT 297
					) AS DT1418 ( C3210 ) 
				INNER JOIN
					T59 DT1419
				ON
					DT1418.C3210 <> DT1419.C715
				)
			ON
				DT1420.C412 < DT1418.C3210
			)
		WHERE
			(
				(
					DT1419.C715 <> DT1419.C716
				)
				AND
				(
					(
						DT1419.C716 = DT1420.C418
					)
					AND
					(
						DT1420.C417 = DT1420.C418
					)
				)
			)
			AND
			(
				(
					(
						DT1419.C714 > DT1420.C412
					)
					AND
					(
						(
							DT1419.C713 > DT1420.C414
						)
						OR
						(
							DT1420.C413 <> DT1420.C417
						)
					)
				)
				OR
				(
					DT1419.C714 = DT1419.C715
				)
			)
		GROUP BY
			DT1419.C716
			, DT1420.C418
			, DT1420.C417
			, DT1419.C713
		ORDER BY
			COUNT( DT1419.C716 )
			, DT1420.C417
			, DT1419.C716
			, MAX( DT1420.C417 )
			, DT1420.C418
			, DT1419.C713
		LIMIT 935
		) AS DT1421 ( C3213, C3214, C3215, C3216, C3217, C3218 ) 
	INNER JOIN
		T29 DT1422
	ON
		DT1421.C3218 = DT1422.C336
	)
WHERE
	(
		(
			(
				DT1422.C339 <> DT1421.C3216
			)
			AND
			(
				DT1422.C340 > DT1422.C334
			)
		)
		OR
		(
			(
				(
					(
						(
							DT1421.C3213 <> DT1421.C3216
						)
						AND
						(
							DT1421.C3216 > DT1422.C335
						)
					)
					AND
					(
						DT1422.C336 <> DT1421.C3217
					)
				)
				AND
				(
					DT1422.C338 = DT1421.C3216
				)
			)
			AND
			(
				DT1422.C336 = DT1422.C337
			)
		)
	)
	OR
	(
		DT1422.C340 < DT1422.C338
	)
GROUP BY
	DT1421.C3215
	, DT1422.C335
ORDER BY
	DT1422.C335
LIMIT 618;


SELECT
	DT1423.C56
FROM
	(
		T88 DT1425
	INNER JOIN
		(
			T4 DT1423
		INNER JOIN
			(
				T39 DT1426
			INNER JOIN
				T80 DT1424
			ON
				DT1426.C446 < DT1424.C986
			)
		ON
			DT1423.C60 = DT1424.C987
		)
	ON
		DT1425.C1065 = DT1423.C61
	)
WHERE
	(
		DT1425.C1066 = DT1425.C1075
	)
	AND
	(
		(
			(
				DT1425.C1075 = DT1425.C1066
			)
			AND
			(
				DT1423.C65 = DT1423.C61
			)
		)
		OR
		(
			(
				DT1424.C987 > DT1424.C988
			)
			OR
			(
				(
					(
						DT1425.C1065 > DT1425.C1070
					)
					OR
					(
						DT1423.C63 = DT1426.C445
					)
				)
				OR
				(
					DT1423.C63 = DT1425.C1066
				)
			)
		)
	)
GROUP BY
	DT1423.C60
	, DT1423.C63
	, DT1425.C1073
	, DT1423.C56
ORDER BY
	DT1423.C56
LIMIT 374;


SELECT
	SUM( DT1430.C173 )
	, DT1430.C164
	, DT1430.C173
	, AVG( DT1430.C164 )
FROM
	(
		T13 DT1430
	INNER JOIN
		(
			(
				(
				SELECT
					MIN( DT1427.C201 )
					, DT1428.C1199
					, COUNT( DT1427.C203 )
					, DT1427.C200
					, DT1427.C203
					, SUM( DT1427.C200 )
				FROM
					(
						T97 DT1428
					INNER JOIN
						T16 DT1427
					ON
						DT1428.C1196 > DT1427.C203
					)
				WHERE
					(
						(
							DT1427.C205 = DT1427.C206
						)
						OR
						(
							DT1428.C1194 = DT1428.C1195
						)
					)
					AND
					(
						(
							(
								DT1428.C1194 = DT1427.C204
							)
							OR
							(
								(
									DT1428.C1190 <> DT1428.C1197
								)
								AND
								(
									(
										DT1427.C202 > DT1428.C1200
									)
									AND
									(
										DT1428.C1191 < DT1428.C1191
									)
								)
							)
						)
						AND
						(
							DT1428.C1193 = DT1427.C201
						)
					)
				GROUP BY
					DT1427.C201
					, DT1428.C1199
					, DT1427.C202
					, DT1427.C200
					, DT1427.C203
				ORDER BY
					MIN( DT1427.C201 )
					, DT1428.C1199
					, COUNT( DT1427.C203 )
					, DT1427.C200
					, DT1427.C203
					, SUM( DT1427.C200 )
				LIMIT 139
				)  DT1429 ( C3224, C3225, C3226, C3227, C3228, C3229 ) 
			INNER JOIN
				T5 DT1431
			ON
				DT1429.C3226 < DT1431.C73
			)
		LEFT OUTER JOIN
			T55 DT1432
		ON
			DT1431.C68 < DT1432.C662
		)
	ON
		DT1430.C172 < DT1432.C658
	)
WHERE
	(
		DT1429.C3229 = DT1432.C658
	)
	AND
	(
		(
			(
				DT1430.C171 > DT1430.C179
			)
			OR
			(
				(
					DT1430.C179 = DT1430.C165
				)
				AND
				(
					DT1429.C3225 < DT1432.C660
				)
			)
		)
		AND
		(
			(
				DT1430.C166 < DT1432.C662
			)
			AND
			(
				DT1429.C3224 = DT1430.C167
			)
		)
	)
GROUP BY
	DT1430.C164
	, DT1430.C173
ORDER BY
	SUM( DT1430.C173 )
	, DT1430.C164
	, DT1430.C173
	, AVG( DT1430.C164 )
LIMIT 675;


SELECT
	DT1437.C356
	, DT1433.C1022
FROM
	(
		(
			(
				T84 DT1433
			INNER JOIN
				(
				SELECT
					SUM( DT1435.C328 )
					, DT1434.C252
					, DT1434.C248
					, SUM( DT1434.C252 )
				FROM
					(
						T21 DT1434
					INNER JOIN
						T28 DT1435
					ON
						DT1434.C247 = DT1435.C332
					)
				WHERE
					(
						DT1434.C251 = DT1435.C329
					)
					OR
					(
						(
							(
								DT1434.C249 = DT1434.C256
							)
							OR
							(
								(
									DT1435.C330 <> DT1435.C333
								)
								OR
								(
									DT1434.C254 = DT1434.C247
								)
							)
						)
						AND
						(
							(
								DT1434.C248 = DT1435.C328
							)
							AND
							(
								DT1435.C333 <> DT1434.C247
							)
						)
					)
				GROUP BY
					DT1434.C248
					, DT1435.C328
					, DT1434.C252
				ORDER BY
					SUM( DT1435.C328 )
					, DT1434.C252
					, DT1434.C248
					, SUM( DT1434.C252 )
				LIMIT 147
				) AS DT1436 ( C3234, C3235, C3236, C3237 ) 
			ON
				DT1433.C1012 <> DT1436.C3236
			)
		INNER JOIN
			T41 DT1438
		ON
			DT1433.C1024 > DT1438.C464
		)
	INNER JOIN
		T31 DT1437
	ON
		DT1433.C1015 = DT1437.C363
	)
WHERE
	(
		(
			(
				(
					(
						DT1433.C1016 > DT1438.C469
					)
					AND
					(
						DT1437.C358 = DT1438.C461
					)
				)
				AND
				(
					(
						DT1438.C457 < DT1433.C1017
					)
					OR
					(
						DT1437.C361 > DT1433.C1026
					)
				)
			)
			AND
			(
				DT1438.C464 < DT1438.C454
			)
		)
		OR
		(
			(
				DT1438.C452 = DT1433.C1025
			)
			AND
			(
				DT1433.C1028 <> DT1436.C3237
			)
		)
	)
	AND
	(
		DT1433.C1008 = DT1438.C472
	)
GROUP BY
	DT1437.C356
	, DT1433.C1022
ORDER BY
	DT1437.C356
	, DT1433.C1022
LIMIT 745;


SELECT
	SUM( DT1442.C162 )
	, DT1441.C19
FROM
	(
		(
			T2 DT1441
		LEFT OUTER JOIN
			T12 DT1442
		ON
			DT1441.C23 <> DT1442.C158
		)
	INNER JOIN
		(
			T51 DT1439
		INNER JOIN
			T27 DT1440
		ON
			DT1439.C616 > DT1440.C323
		)
	ON
		DT1441.C21 <> DT1439.C624
	)
WHERE
	(
		(
			DT1440.C327 = DT1440.C323
		)
		OR
		(
			DT1440.C319 < DT1439.C612
		)
	)
	AND
	(
		(
			(
				(
					(
						DT1439.C616 = DT1439.C612
					)
					AND
					(
						DT1441.C28 = DT1439.C620
					)
				)
				OR
				(
					DT1440.C320 > DT1440.C326
				)
			)
			AND
			(
				DT1439.C617 <> DT1439.C624
			)
		)
		AND
		(
			DT1440.C321 <> DT1441.C27
		)
	)
GROUP BY
	DT1442.C162
	, DT1441.C19
ORDER BY
	SUM( DT1442.C162 )
	, DT1441.C19
LIMIT 952;


SELECT
	DT1444.C107
	, SUM( DT1444.C102 )
	, DT1444.C102
	, DT1443.C401
	, SUM( DT1444.C109 )
	, MIN( DT1444.C107 )
	, SUM( DT1443.C401 )
	, DT1444.C109
FROM
	(
		T7 DT1444
	INNER JOIN
		T33 DT1443
	ON
		DT1444.C108 = DT1443.C391
	)
WHERE
	(
		(
			(
				(
					DT1444.C96 = DT1444.C95
				)
				OR
				(
					DT1443.C399 = DT1443.C389
				)
			)
			OR
			(
				DT1444.C90 = DT1443.C400
			)
		)
		OR
		(
			DT1443.C391 <> DT1444.C109
		)
	)
	OR
	(
		(
			(
				DT1444.C94 = DT1444.C93
			)
			OR
			(
				DT1444.C99 > DT1443.C389
			)
		)
		AND
		(
			(
				DT1443.C383 <> DT1444.C98
			)
			OR
			(
				DT1444.C98 = DT1443.C396
			)
		)
	)
GROUP BY
	DT1444.C102
	, DT1444.C109
	, DT1444.C107
	, DT1443.C401
ORDER BY
	DT1444.C107
	, SUM( DT1444.C102 )
	, DT1444.C102
	, DT1443.C401
	, SUM( DT1444.C109 )
	, MIN( DT1444.C107 )
	, SUM( DT1443.C401 )
	, DT1444.C109
LIMIT 395;


SELECT
	COUNT( DT1446.C872 )
FROM
	(
		T89 DT1445
	INNER JOIN
		T72 DT1446
	ON
		DT1445.C1076 = DT1446.C874
	)
WHERE
	(
		DT1446.C870 < DT1446.C879
	)
	OR
	(
		(
			(
				(
					DT1446.C868 = DT1446.C879
				)
				OR
				(
					(
						DT1446.C876 <> DT1446.C872
					)
					OR
					(
						DT1446.C868 = DT1446.C869
					)
				)
			)
			OR
			(
				DT1446.C885 <> DT1446.C875
			)
		)
		AND
		(
			DT1446.C874 > DT1446.C879
		)
	)
GROUP BY
	DT1446.C887
	, DT1446.C872
	, DT1446.C876
	, DT1446.C879
	, DT1446.C882
ORDER BY
	COUNT( DT1446.C872 )
LIMIT 431;


SELECT
	DT1449.C86
FROM
	(
		(
			T6 DT1449
		INNER JOIN
			T4 DT1447
		ON
			DT1449.C80 < DT1447.C64
		)
	INNER JOIN
		T88 DT1448
	ON
		DT1447.C53 > DT1448.C1071
	)
WHERE
	(
		DT1447.C53 <> DT1447.C63
	)
	AND
	(
		(
			DT1448.C1068 <> DT1447.C58
		)
		OR
		(
			(
				(
					DT1449.C88 > DT1447.C65
				)
				AND
				(
					DT1449.C87 < DT1449.C81
				)
			)
			AND
			(
				DT1447.C63 = DT1447.C64
			)
		)
	)
GROUP BY
	DT1449.C86
	, DT1449.C85
ORDER BY
	DT1449.C86
LIMIT 647;


SELECT
	SUM( DT1458.C3260 )
	, DT1467.C3274
	, DT1458.C3260
FROM
	(
		(
			(
				T27 DT1450
			INNER JOIN
				(
				SELECT
					COUNT( DT1460.C322 )
					, DT1462.C214
					, SUM( DT1462.C214 )
				FROM
					(
						T17 DT1462
					INNER JOIN
						(
							(
								T27 DT1459
							INNER JOIN
								T39 DT1461
							ON
								DT1459.C320 > DT1461.C445
							)
						INNER JOIN
							T27 DT1460
						ON
							DT1461.C446 < DT1460.C327
						)
					ON
						DT1462.C207 < DT1459.C327
					)
				WHERE
					(
						(
							(
								DT1462.C211 <> DT1462.C212
							)
							OR
							(
								DT1460.C327 > DT1461.C444
							)
						)
						AND
						(
							(
								DT1459.C326 = DT1460.C321
							)
							AND
							(
								DT1460.C326 = DT1460.C319
							)
						)
					)
					OR
					(
						(
							DT1462.C213 < DT1460.C320
						)
						OR
						(
							(
								(
									DT1462.C214 > DT1460.C325
								)
								AND
								(
									DT1462.C207 <> DT1460.C319
								)
							)
							AND
							(
								DT1462.C218 = DT1462.C218
							)
						)
					)
				GROUP BY
					DT1460.C322
					, DT1462.C214
				ORDER BY
					COUNT( DT1460.C322 )
					, DT1462.C214
					, SUM( DT1462.C214 )
				LIMIT 953
				) AS DT1463 ( C3263, C3264, C3265 ) 
			ON
				DT1450.C321 <> DT1463.C3264
			)
		INNER JOIN
			(
			SELECT
				COUNT( DT1464.C280 )
				, MIN( DT1464.C282 )
				, DT1465.C837
				, COUNT( DT1466.C267 )
				, DT1466.C267
				, DT1464.C282
				, MAX( DT1465.C837 )
				, DT1464.C280
			FROM
				(
					T69 DT1465
				INNER JOIN
					(
						T22 DT1466
					INNER JOIN
						T24 DT1464
					ON
						DT1466.C266 < DT1464.C280
					)
				ON
					DT1465.C834 <> DT1466.C261
				)
			WHERE
				(
					DT1465.C833 > DT1466.C269
				)
				OR
				(
					(
						(
							(
								DT1465.C825 = DT1465.C832
							)
							AND
							(
								DT1465.C833 > DT1466.C264
							)
						)
						AND
						(
							(
								(
									DT1465.C824 = DT1466.C266
								)
								OR
								(
									DT1464.C281 = DT1466.C264
								)
							)
							OR
							(
								DT1464.C282 <> DT1464.C282
							)
						)
					)
					AND
					(
						(
							DT1465.C838 = DT1465.C824
						)
						AND
						(
							DT1464.C281 <> DT1466.C264
						)
					)
				)
			GROUP BY
				DT1465.C837
				, DT1464.C280
				, DT1464.C282
				, DT1466.C267
			ORDER BY
				COUNT( DT1464.C280 )
				, MIN( DT1464.C282 )
				, DT1465.C837
				, COUNT( DT1466.C267 )
				, DT1466.C267
				, DT1464.C282
				, MAX( DT1465.C837 )
				, DT1464.C280
			LIMIT 153
			) AS DT1467 ( C3270, C3271, C3272, C3273, C3274, C3275, C3276, C3277 ) 
		ON
			DT1450.C326 < DT1467.C3275
		)
	INNER JOIN
		(
		SELECT
			AVG( DT1452.C630 )
		FROM
			(
				(
					(
					SELECT
						DT1453.C586
						, DT1453.C595
						, DT1453.C594
						, SUM( DT1453.C594 )
						, DT1454.C438
						, MIN( DT1454.C438 )
						, DT1455.C182
					FROM
						(
							T49 DT1453
						INNER JOIN
							(
								(
									T14 DT1455
								INNER JOIN
									T37 DT1454
								ON
									DT1455.C182 = DT1454.C439
								)
							INNER JOIN
								T98 DT1456
							ON
								DT1455.C182 = DT1456.C1202
							)
						ON
							DT1453.C599 = DT1456.C1201
						)
					WHERE
						(
							(
								DT1453.C590 = DT1453.C590
							)
							OR
							(
								DT1453.C587 <> DT1455.C185
							)
						)
						AND
						(
							(
								(
									DT1453.C596 = DT1455.C180
								)
								AND
								(
									DT1456.C1203 > DT1456.C1203
								)
							)
							AND
							(
								(
									DT1453.C586 = DT1454.C440
								)
								OR
								(
									DT1453.C592 <> DT1453.C591
								)
							)
						)
					GROUP BY
						DT1453.C586
						, DT1454.C438
						, DT1455.C182
						, DT1453.C594
						, DT1453.C595
					ORDER BY
						DT1453.C586
						, DT1453.C595
						, DT1453.C594
						, SUM( DT1453.C594 )
						, DT1454.C438
						, MIN( DT1454.C438 )
						, DT1455.C182
					LIMIT 877
					) AS DT1457 ( C3252, C3253, C3254, C3255, C3256, C3257, C3258 ) 
				INNER JOIN
					T64 DT1451
				ON
					DT1457.C3252 = DT1451.C781
				)
			LEFT OUTER JOIN
				T52 DT1452
			ON
				DT1451.C768 <> DT1452.C629
			)
		WHERE
			(
				DT1451.C775 <> DT1452.C635
			)
			AND
			(
				(
					(
						(
							DT1451.C782 > DT1452.C627
						)
						AND
						(
							DT1457.C3257 <> DT1451.C771
						)
					)
					AND
					(
						(
							(
								DT1451.C775 <> DT1457.C3253
							)
							OR
							(
								DT1451.C775 < DT1451.C770
							)
						)
						AND
						(
							DT1457.C3254 = DT1452.C629
						)
					)
				)
				OR
				(
					(
						DT1451.C772 <> DT1451.C776
					)
					AND
					(
						DT1457.C3252 < DT1457.C3253
					)
				)
			)
		GROUP BY
			DT1452.C630
			, DT1451.C764
			, DT1457.C3253
			, DT1451.C767
		ORDER BY
			AVG( DT1452.C630 )
		LIMIT 569
		)  DT1458 ( C3260 ) 
	ON
		DT1467.C3274 <> DT1458.C3260
	)
WHERE
	(
		(
			DT1450.C322 < DT1467.C3277
		)
		AND
		(
			DT1450.C324 = DT1450.C319
		)
	)
	OR
	(
		(
			DT1463.C3265 = DT1467.C3270
		)
		AND
		(
			(
				DT1450.C326 = DT1467.C3270
			)
			OR
			(
				(
					(
						(
							DT1450.C324 < DT1467.C3273
						)
						OR
						(
							DT1450.C324 = DT1463.C3265
						)
					)
					AND
					(
						DT1458.C3260 = DT1463.C3265
					)
				)
				AND
				(
					DT1467.C3276 > DT1450.C320
				)
			)
		)
	)
GROUP BY
	DT1467.C3274
	, DT1458.C3260
ORDER BY
	SUM( DT1458.C3260 )
	, DT1467.C3274
	, DT1458.C3260
LIMIT 872;


SELECT
	DT1468.C554
	, DT1468.C564
	, DT1468.C549
	, DT1468.C559
	, DT1468.C556
	, DT1468.C548
	, DT1468.C566
	, DT1472.C3282
	, DT1468.C562
	, DT1468.C563
	, DT1468.C552
	, DT1468.C561
	, DT1472.C3280
	, DT1468.C558
FROM
	(
		T47 DT1468
	INNER JOIN
		(
		SELECT
			DT1471.C408
			, AVG( DT1469.C321 )
			, DT1470.C654
		FROM
			(
				T27 DT1469
			INNER JOIN
				(
					T34 DT1471
				INNER JOIN
					T54 DT1470
				ON
					DT1471.C406 > DT1470.C655
				)
			ON
				DT1469.C324 > DT1471.C407
			)
		WHERE
			(
				(
					(
						DT1469.C319 = DT1469.C324
					)
					AND
					(
						DT1471.C408 = DT1471.C402
					)
				)
				OR
				(
					(
						DT1471.C404 > DT1469.C326
					)
					OR
					(
						DT1471.C405 = DT1469.C320
					)
				)
			)
			AND
			(
				DT1469.C320 = DT1469.C325
			)
		GROUP BY
			DT1471.C408
			, DT1470.C654
			, DT1469.C321
		ORDER BY
			DT1471.C408
			, AVG( DT1469.C321 )
			, DT1470.C654
		LIMIT 853
		)  DT1472 ( C3280, C3281, C3282 ) 
	ON
		DT1468.C559 = DT1472.C3282
	)
WHERE
	(
		(
			DT1468.C563 = DT1468.C554
		)
		OR
		(
			(
				DT1472.C3282 = DT1468.C555
			)
			AND
			(
				DT1468.C563 = DT1468.C563
			)
		)
	)
	OR
	(
		(
			(
				(
					DT1468.C552 = DT1468.C563
				)
				OR
				(
					DT1468.C553 = DT1468.C555
				)
			)
			AND
			(
				DT1468.C560 > DT1468.C563
			)
		)
		AND
		(
			DT1468.C551 = DT1468.C564
		)
	)
ORDER BY
	DT1468.C554
	, DT1468.C564
	, DT1468.C549
	, DT1468.C559
	, DT1468.C556
	, DT1468.C548
	, DT1468.C566
	, DT1472.C3282
	, DT1468.C562
	, DT1468.C563
	, DT1468.C552
	, DT1468.C561
	, DT1472.C3280
	, DT1468.C558
LIMIT 272;


SELECT
	MIN( DT1475.C1067 )
	, DT1475.C1067
	, DT1473.C1078
	, DT1474.C150
	, MIN( DT1473.C1078 )
	, COUNT( DT1475.C1070 )
FROM
	(
		(
			T89 DT1473
		INNER JOIN
			T88 DT1475
		ON
			DT1473.C1076 = DT1475.C1073
		)
	INNER JOIN
		T10 DT1474
	ON
		DT1475.C1073 <> DT1474.C143
	)
WHERE
	(
		(
			(
				(
					(
						DT1474.C149 = DT1475.C1067
					)
					OR
					(
						(
							DT1474.C150 > DT1474.C143
						)
						AND
						(
							DT1475.C1068 < DT1475.C1075
						)
					)
				)
				OR
				(
					DT1475.C1066 = DT1474.C143
				)
			)
			AND
			(
				DT1474.C151 = DT1474.C142
			)
		)
		OR
		(
			DT1474.C151 > DT1474.C144
		)
	)
	OR
	(
		(
			DT1474.C141 = DT1474.C144
		)
		AND
		(
			DT1474.C142 = DT1474.C140
		)
	)
GROUP BY
	DT1474.C147
	, DT1475.C1067
	, DT1473.C1078
	, DT1475.C1070
	, DT1474.C150
ORDER BY
	MIN( DT1475.C1067 )
	, DT1475.C1067
	, DT1473.C1078
	, DT1474.C150
	, MIN( DT1473.C1078 )
	, COUNT( DT1475.C1070 )
LIMIT 972;


SELECT
	COUNT( DT1477.C559 )
	, DT1477.C563
	, DT1477.C559
	, DT1477.C557
	, SUM( DT1477.C557 )
FROM
	(
		(
		SELECT
			MIN( DT1483.C3298 )
			, MAX( DT1480.C3290 )
		FROM
			(
				(
				SELECT
					DT1482.C705
					, AVG( DT1481.C919 )
					, DT1481.C919
					, DT1482.C699
					, AVG( DT1482.C699 )
				FROM
					(
						T58 DT1482
					INNER JOIN
						T74 DT1481
					ON
						DT1482.C708 = DT1481.C913
					)
				WHERE
					(
						(
							(
								DT1481.C926 = DT1481.C921
							)
							AND
							(
								DT1482.C707 < DT1481.C921
							)
						)
						AND
						(
							DT1481.C928 = DT1481.C918
						)
					)
					AND
					(
						(
							DT1482.C699 = DT1481.C922
						)
						AND
						(
							(
								DT1481.C919 < DT1481.C928
							)
							AND
							(
								DT1482.C707 < DT1482.C707
							)
						)
					)
				GROUP BY
					DT1482.C705
					, DT1482.C709
					, DT1482.C699
					, DT1481.C919
				ORDER BY
					DT1482.C705
					, AVG( DT1481.C919 )
					, DT1481.C919
					, DT1482.C699
					, AVG( DT1482.C699 )
				LIMIT 214
				) AS DT1483 ( C3295, C3296, C3297, C3298, C3299 ) 
			INNER JOIN
				(
				SELECT
					DT1479.C66
				FROM
					(
						T34 DT1478
					INNER JOIN
						T5 DT1479
					ON
						DT1478.C407 = DT1479.C67
					)
				WHERE
					(
						(
							DT1478.C408 <> DT1478.C410
						)
						AND
						(
							DT1478.C408 = DT1478.C408
						)
					)
					AND
					(
						(
							(
								(
									DT1479.C71 = DT1478.C404
								)
								AND
								(
									DT1479.C74 < DT1478.C407
								)
							)
							AND
							(
								DT1479.C69 = DT1478.C409
							)
						)
						OR
						(
							DT1478.C403 <> DT1478.C403
						)
					)
				GROUP BY
					DT1479.C69
					, DT1479.C71
					, DT1478.C402
					, DT1478.C407
					, DT1479.C66
				ORDER BY
					DT1479.C66
				LIMIT 800
				) AS DT1480 ( C3290 ) 
			ON
				DT1483.C3295 = DT1480.C3290
			)
		WHERE
			(
				(
					(
						DT1483.C3296 < DT1480.C3290
					)
					AND
					(
						DT1483.C3295 = DT1483.C3297
					)
				)
				OR
				(
					DT1483.C3298 > DT1483.C3298
				)
			)
			AND
			(
				(
					DT1483.C3296 <> DT1483.C3295
				)
				OR
				(
					(
						DT1483.C3298 <> DT1483.C3298
					)
					AND
					(
						DT1483.C3299 = DT1483.C3299
					)
				)
			)
		GROUP BY
			DT1483.C3297
			, DT1480.C3290
			, DT1483.C3299
			, DT1483.C3295
			, DT1483.C3298
		ORDER BY
			MIN( DT1483.C3298 )
			, MAX( DT1480.C3290 )
		LIMIT 525
		)  DT1484 ( C3304, C3305 ) 
	INNER JOIN
		(
			T47 DT1477
		INNER JOIN
			T80 DT1476
		ON
			DT1477.C554 = DT1476.C988
		)
	ON
		DT1484.C3305 = DT1477.C556
	)
WHERE
	(
		(
			(
				DT1484.C3304 > DT1477.C560
			)
			AND
			(
				DT1477.C559 <> DT1476.C987
			)
		)
		AND
		(
			(
				(
					DT1477.C561 = DT1477.C564
				)
				OR
				(
					DT1477.C561 < DT1477.C566
				)
			)
			AND
			(
				(
					DT1477.C554 < DT1477.C563
				)
				OR
				(
					DT1477.C562 = DT1477.C550
				)
			)
		)
	)
	AND
	(
		(
			DT1477.C552 = DT1477.C560
		)
		AND
		(
			DT1476.C988 <> DT1476.C987
		)
	)
GROUP BY
	DT1477.C563
	, DT1477.C557
	, DT1477.C559
ORDER BY
	COUNT( DT1477.C559 )
	, DT1477.C563
	, DT1477.C559
	, DT1477.C557
	, SUM( DT1477.C557 )
LIMIT 198;


SELECT
	DT1491.C320
	, AVG( DT1491.C323 )
	, COUNT( DT1500.C3326 )
	, AVG( DT1500.C3325 )
FROM
	(
		(
			T83 DT1485
		INNER JOIN
			(
			SELECT
				DT1486.C1204
				, DT1487.C805
				, DT1486.C1208
			FROM
				(
					(
						T66 DT1487
					INNER JOIN
						T95 DT1489
					ON
						DT1487.C805 < DT1489.C1170
					)
				INNER JOIN
					(
						T19 DT1488
					INNER JOIN
						T99 DT1486
					ON
						DT1488.C231 = DT1486.C1208
					)
				ON
					DT1487.C808 < DT1488.C230
				)
			WHERE
				(
					DT1487.C801 = DT1486.C1204
				)
				OR
				(
					(
						(
							DT1489.C1174 = DT1486.C1208
						)
						AND
						(
							DT1488.C230 = DT1486.C1204
						)
					)
					AND
					(
						(
							DT1487.C805 < DT1489.C1172
						)
						AND
						(
							(
								DT1487.C799 < DT1486.C1204
							)
							AND
							(
								DT1487.C807 = DT1489.C1175
							)
						)
					)
				)
			GROUP BY
				DT1487.C805
				, DT1487.C807
				, DT1486.C1208
				, DT1486.C1204
			ORDER BY
				DT1486.C1204
				, DT1487.C805
				, DT1486.C1208
			LIMIT 406
			) AS DT1490 ( C3312, C3313, C3314 ) 
		ON
			DT1485.C1001 < DT1490.C3314
		)
	INNER JOIN
		(
			(
			SELECT
				MAX( DT1494.C320 )
				, DT1493.C821
				, COUNT( DT1494.C327 )
				, DT1494.C323
				, MIN( DT1493.C822 )
				, AVG( DT1494.C323 )
			FROM
				(
					(
					SELECT
						AVG( DT1498.C643 )
						, SUM( DT1495.C887 )
					FROM
						(
							(
								T53 DT1498
							INNER JOIN
								(
									T72 DT1495
								INNER JOIN
									T24 DT1496
								ON
									DT1495.C880 = DT1496.C282
								)
							ON
								DT1498.C642 <> DT1495.C879
							)
						INNER JOIN
							T65 DT1497
						ON
							DT1498.C648 = DT1497.C790
						)
					WHERE
						(
							(
								(
									DT1498.C640 = DT1497.C788
								)
								AND
								(
									(
										DT1498.C652 > DT1497.C791
									)
									OR
									(
										DT1495.C880 = DT1496.C281
									)
								)
							)
							OR
							(
								DT1498.C649 = DT1497.C794
							)
						)
						OR
						(
							(
								(
									DT1495.C870 = DT1497.C797
								)
								OR
								(
									DT1497.C795 <> DT1497.C785
								)
							)
							AND
							(
								DT1497.C791 = DT1495.C874
							)
						)
					GROUP BY
						DT1498.C648
						, DT1498.C643
						, DT1497.C795
						, DT1495.C887
					ORDER BY
						AVG( DT1498.C643 )
						, SUM( DT1495.C887 )
					LIMIT 311
					) AS DT1499 ( C3319, C3320 ) 
				INNER JOIN
					(
						(
							T27 DT1494
						INNER JOIN
							T68 DT1493
						ON
							DT1494.C320 < DT1493.C823
						)
					INNER JOIN
						T81 DT1492
					ON
						DT1494.C321 <> DT1492.C992
					)
				ON
					DT1499.C3319 > DT1492.C993
				)
			WHERE
				(
					(
						DT1494.C327 = DT1494.C323
					)
					AND
					(
						DT1493.C821 = DT1494.C327
					)
				)
				AND
				(
					(
						(
							DT1492.C991 <> DT1494.C320
						)
						AND
						(
							(
								DT1494.C325 <> DT1492.C993
							)
							OR
							(
								DT1493.C823 < DT1492.C992
							)
						)
					)
					AND
					(
						DT1494.C321 = DT1494.C323
					)
				)
			GROUP BY
				DT1494.C327
				, DT1493.C822
				, DT1493.C821
				, DT1494.C323
				, DT1494.C320
			ORDER BY
				MAX( DT1494.C320 )
				, DT1493.C821
				, COUNT( DT1494.C327 )
				, DT1494.C323
				, MIN( DT1493.C822 )
				, AVG( DT1494.C323 )
			LIMIT 960
			)  DT1500 ( C3325, C3326, C3327, C3328, C3329, C3330 ) 
		INNER JOIN
			T27 DT1491
		ON
			DT1500.C3329 = DT1491.C324
		)
	ON
		DT1490.C3313 <> DT1491.C327
	)
WHERE
	(
		(
			DT1500.C3325 < DT1490.C3314
		)
		AND
		(
			(
				(
					DT1500.C3326 > DT1491.C326
				)
				AND
				(
					DT1490.C3313 = DT1500.C3328
				)
			)
			AND
			(
				DT1491.C326 = DT1490.C3312
			)
		)
	)
	AND
	(
		(
			DT1485.C1007 = DT1485.C1007
		)
		OR
		(
			(
				DT1491.C322 > DT1491.C327
			)
			OR
			(
				DT1500.C3325 = DT1500.C3325
			)
		)
	)
GROUP BY
	DT1500.C3325
	, DT1500.C3326
	, DT1491.C320
	, DT1500.C3328
	, DT1491.C323
ORDER BY
	DT1491.C320
	, AVG( DT1491.C323 )
	, COUNT( DT1500.C3326 )
	, AVG( DT1500.C3325 )
LIMIT 223;


SELECT
	DT1502.C579
	, DT1501.C1137
	, DT1510.C442
	, DT1502.C582
	, DT1501.C1139
FROM
	(
		(
			(
			SELECT
				DT1507.C970
				, MIN( DT1507.C976 )
				, DT1507.C966
				, DT1507.C976
				, MIN( DT1507.C966 )
				, AVG( DT1507.C970 )
			FROM
				(
					T8 DT1508
				INNER JOIN
					(
						(
						SELECT
							MAX( DT1503.C163 )
							, AVG( DT1505.C1049 )
							, MIN( DT1505.C1052 )
							, DT1503.C163
						FROM
							(
								(
									T12 DT1503
								INNER JOIN
									T60 DT1504
								ON
									DT1503.C162 > DT1504.C719
								)
							INNER JOIN
								T86 DT1505
							ON
								DT1504.C722 = DT1505.C1053
							)
						WHERE
							(
								(
									(
										DT1505.C1048 = DT1504.C722
									)
									AND
									(
										DT1503.C160 = DT1504.C717
									)
								)
								AND
								(
									(
										DT1503.C162 <> DT1503.C162
									)
									OR
									(
										DT1504.C722 <> DT1505.C1047
									)
								)
							)
							AND
							(
								(
									DT1505.C1051 = DT1505.C1051
								)
								OR
								(
									DT1504.C724 < DT1503.C157
								)
							)
						GROUP BY
							DT1503.C160
							, DT1505.C1052
							, DT1503.C163
							, DT1505.C1049
						ORDER BY
							MAX( DT1503.C163 )
							, AVG( DT1505.C1049 )
							, MIN( DT1505.C1052 )
							, DT1503.C163
						LIMIT 690
						)  DT1506 ( C3339, C3340, C3341, C3342 ) 
					LEFT OUTER JOIN
						T78 DT1507
					ON
						DT1506.C3341 > DT1507.C970
					)
				ON
					DT1508.C118 > DT1507.C966
				)
			WHERE
				(
					(
						(
							DT1507.C974 = DT1507.C968
						)
						AND
						(
							DT1507.C978 <> DT1507.C978
						)
					)
					AND
					(
						DT1507.C968 > DT1506.C3342
					)
				)
				OR
				(
					(
						DT1507.C977 = DT1508.C124
					)
					AND
					(
						DT1507.C967 < DT1508.C112
					)
				)
			GROUP BY
				DT1507.C970
				, DT1507.C976
				, DT1507.C966
			ORDER BY
				DT1507.C970
				, MIN( DT1507.C976 )
				, DT1507.C966
				, DT1507.C976
				, MIN( DT1507.C966 )
				, AVG( DT1507.C970 )
			LIMIT 426
			)  DT1509 ( C3346, C3347, C3348, C3349, C3350, C3351 ) 
		LEFT OUTER JOIN
			T93 DT1501
		ON
			DT1509.C3350 = DT1501.C1136
		)
	INNER JOIN
		(
			T38 DT1510
		INNER JOIN
			T48 DT1502
		ON
			DT1510.C443 = DT1502.C574
		)
	ON
		DT1501.C1141 = DT1502.C578
	)
WHERE
	(
		DT1502.C583 <> DT1502.C576
	)
	AND
	(
		(
			DT1502.C576 < DT1502.C576
		)
		AND
		(
			(
				(
					DT1509.C3346 < DT1502.C583
				)
				OR
				(
					DT1502.C583 <> DT1502.C570
				)
			)
			AND
			(
				DT1501.C1136 = DT1502.C577
			)
		)
	)
GROUP BY
	DT1501.C1139
	, DT1502.C579
	, DT1510.C442
	, DT1501.C1137
	, DT1502.C582
ORDER BY
	DT1502.C579
	, DT1501.C1137
	, DT1510.C442
	, DT1502.C582
	, DT1501.C1139
LIMIT 315;


SELECT
	COUNT( DT1518.C497 )
	, DT1516.C727
	, DT1518.C497
FROM
	(
		(
			T99 DT1517
		RIGHT OUTER JOIN
			T61 DT1516
		ON
			DT1517.C1208 <> DT1516.C734
		)
	INNER JOIN
		(
			T43 DT1518
		INNER JOIN
			(
			SELECT
				SUM( DT1513.C244 )
				, DT1513.C244
				, DT1514.C888
				, DT1512.C546
			FROM
				(
					(
						(
							T72 DT1514
						INNER JOIN
							T46 DT1512
						ON
							DT1514.C888 > DT1512.C533
						)
					INNER JOIN
						T20 DT1513
					ON
						DT1512.C529 <> DT1513.C234
					)
				RIGHT OUTER JOIN
					T17 DT1511
				ON
					DT1513.C236 = DT1511.C209
				)
			WHERE
				(
					DT1514.C885 <> DT1511.C208
				)
				OR
				(
					(
						(
							(
								DT1514.C875 <> DT1512.C530
							)
							OR
							(
								(
									DT1512.C547 = DT1512.C532
								)
								OR
								(
									DT1511.C218 = DT1512.C541
								)
							)
						)
						AND
						(
							DT1514.C871 <> DT1514.C871
						)
					)
					OR
					(
						DT1514.C868 > DT1512.C533
					)
				)
			GROUP BY
				DT1514.C888
				, DT1513.C244
				, DT1512.C543
				, DT1512.C546
			ORDER BY
				SUM( DT1513.C244 )
				, DT1513.C244
				, DT1514.C888
				, DT1512.C546
			LIMIT 592
			)  DT1515 ( C3354, C3355, C3356, C3357 ) 
		ON
			DT1518.C488 = DT1515.C3356
		)
	ON
		DT1517.C1208 = DT1518.C497
	)
WHERE
	(
		DT1518.C493 = DT1518.C489
	)
	AND
	(
		(
			(
				DT1515.C3355 > DT1517.C1205
			)
			OR
			(
				(
					DT1518.C493 = DT1516.C739
				)
				AND
				(
					DT1518.C487 = DT1518.C499
				)
			)
		)
		AND
		(
			(
				(
					DT1516.C735 <> DT1518.C490
				)
				AND
				(
					DT1518.C501 = DT1518.C493
				)
			)
			AND
			(
				(
					DT1518.C492 > DT1518.C487
				)
				OR
				(
					DT1516.C731 > DT1518.C491
				)
			)
		)
	)
GROUP BY
	DT1516.C727
	, DT1518.C497
ORDER BY
	COUNT( DT1518.C497 )
	, DT1516.C727
	, DT1518.C497
LIMIT 133;


SELECT
	COUNT( DT1525.C855 )
	, DT1525.C844
	, DT1525.C855
	, DT1525.C854
	, AVG( DT1525.C854 )
	, DT1525.C851
FROM
	(
		(
		SELECT
			AVG( DT1527.C1071 )
			, DT1527.C1071
			, DT1526.C524
			, DT1527.C1067
		FROM
			(
				(
					(
						T62 DT1532
					LEFT OUTER JOIN
						(
						SELECT
							SUM( DT1529.C573 )
							, DT1529.C582
							, DT1529.C573
						FROM
							(
								(
									T48 DT1529
								INNER JOIN
									T29 DT1528
								ON
									DT1529.C569 < DT1528.C339
								)
							INNER JOIN
								T14 DT1530
							ON
								DT1529.C585 < DT1530.C183
							)
						WHERE
							(
								(
									DT1529.C584 <> DT1529.C570
								)
								OR
								(
									DT1528.C335 = DT1529.C582
								)
							)
							OR
							(
								(
									(
										DT1529.C568 > DT1529.C568
									)
									AND
									(
										(
											(
												DT1529.C585 < DT1528.C337
											)
											OR
											(
												DT1529.C573 > DT1529.C571
											)
										)
										OR
										(
											(
												DT1529.C574 <> DT1529.C568
											)
											OR
											(
												DT1528.C338 = DT1529.C585
											)
										)
									)
								)
								AND
								(
									DT1529.C572 = DT1529.C571
								)
							)
						GROUP BY
							DT1529.C573
							, DT1529.C582
						ORDER BY
							SUM( DT1529.C573 )
							, DT1529.C582
							, DT1529.C573
						LIMIT 814
						) AS DT1531 ( C3363, C3364, C3365 ) 
					ON
						DT1532.C742 <> DT1531.C3364
					)
				INNER JOIN
					T88 DT1527
				ON
					DT1532.C741 <> DT1527.C1070
				)
			INNER JOIN
				T45 DT1526
			ON
				DT1531.C3364 = DT1526.C513
			)
		WHERE
			(
				(
					(
						DT1526.C523 <> DT1527.C1065
					)
					AND
					(
						DT1527.C1073 = DT1526.C515
					)
				)
				OR
				(
					(
						DT1526.C514 <> DT1526.C517
					)
					AND
					(
						(
							DT1526.C520 = DT1526.C521
						)
						OR
						(
							DT1526.C523 > DT1526.C517
						)
					)
				)
			)
			AND
			(
				DT1526.C522 = DT1526.C526
			)
		GROUP BY
			DT1527.C1067
			, DT1526.C524
			, DT1527.C1071
		ORDER BY
			AVG( DT1527.C1071 )
			, DT1527.C1071
			, DT1526.C524
			, DT1527.C1067
		LIMIT 755
		)  DT1533 ( C3367, C3368, C3369, C3370 ) 
	INNER JOIN
		(
			(
				T70 DT1525
			INNER JOIN
				(
				SELECT
					DT1523.C1075
					, AVG( DT1522.C749 )
				FROM
					(
						(
							T63 DT1522
						INNER JOIN
							T88 DT1523
						ON
							DT1522.C756 = DT1523.C1067
						)
					INNER JOIN
						(
							T52 DT1521
						INNER JOIN
							T99 DT1520
						ON
							DT1521.C632 < DT1520.C1204
						)
					ON
						DT1522.C754 < DT1521.C635
					)
				WHERE
					(
						(
							DT1520.C1208 < DT1522.C759
						)
						AND
						(
							DT1522.C753 < DT1522.C756
						)
					)
					OR
					(
						(
							DT1523.C1068 = DT1522.C743
						)
						AND
						(
							(
								(
									DT1521.C625 <> DT1522.C749
								)
								AND
								(
									DT1522.C756 > DT1522.C755
								)
							)
							AND
							(
								DT1522.C761 < DT1521.C634
							)
						)
					)
				GROUP BY
					DT1523.C1075
					, DT1522.C749
				ORDER BY
					DT1523.C1075
					, AVG( DT1522.C749 )
				LIMIT 315
				)  DT1524 ( C3360, C3361 ) 
			ON
				DT1525.C847 < DT1524.C3361
			)
		INNER JOIN
			T54 DT1519
		ON
			DT1525.C859 = DT1519.C657
		)
	ON
		DT1533.C3369 = DT1525.C841
	)
WHERE
	(
		(
			(
				(
					DT1525.C846 = DT1519.C655
				)
				AND
				(
					DT1525.C857 <> DT1519.C657
				)
			)
			AND
			(
				(
					DT1525.C841 <> DT1525.C840
				)
				AND
				(
					DT1525.C845 > DT1525.C857
				)
			)
		)
		OR
		(
			(
				DT1519.C654 <> DT1525.C844
			)
			AND
			(
				DT1519.C657 = DT1525.C850
			)
		)
	)
	OR
	(
		(
			DT1525.C859 < DT1525.C852
		)
		OR
		(
			DT1525.C850 = DT1524.C3361
		)
	)
GROUP BY
	DT1525.C851
	, DT1525.C844
	, DT1525.C854
	, DT1525.C855
ORDER BY
	COUNT( DT1525.C855 )
	, DT1525.C844
	, DT1525.C855
	, DT1525.C854
	, AVG( DT1525.C854 )
	, DT1525.C851
LIMIT 198;


SELECT
	DT1534.C350
	, DT1534.C357
	, COUNT( DT1534.C350 )
	, to_char(AVG( DT1534.C344 ),'9999999.9999999')
	, COUNT( DT1534.C357 )
FROM
	(
		(
			(
			SELECT
				DT1540.C866
				, DT1540.C864
				, MAX( DT1540.C864 )
			FROM
				(
					T71 DT1540
				INNER JOIN
					(
						(
							(
							SELECT
								DT1543.C990
								, DT1542.C639
								, DT1542.C646
								, DT1542.C650
							FROM
								(
									(
										T80 DT1545
									INNER JOIN
										(
											T53 DT1542
										INNER JOIN
											T54 DT1544
										ON
											DT1542.C641 = DT1544.C657
										)
									ON
										DT1545.C986 <> DT1542.C651
									)
								INNER JOIN
									T81 DT1543
								ON
									DT1542.C651 = DT1543.C990
								)
							WHERE
								(
									(
										(
											DT1542.C649 = DT1545.C988
										)
										OR
										(
											(
												DT1542.C648 > DT1542.C652
											)
											OR
											(
												DT1542.C647 > DT1542.C651
											)
										)
									)
									OR
									(
										(
											DT1543.C994 < DT1542.C653
										)
										AND
										(
											DT1543.C994 <> DT1542.C636
										)
									)
								)
								OR
								(
									(
										DT1543.C994 > DT1542.C645
									)
									AND
									(
										DT1545.C986 = DT1542.C645
									)
								)
							GROUP BY
								DT1542.C646
								, DT1542.C638
								, DT1542.C650
								, DT1542.C639
								, DT1543.C990
							ORDER BY
								DT1543.C990
								, DT1542.C639
								, DT1542.C646
								, DT1542.C650
							LIMIT 785
							) AS DT1546 ( C3383, C3384, C3385, C3386 ) 
						INNER JOIN
							T26 DT1539
						ON
							DT1546.C3384 = DT1539.C301
						)
					INNER JOIN
						T74 DT1541
					ON
						DT1539.C315 = DT1541.C911
					)
				ON
					DT1540.C861 < DT1541.C911
				)
			WHERE
				(
					(
						(
							(
								DT1541.C923 <> DT1541.C916
							)
							OR
							(
								DT1540.C866 > DT1539.C318
							)
						)
						OR
						(
							DT1541.C911 > DT1539.C302
						)
					)
					OR
					(
						(
							(
								(
									DT1539.C297 <> DT1541.C918
								)
								OR
								(
									DT1541.C913 <> DT1539.C314
								)
							)
							OR
							(
								DT1546.C3383 > DT1541.C928
							)
						)
						AND
						(
							DT1541.C912 > DT1541.C918
						)
					)
				)
				AND
				(
					DT1539.C311 <> DT1539.C299
				)
			GROUP BY
				DT1540.C864
				, DT1540.C866
				, DT1541.C918
				, DT1539.C317
				, DT1540.C863
			ORDER BY
				DT1540.C866
				, DT1540.C864
				, MAX( DT1540.C864 )
			LIMIT 833
			)  DT1547 ( C3391, C3392, C3393 ) 
		INNER JOIN
			T31 DT1534
		ON
			DT1547.C3391 = DT1534.C356
		)
	INNER JOIN
		(
		SELECT
			COUNT( DT1536.C960 )
			, DT1536.C960
			, MIN( DT1536.C959 )
			, DT1536.C951
			, MAX( DT1536.C951 )
		FROM
			(
				(
					T67 DT1535
				INNER JOIN
					T77 DT1536
				ON
					DT1535.C818 = DT1536.C949
				)
			INNER JOIN
				T14 DT1537
			ON
				DT1535.C816 = DT1537.C184
			)
		WHERE
			(
				(
					DT1535.C817 <> DT1536.C956
				)
				OR
				(
					DT1536.C958 = DT1535.C814
				)
			)
			AND
			(
				(
					DT1536.C963 < DT1537.C185
				)
				OR
				(
					(
						DT1535.C812 <> DT1536.C947
					)
					AND
					(
						DT1535.C817 = DT1536.C954
					)
				)
			)
		GROUP BY
			DT1537.C185
			, DT1536.C960
			, DT1536.C959
			, DT1536.C951
		ORDER BY
			COUNT( DT1536.C960 )
			, DT1536.C960
			, MIN( DT1536.C959 )
			, DT1536.C951
			, MAX( DT1536.C951 )
		LIMIT 565
		)  DT1538 ( C3377, C3378, C3379, C3380, C3381 ) 
	ON
		DT1534.C361 = DT1538.C3380
	)
WHERE
	(
		DT1534.C360 > DT1534.C344
	)
	OR
	(
		(
			(
				(
					DT1534.C352 > DT1534.C356
				)
				AND
				(
					(
						DT1534.C362 > DT1534.C357
					)
					AND
					(
						DT1534.C357 = DT1534.C362
					)
				)
			)
			OR
			(
				DT1538.C3381 = DT1534.C356
			)
		)
		OR
		(
			(
				DT1534.C360 < DT1534.C351
			)
			OR
			(
				(
					DT1534.C346 = DT1534.C353
				)
				AND
				(
					DT1534.C351 = DT1534.C347
				)
			)
		)
	)
GROUP BY
	DT1534.C357
	, DT1534.C344
	, DT1534.C350
ORDER BY
	DT1534.C350
	, DT1534.C357
	, COUNT( DT1534.C350 )
	, AVG( DT1534.C344 )
	, COUNT( DT1534.C357 )
LIMIT 952;


SELECT
	MAX( DT1552.C626 )
	, DT1552.C626
FROM
	(
		T11 DT1554
	LEFT OUTER JOIN
		(
			T52 DT1552
		INNER JOIN
			(
				(
				SELECT
					DT1548.C655
					, MIN( DT1548.C654 )
					, DT1550.C473
					, DT1549.C67
					, DT1548.C654
					, AVG( DT1549.C67 )
					, DT1549.C69
				FROM
					(
						(
							T42 DT1550
						INNER JOIN
							T54 DT1548
						ON
							DT1550.C480 = DT1548.C656
						)
					INNER JOIN
						T5 DT1549
					ON
						DT1550.C483 > DT1549.C73
					)
				WHERE
					(
						(
							DT1548.C654 > DT1550.C475
						)
						OR
						(
							DT1549.C69 = DT1549.C73
						)
					)
					AND
					(
						(
							(
								DT1550.C485 <> DT1549.C70
							)
							OR
							(
								(
									DT1550.C480 > DT1550.C480
								)
								AND
								(
									(
										(
											DT1548.C657 < DT1548.C656
										)
										AND
										(
											DT1550.C481 = DT1549.C72
										)
									)
									AND
									(
										DT1549.C66 = DT1548.C656
									)
								)
							)
						)
						AND
						(
							DT1550.C474 <> DT1550.C485
						)
					)
				GROUP BY
					DT1548.C655
					, DT1549.C67
					, DT1549.C69
					, DT1550.C473
					, DT1548.C654
				ORDER BY
					DT1548.C655
					, MIN( DT1548.C654 )
					, DT1550.C473
					, DT1549.C67
					, DT1548.C654
					, AVG( DT1549.C67 )
					, DT1549.C69
				LIMIT 441
				)  DT1551 ( C3399, C3400, C3401, C3402, C3403, C3404, C3405 ) 
			INNER JOIN
				T71 DT1553
			ON
				DT1551.C3401 = DT1553.C863
			)
		ON
			DT1552.C630 = DT1553.C866
		)
	ON
		DT1554.C153 > DT1552.C630
	)
WHERE
	(
		(
			DT1554.C152 = DT1553.C865
		)
		AND
		(
			(
				(
					DT1552.C626 = DT1554.C153
				)
				OR
				(
					DT1553.C863 = DT1551.C3400
				)
			)
			OR
			(
				DT1554.C152 > DT1553.C863
			)
		)
	)
	AND
	(
		(
			DT1552.C628 = DT1551.C3405
		)
		OR
		(
			DT1553.C862 < DT1554.C154
		)
	)
GROUP BY
	DT1552.C626
	, DT1551.C3405
ORDER BY
	MAX( DT1552.C626 )
	, DT1552.C626
LIMIT 302;


SELECT
	DT1556.C446
	, DT1557.C934
FROM
	(
		(
			T14 DT1555
		INNER JOIN
			T75 DT1557
		ON
			DT1555.C181 <> DT1557.C936
		)
	RIGHT OUTER JOIN
		T39 DT1556
	ON
		DT1555.C182 = DT1556.C445
	)
WHERE
	(
		(
			(
				DT1556.C444 <> DT1555.C185
			)
			OR
			(
				DT1557.C935 = DT1557.C930
			)
		)
		OR
		(
			DT1555.C184 = DT1557.C935
		)
	)
	OR
	(
		(
			(
				DT1555.C184 < DT1557.C933
			)
			OR
			(
				DT1557.C933 = DT1555.C180
			)
		)
		OR
		(
			DT1555.C181 > DT1555.C180
		)
	)
GROUP BY
	DT1557.C931
	, DT1557.C934
	, DT1556.C446
ORDER BY
	DT1556.C446
	, DT1557.C934
LIMIT 696;


SELECT
	DT1564.C3414
	, DT1559.C285
FROM
	(
		(
			T29 DT1560
		INNER JOIN
			(
			SELECT
				MIN( DT1563.C804 )
				, COUNT( DT1562.C384 )
				, DT1562.C384
				, MAX( DT1562.C393 )
				, DT1562.C393
			FROM
				(
					(
						T99 DT1561
					RIGHT OUTER JOIN
						T33 DT1562
					ON
						DT1561.C1205 = DT1562.C386
					)
				INNER JOIN
					T66 DT1563
				ON
					DT1562.C385 < DT1563.C800
				)
			WHERE
				(
					(
						(
							DT1562.C401 <> DT1562.C387
						)
						OR
						(
							DT1562.C393 > DT1563.C807
						)
					)
					OR
					(
						(
							DT1562.C396 = DT1562.C383
						)
						OR
						(
							DT1563.C805 = DT1563.C800
						)
					)
				)
				OR
				(
					(
						(
							DT1563.C808 = DT1562.C391
						)
						OR
						(
							DT1563.C798 > DT1561.C1206
						)
					)
					AND
					(
						DT1562.C385 < DT1561.C1205
					)
				)
			GROUP BY
				DT1562.C393
				, DT1563.C804
				, DT1562.C384
				, DT1562.C395
			ORDER BY
				MIN( DT1563.C804 )
				, COUNT( DT1562.C384 )
				, DT1562.C384
				, MAX( DT1562.C393 )
				, DT1562.C393
			LIMIT 209
			)  DT1564 ( C3413, C3414, C3415, C3416, C3417 ) 
		ON
			DT1560.C338 <> DT1564.C3417
		)
	INNER JOIN
		(
			T25 DT1559
		INNER JOIN
			T87 DT1558
		ON
			DT1559.C290 < DT1558.C1060
		)
	ON
		DT1564.C3413 <> DT1559.C293
	)
WHERE
	(
		(
			(
				DT1559.C283 = DT1559.C293
			)
			AND
			(
				DT1558.C1058 < DT1560.C340
			)
		)
		AND
		(
			DT1560.C340 = DT1559.C283
		)
	)
	OR
	(
		(
			(
				DT1564.C3417 = DT1564.C3413
			)
			OR
			(
				DT1559.C285 = DT1558.C1058
			)
		)
		OR
		(
			(
				DT1560.C337 <> DT1558.C1058
			)
			OR
			(
				DT1560.C340 <> DT1560.C339
			)
		)
	)
GROUP BY
	DT1564.C3414
	, DT1559.C285
ORDER BY
	DT1564.C3414
	, DT1559.C285
LIMIT 533;



SELECT
	DT100.C498
	, DT102.C339
	, DT102.C340
	, DT101.C395
	, DT100.C501
	, DT100.C497
	, DT100.C496
	, DT101.C384
	, DT100.C490
	, DT100.C495
	, DT102.C338
	, DT101.C401
	, DT100.C494
	, DT100.C500
	, DT100.C487
	, DT100.C492
	, DT101.C394
	, DT101.C386
	, DT101.C396
	, DT102.C337
	, DT101.C388
	, DT101.C392
FROM
	(
		(
			T43 DT100
		INNER JOIN
			T33 DT101
		ON
			DT100.C498 = DT101.C401
		)
	INNER JOIN
		T29 DT102
	ON
		DT101.C385 = DT102.C338
	)
WHERE
	(
		(
			DT101.C390 = DT100.C500
		)
		OR
		(
			(
				DT102.C338 <> DT101.C388
			)
			AND
			(
				DT102.C336 < DT100.C494
			)
		)
	)
	OR
	(
		(
			DT101.C391 < DT101.C399
		)
		AND
		(
			DT102.C335 = DT100.C490
		)
	)
ORDER BY
	DT100.C498
	, DT102.C339
	, DT102.C340
	, DT101.C395
	, DT100.C501
	, DT100.C497
	, DT100.C496
	, DT101.C384
	, DT100.C490
	, DT100.C495
	, DT102.C338
	, DT101.C401
	, DT100.C494
	, DT100.C500
	, DT100.C487
	, DT100.C492
	, DT101.C394
	, DT101.C386
	, DT101.C396
	, DT102.C337
	, DT101.C388
	, DT101.C392
LIMIT 276;


SELECT
	DT104.C639
	, DT104.C638
	, DT103.C792
FROM
	(
		T53 DT104
	INNER JOIN
		T65 DT103
	ON
		DT104.C643 = DT103.C787
	)
WHERE
	(
		(
			DT103.C785 = DT103.C795
		)
		OR
		(
			DT104.C647 = DT104.C644
		)
	)
	OR
	(
		(
			DT104.C645 < DT104.C641
		)
		OR
		(
			DT103.C783 = DT103.C784
		)
	)
ORDER BY
	DT104.C639
	, DT104.C638
	, DT103.C792
LIMIT 361;


SELECT
	DT106.C722
	, DT105.C1147
	, DT106.C720
	, DT105.C1151
	, DT107.C917
	, DT106.C719
	, DT105.C1155
	, DT107.C924
	, DT106.C721
	, DT107.C927
	, DT107.C928
	, DT105.C1164
	, DT105.C1157
	, DT105.C1152
	, DT105.C1158
	, DT105.C1150
	, DT105.C1148
	, DT105.C1154
	, DT107.C926
	, DT107.C929
	, DT107.C911
	, DT108.C865
	, DT105.C1165
	, DT105.C1159
	, DT107.C925
	, DT107.C922
	, DT107.C914
	, DT105.C1145
	, DT105.C1166
	, DT105.C1153
	, DT105.C1156
	, DT105.C1160
	, DT108.C864
	, DT108.C862
	, DT107.C912
	, DT107.C910
	, DT105.C1146
	, DT106.C724
	, DT105.C1161
	, DT107.C913
	, DT107.C919
	, DT105.C1163
	, DT106.C717
	, DT108.C860
	, DT106.C723
	, DT107.C915
	, DT105.C1162
	, DT108.C863
	, DT107.C920
	, DT108.C861
FROM
	(
		T94 DT105
	INNER JOIN
		(
			T60 DT106
		INNER JOIN
			(
				T74 DT107
			INNER JOIN
				T71 DT108
			ON
				DT107.C921 = DT108.C860
			)
		ON
			DT106.C722 = DT107.C917
		)
	ON
		DT105.C1157 <> DT107.C917
	)
WHERE
	(
		(
			DT105.C1156 = DT105.C1150
		)
		OR
		(
			DT107.C920 = DT107.C915
		)
	)
	AND
	(
		(
			DT106.C724 > DT105.C1159
		)
		AND
		(
			DT106.C721 = DT107.C924
		)
	)
ORDER BY
	DT106.C722
	, DT105.C1147
	, DT106.C720
	, DT105.C1151
	, DT107.C917
	, DT106.C719
	, DT105.C1155
	, DT107.C924
	, DT106.C721
	, DT107.C927
	, DT107.C928
	, DT105.C1164
	, DT105.C1157
	, DT105.C1152
	, DT105.C1158
	, DT105.C1150
	, DT105.C1148
	, DT105.C1154
	, DT107.C926
	, DT107.C929
	, DT107.C911
	, DT108.C865
	, DT105.C1165
	, DT105.C1159
	, DT107.C925
	, DT107.C922
	, DT107.C914
	, DT105.C1145
	, DT105.C1166
	, DT105.C1153
	, DT105.C1156
	, DT105.C1160
	, DT108.C864
	, DT108.C862
	, DT107.C912
	, DT107.C910
	, DT105.C1146
	, DT106.C724
	, DT105.C1161
	, DT107.C913
	, DT107.C919
	, DT105.C1163
	, DT106.C717
	, DT108.C860
	, DT106.C723
	, DT107.C915
	, DT105.C1162
	, DT108.C863
	, DT107.C920
	, DT108.C861
LIMIT 304;


SELECT
	DT113.C920
	, DT113.C922
	, DT113.C929
	, DT109.C228
	, DT109.C224
	, DT113.C921
	, DT113.C928
	, DT113.C924
	, DT113.C925
	, DT109.C220
	, DT112.C319
	, DT110.C278
	, DT113.C914
	, DT111.C126
	, DT113.C919
	, DT113.C911
	, DT109.C223
	, DT111.C130
FROM
	(
		T18 DT109
	INNER JOIN
		(
			(
				T27 DT112
			INNER JOIN
				T74 DT113
			ON
				DT112.C321 <> DT113.C917
			)
		INNER JOIN
			(
				T23 DT110
			INNER JOIN
				T9 DT111
			ON
				DT110.C273 = DT111.C133
			)
		ON
			DT112.C327 <> DT111.C133
		)
	ON
		DT109.C220 < DT113.C924
	)
WHERE
	(
		(
			(
				DT110.C273 = DT113.C917
			)
			AND
			(
				DT111.C133 < DT110.C273
			)
		)
		AND
		(
			DT112.C323 = DT112.C320
		)
	)
	OR
	(
		DT110.C276 = DT111.C133
	)
ORDER BY
	DT113.C920
	, DT113.C922
	, DT113.C929
	, DT109.C228
	, DT109.C224
	, DT113.C921
	, DT113.C928
	, DT113.C924
	, DT113.C925
	, DT109.C220
	, DT112.C319
	, DT110.C278
	, DT113.C914
	, DT111.C126
	, DT113.C919
	, DT113.C911
	, DT109.C223
	, DT111.C130
LIMIT 611;


SELECT
	DT117.C313
	, DT116.C148
	, DT116.C144
	, DT118.C715
	, DT116.C151
	, DT116.C149
	, DT115.C219
	, DT117.C300
	, DT115.C222
	, DT118.C713
	, DT116.C141
	, DT117.C312
	, DT115.C229
FROM
	(
		(
			T26 DT117
		INNER JOIN
			T6 DT114
		ON
			DT117.C315 = DT114.C88
		)
	INNER JOIN
		(
			T18 DT115
		INNER JOIN
			(
				T59 DT118
			INNER JOIN
				T10 DT116
			ON
				DT118.C713 < DT116.C148
			)
		ON
			DT115.C220 = DT118.C714
		)
	ON
		DT114.C78 = DT115.C222
	)
WHERE
	(
		DT114.C79 < DT116.C141
	)
	OR
	(
		(
			(
				DT117.C311 > DT116.C147
			)
			AND
			(
				DT115.C222 = DT115.C229
			)
		)
		AND
		(
			(
				DT118.C713 = DT116.C144
			)
			OR
			(
				DT117.C306 = DT114.C80
			)
		)
	)
ORDER BY
	DT117.C313
	, DT116.C148
	, DT116.C144
	, DT118.C715
	, DT116.C151
	, DT116.C149
	, DT115.C219
	, DT117.C300
	, DT115.C222
	, DT118.C713
	, DT116.C141
	, DT117.C312
	, DT115.C229
LIMIT 295;


SELECT
	DT120.C629
	, DT119.C241
	, DT119.C246
	, DT119.C242
	, DT120.C626
	, DT119.C239
	, DT119.C237
	, DT120.C632
	, DT120.C633
	, DT119.C244
	, DT120.C635
	, DT119.C234
	, DT119.C245
	, DT120.C631
	, DT120.C630
	, DT120.C628
	, DT119.C243
FROM
	(
		T20 DT119
	INNER JOIN
		T52 DT120
	ON
		DT119.C233 = DT120.C631
	)
WHERE
	(
		DT119.C244 = DT120.C627
	)
	OR
	(
		(
			DT119.C246 < DT119.C245
		)
		AND
		(
			DT119.C246 = DT120.C626
		)
	)
ORDER BY
	DT120.C629
	, DT119.C241
	, DT119.C246
	, DT119.C242
	, DT120.C626
	, DT119.C239
	, DT119.C237
	, DT120.C632
	, DT120.C633
	, DT119.C244
	, DT120.C635
	, DT119.C234
	, DT119.C245
	, DT120.C631
	, DT120.C630
	, DT120.C628
	, DT119.C243
LIMIT 118;


SELECT
	DT121.C942
	, DT121.C943
	, DT122.C446
	, DT121.C941
	, DT123.C225
	, DT123.C227
	, DT122.C445
	, DT123.C229
	, DT123.C226
	, DT123.C223
	, DT121.C938
	, DT123.C228
	, DT123.C224
	, DT123.C220
	, DT121.C946
	, DT123.C219
FROM
	(
		T39 DT122
	INNER JOIN
		(
			T76 DT121
		INNER JOIN
			T18 DT123
		ON
			DT121.C939 = DT123.C229
		)
	ON
		DT122.C446 = DT121.C940
	)
WHERE
	(
		(
			DT121.C940 = DT123.C225
		)
		OR
		(
			DT123.C223 < DT121.C946
		)
	)
	AND
	(
		(
			DT122.C445 = DT123.C222
		)
		AND
		(
			DT123.C228 = DT122.C446
		)
	)
ORDER BY
	DT121.C942
	, DT121.C943
	, DT122.C446
	, DT121.C941
	, DT123.C225
	, DT123.C227
	, DT122.C445
	, DT123.C229
	, DT123.C226
	, DT123.C223
	, DT121.C938
	, DT123.C228
	, DT123.C224
	, DT123.C220
	, DT121.C946
	, DT123.C219
LIMIT 493;


SELECT
	DT125.C72
	, DT126.C445
	, DT125.C74
	, DT124.C410
	, DT125.C66
	, DT125.C68
FROM
	(
		T39 DT126
	INNER JOIN
		(
			T34 DT124
		INNER JOIN
			T5 DT125
		ON
			DT124.C402 > DT125.C72
		)
	ON
		DT126.C445 <> DT124.C409
	)
WHERE
	(
		DT125.C72 = DT125.C68
	)
	AND
	(
		DT124.C409 = DT125.C74
	)
ORDER BY
	DT125.C72
	, DT126.C445
	, DT125.C74
	, DT124.C410
	, DT125.C66
	, DT125.C68
LIMIT 493;


SELECT
	DT129.C901
	, DT127.C1031
	, DT128.C1085
	, DT128.C1083
	, DT129.C906
	, DT127.C1036
	, DT129.C904
	, DT127.C1043
	, DT129.C899
	, DT129.C898
	, DT128.C1084
	, DT127.C1042
	, DT127.C1044
	, DT128.C1086
	, DT128.C1092
	, DT127.C1038
	, DT127.C1030
	, DT127.C1029
	, DT129.C897
	, DT128.C1080
	, DT128.C1088
	, DT128.C1079
	, DT128.C1082
	, DT129.C908
	, DT128.C1089
	, DT127.C1045
	, DT128.C1087
	, DT128.C1091
FROM
	(
		(
			T73 DT129
		INNER JOIN
			T90 DT128
		ON
			DT129.C901 <> DT128.C1087
		)
	INNER JOIN
		T85 DT127
	ON
		DT129.C897 > DT127.C1040
	)
WHERE
	(
		(
			DT129.C891 > DT127.C1032
		)
		OR
		(
			DT129.C897 = DT127.C1034
		)
	)
	OR
	(
		(
			DT128.C1079 = DT129.C905
		)
		AND
		(
			DT127.C1042 <> DT129.C906
		)
	)
ORDER BY
	DT129.C901
	, DT127.C1031
	, DT128.C1085
	, DT128.C1083
	, DT129.C906
	, DT127.C1036
	, DT129.C904
	, DT127.C1043
	, DT129.C899
	, DT129.C898
	, DT128.C1084
	, DT127.C1042
	, DT127.C1044
	, DT128.C1086
	, DT128.C1092
	, DT127.C1038
	, DT127.C1030
	, DT127.C1029
	, DT129.C897
	, DT128.C1080
	, DT128.C1088
	, DT128.C1079
	, DT128.C1082
	, DT129.C908
	, DT128.C1089
	, DT127.C1045
	, DT128.C1087
	, DT128.C1091
LIMIT 713;


SELECT
	DT131.C523
	, DT131.C513
	, DT131.C515
	, DT130.C1004
	, DT131.C521
	, DT131.C524
	, DT130.C1003
	, DT131.C517
	, DT131.C527
	, DT130.C1007
	, DT131.C512
	, DT131.C520
	, DT131.C514
	, DT131.C525
FROM
	(
		T45 DT131
	INNER JOIN
		T83 DT130
	ON
		DT131.C522 > DT130.C1005
	)
WHERE
	(
		DT130.C1007 < DT131.C518
	)
	AND
	(
		(
			DT131.C516 < DT131.C520
		)
		AND
		(
			DT131.C515 = DT130.C1003
		)
	)
ORDER BY
	DT131.C523
	, DT131.C513
	, DT131.C515
	, DT130.C1004
	, DT131.C521
	, DT131.C524
	, DT130.C1003
	, DT131.C517
	, DT131.C527
	, DT130.C1007
	, DT131.C512
	, DT131.C520
	, DT131.C514
	, DT131.C525
LIMIT 984;


SELECT
	DT133.C698
	, DT133.C707
	, DT133.C711
	, DT133.C703
	, DT133.C710
	, DT133.C708
	, DT132.C438
	, DT132.C440
	, DT133.C706
	, DT133.C699
FROM
	(
		T37 DT132
	INNER JOIN
		T58 DT133
	ON
		DT132.C440 = DT133.C710
	)
WHERE
	(
		(
			(
				(
					DT133.C705 = DT133.C706
				)
				OR
				(
					DT133.C702 <> DT132.C440
				)
			)
			OR
			(
				DT133.C707 > DT133.C706
			)
		)
		AND
		(
			DT133.C706 > DT133.C709
		)
	)
	AND
	(
		DT133.C698 = DT133.C700
	)
ORDER BY
	DT133.C698
	, DT133.C707
	, DT133.C711
	, DT133.C703
	, DT133.C710
	, DT133.C708
	, DT132.C438
	, DT132.C440
	, DT133.C706
	, DT133.C699
LIMIT 513;


SELECT
	DT135.C100
	, DT135.C91
	, DT136.C414
	, DT135.C106
	, DT134.C799
	, DT137.C840
FROM
	(
		(
			(
				T66 DT134
			INNER JOIN
				T70 DT137
			ON
				DT134.C807 <> DT137.C851
			)
		INNER JOIN
			T7 DT135
		ON
			DT137.C847 = DT135.C94
		)
	INNER JOIN
		T35 DT136
	ON
		DT137.C840 > DT136.C418
	)
WHERE
	(
		(
			DT135.C95 < DT137.C856
		)
		AND
		(
			DT135.C95 < DT137.C842
		)
	)
	AND
	(
		DT134.C807 <> DT136.C413
	)
ORDER BY
	DT135.C100
	, DT135.C91
	, DT136.C414
	, DT135.C106
	, DT134.C799
	, DT137.C840
LIMIT 483;


SELECT
	DT139.C1201
	, DT139.C1202
	, DT138.C993
	, DT138.C992
FROM
	(
		T98 DT139
	INNER JOIN
		T81 DT138
	ON
		DT139.C1202 > DT138.C990
	)
WHERE
	(
		(
			DT138.C993 = DT139.C1201
		)
		OR
		(
			DT139.C1203 = DT139.C1201
		)
	)
	OR
	(
		(
			DT138.C992 = DT138.C991
		)
		AND
		(
			DT139.C1202 = DT138.C991
		)
	)
ORDER BY
	DT139.C1201
	, DT139.C1202
	, DT138.C993
	, DT138.C992
LIMIT 801;


SELECT
	DT142.C90
	, DT141.C394
	, DT142.C104
	, DT140.C445
FROM
	(
		(
			T7 DT142
		INNER JOIN
			T33 DT141
		ON
			DT142.C101 > DT141.C394
		)
	INNER JOIN
		T39 DT140
	ON
		DT142.C100 < DT140.C446
	)
WHERE
	(
		DT142.C89 > DT141.C393
	)
	AND
	(
		(
			DT140.C444 = DT142.C103
		)
		OR
		(
			DT140.C446 <> DT142.C96
		)
	)
ORDER BY
	DT142.C90
	, DT141.C394
	, DT142.C104
	, DT140.C445
LIMIT 679;


SELECT
	DT145.C132
	, DT144.C864
	, DT143.C1004
	, DT145.C136
FROM
	(
		T83 DT143
	INNER JOIN
		(
			T9 DT145
		INNER JOIN
			T71 DT144
		ON
			DT145.C132 < DT144.C862
		)
	ON
		DT143.C1006 > DT144.C866
	)
WHERE
	(
		DT145.C137 = DT143.C1003
	)
	OR
	(
		(
			DT144.C866 = DT143.C1001
		)
		AND
		(
			(
				(
					DT143.C1007 < DT145.C129
				)
				OR
				(
					DT145.C129 = DT145.C130
				)
			)
			AND
			(
				DT143.C1002 = DT145.C129
			)
		)
	)
ORDER BY
	DT145.C132
	, DT144.C864
	, DT143.C1004
	, DT145.C136
LIMIT 387;


SELECT
	DT147.C337
	, DT147.C336
	, DT148.C853
	, DT148.C846
	, DT148.C840
	, DT148.C842
	, DT146.C599
	, DT146.C589
	, DT146.C586
	, DT148.C851
	, DT148.C843
	, DT146.C596
	, DT146.C593
	, DT146.C590
	, DT147.C339
	, DT148.C844
	, DT148.C850
	, DT146.C592
	, DT146.C597
	, DT147.C340
	, DT148.C839
	, DT148.C845
	, DT146.C594
	, DT148.C849
	, DT146.C595
	, DT146.C598
	, DT147.C335
	, DT148.C858
	, DT148.C841
	, DT146.C588
	, DT148.C852
	, DT148.C856
	, DT147.C338
FROM
	(
		T29 DT147
	INNER JOIN
		(
			T49 DT146
		INNER JOIN
			T70 DT148
		ON
			DT146.C587 <> DT148.C844
		)
	ON
		DT147.C338 = DT148.C839
	)
WHERE
	(
		DT148.C849 = DT148.C847
	)
	AND
	(
		(
			(
				DT147.C336 = DT146.C588
			)
			AND
			(
				DT147.C338 <> DT147.C338
			)
		)
		OR
		(
			(
				DT148.C851 > DT148.C840
			)
			AND
			(
				DT148.C851 = DT146.C593
			)
		)
	)
ORDER BY
	DT147.C337
	, DT147.C336
	, DT148.C853
	, DT148.C846
	, DT148.C840
	, DT148.C842
	, DT146.C599
	, DT146.C589
	, DT146.C586
	, DT148.C851
	, DT148.C843
	, DT146.C596
	, DT146.C593
	, DT146.C590
	, DT147.C339
	, DT148.C844
	, DT148.C850
	, DT146.C592
	, DT146.C597
	, DT147.C340
	, DT148.C839
	, DT148.C845
	, DT146.C594
	, DT148.C849
	, DT146.C595
	, DT146.C598
	, DT147.C335
	, DT148.C858
	, DT148.C841
	, DT146.C588
	, DT148.C852
	, DT148.C856
	, DT147.C338
LIMIT 124;


SELECT
	DT150.C449
	, DT151.C1060
	, DT151.C1061
	, DT151.C1058
	, DT151.C1057
	, DT149.C1042
	, DT152.C167
	, DT152.C165
	, DT149.C1044
	, DT149.C1031
	, DT152.C178
	, DT149.C1030
	, DT152.C169
	, DT149.C1032
	, DT152.C164
	, DT151.C1062
	, DT152.C179
	, DT152.C176
	, DT152.C170
	, DT149.C1035
	, DT151.C1063
	, DT152.C177
	, DT152.C171
	, DT152.C172
	, DT149.C1046
	, DT149.C1036
	, DT152.C175
	, DT149.C1038
	, DT151.C1059
FROM
	(
		(
			T85 DT149
		INNER JOIN
			T87 DT151
		ON
			DT149.C1033 = DT151.C1061
		)
	INNER JOIN
		(
			T13 DT152
		INNER JOIN
			T40 DT150
		ON
			DT152.C166 = DT150.C450
		)
	ON
		DT149.C1032 = DT152.C169
	)
WHERE
	(
		(
			DT149.C1042 = DT149.C1032
		)
		OR
		(
			DT149.C1044 = DT149.C1036
		)
	)
	OR
	(
		DT149.C1046 < DT149.C1033
	)
ORDER BY
	DT150.C449
	, DT151.C1060
	, DT151.C1061
	, DT151.C1058
	, DT151.C1057
	, DT149.C1042
	, DT152.C167
	, DT152.C165
	, DT149.C1044
	, DT149.C1031
	, DT152.C178
	, DT149.C1030
	, DT152.C169
	, DT149.C1032
	, DT152.C164
	, DT151.C1062
	, DT152.C179
	, DT152.C176
	, DT152.C170
	, DT149.C1035
	, DT151.C1063
	, DT152.C177
	, DT152.C171
	, DT152.C172
	, DT149.C1046
	, DT149.C1036
	, DT152.C175
	, DT149.C1038
	, DT151.C1059
LIMIT 289;


SELECT
	DT154.C409
	, DT154.C402
FROM
	(
		T7 DT153
	INNER JOIN
		T34 DT154
	ON
		DT153.C109 = DT154.C404
	)
WHERE
	(
		(
			(
				DT154.C406 < DT153.C90
			)
			OR
			(
				DT153.C92 > DT153.C98
			)
		)
		OR
		(
			DT153.C107 = DT153.C103
		)
	)
	AND
	(
		DT153.C101 <> DT153.C109
	)
ORDER BY
	DT154.C409
	, DT154.C402
LIMIT 665;


SELECT
	DT157.C1005
	, DT159.C939
	, DT157.C1002
FROM
	(
		T99 DT156
	INNER JOIN
		(
			(
				T30 DT158
			INNER JOIN
				T83 DT157
			ON
				DT158.C342 <> DT157.C1003
			)
		INNER JOIN
			(
				T76 DT159
			INNER JOIN
				T29 DT155
			ON
				DT159.C944 < DT155.C337
			)
		ON
			DT158.C341 <> DT159.C943
		)
	ON
		DT156.C1208 <> DT159.C945
	)
WHERE
	(
		DT158.C341 = DT155.C336
	)
	AND
	(
		DT156.C1208 < DT156.C1207
	)
ORDER BY
	DT157.C1005
	, DT159.C939
	, DT157.C1002
LIMIT 710;


SELECT
	DT162.C701
	, DT164.C416
	, DT160.C254
	, DT164.C413
	, DT162.C699
	, DT160.C250
	, DT162.C708
	, DT162.C712
	, DT161.C449
	, DT160.C256
	, DT161.C450
	, DT160.C248
	, DT162.C700
	, DT162.C706
	, DT163.C446
	, DT160.C251
	, DT162.C702
	, DT160.C255
	, DT162.C711
	, DT163.C445
	, DT160.C247
	, DT162.C709
	, DT160.C257
	, DT162.C705
	, DT164.C418
	, DT161.C448
	, DT161.C447
	, DT164.C412
	, DT160.C249
	, DT160.C258
	, DT160.C253
	, DT162.C698
	, DT162.C703
	, DT164.C417
	, DT160.C252
	, DT162.C710
	, DT164.C415
	, DT164.C414
FROM
	(
		T21 DT160
	INNER JOIN
		(
			(
				T39 DT163
			INNER JOIN
				(
					T40 DT161
				INNER JOIN
					T58 DT162
				ON
					DT161.C450 = DT162.C706
				)
			ON
				DT163.C444 = DT161.C450
			)
		INNER JOIN
			T35 DT164
		ON
			DT162.C698 = DT164.C411
		)
	ON
		DT160.C258 <> DT162.C712
	)
WHERE
	(
		DT160.C251 > DT160.C250
	)
	OR
	(
		(
			DT162.C706 > DT160.C252
		)
		OR
		(
			(
				DT164.C411 = DT162.C711
			)
			OR
			(
				DT161.C450 = DT162.C706
			)
		)
	)
ORDER BY
	DT162.C701
	, DT164.C416
	, DT160.C254
	, DT164.C413
	, DT162.C699
	, DT160.C250
	, DT162.C708
	, DT162.C712
	, DT161.C449
	, DT160.C256
	, DT161.C450
	, DT160.C248
	, DT162.C700
	, DT162.C706
	, DT163.C446
	, DT160.C251
	, DT162.C702
	, DT160.C255
	, DT162.C711
	, DT163.C445
	, DT160.C247
	, DT162.C709
	, DT160.C257
	, DT162.C705
	, DT164.C418
	, DT161.C448
	, DT161.C447
	, DT164.C412
	, DT160.C249
	, DT160.C258
	, DT160.C253
	, DT162.C698
	, DT162.C703
	, DT164.C417
	, DT160.C252
	, DT162.C710
	, DT164.C415
	, DT164.C414
LIMIT 889;


SELECT
	DT165.C618
	, DT167.C183
	, DT166.C1183
	, DT166.C1188
	, DT165.C623
	, DT165.C621
	, DT167.C181
	, DT166.C1189
	, DT165.C611
	, DT165.C617
	, DT167.C182
	, DT166.C1180
	, DT166.C1186
	, DT166.C1176
	, DT165.C624
	, DT167.C185
	, DT166.C1178
	, DT165.C620
	, DT166.C1182
	, DT165.C608
	, DT165.C609
	, DT166.C1177
	, DT165.C615
	, DT167.C180
	, DT165.C612
	, DT165.C616
	, DT167.C184
	, DT165.C610
	, DT165.C619
	, DT165.C614
FROM
	(
		T96 DT166
	INNER JOIN
		(
			T51 DT165
		INNER JOIN
			T14 DT167
		ON
			DT165.C613 = DT167.C183
		)
	ON
		DT166.C1176 <> DT165.C612
	)
WHERE
	(
		(
			DT166.C1186 > DT166.C1178
		)
		AND
		(
			DT167.C182 > DT167.C183
		)
	)
	AND
	(
		(
			DT167.C181 = DT166.C1177
		)
		OR
		(
			DT165.C621 > DT166.C1183
		)
	)
ORDER BY
	DT165.C618
	, DT167.C183
	, DT166.C1183
	, DT166.C1188
	, DT165.C623
	, DT165.C621
	, DT167.C181
	, DT166.C1189
	, DT165.C611
	, DT165.C617
	, DT167.C182
	, DT166.C1180
	, DT166.C1186
	, DT166.C1176
	, DT165.C624
	, DT167.C185
	, DT166.C1178
	, DT165.C620
	, DT166.C1182
	, DT165.C608
	, DT165.C609
	, DT166.C1177
	, DT165.C615
	, DT167.C180
	, DT165.C612
	, DT165.C616
	, DT167.C184
	, DT165.C610
	, DT165.C619
	, DT165.C614
LIMIT 787;


SELECT
	DT169.C547
	, DT169.C545
	, DT169.C541
	, DT169.C535
	, DT168.C1185
	, DT168.C1178
	, DT169.C530
	, DT168.C1188
	, DT169.C543
	, DT169.C546
	, DT168.C1177
FROM
	(
		T46 DT169
	INNER JOIN
		T96 DT168
	ON
		DT169.C535 = DT168.C1184
	)
WHERE
	(
		(
			DT169.C533 = DT168.C1183
		)
		OR
		(
			DT169.C534 = DT168.C1178
		)
	)
	AND
	(
		DT168.C1184 > DT169.C537
	)
ORDER BY
	DT169.C547
	, DT169.C545
	, DT169.C541
	, DT169.C535
	, DT168.C1185
	, DT168.C1178
	, DT169.C530
	, DT168.C1188
	, DT169.C543
	, DT169.C546
	, DT168.C1177
LIMIT 152;


SELECT
	DT172.C938
	, DT171.C283
	, DT170.C997
	, DT171.C289
	, DT172.C942
	, DT170.C995
	, DT171.C286
	, DT172.C939
	, DT170.C998
	, DT171.C288
	, DT171.C293
FROM
	(
		(
			T82 DT170
		INNER JOIN
			T76 DT172
		ON
			DT170.C999 = DT172.C939
		)
	INNER JOIN
		T25 DT171
	ON
		DT172.C944 > DT171.C288
	)
WHERE
	(
		DT172.C945 <> DT171.C291
	)
	OR
	(
		(
			DT171.C283 <> DT172.C941
		)
		OR
		(
			DT172.C946 <> DT171.C294
		)
	)
ORDER BY
	DT172.C938
	, DT171.C283
	, DT170.C997
	, DT171.C289
	, DT172.C942
	, DT170.C995
	, DT171.C286
	, DT172.C939
	, DT170.C998
	, DT171.C288
	, DT171.C293
LIMIT 823;


SELECT
	DT175.C187
	, DT175.C188
	, DT173.C732
	, DT174.C126
	, DT175.C196
	, DT174.C133
	, DT174.C127
	, DT173.C734
	, DT173.C733
	, DT173.C737
	, DT173.C738
	, DT175.C190
	, DT173.C726
	, DT174.C134
	, DT175.C199
	, DT173.C735
	, DT174.C129
	, DT174.C131
	, DT173.C739
	, DT175.C195
	, DT173.C727
	, DT173.C730
	, DT173.C725
	, DT174.C128
	, DT175.C197
	, DT173.C729
	, DT175.C189
	, DT175.C198
	, DT175.C191
	, DT175.C192
	, DT173.C731
	, DT174.C136
	, DT174.C137
	, DT174.C130
	, DT174.C135
	, DT175.C186
	, DT175.C193
FROM
	(
		T61 DT173
	INNER JOIN
		(
			T15 DT175
		INNER JOIN
			T9 DT174
		ON
			DT175.C194 = DT174.C135
		)
	ON
		DT173.C736 = DT174.C128
	)
WHERE
	(
		DT174.C132 = DT173.C725
	)
	OR
	(
		(
			(
				DT174.C137 <> DT175.C186
			)
			AND
			(
				DT173.C732 > DT175.C196
			)
		)
		AND
		(
			DT175.C197 = DT173.C731
		)
	)
ORDER BY
	DT175.C187
	, DT175.C188
	, DT173.C732
	, DT174.C126
	, DT175.C196
	, DT174.C133
	, DT174.C127
	, DT173.C734
	, DT173.C733
	, DT173.C737
	, DT173.C738
	, DT175.C190
	, DT173.C726
	, DT174.C134
	, DT175.C199
	, DT173.C735
	, DT174.C129
	, DT174.C131
	, DT173.C739
	, DT175.C195
	, DT173.C727
	, DT173.C730
	, DT173.C725
	, DT174.C128
	, DT175.C197
	, DT173.C729
	, DT175.C189
	, DT175.C198
	, DT175.C191
	, DT175.C192
	, DT173.C731
	, DT174.C136
	, DT174.C137
	, DT174.C130
	, DT174.C135
	, DT175.C186
	, DT175.C193
LIMIT 937;


SELECT
	DT176.C971
	, DT178.C353
	, DT176.C972
	, DT177.C635
	, DT177.C633
	, DT176.C976
	, DT176.C975
	, DT178.C355
	, DT176.C969
	, DT177.C627
	, DT178.C361
	, DT178.C345
	, DT178.C352
	, DT177.C626
	, DT178.C357
	, DT178.C344
	, DT178.C354
	, DT178.C350
	, DT176.C974
	, DT176.C977
	, DT178.C359
	, DT176.C968
	, DT178.C358
	, DT176.C966
	, DT177.C625
	, DT178.C362
	, DT176.C970
	, DT178.C363
	, DT177.C630
	, DT177.C628
	, DT177.C634
	, DT176.C973
	, DT176.C965
	, DT177.C629
	, DT177.C632
	, DT178.C356
	, DT178.C360
	, DT178.C346
	, DT176.C978
	, DT178.C348
	, DT178.C349
	, DT178.C347
	, DT178.C351
	, DT177.C631
FROM
	(
		T52 DT177
	INNER JOIN
		(
			T78 DT176
		INNER JOIN
			T31 DT178
		ON
			DT176.C971 > DT178.C349
		)
	ON
		DT177.C628 < DT178.C359
	)
WHERE
	(
		(
			DT176.C969 < DT178.C346
		)
		OR
		(
			DT178.C345 = DT178.C355
		)
	)
	OR
	(
		(
			DT177.C631 = DT178.C359
		)
		AND
		(
			DT176.C968 = DT177.C627
		)
	)
ORDER BY
	DT176.C971
	, DT178.C353
	, DT176.C972
	, DT177.C635
	, DT177.C633
	, DT176.C976
	, DT176.C975
	, DT178.C355
	, DT176.C969
	, DT177.C627
	, DT178.C361
	, DT178.C345
	, DT178.C352
	, DT177.C626
	, DT178.C357
	, DT178.C344
	, DT178.C354
	, DT178.C350
	, DT176.C974
	, DT176.C977
	, DT178.C359
	, DT176.C968
	, DT178.C358
	, DT176.C966
	, DT177.C625
	, DT178.C362
	, DT176.C970
	, DT178.C363
	, DT177.C630
	, DT177.C628
	, DT177.C634
	, DT176.C973
	, DT176.C965
	, DT177.C629
	, DT177.C632
	, DT178.C356
	, DT178.C360
	, DT178.C346
	, DT176.C978
	, DT178.C348
	, DT178.C349
	, DT178.C347
	, DT178.C351
	, DT177.C631
LIMIT 529;


SELECT
	DT179.C40
	, DT180.C148
	, DT179.C48
	, DT179.C50
	, DT180.C150
	, DT179.C44
	, DT179.C46
	, DT179.C35
	, DT180.C143
	, DT180.C151
	, DT179.C37
	, DT179.C45
	, DT179.C36
	, DT179.C34
	, DT180.C140
	, DT180.C142
	, DT179.C38
	, DT180.C146
	, DT180.C144
	, DT179.C42
	, DT179.C32
	, DT180.C145
	, DT180.C141
	, DT180.C147
	, DT180.C149
	, DT179.C33
	, DT179.C52
	, DT179.C47
	, DT179.C49
	, DT179.C41
FROM
	(
		T3 DT179
	INNER JOIN
		T10 DT180
	ON
		DT179.C34 = DT180.C145
	)
WHERE
	(
		DT179.C45 = DT180.C150
	)
	AND
	(
		DT180.C142 > DT180.C141
	)
ORDER BY
	DT179.C40
	, DT180.C148
	, DT179.C48
	, DT179.C50
	, DT180.C150
	, DT179.C44
	, DT179.C46
	, DT179.C35
	, DT180.C143
	, DT180.C151
	, DT179.C37
	, DT179.C45
	, DT179.C36
	, DT179.C34
	, DT180.C140
	, DT180.C142
	, DT179.C38
	, DT180.C146
	, DT180.C144
	, DT179.C42
	, DT179.C32
	, DT180.C145
	, DT180.C141
	, DT180.C147
	, DT180.C149
	, DT179.C33
	, DT179.C52
	, DT179.C47
	, DT179.C49
	, DT179.C41
LIMIT 768;


SELECT
	DT182.C635
	, DT183.C1102
	, DT184.C256
	, DT181.C124
	, DT184.C247
	, DT184.C252
	, DT183.C1094
	, DT182.C626
	, DT185.C1193
	, DT183.C1097
	, DT185.C1192
	, DT182.C629
	, DT183.C1107
	, DT183.C1110
	, DT183.C1104
	, DT183.C1096
	, DT183.C1109
FROM
	(
		T91 DT183
	INNER JOIN
		(
			(
				T97 DT185
			INNER JOIN
				T21 DT184
			ON
				DT185.C1193 > DT184.C248
			)
		INNER JOIN
			(
				T8 DT181
			INNER JOIN
				T52 DT182
			ON
				DT181.C124 = DT182.C630
			)
		ON
			DT184.C254 < DT181.C115
		)
	ON
		DT183.C1110 <> DT185.C1200
	)
WHERE
	(
		(
			(
				DT183.C1102 = DT181.C121
			)
			AND
			(
				DT183.C1107 = DT185.C1193
			)
		)
		AND
		(
			DT182.C633 = DT183.C1104
		)
	)
	OR
	(
		DT184.C254 = DT183.C1112
	)
ORDER BY
	DT182.C635
	, DT183.C1102
	, DT184.C256
	, DT181.C124
	, DT184.C247
	, DT184.C252
	, DT183.C1094
	, DT182.C626
	, DT185.C1193
	, DT183.C1097
	, DT185.C1192
	, DT182.C629
	, DT183.C1107
	, DT183.C1110
	, DT183.C1104
	, DT183.C1096
	, DT183.C1109
LIMIT 863;


SELECT
	DT186.C477
	, DT189.C1140
	, DT186.C483
	, DT187.C596
FROM
	(
		T93 DT189
	INNER JOIN
		(
			T42 DT186
		INNER JOIN
			(
				T49 DT187
			INNER JOIN
				(
					T62 DT188
				INNER JOIN
					T81 DT190
				ON
					DT188.C742 <> DT190.C991
				)
			ON
				DT187.C587 <> DT190.C994
			)
		ON
			DT186.C478 > DT187.C588
		)
	ON
		DT189.C1141 <> DT187.C586
	)
WHERE
	(
		DT186.C485 = DT190.C992
	)
	OR
	(
		(
			(
				(
					DT186.C477 > DT186.C484
				)
				AND
				(
					DT186.C479 = DT186.C484
				)
			)
			OR
			(
				DT187.C588 <> DT187.C586
			)
		)
		OR
		(
			DT189.C1143 = DT190.C994
		)
	)
ORDER BY
	DT186.C477
	, DT189.C1140
	, DT186.C483
	, DT187.C596
LIMIT 105;


SELECT
	DT191.C146
	, DT192.C600
	, DT193.C496
	, DT193.C500
	, DT191.C144
	, DT191.C138
	, DT193.C495
	, DT193.C497
	, DT191.C141
	, DT192.C604
	, DT193.C489
	, DT193.C488
	, DT192.C602
	, DT192.C603
	, DT193.C490
	, DT193.C492
	, DT192.C606
	, DT192.C601
	, DT191.C139
	, DT191.C145
FROM
	(
		T43 DT193
	INNER JOIN
		(
			T10 DT191
		INNER JOIN
			T50 DT192
		ON
			DT191.C150 > DT192.C604
		)
	ON
		DT193.C490 <> DT191.C140
	)
WHERE
	(
		DT192.C604 > DT193.C490
	)
	OR
	(
		DT193.C495 = DT193.C493
	)
ORDER BY
	DT191.C146
	, DT192.C600
	, DT193.C496
	, DT193.C500
	, DT191.C144
	, DT191.C138
	, DT193.C495
	, DT193.C497
	, DT191.C141
	, DT192.C604
	, DT193.C489
	, DT193.C488
	, DT192.C602
	, DT192.C603
	, DT193.C490
	, DT193.C492
	, DT192.C606
	, DT192.C601
	, DT191.C139
	, DT191.C145
LIMIT 383;


SELECT
	DT194.C170
	, DT195.C211
	, DT195.C210
	, DT197.C1075
	, DT194.C176
	, DT196.C815
FROM
	(
		(
			T88 DT197
		INNER JOIN
			T17 DT195
		ON
			DT197.C1071 = DT195.C208
		)
	INNER JOIN
		(
			T67 DT196
		INNER JOIN
			T13 DT194
		ON
			DT196.C819 > DT194.C172
		)
	ON
		DT195.C211 = DT194.C168
	)
WHERE
	(
		(
			DT195.C207 < DT196.C818
		)
		AND
		(
			(
				DT197.C1071 = DT196.C812
			)
			AND
			(
				DT195.C211 > DT197.C1069
			)
		)
	)
	AND
	(
		(
			DT195.C211 = DT196.C811
		)
		AND
		(
			DT197.C1072 = DT195.C209
		)
	)
ORDER BY
	DT194.C170
	, DT195.C211
	, DT195.C210
	, DT197.C1075
	, DT194.C176
	, DT196.C815
LIMIT 719;


SELECT
	DT200.C318
	, DT198.C724
	, DT200.C313
	, DT198.C720
	, DT200.C302
	, DT202.C598
	, DT200.C299
	, DT201.C819
	, DT200.C298
	, DT201.C816
	, DT199.C152
	, DT202.C599
	, DT202.C595
	, DT199.C153
	, DT198.C721
	, DT200.C308
	, DT202.C586
	, DT200.C304
	, DT198.C718
	, DT200.C301
	, DT198.C723
	, DT202.C588
	, DT200.C309
	, DT201.C818
	, DT199.C156
	, DT200.C305
	, DT200.C306
	, DT198.C722
	, DT201.C820
	, DT201.C810
	, DT200.C310
	, DT202.C596
	, DT201.C813
	, DT201.C812
	, DT202.C590
	, DT200.C312
	, DT202.C587
	, DT202.C594
	, DT200.C297
	, DT201.C814
	, DT200.C317
	, DT202.C589
	, DT200.C314
	, DT202.C593
	, DT201.C811
	, DT202.C592
	, DT200.C315
	, DT200.C307
	, DT199.C154
	, DT198.C717
	, DT201.C817
FROM
	(
		T11 DT199
	INNER JOIN
		(
			(
				(
					T60 DT198
				INNER JOIN
					T67 DT201
				ON
					DT198.C724 > DT201.C810
				)
			INNER JOIN
				T49 DT202
			ON
				DT198.C720 = DT202.C587
			)
		INNER JOIN
			T26 DT200
		ON
			DT202.C592 = DT200.C310
		)
	ON
		DT199.C154 <> DT200.C305
	)
WHERE
	(
		DT200.C299 <> DT199.C155
	)
	OR
	(
		(
			(
				DT200.C318 = DT200.C303
			)
			OR
			(
				DT201.C814 = DT198.C722
			)
		)
		AND
		(
			DT201.C818 <> DT201.C810
		)
	)
ORDER BY
	DT200.C318
	, DT198.C724
	, DT200.C313
	, DT198.C720
	, DT200.C302
	, DT202.C598
	, DT200.C299
	, DT201.C819
	, DT200.C298
	, DT201.C816
	, DT199.C152
	, DT202.C599
	, DT202.C595
	, DT199.C153
	, DT198.C721
	, DT200.C308
	, DT202.C586
	, DT200.C304
	, DT198.C718
	, DT200.C301
	, DT198.C723
	, DT202.C588
	, DT200.C309
	, DT201.C818
	, DT199.C156
	, DT200.C305
	, DT200.C306
	, DT198.C722
	, DT201.C820
	, DT201.C810
	, DT200.C310
	, DT202.C596
	, DT201.C813
	, DT201.C812
	, DT202.C590
	, DT200.C312
	, DT202.C587
	, DT202.C594
	, DT200.C297
	, DT201.C814
	, DT200.C317
	, DT202.C589
	, DT200.C314
	, DT202.C593
	, DT201.C811
	, DT202.C592
	, DT200.C315
	, DT200.C307
	, DT199.C154
	, DT198.C717
	, DT201.C817
LIMIT 638;


SELECT
	DT205.C749
	, DT205.C746
	, DT205.C758
	, DT205.C757
	, DT205.C745
	, DT205.C759
	, DT205.C743
	, DT203.C1062
	, DT204.C1205
	, DT205.C760
	, DT205.C753
	, DT204.C1207
	, DT205.C751
	, DT205.C762
	, DT203.C1056
	, DT204.C1208
	, DT205.C748
	, DT206.C341
	, DT203.C1061
	, DT203.C1057
	, DT205.C750
	, DT206.C342
	, DT203.C1063
	, DT203.C1060
	, DT205.C756
	, DT203.C1059
	, DT205.C763
	, DT205.C754
	, DT205.C752
	, DT206.C343
	, DT204.C1206
	, DT204.C1204
	, DT205.C744
FROM
	(
		(
			T87 DT203
		INNER JOIN
			T99 DT204
		ON
			DT203.C1063 = DT204.C1205
		)
	INNER JOIN
		(
			T63 DT205
		INNER JOIN
			T30 DT206
		ON
			DT205.C755 = DT206.C343
		)
	ON
		DT203.C1062 = DT205.C763
	)
WHERE
	(
		(
			DT205.C746 <> DT205.C761
		)
		AND
		(
			(
				DT204.C1204 = DT203.C1063
			)
			AND
			(
				DT205.C756 <> DT205.C757
			)
		)
	)
	AND
	(
		DT203.C1059 = DT205.C763
	)
ORDER BY
	DT205.C749
	, DT205.C746
	, DT205.C758
	, DT205.C757
	, DT205.C745
	, DT205.C759
	, DT205.C743
	, DT203.C1062
	, DT204.C1205
	, DT205.C760
	, DT205.C753
	, DT204.C1207
	, DT205.C751
	, DT205.C762
	, DT203.C1056
	, DT204.C1208
	, DT205.C748
	, DT206.C341
	, DT203.C1061
	, DT203.C1057
	, DT205.C750
	, DT206.C342
	, DT203.C1063
	, DT203.C1060
	, DT205.C756
	, DT203.C1059
	, DT205.C763
	, DT205.C754
	, DT205.C752
	, DT206.C343
	, DT204.C1206
	, DT204.C1204
	, DT205.C744
LIMIT 360;


SELECT
	DT208.C1025
	, DT207.C1175
	, DT208.C1014
	, DT208.C1016
	, DT208.C1011
FROM
	(
		T95 DT207
	INNER JOIN
		T84 DT208
	ON
		DT207.C1167 < DT208.C1019
	)
WHERE
	(
		(
			DT208.C1025 = DT207.C1171
		)
		OR
		(
			DT207.C1168 <> DT207.C1175
		)
	)
	AND
	(
		DT208.C1025 <> DT207.C1171
	)
ORDER BY
	DT208.C1025
	, DT207.C1175
	, DT208.C1014
	, DT208.C1016
	, DT208.C1011
LIMIT 170;


SELECT
	DT211.C599
	, DT210.C182
	, DT211.C591
FROM
	(
		T96 DT213
	INNER JOIN
		(
			T99 DT212
		INNER JOIN
			(
				T14 DT210
			INNER JOIN
				(
					T49 DT211
				INNER JOIN
					T37 DT209
				ON
					DT211.C589 <> DT209.C440
				)
			ON
				DT210.C180 = DT209.C439
			)
		ON
			DT212.C1205 < DT211.C587
		)
	ON
		DT213.C1182 > DT209.C440
	)
WHERE
	(
		DT213.C1181 <> DT213.C1181
	)
	OR
	(
		(
			DT211.C588 = DT213.C1188
		)
		AND
		(
			DT210.C183 = DT211.C596
		)
	)
ORDER BY
	DT211.C599
	, DT210.C182
	, DT211.C591
LIMIT 238;


SELECT
	DT215.C1081
	, DT214.C275
	, DT216.C938
	, DT215.C1086
	, DT214.C276
	, DT215.C1084
	, DT215.C1091
	, DT214.C278
	, DT216.C943
	, DT214.C273
	, DT215.C1079
	, DT214.C272
	, DT215.C1085
	, DT215.C1088
	, DT215.C1090
	, DT216.C945
FROM
	(
		(
			(
				T76 DT216
			INNER JOIN
				T90 DT215
			ON
				DT216.C946 <> DT215.C1091
			)
		INNER JOIN
			T89 DT217
		ON
			DT215.C1082 = DT217.C1077
		)
	INNER JOIN
		T23 DT214
	ON
		DT215.C1092 > DT214.C273
	)
WHERE
	(
		DT214.C270 = DT215.C1081
	)
	OR
	(
		DT215.C1083 = DT215.C1091
	)
ORDER BY
	DT215.C1081
	, DT214.C275
	, DT216.C938
	, DT215.C1086
	, DT214.C276
	, DT215.C1084
	, DT215.C1091
	, DT214.C278
	, DT216.C943
	, DT214.C273
	, DT215.C1079
	, DT214.C272
	, DT215.C1085
	, DT215.C1088
	, DT215.C1090
	, DT216.C945
LIMIT 297;


SELECT
	DT218.C129
	, DT218.C134
	, DT219.C303
	, DT219.C299
	, DT219.C297
	, DT219.C310
	, DT219.C311
	, DT219.C304
	, DT218.C128
	, DT219.C300
	, DT218.C133
	, DT219.C313
	, DT218.C132
	, DT218.C135
FROM
	(
		T26 DT219
	INNER JOIN
		T9 DT218
	ON
		DT219.C318 = DT218.C133
	)
WHERE
	(
		(
			DT218.C131 > DT218.C137
		)
		OR
		(
			DT219.C301 <> DT218.C133
		)
	)
	OR
	(
		DT219.C314 > DT219.C297
	)
ORDER BY
	DT218.C129
	, DT218.C134
	, DT219.C303
	, DT219.C299
	, DT219.C297
	, DT219.C310
	, DT219.C311
	, DT219.C304
	, DT218.C128
	, DT219.C300
	, DT218.C133
	, DT219.C313
	, DT218.C132
	, DT218.C135
LIMIT 470;


SELECT
	DT220.C168
	, DT220.C171
	, DT221.C753
	, DT221.C754
	, DT222.C1059
	, DT220.C165
	, DT224.C93
	, DT224.C98
	, DT224.C90
	, DT222.C1063
	, DT221.C746
	, DT220.C176
	, DT221.C747
	, DT221.C755
	, DT222.C1062
	, DT220.C177
	, DT224.C104
	, DT221.C748
	, DT223.C231
	, DT221.C752
	, DT220.C173
	, DT221.C759
	, DT221.C756
	, DT220.C167
	, DT221.C760
	, DT224.C99
	, DT224.C109
	, DT224.C105
	, DT220.C175
	, DT224.C100
	, DT224.C91
	, DT224.C103
	, DT221.C763
	, DT224.C101
	, DT221.C761
	, DT221.C751
	, DT224.C89
	, DT220.C169
	, DT224.C96
	, DT224.C94
	, DT220.C166
	, DT221.C762
	, DT224.C108
	, DT221.C745
	, DT220.C172
	, DT220.C170
	, DT224.C106
	, DT221.C749
	, DT222.C1057
FROM
	(
		(
			T19 DT223
		INNER JOIN
			(
				T63 DT221
			INNER JOIN
				T87 DT222
			ON
				DT221.C754 > DT222.C1062
			)
		ON
			DT223.C230 = DT221.C748
		)
	INNER JOIN
		(
			T13 DT220
		INNER JOIN
			T7 DT224
		ON
			DT220.C177 <> DT224.C104
		)
	ON
		DT221.C757 < DT220.C173
	)
WHERE
	(
		(
			DT224.C92 > DT221.C755
		)
		AND
		(
			DT220.C164 < DT220.C172
		)
	)
	OR
	(
		DT224.C100 > DT220.C175
	)
ORDER BY
	DT220.C168
	, DT220.C171
	, DT221.C753
	, DT221.C754
	, DT222.C1059
	, DT220.C165
	, DT224.C93
	, DT224.C98
	, DT224.C90
	, DT222.C1063
	, DT221.C746
	, DT220.C176
	, DT221.C747
	, DT221.C755
	, DT222.C1062
	, DT220.C177
	, DT224.C104
	, DT221.C748
	, DT223.C231
	, DT221.C752
	, DT220.C173
	, DT221.C759
	, DT221.C756
	, DT220.C167
	, DT221.C760
	, DT224.C99
	, DT224.C109
	, DT224.C105
	, DT220.C175
	, DT224.C100
	, DT224.C91
	, DT224.C103
	, DT221.C763
	, DT224.C101
	, DT221.C761
	, DT221.C751
	, DT224.C89
	, DT220.C169
	, DT224.C96
	, DT224.C94
	, DT220.C166
	, DT221.C762
	, DT224.C108
	, DT221.C745
	, DT220.C172
	, DT220.C170
	, DT224.C106
	, DT221.C749
	, DT222.C1057
LIMIT 929;


SELECT
	DT225.C1037
	, DT225.C1040
	, DT227.C674
	, DT227.C670
FROM
	(
		(
			T56 DT227
		INNER JOIN
			T85 DT225
		ON
			DT227.C669 = DT225.C1040
		)
	INNER JOIN
		T81 DT226
	ON
		DT227.C671 > DT226.C990
	)
WHERE
	(
		DT226.C994 = DT225.C1040
	)
	AND
	(
		DT225.C1031 = DT225.C1029
	)
ORDER BY
	DT225.C1037
	, DT225.C1040
	, DT227.C674
	, DT227.C670
LIMIT 217;


SELECT
	DT229.C219
	, DT229.C222
	, DT228.C152
	, DT230.C662
	, DT229.C228
	, DT230.C666
	, DT228.C155
	, DT230.C661
	, DT230.C658
	, DT228.C153
	, DT229.C220
	, DT230.C667
	, DT229.C221
	, DT230.C663
	, DT229.C227
	, DT230.C664
	, DT230.C660
	, DT229.C225
	, DT230.C665
FROM
	(
		T55 DT230
	INNER JOIN
		(
			T18 DT229
		INNER JOIN
			T11 DT228
		ON
			DT229.C222 > DT228.C153
		)
	ON
		DT230.C659 = DT228.C153
	)
WHERE
	(
		DT230.C666 > DT229.C221
	)
	AND
	(
		DT230.C665 = DT230.C658
	)
ORDER BY
	DT229.C219
	, DT229.C222
	, DT228.C152
	, DT230.C662
	, DT229.C228
	, DT230.C666
	, DT228.C155
	, DT230.C661
	, DT230.C658
	, DT228.C153
	, DT229.C220
	, DT230.C667
	, DT229.C221
	, DT230.C663
	, DT229.C227
	, DT230.C664
	, DT230.C660
	, DT229.C225
	, DT230.C665
LIMIT 874;


SELECT
	DT231.C486
	, DT231.C476
	, DT233.C716
	, DT232.C1044
	, DT232.C1037
	, DT231.C479
	, DT231.C482
	, DT232.C1032
	, DT233.C713
	, DT231.C480
	, DT232.C1030
	, DT232.C1033
	, DT231.C483
	, DT233.C715
	, DT231.C484
	, DT232.C1029
	, DT232.C1039
	, DT231.C485
	, DT232.C1031
	, DT231.C477
	, DT232.C1043
	, DT234.C822
	, DT232.C1046
	, DT231.C478
FROM
	(
		(
			(
				T59 DT233
			INNER JOIN
				T85 DT232
			ON
				DT233.C715 > DT232.C1030
			)
		INNER JOIN
			T68 DT234
		ON
			DT232.C1046 <> DT234.C822
		)
	INNER JOIN
		T42 DT231
	ON
		DT232.C1046 > DT231.C478
	)
WHERE
	(
		(
			DT231.C481 = DT232.C1043
		)
		AND
		(
			DT231.C486 = DT232.C1045
		)
	)
	OR
	(
		DT234.C821 < DT232.C1033
	)
ORDER BY
	DT231.C486
	, DT231.C476
	, DT233.C716
	, DT232.C1044
	, DT232.C1037
	, DT231.C479
	, DT231.C482
	, DT232.C1032
	, DT233.C713
	, DT231.C480
	, DT232.C1030
	, DT232.C1033
	, DT231.C483
	, DT233.C715
	, DT231.C484
	, DT232.C1029
	, DT232.C1039
	, DT231.C485
	, DT232.C1031
	, DT231.C477
	, DT232.C1043
	, DT234.C822
	, DT232.C1046
	, DT231.C478
LIMIT 836;


SELECT
	DT235.C86
	, DT235.C88
	, DT235.C84
	, DT236.C1052
	, DT235.C75
	, DT235.C87
	, DT235.C83
	, DT236.C1055
	, DT236.C1053
	, DT235.C78
	, DT236.C1049
	, DT236.C1048
	, DT236.C1050
	, DT235.C82
	, DT235.C76
	, DT235.C77
	, DT235.C80
	, DT235.C85
	, DT236.C1047
	, DT235.C81
	, DT235.C79
	, DT236.C1054
FROM
	(
		T6 DT235
	INNER JOIN
		T86 DT236
	ON
		DT235.C83 = DT236.C1047
	)
WHERE
	(
		DT235.C80 = DT235.C79
	)
	AND
	(
		(
			DT235.C80 = DT235.C84
		)
		AND
		(
			DT235.C78 = DT236.C1047
		)
	)
ORDER BY
	DT235.C86
	, DT235.C88
	, DT235.C84
	, DT236.C1052
	, DT235.C75
	, DT235.C87
	, DT235.C83
	, DT236.C1055
	, DT236.C1053
	, DT235.C78
	, DT236.C1049
	, DT236.C1048
	, DT236.C1050
	, DT235.C82
	, DT235.C76
	, DT235.C77
	, DT235.C80
	, DT235.C85
	, DT236.C1047
	, DT235.C81
	, DT235.C79
	, DT236.C1054
LIMIT 614;


SELECT
	DT238.C719
	, DT238.C718
	, DT238.C723
	, DT238.C720
	, DT238.C722
	, DT237.C441
	, DT237.C443
FROM
	(
		T60 DT238
	INNER JOIN
		T38 DT237
	ON
		DT238.C722 = DT237.C443
	)
WHERE
	(
		DT238.C724 > DT238.C721
	)
	OR
	(
		(
			DT238.C724 = DT238.C724
		)
		OR
		(
			DT237.C442 = DT238.C723
		)
	)
ORDER BY
	DT238.C719
	, DT238.C718
	, DT238.C723
	, DT238.C720
	, DT238.C722
	, DT237.C441
	, DT237.C443
LIMIT 863;


SELECT
	DT241.C62
	, DT240.C713
	, DT239.C878
	, DT241.C60
	, DT239.C874
	, DT241.C61
	, DT239.C888
	, DT241.C64
	, DT240.C714
	, DT239.C881
	, DT241.C53
	, DT239.C872
	, DT239.C887
	, DT241.C59
	, DT241.C54
	, DT239.C884
	, DT241.C63
	, DT239.C877
	, DT239.C871
	, DT240.C716
	, DT239.C869
	, DT239.C882
	, DT241.C56
	, DT240.C715
	, DT241.C65
	, DT239.C867
	, DT239.C886
	, DT241.C58
	, DT241.C57
	, DT239.C876
	, DT239.C868
	, DT239.C875
	, DT239.C870
	, DT239.C880
	, DT239.C873
	, DT239.C883
	, DT239.C879
	, DT239.C885
FROM
	(
		(
			T4 DT241
		INNER JOIN
			T72 DT239
		ON
			DT241.C58 <> DT239.C871
		)
	INNER JOIN
		T59 DT240
	ON
		DT239.C874 <> DT240.C713
	)
WHERE
	(
		(
			DT239.C867 = DT239.C888
		)
		OR
		(
			DT241.C57 <> DT240.C713
		)
	)
	OR
	(
		DT239.C875 < DT239.C874
	)
ORDER BY
	DT241.C62
	, DT240.C713
	, DT239.C878
	, DT241.C60
	, DT239.C874
	, DT241.C61
	, DT239.C888
	, DT241.C64
	, DT240.C714
	, DT239.C881
	, DT241.C53
	, DT239.C872
	, DT239.C887
	, DT241.C59
	, DT241.C54
	, DT239.C884
	, DT241.C63
	, DT239.C877
	, DT239.C871
	, DT240.C716
	, DT239.C869
	, DT239.C882
	, DT241.C56
	, DT240.C715
	, DT241.C65
	, DT239.C867
	, DT239.C886
	, DT241.C58
	, DT241.C57
	, DT239.C876
	, DT239.C868
	, DT239.C875
	, DT239.C870
	, DT239.C880
	, DT239.C873
	, DT239.C883
	, DT239.C879
	, DT239.C885
LIMIT 405;


SELECT
	DT243.C1140
	, DT244.C59
	, DT242.C136
	, DT242.C137
	, DT242.C128
	, DT242.C131
	, DT244.C64
	, DT242.C133
	, DT244.C60
	, DT242.C132
	, DT244.C62
	, DT242.C127
	, DT242.C135
	, DT243.C1137
	, DT244.C65
	, DT243.C1138
	, DT242.C134
FROM
	(
		(
			T9 DT242
		INNER JOIN
			T93 DT243
		ON
			DT242.C136 = DT243.C1144
		)
	INNER JOIN
		T4 DT244
	ON
		DT242.C127 = DT244.C57
	)
WHERE
	(
		DT242.C134 = DT243.C1137
	)
	OR
	(
		(
			DT244.C56 = DT242.C133
		)
		AND
		(
			DT244.C63 < DT242.C127
		)
	)
ORDER BY
	DT243.C1140
	, DT244.C59
	, DT242.C136
	, DT242.C137
	, DT242.C128
	, DT242.C131
	, DT244.C64
	, DT242.C133
	, DT244.C60
	, DT242.C132
	, DT244.C62
	, DT242.C127
	, DT242.C135
	, DT243.C1137
	, DT244.C65
	, DT243.C1138
	, DT242.C134
LIMIT 887;


SELECT
	DT245.C1204
	, DT245.C1208
	, DT245.C1207
	, DT245.C1206
	, DT246.C231
	, DT246.C232
	, DT246.C230
FROM
	(
		T19 DT246
	INNER JOIN
		T99 DT245
	ON
		DT246.C232 = DT245.C1205
	)
WHERE
	(
		(
			DT246.C230 = DT246.C231
		)
		AND
		(
			DT245.C1204 = DT245.C1207
		)
	)
	AND
	(
		DT245.C1204 = DT245.C1206
	)
ORDER BY
	DT245.C1204
	, DT245.C1208
	, DT245.C1207
	, DT245.C1206
	, DT246.C231
	, DT246.C232
	, DT246.C230
LIMIT 876;


SELECT
	DT248.C1095
	, DT248.C1101
	, DT248.C1110
	, DT247.C128
	, DT247.C137
	, DT247.C129
	, DT248.C1107
	, DT248.C1113
	, DT247.C135
	, DT248.C1111
	, DT248.C1096
	, DT247.C130
	, DT248.C1112
FROM
	(
		T9 DT247
	INNER JOIN
		T91 DT248
	ON
		DT247.C129 = DT248.C1100
	)
WHERE
	(
		(
			(
				(
					DT247.C134 = DT248.C1110
				)
				OR
				(
					DT247.C136 > DT247.C126
				)
			)
			OR
			(
				DT247.C129 > DT248.C1096
			)
		)
		AND
		(
			DT248.C1099 = DT248.C1098
		)
	)
	OR
	(
		DT247.C127 < DT248.C1099
	)
ORDER BY
	DT248.C1095
	, DT248.C1101
	, DT248.C1110
	, DT247.C128
	, DT247.C137
	, DT247.C129
	, DT248.C1107
	, DT248.C1113
	, DT247.C135
	, DT248.C1111
	, DT248.C1096
	, DT247.C130
	, DT248.C1112
LIMIT 181;


SELECT
	DT251.C590
	, DT253.C601
	, DT250.C997
	, DT253.C607
	, DT249.C85
	, DT251.C597
	, DT250.C996
	, DT252.C342
	, DT250.C999
FROM
	(
		(
			(
				T49 DT251
			INNER JOIN
				(
					T82 DT250
				INNER JOIN
					T30 DT252
				ON
					DT250.C999 = DT252.C341
				)
			ON
				DT251.C592 = DT250.C1000
			)
		INNER JOIN
			T50 DT253
		ON
			DT250.C999 < DT253.C603
		)
	INNER JOIN
		T6 DT249
	ON
		DT250.C995 < DT249.C75
	)
WHERE
	(
		DT250.C1000 = DT251.C596
	)
	AND
	(
		DT250.C998 > DT251.C589
	)
ORDER BY
	DT251.C590
	, DT253.C601
	, DT250.C997
	, DT253.C607
	, DT249.C85
	, DT251.C597
	, DT250.C996
	, DT252.C342
	, DT250.C999
LIMIT 871;


SELECT
	DT257.C448
	, DT254.C788
	, DT255.C205
	, DT254.C784
	, DT254.C786
	, DT257.C449
	, DT256.C718
	, DT255.C200
	, DT254.C789
	, DT254.C794
	, DT254.C797
	, DT255.C202
	, DT254.C787
	, DT255.C201
	, DT255.C203
	, DT254.C793
	, DT256.C719
	, DT254.C791
	, DT256.C717
	, DT256.C724
	, DT254.C783
FROM
	(
		(
			T60 DT256
		INNER JOIN
			(
				T40 DT257
			INNER JOIN
				T65 DT254
			ON
				DT257.C448 <> DT254.C784
			)
		ON
			DT256.C720 <> DT254.C791
		)
	INNER JOIN
		T16 DT255
	ON
		DT254.C789 > DT255.C202
	)
WHERE
	(
		(
			(
				DT255.C205 < DT256.C723
			)
			OR
			(
				DT255.C203 > DT254.C787
			)
		)
		AND
		(
			DT257.C448 = DT254.C790
		)
	)
	OR
	(
		DT256.C718 > DT255.C205
	)
ORDER BY
	DT257.C448
	, DT254.C788
	, DT255.C205
	, DT254.C784
	, DT254.C786
	, DT257.C449
	, DT256.C718
	, DT255.C200
	, DT254.C789
	, DT254.C794
	, DT254.C797
	, DT255.C202
	, DT254.C787
	, DT255.C201
	, DT255.C203
	, DT254.C793
	, DT256.C719
	, DT254.C791
	, DT256.C717
	, DT256.C724
	, DT254.C783
LIMIT 213;


SELECT
	DT259.C405
FROM
	(
		(
			T64 DT261
		INNER JOIN
			T59 DT260
		ON
			DT261.C773 < DT260.C716
		)
	INNER JOIN
		(
			T60 DT258
		INNER JOIN
			T34 DT259
		ON
			DT258.C718 < DT259.C406
		)
	ON
		DT261.C776 < DT258.C717
	)
WHERE
	(
		DT259.C404 = DT259.C405
	)
	OR
	(
		DT261.C770 = DT261.C768
	)
ORDER BY
	DT259.C405
LIMIT 317;


SELECT
	DT262.C417
	, DT263.C500
	, DT263.C497
	, DT262.C411
	, DT262.C413
	, DT262.C416
	, DT263.C499
	, DT263.C489
	, DT263.C498
	, DT262.C414
	, DT263.C493
FROM
	(
		T35 DT262
	INNER JOIN
		T43 DT263
	ON
		DT262.C411 <> DT263.C494
	)
WHERE
	(
		(
			(
				DT263.C492 = DT263.C498
			)
			AND
			(
				DT263.C497 = DT263.C492
			)
		)
		OR
		(
			DT263.C501 = DT262.C413
		)
	)
	OR
	(
		DT262.C415 = DT263.C501
	)
ORDER BY
	DT262.C417
	, DT263.C500
	, DT263.C497
	, DT262.C411
	, DT262.C413
	, DT262.C416
	, DT263.C499
	, DT263.C489
	, DT263.C498
	, DT262.C414
	, DT263.C493
LIMIT 265;


SELECT
	DT264.C527
	, DT266.C45
	, DT264.C524
	, DT264.C513
	, DT266.C43
	, DT266.C47
	, DT264.C526
	, DT267.C971
	, DT265.C802
	, DT266.C50
	, DT267.C969
	, DT267.C970
	, DT266.C33
	, DT267.C968
	, DT267.C965
	, DT267.C978
	, DT266.C39
	, DT264.C515
	, DT265.C800
	, DT266.C37
	, DT266.C51
	, DT264.C519
	, DT266.C34
	, DT266.C49
	, DT266.C35
	, DT267.C966
	, DT266.C42
	, DT264.C525
	, DT267.C976
	, DT266.C52
	, DT266.C48
	, DT266.C46
	, DT266.C44
	, DT264.C517
	, DT264.C512
	, DT265.C798
	, DT264.C518
	, DT265.C805
	, DT265.C804
	, DT264.C520
	, DT266.C40
	, DT267.C972
	, DT266.C32
	, DT266.C36
	, DT264.C521
	, DT267.C977
	, DT264.C516
	, DT265.C799
	, DT264.C523
	, DT267.C973
	, DT265.C807
	, DT264.C514
	, DT265.C803
	, DT265.C801
	, DT267.C974
	, DT267.C967
	, DT264.C522
	, DT266.C38
	, DT265.C808
FROM
	(
		(
			T66 DT265
		INNER JOIN
			T45 DT264
		ON
			DT265.C805 > DT264.C519
		)
	INNER JOIN
		(
			T3 DT266
		INNER JOIN
			T78 DT267
		ON
			DT266.C45 = DT267.C967
		)
	ON
		DT264.C521 = DT266.C48
	)
WHERE
	(
		DT267.C965 = DT266.C36
	)
	OR
	(
		(
			DT265.C807 < DT267.C974
		)
		OR
		(
			DT264.C521 > DT265.C808
		)
	)
ORDER BY
	DT264.C527
	, DT266.C45
	, DT264.C524
	, DT264.C513
	, DT266.C43
	, DT266.C47
	, DT264.C526
	, DT267.C971
	, DT265.C802
	, DT266.C50
	, DT267.C969
	, DT267.C970
	, DT266.C33
	, DT267.C968
	, DT267.C965
	, DT267.C978
	, DT266.C39
	, DT264.C515
	, DT265.C800
	, DT266.C37
	, DT266.C51
	, DT264.C519
	, DT266.C34
	, DT266.C49
	, DT266.C35
	, DT267.C966
	, DT266.C42
	, DT264.C525
	, DT267.C976
	, DT266.C52
	, DT266.C48
	, DT266.C46
	, DT266.C44
	, DT264.C517
	, DT264.C512
	, DT265.C798
	, DT264.C518
	, DT265.C805
	, DT265.C804
	, DT264.C520
	, DT266.C40
	, DT267.C972
	, DT266.C32
	, DT266.C36
	, DT264.C521
	, DT267.C977
	, DT264.C516
	, DT265.C799
	, DT264.C523
	, DT267.C973
	, DT265.C807
	, DT264.C514
	, DT265.C803
	, DT265.C801
	, DT267.C974
	, DT267.C967
	, DT264.C522
	, DT266.C38
	, DT265.C808
LIMIT 928;


SELECT
	DT268.C1199
	, DT272.C318
	, DT270.C1079
	, DT272.C314
	, DT269.C628
	, DT272.C304
	, DT270.C1091
	, DT270.C1090
	, DT268.C1192
	, DT270.C1083
	, DT269.C625
	, DT268.C1200
	, DT272.C310
	, DT269.C627
	, DT269.C629
	, DT272.C298
	, DT272.C307
	, DT272.C312
	, DT270.C1084
	, DT272.C311
	, DT272.C308
	, DT269.C633
	, DT272.C316
	, DT272.C302
	, DT269.C635
	, DT268.C1198
	, DT272.C306
	, DT270.C1081
	, DT272.C317
	, DT270.C1087
	, DT268.C1197
	, DT272.C313
	, DT269.C634
	, DT270.C1088
	, DT270.C1085
	, DT272.C309
	, DT272.C305
	, DT269.C626
	, DT268.C1195
	, DT269.C631
	, DT268.C1191
	, DT272.C315
FROM
	(
		T97 DT268
	INNER JOIN
		(
			(
				T38 DT271
			INNER JOIN
				(
					T52 DT269
				INNER JOIN
					T90 DT270
				ON
					DT269.C631 = DT270.C1091
				)
			ON
				DT271.C443 = DT270.C1089
			)
		INNER JOIN
			T26 DT272
		ON
			DT270.C1084 > DT272.C314
		)
	ON
		DT268.C1194 = DT272.C300
	)
WHERE
	(
		DT268.C1192 = DT269.C632
	)
	AND
	(
		(
			DT270.C1088 <> DT268.C1196
		)
		OR
		(
			DT272.C301 <> DT272.C301
		)
	)
ORDER BY
	DT268.C1199
	, DT272.C318
	, DT270.C1079
	, DT272.C314
	, DT269.C628
	, DT272.C304
	, DT270.C1091
	, DT270.C1090
	, DT268.C1192
	, DT270.C1083
	, DT269.C625
	, DT268.C1200
	, DT272.C310
	, DT269.C627
	, DT269.C629
	, DT272.C298
	, DT272.C307
	, DT272.C312
	, DT270.C1084
	, DT272.C311
	, DT272.C308
	, DT269.C633
	, DT272.C316
	, DT272.C302
	, DT269.C635
	, DT268.C1198
	, DT272.C306
	, DT270.C1081
	, DT272.C317
	, DT270.C1087
	, DT268.C1197
	, DT272.C313
	, DT269.C634
	, DT270.C1088
	, DT270.C1085
	, DT272.C309
	, DT272.C305
	, DT269.C626
	, DT268.C1195
	, DT269.C631
	, DT268.C1191
	, DT272.C315
LIMIT 128;


SELECT
	DT274.C1116
	, DT274.C1124
	, DT274.C1117
	, DT273.C448
	, DT274.C1126
	, DT274.C1125
	, DT274.C1130
	, DT274.C1122
	, DT274.C1118
	, DT274.C1123
	, DT274.C1115
	, DT274.C1121
	, DT274.C1120
FROM
	(
		T92 DT274
	INNER JOIN
		T40 DT273
	ON
		DT274.C1126 = DT273.C447
	)
WHERE
	(
		DT274.C1129 = DT274.C1115
	)
	AND
	(
		(
			DT274.C1130 > DT274.C1127
		)
		AND
		(
			DT274.C1124 = DT274.C1117
		)
	)
ORDER BY
	DT274.C1116
	, DT274.C1124
	, DT274.C1117
	, DT273.C448
	, DT274.C1126
	, DT274.C1125
	, DT274.C1130
	, DT274.C1122
	, DT274.C1118
	, DT274.C1123
	, DT274.C1115
	, DT274.C1121
	, DT274.C1120
LIMIT 585;


SELECT
	DT275.C677
	, DT276.C605
	, DT276.C607
FROM
	(
		(
			T56 DT275
		INNER JOIN
			T50 DT276
		ON
			DT275.C670 > DT276.C603
		)
	INNER JOIN
		T24 DT277
	ON
		DT275.C670 = DT277.C280
	)
WHERE
	(
		DT276.C604 = DT275.C671
	)
	AND
	(
		(
			DT276.C600 > DT275.C679
		)
		OR
		(
			DT275.C679 = DT275.C675
		)
	)
ORDER BY
	DT275.C677
	, DT276.C605
	, DT276.C607
LIMIT 829;


SELECT
	DT278.C834
	, DT278.C825
	, DT279.C862
FROM
	(
		T69 DT278
	INNER JOIN
		T71 DT279
	ON
		DT278.C824 = DT279.C866
	)
WHERE
	(
		(
			(
				DT278.C827 < DT278.C837
			)
			OR
			(
				DT278.C834 = DT278.C831
			)
		)
		OR
		(
			DT278.C832 > DT278.C835
		)
	)
	AND
	(
		DT279.C866 < DT278.C837
	)
ORDER BY
	DT278.C834
	, DT278.C825
	, DT279.C862
LIMIT 471;


SELECT
	DT280.C981
	, DT280.C985
	, DT280.C984
	, DT282.C513
	, DT281.C331
	, DT282.C515
	, DT282.C517
	, DT282.C512
	, DT280.C979
	, DT282.C514
	, DT280.C980
	, DT282.C526
	, DT282.C522
	, DT281.C328
	, DT282.C527
	, DT282.C516
	, DT282.C521
	, DT282.C519
	, DT280.C983
	, DT282.C524
	, DT281.C330
FROM
	(
		T28 DT281
	INNER JOIN
		(
			T45 DT282
		INNER JOIN
			T79 DT280
		ON
			DT282.C517 > DT280.C983
		)
	ON
		DT281.C330 = DT280.C985
	)
WHERE
	(
		(
			(
				DT281.C329 = DT282.C512
			)
			OR
			(
				DT281.C332 > DT280.C984
			)
		)
		AND
		(
			DT281.C330 = DT282.C525
		)
	)
	OR
	(
		(
			DT280.C983 <> DT280.C984
		)
		OR
		(
			DT281.C329 < DT282.C517
		)
	)
ORDER BY
	DT280.C981
	, DT280.C985
	, DT280.C984
	, DT282.C513
	, DT281.C331
	, DT282.C515
	, DT282.C517
	, DT282.C512
	, DT280.C979
	, DT282.C514
	, DT280.C980
	, DT282.C526
	, DT282.C522
	, DT281.C328
	, DT282.C527
	, DT282.C516
	, DT282.C521
	, DT282.C519
	, DT280.C983
	, DT282.C524
	, DT281.C330
LIMIT 121;


SELECT
	DT284.C457
	, DT284.C464
	, DT283.C154
	, DT284.C455
	, DT284.C456
	, DT284.C465
	, DT284.C459
	, DT284.C467
	, DT283.C153
	, DT284.C466
	, DT284.C458
FROM
	(
		T11 DT283
	INNER JOIN
		T41 DT284
	ON
		DT283.C155 <> DT284.C468
	)
WHERE
	(
		DT283.C156 > DT284.C469
	)
	OR
	(
		(
			(
				DT284.C453 <> DT284.C452
			)
			OR
			(
				DT283.C154 < DT284.C460
			)
		)
		AND
		(
			(
				DT283.C155 = DT284.C459
			)
			AND
			(
				DT284.C457 = DT283.C155
			)
		)
	)
ORDER BY
	DT284.C457
	, DT284.C464
	, DT283.C154
	, DT284.C455
	, DT284.C456
	, DT284.C465
	, DT284.C459
	, DT284.C467
	, DT283.C153
	, DT284.C466
	, DT284.C458
LIMIT 497;


SELECT
	DT286.C323
	, DT287.C246
	, DT285.C1069
	, DT286.C327
	, DT287.C242
	, DT285.C1066
	, DT285.C1073
	, DT285.C1070
	, DT285.C1071
	, DT285.C1074
	, DT286.C325
	, DT287.C234
	, DT287.C233
	, DT287.C236
	, DT287.C237
	, DT287.C241
	, DT285.C1075
FROM
	(
		T88 DT285
	INNER JOIN
		(
			T27 DT286
		INNER JOIN
			T20 DT287
		ON
			DT286.C321 <> DT287.C240
		)
	ON
		DT285.C1065 = DT286.C321
	)
WHERE
	(
		DT287.C237 = DT285.C1070
	)
	AND
	(
		(
			(
				DT285.C1066 = DT287.C236
			)
			OR
			(
				DT287.C239 > DT287.C239
			)
		)
		AND
		(
			DT286.C319 > DT285.C1065
		)
	)
ORDER BY
	DT286.C323
	, DT287.C246
	, DT285.C1069
	, DT286.C327
	, DT287.C242
	, DT285.C1066
	, DT285.C1073
	, DT285.C1070
	, DT285.C1071
	, DT285.C1074
	, DT286.C325
	, DT287.C234
	, DT287.C233
	, DT287.C236
	, DT287.C237
	, DT287.C241
	, DT285.C1075
LIMIT 611;


SELECT
	DT290.C168
	, DT288.C1023
	, DT289.C1098
	, DT289.C1102
	, DT288.C1021
	, DT288.C1012
	, DT291.C1039
	, DT291.C1033
FROM
	(
		(
			(
				T91 DT289
			INNER JOIN
				T85 DT291
			ON
				DT289.C1094 <> DT291.C1039
			)
		INNER JOIN
			T84 DT288
		ON
			DT289.C1106 > DT288.C1018
		)
	INNER JOIN
		(
			T13 DT290
		INNER JOIN
			T89 DT292
		ON
			DT290.C174 = DT292.C1077
		)
	ON
		DT291.C1030 <> DT290.C176
	)
WHERE
	(
		DT289.C1097 <> DT288.C1022
	)
	AND
	(
		DT289.C1099 <> DT290.C179
	)
ORDER BY
	DT290.C168
	, DT288.C1023
	, DT289.C1098
	, DT289.C1102
	, DT288.C1021
	, DT288.C1012
	, DT291.C1039
	, DT291.C1033
LIMIT 504;


SELECT
	DT294.C275
	, DT294.C271
	, DT296.C447
	, DT297.C249
	, DT294.C276
	, DT295.C657
	, DT297.C256
	, DT294.C273
	, DT297.C248
	, DT295.C654
	, DT297.C252
	, DT293.C999
	, DT294.C270
	, DT296.C448
FROM
	(
		T82 DT293
	INNER JOIN
		(
			(
				(
					T40 DT296
				INNER JOIN
					T21 DT297
				ON
					DT296.C447 = DT297.C255
				)
			INNER JOIN
				T54 DT295
			ON
				DT297.C254 = DT295.C654
			)
		INNER JOIN
			T23 DT294
		ON
			DT297.C258 = DT294.C272
		)
	ON
		DT293.C1000 = DT294.C274
	)
WHERE
	(
		DT293.C998 = DT297.C247
	)
	AND
	(
		(
			DT293.C999 = DT297.C254
		)
		OR
		(
			DT297.C251 = DT297.C248
		)
	)
ORDER BY
	DT294.C275
	, DT294.C271
	, DT296.C447
	, DT297.C249
	, DT294.C276
	, DT295.C657
	, DT297.C256
	, DT294.C273
	, DT297.C248
	, DT295.C654
	, DT297.C252
	, DT293.C999
	, DT294.C270
	, DT296.C448
LIMIT 676;


SELECT
	DT299.C966
	, DT299.C971
	, DT299.C965
	, DT298.C293
	, DT298.C291
FROM
	(
		T78 DT299
	INNER JOIN
		T25 DT298
	ON
		DT299.C971 <> DT298.C284
	)
WHERE
	(
		DT299.C978 = DT299.C977
	)
	AND
	(
		(
			DT299.C978 < DT298.C289
		)
		OR
		(
			DT299.C978 = DT298.C284
		)
	)
ORDER BY
	DT299.C966
	, DT299.C971
	, DT299.C965
	, DT298.C293
	, DT298.C291
LIMIT 993;


SELECT
	DT301.C168
	, DT301.C175
	, DT300.C149
	, DT301.C167
	, DT300.C138
	, DT301.C174
	, DT301.C169
	, DT300.C151
	, DT300.C144
	, DT300.C139
	, DT301.C170
	, DT301.C176
	, DT300.C142
	, DT300.C143
	, DT301.C165
	, DT301.C172
	, DT301.C164
	, DT301.C178
	, DT300.C150
FROM
	(
		T10 DT300
	INNER JOIN
		T13 DT301
	ON
		DT300.C149 = DT301.C170
	)
WHERE
	(
		DT301.C173 < DT301.C173
	)
	AND
	(
		DT300.C143 = DT300.C138
	)
ORDER BY
	DT301.C168
	, DT301.C175
	, DT300.C149
	, DT301.C167
	, DT300.C138
	, DT301.C174
	, DT301.C169
	, DT300.C151
	, DT300.C144
	, DT300.C139
	, DT301.C170
	, DT301.C176
	, DT300.C142
	, DT300.C143
	, DT301.C165
	, DT301.C172
	, DT301.C164
	, DT301.C178
	, DT300.C150
LIMIT 588;


SELECT
	DT304.C665
	, DT303.C358
	, DT304.C662
	, DT303.C355
	, DT303.C354
	, DT304.C663
	, DT302.C9
	, DT303.C361
	, DT302.C8
	, DT303.C350
	, DT302.C4
	, DT303.C356
	, DT302.C11
	, DT303.C344
	, DT304.C661
	, DT303.C360
	, DT303.C359
	, DT304.C667
	, DT302.C10
	, DT303.C347
	, DT304.C659
	, DT303.C362
	, DT304.C660
	, DT302.C12
	, DT302.C14
	, DT303.C351
	, DT303.C348
	, DT302.C5
	, DT303.C363
	, DT303.C345
	, DT303.C346
	, DT302.C13
	, DT304.C658
	, DT304.C666
	, DT303.C349
	, DT303.C352
	, DT303.C357
	, DT304.C664
	, DT302.C6
FROM
	(
		T55 DT304
	INNER JOIN
		(
			T31 DT303
		INNER JOIN
			T1 DT302
		ON
			DT303.C347 = DT302.C9
		)
	ON
		DT304.C663 > DT302.C8
	)
WHERE
	(
		(
			DT303.C363 = DT303.C356
		)
		AND
		(
			DT302.C11 <> DT302.C8
		)
	)
	AND
	(
		DT303.C363 = DT302.C13
	)
ORDER BY
	DT304.C665
	, DT303.C358
	, DT304.C662
	, DT303.C355
	, DT303.C354
	, DT304.C663
	, DT302.C9
	, DT303.C361
	, DT302.C8
	, DT303.C350
	, DT302.C4
	, DT303.C356
	, DT302.C11
	, DT303.C344
	, DT304.C661
	, DT303.C360
	, DT303.C359
	, DT304.C667
	, DT302.C10
	, DT303.C347
	, DT304.C659
	, DT303.C362
	, DT304.C660
	, DT302.C12
	, DT302.C14
	, DT303.C351
	, DT303.C348
	, DT302.C5
	, DT303.C363
	, DT303.C345
	, DT303.C346
	, DT302.C13
	, DT304.C658
	, DT304.C666
	, DT303.C349
	, DT303.C352
	, DT303.C357
	, DT304.C664
	, DT302.C6
LIMIT 629;


SELECT
	DT305.C815
	, DT305.C816
	, DT305.C809
	, DT305.C812
	, DT305.C813
	, DT308.C1201
	, DT306.C486
	, DT308.C1202
	, DT306.C484
FROM
	(
		T98 DT308
	INNER JOIN
		(
			T83 DT307
		INNER JOIN
			(
				T67 DT305
			INNER JOIN
				T42 DT306
			ON
				DT305.C815 = DT306.C477
			)
		ON
			DT307.C1004 <> DT306.C477
		)
	ON
		DT308.C1203 < DT307.C1005
	)
WHERE
	(
		(
			DT305.C816 = DT307.C1005
		)
		AND
		(
			(
				(
					DT305.C813 = DT307.C1005
				)
				OR
				(
					DT305.C818 <> DT306.C473
				)
			)
			AND
			(
				DT306.C485 = DT308.C1203
			)
		)
	)
	AND
	(
		DT306.C474 = DT306.C483
	)
ORDER BY
	DT305.C815
	, DT305.C816
	, DT305.C809
	, DT305.C812
	, DT305.C813
	, DT308.C1201
	, DT306.C486
	, DT308.C1202
	, DT306.C484
LIMIT 109;


SELECT
	DT310.C821
	, DT313.C1193
	, DT310.C823
	, DT313.C1198
	, DT309.C67
FROM
	(
		(
			(
				T5 DT309
			INNER JOIN
				T28 DT311
			ON
				DT309.C67 <> DT311.C328
			)
		INNER JOIN
			(
				T97 DT313
			INNER JOIN
				T10 DT312
			ON
				DT313.C1192 <> DT312.C146
			)
		ON
			DT309.C74 <> DT312.C138
		)
	INNER JOIN
		T68 DT310
	ON
		DT311.C332 <> DT310.C822
	)
WHERE
	(
		DT313.C1198 = DT312.C149
	)
	OR
	(
		(
			DT312.C141 = DT309.C74
		)
		AND
		(
			(
				DT311.C332 < DT311.C330
			)
			AND
			(
				DT309.C73 = DT309.C68
			)
		)
	)
ORDER BY
	DT310.C821
	, DT313.C1193
	, DT310.C823
	, DT313.C1198
	, DT309.C67
LIMIT 487;


SELECT
	DT315.C788
	, DT314.C1068
FROM
	(
		T88 DT314
	INNER JOIN
		T65 DT315
	ON
		DT314.C1072 > DT315.C785
	)
WHERE
	(
		(
			DT314.C1074 < DT315.C787
		)
		OR
		(
			DT314.C1067 < DT314.C1064
		)
	)
	AND
	(
		(
			DT314.C1075 < DT314.C1072
		)
		AND
		(
			(
				DT315.C797 = DT315.C792
			)
			AND
			(
				DT314.C1065 > DT315.C791
			)
		)
	)
ORDER BY
	DT315.C788
	, DT314.C1068
LIMIT 195;


SELECT
	DT317.C1167
	, DT318.C546
	, DT318.C542
FROM
	(
		(
			T43 DT316
		INNER JOIN
			(
				T95 DT317
			INNER JOIN
				T46 DT318
			ON
				DT317.C1172 <> DT318.C545
			)
		ON
			DT316.C493 = DT317.C1172
		)
	INNER JOIN
		T76 DT319
	ON
		DT318.C530 = DT319.C946
	)
WHERE
	(
		(
			(
				DT318.C534 > DT319.C943
			)
			OR
			(
				DT316.C490 = DT316.C490
			)
		)
		AND
		(
			DT318.C532 = DT316.C495
		)
	)
	AND
	(
		DT318.C543 < DT317.C1167
	)
ORDER BY
	DT317.C1167
	, DT318.C546
	, DT318.C542
LIMIT 216;


SELECT
	DT320.C472
	, DT321.C848
	, DT320.C459
	, DT320.C457
	, DT320.C467
	, DT321.C841
	, DT323.C1171
	, DT320.C471
	, DT320.C466
	, DT321.C855
FROM
	(
		T70 DT321
	INNER JOIN
		(
			(
				T95 DT323
			INNER JOIN
				T41 DT320
			ON
				DT323.C1175 <> DT320.C468
			)
		INNER JOIN
			T54 DT322
		ON
			DT320.C460 < DT322.C657
		)
	ON
		DT321.C849 = DT322.C657
	)
WHERE
	(
		DT320.C453 = DT321.C840
	)
	OR
	(
		(
			DT321.C842 = DT321.C842
		)
		OR
		(
			(
				DT321.C847 = DT321.C857
			)
			OR
			(
				DT320.C455 > DT323.C1173
			)
		)
	)
ORDER BY
	DT320.C472
	, DT321.C848
	, DT320.C459
	, DT320.C457
	, DT320.C467
	, DT321.C841
	, DT323.C1171
	, DT320.C471
	, DT320.C466
	, DT321.C855
LIMIT 968;


SELECT
	DT326.C1157
	, DT326.C1165
	, DT326.C1145
	, DT325.C5
	, DT326.C1163
	, DT325.C7
	, DT325.C6
	, DT326.C1146
	, DT326.C1152
	, DT326.C1147
	, DT325.C9
	, DT324.C1202
	, DT326.C1158
	, DT326.C1155
	, DT326.C1166
	, DT326.C1150
	, DT326.C1153
	, DT325.C8
	, DT326.C1164
	, DT326.C1159
	, DT325.C13
	, DT325.C14
	, DT324.C1203
	, DT325.C12
	, DT326.C1161
	, DT326.C1151
	, DT325.C4
	, DT326.C1148
	, DT324.C1201
	, DT325.C10
	, DT326.C1156
	, DT326.C1160
	, DT326.C1149
	, DT326.C1154
FROM
	(
		(
			T98 DT324
		INNER JOIN
			T94 DT326
		ON
			DT324.C1203 = DT326.C1145
		)
	INNER JOIN
		T1 DT325
	ON
		DT326.C1157 < DT325.C13
	)
WHERE
	(
		(
			DT326.C1157 = DT326.C1158
		)
		OR
		(
			DT325.C4 = DT326.C1163
		)
	)
	OR
	(
		DT325.C8 <> DT325.C6
	)
ORDER BY
	DT326.C1157
	, DT326.C1165
	, DT326.C1145
	, DT325.C5
	, DT326.C1163
	, DT325.C7
	, DT325.C6
	, DT326.C1146
	, DT326.C1152
	, DT326.C1147
	, DT325.C9
	, DT324.C1202
	, DT326.C1158
	, DT326.C1155
	, DT326.C1166
	, DT326.C1150
	, DT326.C1153
	, DT325.C8
	, DT326.C1164
	, DT326.C1159
	, DT325.C13
	, DT325.C14
	, DT324.C1203
	, DT325.C12
	, DT326.C1161
	, DT326.C1151
	, DT325.C4
	, DT326.C1148
	, DT324.C1201
	, DT325.C10
	, DT326.C1156
	, DT326.C1160
	, DT326.C1149
	, DT326.C1154
LIMIT 563;


SELECT
	DT327.C1207
	, DT329.C662
	, DT329.C661
	, DT329.C666
	, DT331.C450
	, DT330.C742
	, DT328.C742
	, DT327.C1205
	, DT329.C667
	, DT329.C658
FROM
	(
		T62 DT330
	INNER JOIN
		(
			T55 DT329
		INNER JOIN
			(
				T99 DT327
			INNER JOIN
				(
					T62 DT328
				INNER JOIN
					T40 DT331
				ON
					DT328.C741 < DT331.C448
				)
			ON
				DT327.C1207 = DT331.C449
			)
		ON
			DT329.C662 > DT327.C1206
		)
	ON
		DT330.C740 = DT327.C1207
	)
WHERE
	(
		DT328.C742 = DT330.C742
	)
	AND
	(
		DT329.C661 <> DT331.C450
	)
ORDER BY
	DT327.C1207
	, DT329.C662
	, DT329.C661
	, DT329.C666
	, DT331.C450
	, DT330.C742
	, DT328.C742
	, DT327.C1205
	, DT329.C667
	, DT329.C658
LIMIT 420;


SELECT
	DT332.C1204
	, DT332.C1208
	, DT332.C1206
FROM
	(
		T40 DT333
	INNER JOIN
		T99 DT332
	ON
		DT333.C449 > DT332.C1204
	)
WHERE
	(
		DT333.C447 > DT332.C1206
	)
	OR
	(
		(
			(
				DT332.C1205 = DT333.C450
			)
			OR
			(
				DT332.C1206 = DT332.C1204
			)
		)
		OR
		(
			DT333.C450 = DT332.C1206
		)
	)
ORDER BY
	DT332.C1204
	, DT332.C1208
	, DT332.C1206
LIMIT 322;


SELECT
	DT336.C13
	, DT334.C844
	, DT335.C203
	, DT335.C206
	, DT335.C200
	, DT336.C4
	, DT334.C840
	, DT334.C856
	, DT334.C857
	, DT334.C853
	, DT336.C5
	, DT336.C8
	, DT335.C202
	, DT334.C848
	, DT334.C852
	, DT336.C7
	, DT334.C850
	, DT335.C201
	, DT336.C9
	, DT334.C839
	, DT335.C204
	, DT334.C849
	, DT336.C10
	, DT334.C845
	, DT334.C854
	, DT336.C11
	, DT335.C205
	, DT334.C847
	, DT336.C12
	, DT334.C842
	, DT336.C14
FROM
	(
		(
			T1 DT336
		INNER JOIN
			T70 DT334
		ON
			DT336.C6 > DT334.C842
		)
	INNER JOIN
		T16 DT335
	ON
		DT334.C855 = DT335.C200
	)
WHERE
	(
		(
			DT336.C14 = DT335.C202
		)
		AND
		(
			DT335.C200 > DT336.C9
		)
	)
	OR
	(
		DT334.C843 = DT334.C839
	)
ORDER BY
	DT336.C13
	, DT334.C844
	, DT335.C203
	, DT335.C206
	, DT335.C200
	, DT336.C4
	, DT334.C840
	, DT334.C856
	, DT334.C857
	, DT334.C853
	, DT336.C5
	, DT336.C8
	, DT335.C202
	, DT334.C848
	, DT334.C852
	, DT336.C7
	, DT334.C850
	, DT335.C201
	, DT336.C9
	, DT334.C839
	, DT335.C204
	, DT334.C849
	, DT336.C10
	, DT334.C845
	, DT334.C854
	, DT336.C11
	, DT335.C205
	, DT334.C847
	, DT336.C12
	, DT334.C842
	, DT336.C14
LIMIT 427;


SELECT
	DT337.C400
	, DT337.C397
	, DT338.C35
	, DT338.C44
	, DT338.C33
	, DT339.C335
	, DT337.C399
	, DT338.C40
FROM
	(
		(
			T29 DT339
		INNER JOIN
			T33 DT337
		ON
			DT339.C336 <> DT337.C384
		)
	INNER JOIN
		T3 DT338
	ON
		DT337.C393 < DT338.C42
	)
WHERE
	(
		DT338.C45 = DT338.C39
	)
	OR
	(
		(
			DT337.C384 = DT337.C389
		)
		AND
		(
			DT337.C391 < DT338.C47
		)
	)
ORDER BY
	DT337.C400
	, DT337.C397
	, DT338.C35
	, DT338.C44
	, DT338.C33
	, DT339.C335
	, DT337.C399
	, DT338.C40
LIMIT 206;


SELECT
	DT340.C770
	, DT340.C782
	, DT341.C989
	, DT340.C764
	, DT340.C779
	, DT340.C774
	, DT342.C484
	, DT342.C475
	, DT340.C765
	, DT340.C780
	, DT342.C477
	, DT340.C777
	, DT340.C772
	, DT342.C476
	, DT340.C781
	, DT340.C775
	, DT341.C987
	, DT341.C986
	, DT342.C480
	, DT342.C478
	, DT342.C473
	, DT342.C485
	, DT340.C773
	, DT340.C766
	, DT342.C483
	, DT340.C778
	, DT342.C482
	, DT340.C768
	, DT342.C481
	, DT340.C771
	, DT342.C486
	, DT340.C767
	, DT342.C474
	, DT340.C769
	, DT340.C776
	, DT341.C988
	, DT342.C479
FROM
	(
		T64 DT340
	INNER JOIN
		(
			T80 DT341
		INNER JOIN
			T42 DT342
		ON
			DT341.C988 <> DT342.C477
		)
	ON
		DT340.C779 = DT341.C989
	)
WHERE
	(
		(
			DT341.C987 <> DT342.C479
		)
		OR
		(
			(
				(
					DT340.C781 = DT340.C766
				)
				OR
				(
					DT341.C989 > DT340.C769
				)
			)
			OR
			(
				DT340.C773 = DT341.C989
			)
		)
	)
	OR
	(
		DT342.C483 = DT342.C484
	)
ORDER BY
	DT340.C770
	, DT340.C782
	, DT341.C989
	, DT340.C764
	, DT340.C779
	, DT340.C774
	, DT342.C484
	, DT342.C475
	, DT340.C765
	, DT340.C780
	, DT342.C477
	, DT340.C777
	, DT340.C772
	, DT342.C476
	, DT340.C781
	, DT340.C775
	, DT341.C987
	, DT341.C986
	, DT342.C480
	, DT342.C478
	, DT342.C473
	, DT342.C485
	, DT340.C773
	, DT340.C766
	, DT342.C483
	, DT340.C778
	, DT342.C482
	, DT340.C768
	, DT342.C481
	, DT340.C771
	, DT342.C486
	, DT340.C767
	, DT342.C474
	, DT340.C769
	, DT340.C776
	, DT341.C988
	, DT342.C479
LIMIT 906;


SELECT
	DT343.C864
	, DT345.C184
	, DT343.C860
	, DT344.C1081
	, DT344.C1085
	, DT344.C1083
	, DT344.C1092
	, DT345.C183
	, DT344.C1089
	, DT343.C862
	, DT344.C1082
	, DT344.C1090
	, DT345.C180
	, DT345.C181
FROM
	(
		T90 DT344
	INNER JOIN
		(
			T14 DT345
		INNER JOIN
			T71 DT343
		ON
			DT345.C181 <> DT343.C866
		)
	ON
		DT344.C1086 <> DT343.C866
	)
WHERE
	(
		(
			DT343.C865 > DT344.C1088
		)
		OR
		(
			DT345.C185 > DT345.C180
		)
	)
	AND
	(
		(
			DT345.C180 = DT345.C181
		)
		AND
		(
			DT343.C862 <> DT344.C1082
		)
	)
ORDER BY
	DT343.C864
	, DT345.C184
	, DT343.C860
	, DT344.C1081
	, DT344.C1085
	, DT344.C1083
	, DT344.C1092
	, DT345.C183
	, DT344.C1089
	, DT343.C862
	, DT344.C1082
	, DT344.C1090
	, DT345.C180
	, DT345.C181
LIMIT 241;


SELECT
	DT346.C221
	, DT347.C237
	, DT346.C225
	, DT348.C159
	, DT347.C244
FROM
	(
		T20 DT347
	INNER JOIN
		(
			T18 DT346
		INNER JOIN
			T12 DT348
		ON
			DT346.C228 = DT348.C160
		)
	ON
		DT347.C246 < DT348.C160
	)
WHERE
	(
		(
			DT346.C224 = DT347.C239
		)
		OR
		(
			DT347.C237 = DT347.C243
		)
	)
	OR
	(
		DT348.C162 <> DT347.C246
	)
ORDER BY
	DT346.C221
	, DT347.C237
	, DT346.C225
	, DT348.C159
	, DT347.C244
LIMIT 290;


SELECT
	DT351.C736
	, DT351.C734
	, DT349.C1057
	, DT353.C17
	, DT353.C16
	, DT352.C279
	, DT353.C28
	, DT350.C1165
	, DT350.C1166
	, DT350.C1148
	, DT353.C30
	, DT351.C732
	, DT353.C23
	, DT350.C1156
	, DT353.C24
	, DT352.C280
	, DT349.C1056
	, DT353.C31
	, DT349.C1061
	, DT351.C739
	, DT349.C1062
	, DT350.C1164
	, DT353.C29
	, DT351.C727
	, DT350.C1151
	, DT349.C1063
	, DT353.C15
	, DT353.C22
	, DT350.C1152
	, DT351.C731
	, DT350.C1146
	, DT351.C729
	, DT352.C282
	, DT351.C735
	, DT351.C725
	, DT351.C728
	, DT350.C1158
	, DT350.C1160
	, DT352.C281
	, DT351.C737
	, DT350.C1155
	, DT350.C1149
	, DT349.C1058
	, DT350.C1150
	, DT350.C1157
	, DT350.C1153
	, DT350.C1159
	, DT351.C730
	, DT353.C25
	, DT351.C733
	, DT350.C1147
	, DT350.C1145
	, DT350.C1161
	, DT353.C20
	, DT353.C27
	, DT353.C26
	, DT351.C726
	, DT350.C1162
	, DT349.C1060
	, DT351.C738
	, DT350.C1154
	, DT353.C18
	, DT350.C1163
FROM
	(
		(
			(
				T24 DT352
			INNER JOIN
				T61 DT351
			ON
				DT352.C280 < DT351.C726
			)
		INNER JOIN
			T2 DT353
		ON
			DT351.C739 = DT353.C28
		)
	INNER JOIN
		(
			T94 DT350
		INNER JOIN
			T87 DT349
		ON
			DT350.C1160 < DT349.C1059
		)
	ON
		DT352.C281 = DT349.C1057
	)
WHERE
	(
		DT349.C1056 = DT349.C1063
	)
	OR
	(
		DT350.C1153 <> DT350.C1156
	)
ORDER BY
	DT351.C736
	, DT351.C734
	, DT349.C1057
	, DT353.C17
	, DT353.C16
	, DT352.C279
	, DT353.C28
	, DT350.C1165
	, DT350.C1166
	, DT350.C1148
	, DT353.C30
	, DT351.C732
	, DT353.C23
	, DT350.C1156
	, DT353.C24
	, DT352.C280
	, DT349.C1056
	, DT353.C31
	, DT349.C1061
	, DT351.C739
	, DT349.C1062
	, DT350.C1164
	, DT353.C29
	, DT351.C727
	, DT350.C1151
	, DT349.C1063
	, DT353.C15
	, DT353.C22
	, DT350.C1152
	, DT351.C731
	, DT350.C1146
	, DT351.C729
	, DT352.C282
	, DT351.C735
	, DT351.C725
	, DT351.C728
	, DT350.C1158
	, DT350.C1160
	, DT352.C281
	, DT351.C737
	, DT350.C1155
	, DT350.C1149
	, DT349.C1058
	, DT350.C1150
	, DT350.C1157
	, DT350.C1153
	, DT350.C1159
	, DT351.C730
	, DT353.C25
	, DT351.C733
	, DT350.C1147
	, DT350.C1145
	, DT350.C1161
	, DT353.C20
	, DT353.C27
	, DT353.C26
	, DT351.C726
	, DT350.C1162
	, DT349.C1060
	, DT351.C738
	, DT350.C1154
	, DT353.C18
	, DT350.C1163
LIMIT 593;


SELECT
	DT355.C500
	, DT355.C490
	, DT354.C1004
	, DT355.C495
	, DT354.C1003
	, DT354.C1007
	, DT354.C1006
	, DT355.C489
	, DT355.C493
	, DT355.C498
	, DT355.C488
	, DT355.C499
	, DT355.C491
FROM
	(
		T83 DT354
	INNER JOIN
		T43 DT355
	ON
		DT354.C1003 = DT355.C501
	)
WHERE
	(
		DT355.C498 = DT355.C500
	)
	AND
	(
		(
			(
				DT354.C1007 = DT354.C1005
			)
			OR
			(
				DT354.C1007 = DT354.C1006
			)
		)
		OR
		(
			(
				DT354.C1001 > DT355.C496
			)
			AND
			(
				DT355.C490 = DT354.C1007
			)
		)
	)
ORDER BY
	DT355.C500
	, DT355.C490
	, DT354.C1004
	, DT355.C495
	, DT354.C1003
	, DT354.C1007
	, DT354.C1006
	, DT355.C489
	, DT355.C493
	, DT355.C498
	, DT355.C488
	, DT355.C499
	, DT355.C491
LIMIT 849;


SELECT
	DT357.C78
	, DT358.C334
	, DT357.C86
	, DT357.C80
	, DT358.C339
	, DT357.C76
	, DT357.C84
	, DT356.C714
	, DT357.C82
	, DT357.C75
	, DT357.C83
	, DT358.C336
	, DT358.C337
	, DT358.C335
	, DT357.C81
	, DT357.C79
	, DT357.C77
	, DT356.C715
	, DT357.C88
	, DT357.C85
FROM
	(
		T6 DT357
	INNER JOIN
		(
			T29 DT358
		INNER JOIN
			T59 DT356
		ON
			DT358.C336 = DT356.C714
		)
	ON
		DT357.C87 <> DT358.C338
	)
WHERE
	(
		DT357.C83 > DT357.C78
	)
	AND
	(
		(
			(
				DT358.C334 = DT358.C335
			)
			AND
			(
				DT356.C716 = DT358.C340
			)
		)
		AND
		(
			(
				DT357.C84 < DT357.C83
			)
			OR
			(
				DT358.C335 > DT357.C84
			)
		)
	)
ORDER BY
	DT357.C78
	, DT358.C334
	, DT357.C86
	, DT357.C80
	, DT358.C339
	, DT357.C76
	, DT357.C84
	, DT356.C714
	, DT357.C82
	, DT357.C75
	, DT357.C83
	, DT358.C336
	, DT358.C337
	, DT358.C335
	, DT357.C81
	, DT357.C79
	, DT357.C77
	, DT356.C715
	, DT357.C88
	, DT357.C85
LIMIT 428;


SELECT
	DT360.C349
	, DT361.C9
	, DT359.C612
	, DT360.C348
	, DT360.C350
	, DT360.C360
	, DT360.C359
	, DT361.C7
	, DT359.C619
	, DT359.C608
	, DT360.C346
	, DT360.C363
	, DT360.C356
	, DT359.C623
	, DT360.C344
	, DT361.C12
FROM
	(
		(
			T31 DT360
		INNER JOIN
			T51 DT359
		ON
			DT360.C357 = DT359.C611
		)
	INNER JOIN
		T1 DT361
	ON
		DT360.C357 = DT361.C11
	)
WHERE
	(
		DT360.C363 = DT360.C360
	)
	AND
	(
		DT360.C352 = DT360.C344
	)
ORDER BY
	DT360.C349
	, DT361.C9
	, DT359.C612
	, DT360.C348
	, DT360.C350
	, DT360.C360
	, DT360.C359
	, DT361.C7
	, DT359.C619
	, DT359.C608
	, DT360.C346
	, DT360.C363
	, DT360.C356
	, DT359.C623
	, DT360.C344
	, DT361.C12
LIMIT 274;


SELECT
	DT362.C329
	, DT364.C865
	, DT363.C605
	, DT362.C332
	, DT362.C331
	, DT362.C330
	, DT364.C860
	, DT363.C600
	, DT364.C866
FROM
	(
		(
			T71 DT364
		INNER JOIN
			T28 DT362
		ON
			DT364.C866 <> DT362.C331
		)
	INNER JOIN
		T50 DT363
	ON
		DT362.C330 = DT363.C603
	)
WHERE
	(
		DT362.C332 > DT364.C860
	)
	AND
	(
		DT362.C332 <> DT363.C604
	)
ORDER BY
	DT362.C329
	, DT364.C865
	, DT363.C605
	, DT362.C332
	, DT362.C331
	, DT362.C330
	, DT364.C860
	, DT363.C600
	, DT364.C866
LIMIT 981;


SELECT
	DT366.C950
	, DT367.C502
	, DT368.C974
	, DT365.C1146
	, DT366.C961
	, DT365.C1157
	, DT367.C504
	, DT368.C975
	, DT365.C1148
	, DT368.C977
	, DT366.C952
	, DT368.C968
	, DT366.C949
	, DT367.C507
	, DT367.C506
	, DT365.C1150
	, DT365.C1145
	, DT368.C976
	, DT366.C951
	, DT367.C511
	, DT365.C1155
	, DT366.C948
	, DT365.C1160
	, DT367.C509
	, DT365.C1154
	, DT367.C505
	, DT366.C957
	, DT366.C964
	, DT365.C1149
	, DT365.C1162
	, DT365.C1153
	, DT366.C963
	, DT367.C508
	, DT365.C1152
	, DT368.C967
	, DT365.C1164
	, DT366.C955
	, DT368.C969
	, DT365.C1166
	, DT366.C958
	, DT368.C971
	, DT367.C503
	, DT367.C510
	, DT368.C973
	, DT368.C978
	, DT368.C965
	, DT365.C1159
	, DT366.C962
	, DT365.C1147
	, DT368.C970
	, DT365.C1158
	, DT366.C959
	, DT365.C1161
	, DT368.C972
	, DT365.C1156
	, DT366.C960
	, DT365.C1165
	, DT365.C1151
	, DT366.C953
	, DT366.C954
	, DT366.C956
	, DT368.C966
FROM
	(
		T78 DT368
	INNER JOIN
		(
			(
				T44 DT367
			INNER JOIN
				T77 DT366
			ON
				DT367.C509 <> DT366.C954
			)
		INNER JOIN
			T94 DT365
		ON
			DT366.C953 = DT365.C1166
		)
	ON
		DT368.C970 < DT366.C955
	)
WHERE
	(
		DT365.C1148 = DT365.C1149
	)
	AND
	(
		(
			(
				DT366.C960 = DT365.C1155
			)
			OR
			(
				DT365.C1155 = DT365.C1151
			)
		)
		OR
		(
			DT367.C508 = DT365.C1149
		)
	)
ORDER BY
	DT366.C950
	, DT367.C502
	, DT368.C974
	, DT365.C1146
	, DT366.C961
	, DT365.C1157
	, DT367.C504
	, DT368.C975
	, DT365.C1148
	, DT368.C977
	, DT366.C952
	, DT368.C968
	, DT366.C949
	, DT367.C507
	, DT367.C506
	, DT365.C1150
	, DT365.C1145
	, DT368.C976
	, DT366.C951
	, DT367.C511
	, DT365.C1155
	, DT366.C948
	, DT365.C1160
	, DT367.C509
	, DT365.C1154
	, DT367.C505
	, DT366.C957
	, DT366.C964
	, DT365.C1149
	, DT365.C1162
	, DT365.C1153
	, DT366.C963
	, DT367.C508
	, DT365.C1152
	, DT368.C967
	, DT365.C1164
	, DT366.C955
	, DT368.C969
	, DT365.C1166
	, DT366.C958
	, DT368.C971
	, DT367.C503
	, DT367.C510
	, DT368.C973
	, DT368.C978
	, DT368.C965
	, DT365.C1159
	, DT366.C962
	, DT365.C1147
	, DT368.C970
	, DT365.C1158
	, DT366.C959
	, DT365.C1161
	, DT368.C972
	, DT365.C1156
	, DT366.C960
	, DT365.C1165
	, DT365.C1151
	, DT366.C953
	, DT366.C954
	, DT366.C956
	, DT368.C966
LIMIT 241;


SELECT
	DT369.C996
	, DT370.C182
	, DT371.C972
FROM
	(
		(
			T71 DT372
		INNER JOIN
			T78 DT371
		ON
			DT372.C863 < DT371.C972
		)
	INNER JOIN
		(
			T82 DT369
		INNER JOIN
			T14 DT370
		ON
			DT369.C995 = DT370.C180
		)
	ON
		DT371.C977 > DT369.C1000
	)
WHERE
	(
		(
			DT369.C998 < DT371.C977
		)
		OR
		(
			DT371.C970 <> DT371.C978
		)
	)
	OR
	(
		(
			DT372.C860 <> DT370.C185
		)
		OR
		(
			DT370.C183 <> DT371.C977
		)
	)
ORDER BY
	DT369.C996
	, DT370.C182
	, DT371.C972
LIMIT 940;


SELECT
	DT373.C659
	, DT374.C337
	, DT374.C339
	, DT374.C334
	, DT373.C663
	, DT373.C660
	, DT373.C664
	, DT373.C662
	, DT373.C665
	, DT373.C661
	, DT374.C338
FROM
	(
		T29 DT374
	INNER JOIN
		T55 DT373
	ON
		DT374.C337 = DT373.C664
	)
WHERE
	(
		(
			(
				DT373.C665 > DT374.C335
			)
			AND
			(
				(
					DT373.C658 < DT374.C335
				)
				AND
				(
					DT373.C666 > DT374.C337
				)
			)
		)
		OR
		(
			DT373.C662 > DT374.C337
		)
	)
	OR
	(
		DT374.C335 <> DT373.C664
	)
ORDER BY
	DT373.C659
	, DT374.C337
	, DT374.C339
	, DT374.C334
	, DT373.C663
	, DT373.C660
	, DT373.C664
	, DT373.C662
	, DT373.C665
	, DT373.C661
	, DT374.C338
LIMIT 222;


SELECT
	DT376.C674
	, DT377.C780
	, DT375.C1120
	, DT375.C1115
	, DT377.C771
	, DT378.C631
	, DT375.C1132
	, DT375.C1129
	, DT377.C769
	, DT377.C775
	, DT376.C671
	, DT377.C764
	, DT378.C635
	, DT377.C777
	, DT379.C123
	, DT375.C1134
	, DT377.C774
	, DT379.C122
	, DT379.C117
	, DT379.C124
	, DT375.C1121
	, DT377.C773
	, DT376.C676
	, DT377.C766
	, DT375.C1116
	, DT377.C776
	, DT377.C779
	, DT379.C116
	, DT379.C112
	, DT379.C121
	, DT378.C633
	, DT377.C768
	, DT375.C1123
	, DT379.C119
	, DT375.C1117
	, DT376.C673
	, DT375.C1124
	, DT376.C679
	, DT376.C668
	, DT378.C630
	, DT375.C1128
	, DT377.C772
	, DT376.C678
	, DT375.C1131
	, DT377.C765
	, DT375.C1125
	, DT379.C120
	, DT379.C114
	, DT376.C680
	, DT378.C629
	, DT377.C778
	, DT378.C628
	, DT375.C1118
	, DT378.C626
	, DT375.C1135
	, DT379.C118
FROM
	(
		(
			T56 DT376
		INNER JOIN
			(
				(
					T8 DT379
				INNER JOIN
					T64 DT377
				ON
					DT379.C113 > DT377.C766
				)
			INNER JOIN
				T52 DT378
			ON
				DT377.C770 = DT378.C634
			)
		ON
			DT376.C677 < DT377.C768
		)
	INNER JOIN
		T92 DT375
	ON
		DT377.C780 = DT375.C1128
	)
WHERE
	(
		DT379.C116 <> DT377.C770
	)
	OR
	(
		DT379.C111 <> DT375.C1121
	)
ORDER BY
	DT376.C674
	, DT377.C780
	, DT375.C1120
	, DT375.C1115
	, DT377.C771
	, DT378.C631
	, DT375.C1132
	, DT375.C1129
	, DT377.C769
	, DT377.C775
	, DT376.C671
	, DT377.C764
	, DT378.C635
	, DT377.C777
	, DT379.C123
	, DT375.C1134
	, DT377.C774
	, DT379.C122
	, DT379.C117
	, DT379.C124
	, DT375.C1121
	, DT377.C773
	, DT376.C676
	, DT377.C766
	, DT375.C1116
	, DT377.C776
	, DT377.C779
	, DT379.C116
	, DT379.C112
	, DT379.C121
	, DT378.C633
	, DT377.C768
	, DT375.C1123
	, DT379.C119
	, DT375.C1117
	, DT376.C673
	, DT375.C1124
	, DT376.C679
	, DT376.C668
	, DT378.C630
	, DT375.C1128
	, DT377.C772
	, DT376.C678
	, DT375.C1131
	, DT377.C765
	, DT375.C1125
	, DT379.C120
	, DT379.C114
	, DT376.C680
	, DT378.C629
	, DT377.C778
	, DT378.C628
	, DT375.C1118
	, DT378.C626
	, DT375.C1135
	, DT379.C118
LIMIT 691;


SELECT
	DT381.C960
	, DT381.C958
	, DT381.C959
	, DT382.C982
	, DT382.C984
	, DT381.C955
	, DT380.C1069
	, DT380.C1066
	, DT381.C962
	, DT381.C952
	, DT381.C948
	, DT380.C1065
	, DT381.C954
	, DT381.C961
	, DT380.C1068
	, DT380.C1074
	, DT380.C1067
	, DT381.C950
	, DT381.C964
	, DT380.C1075
	, DT382.C980
	, DT382.C981
	, DT381.C947
	, DT380.C1070
	, DT382.C983
FROM
	(
		(
			T77 DT381
		INNER JOIN
			T79 DT382
		ON
			DT381.C958 = DT382.C984
		)
	INNER JOIN
		T88 DT380
	ON
		DT382.C983 < DT380.C1075
	)
WHERE
	(
		DT380.C1069 <> DT382.C982
	)
	OR
	(
		(
			DT381.C961 < DT381.C955
		)
		OR
		(
			(
				(
					DT381.C963 = DT380.C1070
				)
				OR
				(
					DT382.C980 = DT381.C955
				)
			)
			AND
			(
				DT382.C982 > DT381.C958
			)
		)
	)
ORDER BY
	DT381.C960
	, DT381.C958
	, DT381.C959
	, DT382.C982
	, DT382.C984
	, DT381.C955
	, DT380.C1069
	, DT380.C1066
	, DT381.C962
	, DT381.C952
	, DT381.C948
	, DT380.C1065
	, DT381.C954
	, DT381.C961
	, DT380.C1068
	, DT380.C1074
	, DT380.C1067
	, DT381.C950
	, DT381.C964
	, DT380.C1075
	, DT382.C980
	, DT382.C981
	, DT381.C947
	, DT380.C1070
	, DT382.C983
LIMIT 163;


SELECT
	DT385.C771
	, DT387.C37
	, DT385.C774
	, DT386.C732
	, DT386.C726
	, DT386.C727
	, DT384.C1001
	, DT387.C33
	, DT386.C733
	, DT385.C777
	, DT387.C32
	, DT386.C725
	, DT385.C764
	, DT386.C728
	, DT387.C45
	, DT387.C46
	, DT385.C768
	, DT385.C767
	, DT387.C44
	, DT385.C769
	, DT387.C34
	, DT386.C735
	, DT387.C52
	, DT384.C1005
	, DT386.C731
	, DT383.C1077
	, DT385.C782
	, DT387.C39
	, DT385.C780
	, DT387.C36
	, DT387.C50
	, DT385.C778
	, DT386.C734
	, DT385.C770
	, DT387.C41
	, DT386.C730
	, DT385.C772
	, DT387.C35
	, DT387.C48
	, DT386.C729
	, DT386.C736
	, DT387.C49
	, DT384.C1003
	, DT384.C1006
	, DT385.C765
	, DT385.C776
	, DT383.C1076
	, DT386.C737
	, DT386.C739
	, DT385.C775
	, DT387.C47
	, DT383.C1078
	, DT387.C40
	, DT384.C1007
	, DT387.C38
	, DT385.C766
	, DT385.C781
	, DT387.C43
	, DT387.C51
	, DT386.C738
	, DT384.C1004
	, DT384.C1002
FROM
	(
		(
			T83 DT384
		INNER JOIN
			T61 DT386
		ON
			DT384.C1001 = DT386.C737
		)
	INNER JOIN
		(
			T89 DT383
		INNER JOIN
			(
				T3 DT387
			INNER JOIN
				T64 DT385
			ON
				DT387.C43 <> DT385.C778
			)
		ON
			DT383.C1077 = DT385.C781
		)
	ON
		DT386.C725 <> DT387.C46
	)
WHERE
	(
		(
			DT385.C772 = DT385.C769
		)
		OR
		(
			DT385.C766 <> DT385.C771
		)
	)
	OR
	(
		DT386.C729 = DT387.C37
	)
ORDER BY
	DT385.C771
	, DT387.C37
	, DT385.C774
	, DT386.C732
	, DT386.C726
	, DT386.C727
	, DT384.C1001
	, DT387.C33
	, DT386.C733
	, DT385.C777
	, DT387.C32
	, DT386.C725
	, DT385.C764
	, DT386.C728
	, DT387.C45
	, DT387.C46
	, DT385.C768
	, DT385.C767
	, DT387.C44
	, DT385.C769
	, DT387.C34
	, DT386.C735
	, DT387.C52
	, DT384.C1005
	, DT386.C731
	, DT383.C1077
	, DT385.C782
	, DT387.C39
	, DT385.C780
	, DT387.C36
	, DT387.C50
	, DT385.C778
	, DT386.C734
	, DT385.C770
	, DT387.C41
	, DT386.C730
	, DT385.C772
	, DT387.C35
	, DT387.C48
	, DT386.C729
	, DT386.C736
	, DT387.C49
	, DT384.C1003
	, DT384.C1006
	, DT385.C765
	, DT385.C776
	, DT383.C1076
	, DT386.C737
	, DT386.C739
	, DT385.C775
	, DT387.C47
	, DT383.C1078
	, DT387.C40
	, DT384.C1007
	, DT387.C38
	, DT385.C766
	, DT385.C781
	, DT387.C43
	, DT387.C51
	, DT386.C738
	, DT384.C1004
	, DT384.C1002
LIMIT 328;


SELECT
	DT389.C185
	, DT389.C184
	, DT388.C329
	, DT389.C183
	, DT389.C182
	, DT388.C333
	, DT389.C180
	, DT389.C181
	, DT388.C332
	, DT388.C330
FROM
	(
		T14 DT389
	INNER JOIN
		T28 DT388
	ON
		DT389.C183 = DT388.C328
	)
WHERE
	(
		(
			DT389.C185 < DT388.C333
		)
		OR
		(
			DT388.C329 = DT388.C330
		)
	)
	AND
	(
		(
			DT389.C183 = DT388.C328
		)
		AND
		(
			DT388.C332 <> DT388.C331
		)
	)
ORDER BY
	DT389.C185
	, DT389.C184
	, DT388.C329
	, DT389.C183
	, DT389.C182
	, DT388.C333
	, DT389.C180
	, DT389.C181
	, DT388.C332
	, DT388.C330
LIMIT 816;


SELECT
	DT390.C279
	, DT392.C157
	, DT391.C1153
	, DT391.C1154
	, DT393.C180
	, DT391.C1162
	, DT392.C159
	, DT391.C1158
	, DT390.C280
	, DT391.C1163
	, DT392.C161
	, DT393.C184
	, DT392.C158
	, DT391.C1157
	, DT391.C1145
	, DT391.C1159
	, DT391.C1147
	, DT392.C162
	, DT393.C182
	, DT391.C1150
	, DT390.C282
	, DT393.C181
	, DT391.C1156
	, DT394.C343
	, DT394.C342
	, DT391.C1164
	, DT391.C1161
	, DT391.C1149
	, DT391.C1152
	, DT392.C160
	, DT393.C185
FROM
	(
		T24 DT390
	INNER JOIN
		(
			T12 DT392
		INNER JOIN
			(
				T14 DT393
			INNER JOIN
				(
					T94 DT391
				INNER JOIN
					T30 DT394
				ON
					DT391.C1147 = DT394.C343
				)
			ON
				DT393.C185 = DT391.C1147
			)
		ON
			DT392.C159 <> DT394.C342
		)
	ON
		DT390.C280 < DT391.C1164
	)
WHERE
	(
		DT393.C185 = DT391.C1162
	)
	OR
	(
		(
			DT391.C1151 = DT392.C163
		)
		AND
		(
			(
				DT391.C1150 = DT392.C163
			)
			AND
			(
				DT394.C343 = DT392.C161
			)
		)
	)
ORDER BY
	DT390.C279
	, DT392.C157
	, DT391.C1153
	, DT391.C1154
	, DT393.C180
	, DT391.C1162
	, DT392.C159
	, DT391.C1158
	, DT390.C280
	, DT391.C1163
	, DT392.C161
	, DT393.C184
	, DT392.C158
	, DT391.C1157
	, DT391.C1145
	, DT391.C1159
	, DT391.C1147
	, DT392.C162
	, DT393.C182
	, DT391.C1150
	, DT390.C282
	, DT393.C181
	, DT391.C1156
	, DT394.C343
	, DT394.C342
	, DT391.C1164
	, DT391.C1161
	, DT391.C1149
	, DT391.C1152
	, DT392.C160
	, DT393.C185
LIMIT 539;


SELECT
	DT395.C1122
	, DT395.C1118
	, DT395.C1128
	, DT395.C1130
	, DT395.C1117
	, DT395.C1132
	, DT395.C1131
	, DT396.C1062
	, DT395.C1116
	, DT395.C1123
	, DT396.C1057
	, DT395.C1120
FROM
	(
		T87 DT396
	INNER JOIN
		T92 DT395
	ON
		DT396.C1059 = DT395.C1124
	)
WHERE
	(
		DT395.C1119 = DT395.C1131
	)
	AND
	(
		(
			DT396.C1060 < DT396.C1058
		)
		OR
		(
			DT395.C1120 < DT395.C1116
		)
	)
ORDER BY
	DT395.C1122
	, DT395.C1118
	, DT395.C1128
	, DT395.C1130
	, DT395.C1117
	, DT395.C1132
	, DT395.C1131
	, DT396.C1062
	, DT395.C1116
	, DT395.C1123
	, DT396.C1057
	, DT395.C1120
LIMIT 804;


SELECT
	DT400.C90
	, DT400.C98
	, DT398.C1130
	, DT397.C445
	, DT398.C1134
	, DT401.C838
	, DT401.C835
	, DT401.C829
	, DT400.C96
	, DT401.C836
	, DT401.C833
	, DT401.C827
	, DT400.C99
	, DT398.C1123
	, DT400.C109
	, DT398.C1126
	, DT398.C1122
	, DT398.C1135
	, DT398.C1115
	, DT400.C101
	, DT400.C92
	, DT398.C1124
	, DT398.C1117
	, DT399.C450
	, DT401.C826
	, DT400.C97
	, DT398.C1132
	, DT400.C103
	, DT400.C91
	, DT398.C1120
	, DT401.C837
	, DT397.C446
	, DT399.C447
	, DT398.C1121
	, DT400.C105
	, DT398.C1129
	, DT400.C93
	, DT399.C448
	, DT400.C104
	, DT401.C830
	, DT398.C1127
	, DT401.C831
	, DT399.C449
	, DT398.C1116
FROM
	(
		T69 DT401
	INNER JOIN
		(
			(
				T40 DT399
			INNER JOIN
				T7 DT400
			ON
				DT399.C450 = DT400.C97
			)
		INNER JOIN
			(
				T92 DT398
			INNER JOIN
				T39 DT397
			ON
				DT398.C1129 = DT397.C445
			)
		ON
			DT400.C106 = DT398.C1115
		)
	ON
		DT401.C826 = DT400.C99
	)
WHERE
	(
		(
			DT398.C1127 <> DT398.C1117
		)
		OR
		(
			DT400.C91 = DT400.C92
		)
	)
	OR
	(
		DT400.C103 = DT400.C104
	)
ORDER BY
	DT400.C90
	, DT400.C98
	, DT398.C1130
	, DT397.C445
	, DT398.C1134
	, DT401.C838
	, DT401.C835
	, DT401.C829
	, DT400.C96
	, DT401.C836
	, DT401.C833
	, DT401.C827
	, DT400.C99
	, DT398.C1123
	, DT400.C109
	, DT398.C1126
	, DT398.C1122
	, DT398.C1135
	, DT398.C1115
	, DT400.C101
	, DT400.C92
	, DT398.C1124
	, DT398.C1117
	, DT399.C450
	, DT401.C826
	, DT400.C97
	, DT398.C1132
	, DT400.C103
	, DT400.C91
	, DT398.C1120
	, DT401.C837
	, DT397.C446
	, DT399.C447
	, DT398.C1121
	, DT400.C105
	, DT398.C1129
	, DT400.C93
	, DT399.C448
	, DT400.C104
	, DT401.C830
	, DT398.C1127
	, DT401.C831
	, DT399.C449
	, DT398.C1116
LIMIT 711;


SELECT
	DT405.C1096
	, DT405.C1109
	, DT402.C272
FROM
	(
		(
			(
				T23 DT402
			INNER JOIN
				T96 DT403
			ON
				DT402.C274 = DT403.C1188
			)
		INNER JOIN
			T62 DT404
		ON
			DT402.C274 <> DT404.C740
		)
	INNER JOIN
		T91 DT405
	ON
		DT403.C1184 < DT405.C1093
	)
WHERE
	(
		(
			DT402.C273 = DT405.C1110
		)
		OR
		(
			DT405.C1109 = DT402.C275
		)
	)
	OR
	(
		(
			DT402.C270 <> DT403.C1183
		)
		AND
		(
			(
				DT403.C1181 = DT402.C276
			)
			OR
			(
				DT403.C1185 = DT405.C1096
			)
		)
	)
ORDER BY
	DT405.C1096
	, DT405.C1109
	, DT402.C272
LIMIT 696;


SELECT
	DT408.C814
	, DT406.C457
	, DT406.C470
	, DT406.C465
	, DT406.C455
	, DT406.C467
	, DT409.C15
	, DT406.C461
	, DT409.C30
	, DT409.C26
	, DT409.C17
	, DT408.C819
	, DT406.C464
	, DT409.C23
	, DT406.C453
	, DT409.C24
	, DT409.C16
	, DT407.C2
	, DT409.C18
	, DT406.C468
	, DT406.C456
	, DT406.C452
	, DT408.C815
	, DT408.C812
	, DT406.C451
	, DT406.C463
	, DT409.C19
	, DT408.C810
	, DT408.C809
	, DT408.C813
	, DT406.C471
	, DT409.C29
FROM
	(
		(
			T41 DT406
		INNER JOIN
			T67 DT408
		ON
			DT406.C460 > DT408.C809
		)
	INNER JOIN
		(
			T0 DT407
		INNER JOIN
			T2 DT409
		ON
			DT407.C1 = DT409.C22
		)
	ON
		DT406.C461 < DT407.C2
	)
WHERE
	(
		(
			DT406.C471 > DT409.C15
		)
		OR
		(
			DT406.C465 = DT406.C457
		)
	)
	AND
	(
		DT408.C813 > DT408.C818
	)
ORDER BY
	DT408.C814
	, DT406.C457
	, DT406.C470
	, DT406.C465
	, DT406.C455
	, DT406.C467
	, DT409.C15
	, DT406.C461
	, DT409.C30
	, DT409.C26
	, DT409.C17
	, DT408.C819
	, DT406.C464
	, DT409.C23
	, DT406.C453
	, DT409.C24
	, DT409.C16
	, DT407.C2
	, DT409.C18
	, DT406.C468
	, DT406.C456
	, DT406.C452
	, DT408.C815
	, DT408.C812
	, DT406.C451
	, DT406.C463
	, DT409.C19
	, DT408.C810
	, DT408.C809
	, DT408.C813
	, DT406.C471
	, DT409.C29
LIMIT 939;


SELECT
	DT412.C270
	, DT413.C320
	, DT412.C278
	, DT410.C440
	, DT414.C213
	, DT413.C319
	, DT413.C325
	, DT412.C274
	, DT414.C215
	, DT413.C322
	, DT414.C207
	, DT412.C275
	, DT413.C324
	, DT413.C326
	, DT414.C212
	, DT414.C209
	, DT413.C327
	, DT414.C216
	, DT411.C450
	, DT412.C272
	, DT411.C447
	, DT413.C323
FROM
	(
		(
			T17 DT414
		INNER JOIN
			(
				T23 DT412
			INNER JOIN
				T40 DT411
			ON
				DT412.C275 > DT411.C449
			)
		ON
			DT414.C210 <> DT412.C278
		)
	INNER JOIN
		(
			T27 DT413
		INNER JOIN
			T37 DT410
		ON
			DT413.C324 = DT410.C438
		)
	ON
		DT412.C276 <> DT413.C325
	)
WHERE
	(
		DT412.C274 = DT412.C272
	)
	OR
	(
		(
			DT411.C450 = DT414.C210
		)
		OR
		(
			DT413.C327 = DT413.C327
		)
	)
ORDER BY
	DT412.C270
	, DT413.C320
	, DT412.C278
	, DT410.C440
	, DT414.C213
	, DT413.C319
	, DT413.C325
	, DT412.C274
	, DT414.C215
	, DT413.C322
	, DT414.C207
	, DT412.C275
	, DT413.C324
	, DT413.C326
	, DT414.C212
	, DT414.C209
	, DT413.C327
	, DT414.C216
	, DT411.C450
	, DT412.C272
	, DT411.C447
	, DT413.C323
LIMIT 712;


SELECT
	DT415.C777
	, DT415.C771
	, DT415.C769
	, DT415.C767
	, DT416.C204
	, DT416.C200
	, DT415.C774
	, DT416.C206
	, DT415.C764
	, DT416.C203
	, DT415.C768
	, DT415.C778
	, DT415.C782
	, DT415.C779
	, DT415.C770
FROM
	(
		T64 DT415
	INNER JOIN
		T16 DT416
	ON
		DT415.C764 < DT416.C201
	)
WHERE
	(
		(
			DT415.C777 = DT415.C772
		)
		OR
		(
			DT416.C206 = DT415.C770
		)
	)
	OR
	(
		DT415.C776 = DT416.C200
	)
ORDER BY
	DT415.C777
	, DT415.C771
	, DT415.C769
	, DT415.C767
	, DT416.C204
	, DT416.C200
	, DT415.C774
	, DT416.C206
	, DT415.C764
	, DT416.C203
	, DT415.C768
	, DT415.C778
	, DT415.C782
	, DT415.C779
	, DT415.C770
LIMIT 628;


SELECT
	DT420.C1015
	, DT420.C1025
	, DT419.C655
	, DT420.C1018
	, DT420.C1021
	, DT420.C1020
	, DT418.C407
	, DT420.C1028
	, DT418.C403
	, DT418.C410
	, DT420.C1024
	, DT417.C822
	, DT420.C1010
	, DT418.C406
	, DT418.C408
	, DT420.C1027
	, DT420.C1014
	, DT417.C821
	, DT420.C1009
	, DT420.C1008
	, DT420.C1022
	, DT420.C1011
	, DT420.C1019
	, DT420.C1012
	, DT418.C404
	, DT420.C1017
	, DT418.C405
	, DT420.C1026
	, DT419.C656
	, DT420.C1023
	, DT420.C1013
	, DT419.C654
	, DT417.C823
FROM
	(
		T34 DT418
	INNER JOIN
		(
			T84 DT420
		INNER JOIN
			(
				T54 DT419
			INNER JOIN
				T68 DT417
			ON
				DT419.C654 = DT417.C823
			)
		ON
			DT420.C1012 > DT419.C655
		)
	ON
		DT418.C406 = DT420.C1008
	)
WHERE
	(
		(
			(
				DT420.C1021 = DT420.C1008
			)
			OR
			(
				DT417.C821 > DT420.C1013
			)
		)
		AND
		(
			DT420.C1019 <> DT420.C1020
		)
	)
	OR
	(
		DT418.C403 = DT420.C1015
	)
ORDER BY
	DT420.C1015
	, DT420.C1025
	, DT419.C655
	, DT420.C1018
	, DT420.C1021
	, DT420.C1020
	, DT418.C407
	, DT420.C1028
	, DT418.C403
	, DT418.C410
	, DT420.C1024
	, DT417.C822
	, DT420.C1010
	, DT418.C406
	, DT418.C408
	, DT420.C1027
	, DT420.C1014
	, DT417.C821
	, DT420.C1009
	, DT420.C1008
	, DT420.C1022
	, DT420.C1011
	, DT420.C1019
	, DT420.C1012
	, DT418.C404
	, DT420.C1017
	, DT418.C405
	, DT420.C1026
	, DT419.C656
	, DT420.C1023
	, DT420.C1013
	, DT419.C654
	, DT417.C823
LIMIT 406;


SELECT
	DT421.C1052
	, DT421.C1053
	, DT421.C1047
	, DT422.C597
	, DT422.C599
FROM
	(
		T49 DT422
	INNER JOIN
		T86 DT421
	ON
		DT422.C599 < DT421.C1054
	)
WHERE
	(
		DT422.C592 > DT422.C597
	)
	OR
	(
		DT421.C1049 = DT422.C590
	)
ORDER BY
	DT421.C1052
	, DT421.C1053
	, DT421.C1047
	, DT422.C597
	, DT422.C599
LIMIT 835;


SELECT
	DT423.C213
	, DT423.C209
	, DT423.C218
	, DT423.C211
	, DT424.C324
	, DT423.C217
	, DT425.C441
	, DT423.C216
	, DT423.C208
	, DT425.C442
	, DT424.C319
	, DT425.C443
FROM
	(
		(
			T38 DT425
		INNER JOIN
			T17 DT423
		ON
			DT425.C443 = DT423.C210
		)
	INNER JOIN
		T27 DT424
	ON
		DT423.C215 > DT424.C319
	)
WHERE
	(
		DT423.C218 > DT423.C218
	)
	AND
	(
		DT423.C215 = DT423.C211
	)
ORDER BY
	DT423.C213
	, DT423.C209
	, DT423.C218
	, DT423.C211
	, DT424.C324
	, DT423.C217
	, DT425.C441
	, DT423.C216
	, DT423.C208
	, DT425.C442
	, DT424.C319
	, DT425.C443
LIMIT 281;


SELECT
	DT427.C1190
	, DT428.C60
	, DT426.C545
	, DT426.C535
	, DT428.C56
	, DT426.C529
	, DT426.C544
	, DT427.C1199
	, DT428.C58
	, DT428.C57
	, DT426.C530
	, DT426.C547
	, DT426.C541
	, DT427.C1191
	, DT426.C539
	, DT427.C1195
	, DT428.C62
	, DT426.C528
	, DT426.C534
	, DT427.C1192
	, DT427.C1198
	, DT428.C54
	, DT427.C1197
	, DT428.C59
	, DT426.C537
	, DT427.C1200
FROM
	(
		T97 DT427
	INNER JOIN
		(
			T4 DT428
		INNER JOIN
			T46 DT426
		ON
			DT428.C58 = DT426.C547
		)
	ON
		DT427.C1192 < DT426.C541
	)
WHERE
	(
		DT426.C529 = DT427.C1192
	)
	AND
	(
		DT427.C1191 <> DT426.C537
	)
ORDER BY
	DT427.C1190
	, DT428.C60
	, DT426.C545
	, DT426.C535
	, DT428.C56
	, DT426.C529
	, DT426.C544
	, DT427.C1199
	, DT428.C58
	, DT428.C57
	, DT426.C530
	, DT426.C547
	, DT426.C541
	, DT427.C1191
	, DT426.C539
	, DT427.C1195
	, DT428.C62
	, DT426.C528
	, DT426.C534
	, DT427.C1192
	, DT427.C1198
	, DT428.C54
	, DT427.C1197
	, DT428.C59
	, DT426.C537
	, DT427.C1200
LIMIT 756;


SELECT
	DT431.C197
	, DT429.C1085
	, DT431.C189
FROM
	(
		(
			T0 DT430
		INNER JOIN
			T90 DT429
		ON
			DT430.C1 = DT429.C1079
		)
	INNER JOIN
		T15 DT431
	ON
		DT429.C1091 < DT431.C187
	)
WHERE
	(
		DT429.C1084 < DT431.C188
	)
	AND
	(
		(
			DT429.C1088 <> DT430.C0
		)
		AND
		(
			DT430.C2 = DT429.C1090
		)
	)
ORDER BY
	DT431.C197
	, DT429.C1085
	, DT431.C189
LIMIT 411;


SELECT
	DT434.C24
	, DT434.C27
	, DT434.C30
	, DT432.C599
	, DT434.C22
	, DT433.C268
	, DT433.C269
	, DT432.C598
	, DT434.C21
	, DT432.C593
	, DT434.C15
	, DT434.C26
	, DT434.C17
	, DT432.C594
	, DT432.C595
	, DT432.C596
	, DT432.C588
	, DT434.C20
	, DT432.C587
	, DT434.C16
	, DT432.C590
	, DT432.C592
	, DT433.C267
	, DT432.C597
	, DT433.C261
	, DT434.C19
	, DT434.C28
	, DT433.C262
	, DT433.C265
	, DT432.C586
	, DT434.C31
	, DT434.C23
	, DT432.C589
	, DT433.C263
FROM
	(
		(
			T22 DT433
		INNER JOIN
			T49 DT432
		ON
			DT433.C262 < DT432.C595
		)
	INNER JOIN
		T2 DT434
	ON
		DT432.C599 <> DT434.C30
	)
WHERE
	(
		DT433.C264 > DT434.C22
	)
	AND
	(
		(
			(
				DT433.C269 = DT432.C592
			)
			AND
			(
				DT434.C31 = DT434.C18
			)
		)
		AND
		(
			DT432.C587 = DT432.C599
		)
	)
ORDER BY
	DT434.C24
	, DT434.C27
	, DT434.C30
	, DT432.C599
	, DT434.C22
	, DT433.C268
	, DT433.C269
	, DT432.C598
	, DT434.C21
	, DT432.C593
	, DT434.C15
	, DT434.C26
	, DT434.C17
	, DT432.C594
	, DT432.C595
	, DT432.C596
	, DT432.C588
	, DT434.C20
	, DT432.C587
	, DT434.C16
	, DT432.C590
	, DT432.C592
	, DT433.C267
	, DT432.C597
	, DT433.C261
	, DT434.C19
	, DT434.C28
	, DT433.C262
	, DT433.C265
	, DT432.C586
	, DT434.C31
	, DT434.C23
	, DT432.C589
	, DT433.C263
LIMIT 826;


SELECT
	DT435.C1047
	, DT435.C1051
	, DT436.C343
FROM
	(
		T30 DT436
	INNER JOIN
		T86 DT435
	ON
		DT436.C343 = DT435.C1047
	)
WHERE
	(
		(
			DT435.C1054 <> DT435.C1049
		)
		OR
		(
			(
				DT435.C1053 > DT435.C1055
			)
			AND
			(
				DT435.C1052 > DT435.C1052
			)
		)
	)
	OR
	(
		DT435.C1048 = DT435.C1050
	)
ORDER BY
	DT435.C1047
	, DT435.C1051
	, DT436.C343
LIMIT 794;


SELECT
	DT438.C1112
	, DT438.C1106
	, DT437.C1047
	, DT438.C1095
	, DT437.C1052
	, DT437.C1050
	, DT438.C1104
	, DT437.C1055
	, DT438.C1108
	, DT438.C1101
	, DT438.C1100
	, DT438.C1096
	, DT437.C1051
	, DT437.C1049
	, DT438.C1113
	, DT438.C1099
	, DT438.C1102
FROM
	(
		T86 DT437
	INNER JOIN
		T91 DT438
	ON
		DT437.C1048 = DT438.C1099
	)
WHERE
	(
		(
			DT437.C1052 > DT438.C1098
		)
		AND
		(
			DT437.C1053 = DT437.C1054
		)
	)
	OR
	(
		DT438.C1114 > DT438.C1098
	)
ORDER BY
	DT438.C1112
	, DT438.C1106
	, DT437.C1047
	, DT438.C1095
	, DT437.C1052
	, DT437.C1050
	, DT438.C1104
	, DT437.C1055
	, DT438.C1108
	, DT438.C1101
	, DT438.C1100
	, DT438.C1096
	, DT437.C1051
	, DT437.C1049
	, DT438.C1113
	, DT438.C1099
	, DT438.C1102
LIMIT 568;


SELECT
	DT440.C169
	, DT439.C632
	, DT440.C175
	, DT439.C629
	, DT440.C171
	, DT439.C627
	, DT439.C628
	, DT440.C170
	, DT440.C174
	, DT440.C168
	, DT440.C176
	, DT440.C178
	, DT440.C165
	, DT440.C179
	, DT439.C626
	, DT440.C166
	, DT440.C177
	, DT439.C634
	, DT440.C172
	, DT439.C630
	, DT440.C167
	, DT440.C164
	, DT439.C625
	, DT439.C631
FROM
	(
		T13 DT440
	INNER JOIN
		T52 DT439
	ON
		DT440.C177 < DT439.C630
	)
WHERE
	(
		DT440.C174 > DT440.C178
	)
	OR
	(
		DT439.C635 = DT440.C167
	)
ORDER BY
	DT440.C169
	, DT439.C632
	, DT440.C175
	, DT439.C629
	, DT440.C171
	, DT439.C627
	, DT439.C628
	, DT440.C170
	, DT440.C174
	, DT440.C168
	, DT440.C176
	, DT440.C178
	, DT440.C165
	, DT440.C179
	, DT439.C626
	, DT440.C166
	, DT440.C177
	, DT439.C634
	, DT440.C172
	, DT439.C630
	, DT440.C167
	, DT440.C164
	, DT439.C625
	, DT439.C631
LIMIT 140;


SELECT
	DT441.C253
	, DT442.C1005
	, DT442.C1007
	, DT441.C251
	, DT442.C1002
	, DT441.C252
	, DT441.C254
FROM
	(
		T83 DT442
	INNER JOIN
		T21 DT441
	ON
		DT442.C1002 = DT441.C251
	)
WHERE
	(
		DT442.C1001 = DT441.C247
	)
	AND
	(
		DT441.C247 = DT442.C1006
	)
ORDER BY
	DT441.C253
	, DT442.C1005
	, DT442.C1007
	, DT441.C251
	, DT442.C1002
	, DT441.C252
	, DT441.C254
LIMIT 534;


SELECT
	DT447.C1091
	, DT446.C865
	, DT447.C1081
	, DT443.C502
	, DT447.C1087
	, DT444.C1203
	, DT445.C716
	, DT445.C714
	, DT447.C1084
	, DT446.C862
	, DT446.C864
	, DT443.C503
	, DT443.C509
	, DT447.C1083
	, DT444.C1202
	, DT443.C504
	, DT446.C860
	, DT446.C866
	, DT447.C1089
	, DT443.C505
	, DT443.C506
	, DT447.C1090
	, DT447.C1092
	, DT445.C713
	, DT443.C510
	, DT447.C1086
	, DT443.C507
	, DT443.C511
	, DT447.C1079
	, DT447.C1080
	, DT447.C1088
	, DT446.C861
	, DT447.C1082
	, DT444.C1201
	, DT447.C1085
	, DT446.C863
	, DT445.C715
	, DT443.C508
FROM
	(
		T59 DT445
	INNER JOIN
		(
			(
				T44 DT443
			INNER JOIN
				(
					T90 DT447
				INNER JOIN
					T71 DT446
				ON
					DT447.C1082 > DT446.C866
				)
			ON
				DT443.C510 > DT447.C1083
			)
		INNER JOIN
			T98 DT444
		ON
			DT446.C864 = DT444.C1201
		)
	ON
		DT445.C716 <> DT447.C1088
	)
WHERE
	(
		(
			DT447.C1079 <> DT447.C1092
		)
		OR
		(
			DT447.C1088 < DT443.C505
		)
	)
	OR
	(
		(
			DT447.C1088 = DT446.C861
		)
		AND
		(
			DT447.C1090 <> DT447.C1085
		)
	)
ORDER BY
	DT447.C1091
	, DT446.C865
	, DT447.C1081
	, DT443.C502
	, DT447.C1087
	, DT444.C1203
	, DT445.C716
	, DT445.C714
	, DT447.C1084
	, DT446.C862
	, DT446.C864
	, DT443.C503
	, DT443.C509
	, DT447.C1083
	, DT444.C1202
	, DT443.C504
	, DT446.C860
	, DT446.C866
	, DT447.C1089
	, DT443.C505
	, DT443.C506
	, DT447.C1090
	, DT447.C1092
	, DT445.C713
	, DT443.C510
	, DT447.C1086
	, DT443.C507
	, DT443.C511
	, DT447.C1079
	, DT447.C1080
	, DT447.C1088
	, DT446.C861
	, DT447.C1082
	, DT444.C1201
	, DT447.C1085
	, DT446.C863
	, DT445.C715
	, DT443.C508
LIMIT 466;


SELECT
	DT449.C237
	, DT449.C245
	, DT450.C940
	, DT448.C1057
	, DT449.C244
	, DT448.C1056
	, DT449.C235
	, DT450.C938
	, DT449.C233
FROM
	(
		(
			T87 DT448
		INNER JOIN
			T76 DT450
		ON
			DT448.C1059 = DT450.C938
		)
	INNER JOIN
		T20 DT449
	ON
		DT450.C943 > DT449.C244
	)
WHERE
	(
		DT448.C1059 <> DT449.C239
	)
	AND
	(
		DT448.C1057 <> DT450.C943
	)
ORDER BY
	DT449.C237
	, DT449.C245
	, DT450.C940
	, DT448.C1057
	, DT449.C244
	, DT448.C1056
	, DT449.C235
	, DT450.C938
	, DT449.C233
LIMIT 393;


SELECT
	DT452.C391
	, DT452.C389
	, DT451.C512
	, DT451.C517
	, DT451.C524
	, DT451.C527
	, DT451.C526
	, DT451.C523
	, DT452.C398
	, DT452.C388
	, DT452.C386
	, DT452.C383
	, DT452.C396
	, DT452.C401
	, DT452.C399
	, DT451.C522
	, DT452.C400
	, DT452.C390
	, DT452.C385
	, DT451.C515
	, DT451.C513
	, DT451.C520
	, DT452.C384
	, DT452.C394
	, DT451.C521
	, DT451.C519
FROM
	(
		T45 DT451
	INNER JOIN
		T33 DT452
	ON
		DT451.C518 > DT452.C383
	)
WHERE
	(
		DT451.C521 > DT451.C515
	)
	OR
	(
		DT451.C527 <> DT451.C513
	)
ORDER BY
	DT452.C391
	, DT452.C389
	, DT451.C512
	, DT451.C517
	, DT451.C524
	, DT451.C527
	, DT451.C526
	, DT451.C523
	, DT452.C398
	, DT452.C388
	, DT452.C386
	, DT452.C383
	, DT452.C396
	, DT452.C401
	, DT452.C399
	, DT451.C522
	, DT452.C400
	, DT452.C390
	, DT452.C385
	, DT451.C515
	, DT451.C513
	, DT451.C520
	, DT452.C384
	, DT452.C394
	, DT451.C521
	, DT451.C519
LIMIT 550;


SELECT
	DT454.C1134
	, DT456.C221
	, DT453.C356
	, DT455.C660
	, DT455.C662
	, DT457.C1139
	, DT457.C1143
	, DT456.C224
	, DT454.C1129
	, DT456.C220
	, DT454.C1132
	, DT454.C1115
	, DT453.C347
	, DT454.C1127
	, DT453.C346
	, DT454.C1121
	, DT454.C1131
	, DT453.C355
	, DT453.C351
	, DT455.C666
	, DT455.C659
	, DT454.C1122
	, DT454.C1125
	, DT453.C350
	, DT454.C1130
	, DT453.C344
	, DT457.C1137
	, DT455.C661
	, DT453.C363
	, DT455.C663
	, DT455.C665
	, DT457.C1144
	, DT456.C229
	, DT453.C353
	, DT456.C222
	, DT457.C1138
	, DT453.C345
	, DT454.C1120
	, DT453.C354
	, DT454.C1133
	, DT453.C357
	, DT456.C219
	, DT454.C1118
	, DT454.C1116
	, DT453.C360
	, DT453.C348
	, DT453.C362
	, DT453.C349
	, DT457.C1140
	, DT455.C667
	, DT454.C1128
	, DT454.C1119
	, DT455.C658
	, DT454.C1124
	, DT457.C1142
	, DT457.C1141
	, DT453.C359
	, DT453.C352
	, DT453.C361
	, DT456.C225
	, DT457.C1136
	, DT454.C1123
	, DT453.C358
	, DT454.C1135
	, DT456.C223
	, DT454.C1117
	, DT456.C227
FROM
	(
		T55 DT455
	INNER JOIN
		(
			(
				(
					T31 DT453
				INNER JOIN
					T93 DT457
				ON
					DT453.C358 = DT457.C1142
				)
			INNER JOIN
				T92 DT454
			ON
				DT453.C362 < DT454.C1115
			)
		INNER JOIN
			T18 DT456
		ON
			DT454.C1125 < DT456.C225
		)
	ON
		DT455.C667 = DT454.C1115
	)
WHERE
	(
		DT454.C1129 = DT453.C350
	)
	OR
	(
		DT453.C353 <> DT454.C1135
	)
ORDER BY
	DT454.C1134
	, DT456.C221
	, DT453.C356
	, DT455.C660
	, DT455.C662
	, DT457.C1139
	, DT457.C1143
	, DT456.C224
	, DT454.C1129
	, DT456.C220
	, DT454.C1132
	, DT454.C1115
	, DT453.C347
	, DT454.C1127
	, DT453.C346
	, DT454.C1121
	, DT454.C1131
	, DT453.C355
	, DT453.C351
	, DT455.C666
	, DT455.C659
	, DT454.C1122
	, DT454.C1125
	, DT453.C350
	, DT454.C1130
	, DT453.C344
	, DT457.C1137
	, DT455.C661
	, DT453.C363
	, DT455.C663
	, DT455.C665
	, DT457.C1144
	, DT456.C229
	, DT453.C353
	, DT456.C222
	, DT457.C1138
	, DT453.C345
	, DT454.C1120
	, DT453.C354
	, DT454.C1133
	, DT453.C357
	, DT456.C219
	, DT454.C1118
	, DT454.C1116
	, DT453.C360
	, DT453.C348
	, DT453.C362
	, DT453.C349
	, DT457.C1140
	, DT455.C667
	, DT454.C1128
	, DT454.C1119
	, DT455.C658
	, DT454.C1124
	, DT457.C1142
	, DT457.C1141
	, DT453.C359
	, DT453.C352
	, DT453.C361
	, DT456.C225
	, DT457.C1136
	, DT454.C1123
	, DT453.C358
	, DT454.C1135
	, DT456.C223
	, DT454.C1117
	, DT456.C227
LIMIT 597;


SELECT
	DT460.C941
	, DT458.C214
	, DT460.C945
	, DT461.C343
	, DT459.C851
	, DT462.C113
	, DT458.C208
	, DT459.C856
	, DT458.C218
	, DT462.C120
	, DT460.C940
	, DT459.C855
	, DT462.C114
	, DT462.C123
	, DT461.C341
	, DT459.C857
	, DT462.C125
	, DT459.C849
	, DT458.C216
	, DT459.C848
	, DT458.C217
	, DT459.C852
	, DT459.C841
	, DT459.C853
	, DT458.C211
	, DT458.C215
	, DT461.C342
	, DT458.C210
	, DT459.C854
	, DT460.C938
	, DT459.C839
	, DT459.C847
	, DT462.C124
	, DT460.C942
	, DT462.C110
	, DT462.C117
	, DT462.C122
	, DT459.C858
	, DT460.C946
	, DT462.C115
	, DT462.C118
	, DT459.C842
	, DT458.C212
	, DT460.C939
	, DT459.C845
	, DT458.C213
	, DT459.C846
	, DT459.C844
FROM
	(
		(
			T17 DT458
		INNER JOIN
			T8 DT462
		ON
			DT458.C210 > DT462.C119
		)
	INNER JOIN
		(
			(
				T76 DT460
			INNER JOIN
				T30 DT461
			ON
				DT460.C946 = DT461.C343
			)
		INNER JOIN
			T70 DT459
		ON
			DT460.C941 > DT459.C854
		)
	ON
		DT458.C210 <> DT460.C945
	)
WHERE
	(
		DT459.C839 <> DT462.C113
	)
	OR
	(
		DT462.C117 = DT462.C114
	)
ORDER BY
	DT460.C941
	, DT458.C214
	, DT460.C945
	, DT461.C343
	, DT459.C851
	, DT462.C113
	, DT458.C208
	, DT459.C856
	, DT458.C218
	, DT462.C120
	, DT460.C940
	, DT459.C855
	, DT462.C114
	, DT462.C123
	, DT461.C341
	, DT459.C857
	, DT462.C125
	, DT459.C849
	, DT458.C216
	, DT459.C848
	, DT458.C217
	, DT459.C852
	, DT459.C841
	, DT459.C853
	, DT458.C211
	, DT458.C215
	, DT461.C342
	, DT458.C210
	, DT459.C854
	, DT460.C938
	, DT459.C839
	, DT459.C847
	, DT462.C124
	, DT460.C942
	, DT462.C110
	, DT462.C117
	, DT462.C122
	, DT459.C858
	, DT460.C946
	, DT462.C115
	, DT462.C118
	, DT459.C842
	, DT458.C212
	, DT460.C939
	, DT459.C845
	, DT458.C213
	, DT459.C846
	, DT459.C844
LIMIT 213;


SELECT
	DT464.C157
	, DT466.C601
	, DT466.C602
	, DT466.C603
	, DT465.C72
	, DT465.C74
	, DT465.C69
	, DT463.C600
	, DT465.C73
	, DT466.C607
	, DT464.C158
	, DT464.C163
	, DT463.C607
	, DT465.C68
	, DT464.C162
	, DT464.C161
	, DT463.C603
	, DT463.C602
	, DT464.C159
	, DT463.C605
	, DT466.C606
	, DT466.C605
	, DT465.C67
	, DT466.C600
	, DT463.C606
	, DT463.C601
	, DT464.C160
	, DT465.C70
	, DT465.C66
FROM
	(
		T12 DT464
	INNER JOIN
		(
			(
				T50 DT466
			INNER JOIN
				T50 DT463
			ON
				DT466.C602 = DT463.C600
			)
		INNER JOIN
			T5 DT465
		ON
			DT463.C601 > DT465.C70
		)
	ON
		DT464.C157 <> DT466.C605
	)
WHERE
	(
		(
			DT463.C602 < DT463.C605
		)
		AND
		(
			DT465.C66 <> DT466.C604
		)
	)
	AND
	(
		(
			DT465.C72 <> DT464.C163
		)
		AND
		(
			DT464.C157 = DT465.C72
		)
	)
ORDER BY
	DT464.C157
	, DT466.C601
	, DT466.C602
	, DT466.C603
	, DT465.C72
	, DT465.C74
	, DT465.C69
	, DT463.C600
	, DT465.C73
	, DT466.C607
	, DT464.C158
	, DT464.C163
	, DT463.C607
	, DT465.C68
	, DT464.C162
	, DT464.C161
	, DT463.C603
	, DT463.C602
	, DT464.C159
	, DT463.C605
	, DT466.C606
	, DT466.C605
	, DT465.C67
	, DT466.C600
	, DT463.C606
	, DT463.C601
	, DT464.C160
	, DT465.C70
	, DT465.C66
LIMIT 169;


SELECT
	DT467.C1179
	, DT467.C1181
	, DT469.C183
	, DT468.C976
	, DT467.C1183
	, DT468.C968
	, DT468.C975
	, DT468.C966
	, DT469.C181
	, DT468.C971
	, DT467.C1176
	, DT468.C972
	, DT467.C1188
	, DT467.C1187
	, DT467.C1180
	, DT469.C185
	, DT467.C1182
	, DT469.C184
	, DT468.C969
	, DT468.C967
	, DT468.C973
	, DT468.C965
	, DT469.C180
	, DT468.C977
	, DT467.C1186
	, DT468.C970
	, DT467.C1178
	, DT468.C978
	, DT467.C1189
	, DT468.C974
	, DT467.C1177
FROM
	(
		T78 DT468
	INNER JOIN
		(
			T96 DT467
		INNER JOIN
			T14 DT469
		ON
			DT467.C1176 = DT469.C185
		)
	ON
		DT468.C973 > DT467.C1186
	)
WHERE
	(
		(
			DT467.C1186 <> DT468.C968
		)
		AND
		(
			(
				DT467.C1179 = DT467.C1184
			)
			AND
			(
				DT468.C977 = DT469.C182
			)
		)
	)
	AND
	(
		(
			DT469.C183 < DT468.C973
		)
		AND
		(
			DT467.C1180 = DT467.C1179
		)
	)
ORDER BY
	DT467.C1179
	, DT467.C1181
	, DT469.C183
	, DT468.C976
	, DT467.C1183
	, DT468.C968
	, DT468.C975
	, DT468.C966
	, DT469.C181
	, DT468.C971
	, DT467.C1176
	, DT468.C972
	, DT467.C1188
	, DT467.C1187
	, DT467.C1180
	, DT469.C185
	, DT467.C1182
	, DT469.C184
	, DT468.C969
	, DT468.C967
	, DT468.C973
	, DT468.C965
	, DT469.C180
	, DT468.C977
	, DT467.C1186
	, DT468.C970
	, DT467.C1178
	, DT468.C978
	, DT467.C1189
	, DT468.C974
	, DT467.C1177
LIMIT 875;


SELECT
	DT472.C876
	, DT473.C129
	, DT472.C878
	, DT472.C879
	, DT471.C1054
	, DT472.C887
	, DT472.C868
	, DT473.C132
	, DT474.C1191
	, DT470.C86
	, DT470.C81
	, DT474.C1198
	, DT471.C1048
	, DT470.C80
	, DT472.C881
	, DT472.C885
FROM
	(
		T6 DT470
	INNER JOIN
		(
			T9 DT473
		INNER JOIN
			(
				T86 DT471
			INNER JOIN
				(
					T97 DT474
				INNER JOIN
					T72 DT472
				ON
					DT474.C1193 = DT472.C885
				)
			ON
				DT471.C1054 = DT472.C877
			)
		ON
			DT473.C126 = DT471.C1054
		)
	ON
		DT470.C77 <> DT471.C1055
	)
WHERE
	(
		DT473.C128 = DT474.C1196
	)
	AND
	(
		(
			(
				DT473.C126 = DT472.C871
			)
			OR
			(
				DT472.C873 > DT472.C879
			)
		)
		OR
		(
			(
				DT474.C1193 = DT472.C872
			)
			OR
			(
				DT474.C1190 < DT472.C882
			)
		)
	)
ORDER BY
	DT472.C876
	, DT473.C129
	, DT472.C878
	, DT472.C879
	, DT471.C1054
	, DT472.C887
	, DT472.C868
	, DT473.C132
	, DT474.C1191
	, DT470.C86
	, DT470.C81
	, DT474.C1198
	, DT471.C1048
	, DT470.C80
	, DT472.C881
	, DT472.C885
LIMIT 410;


SELECT
	DT479.C994
	, DT475.C212
	, DT476.C1143
	, DT477.C754
	, DT479.C993
	, DT477.C753
	, DT477.C746
	, DT478.C544
	, DT476.C1137
	, DT475.C208
	, DT477.C758
	, DT477.C752
	, DT477.C759
	, DT477.C755
	, DT478.C537
	, DT477.C743
	, DT478.C547
	, DT476.C1140
	, DT477.C748
	, DT475.C210
	, DT477.C763
	, DT478.C533
	, DT478.C531
	, DT477.C745
	, DT477.C751
	, DT478.C546
	, DT478.C543
	, DT476.C1141
	, DT475.C216
	, DT475.C213
	, DT478.C532
	, DT475.C214
	, DT478.C529
	, DT475.C209
	, DT477.C744
	, DT478.C536
	, DT476.C1142
	, DT476.C1144
	, DT479.C990
	, DT478.C545
	, DT477.C756
	, DT477.C747
	, DT479.C991
FROM
	(
		T63 DT477
	INNER JOIN
		(
			(
				T81 DT479
			INNER JOIN
				T17 DT475
			ON
				DT479.C993 = DT475.C210
			)
		INNER JOIN
			(
				T93 DT476
			INNER JOIN
				T46 DT478
			ON
				DT476.C1142 = DT478.C539
			)
		ON
			DT475.C209 <> DT478.C536
		)
	ON
		DT477.C753 = DT478.C540
	)
WHERE
	(
		DT475.C208 = DT478.C535
	)
	OR
	(
		DT477.C746 = DT479.C990
	)
ORDER BY
	DT479.C994
	, DT475.C212
	, DT476.C1143
	, DT477.C754
	, DT479.C993
	, DT477.C753
	, DT477.C746
	, DT478.C544
	, DT476.C1137
	, DT475.C208
	, DT477.C758
	, DT477.C752
	, DT477.C759
	, DT477.C755
	, DT478.C537
	, DT477.C743
	, DT478.C547
	, DT476.C1140
	, DT477.C748
	, DT475.C210
	, DT477.C763
	, DT478.C533
	, DT478.C531
	, DT477.C745
	, DT477.C751
	, DT478.C546
	, DT478.C543
	, DT476.C1141
	, DT475.C216
	, DT475.C213
	, DT478.C532
	, DT475.C214
	, DT478.C529
	, DT475.C209
	, DT477.C744
	, DT478.C536
	, DT476.C1142
	, DT476.C1144
	, DT479.C990
	, DT478.C545
	, DT477.C756
	, DT477.C747
	, DT479.C991
LIMIT 331;


SELECT
	DT482.C1194
FROM
	(
		(
			T31 DT480
		INNER JOIN
			T55 DT481
		ON
			DT480.C353 = DT481.C662
		)
	INNER JOIN
		(
			T97 DT482
		INNER JOIN
			T0 DT483
		ON
			DT482.C1199 > DT483.C3
		)
	ON
		DT481.C663 = DT482.C1191
	)
WHERE
	(
		(
			DT480.C346 = DT480.C359
		)
		AND
		(
			DT480.C357 = DT480.C347
		)
	)
	OR
	(
		DT481.C658 < DT482.C1200
	)
ORDER BY
	DT482.C1194
LIMIT 687;


SELECT
	DT488.C1086
	, DT488.C1085
	, DT484.C1202
	, DT486.C193
	, DT487.C248
	, DT488.C1087
	, DT488.C1083
	, DT487.C256
	, DT484.C1201
	, DT487.C258
	, DT486.C192
	, DT487.C253
	, DT488.C1092
	, DT485.C323
	, DT488.C1080
	, DT485.C327
	, DT486.C186
	, DT486.C199
	, DT486.C190
	, DT486.C197
	, DT485.C319
	, DT487.C251
	, DT485.C325
	, DT487.C255
	, DT488.C1082
	, DT485.C320
	, DT488.C1081
	, DT486.C191
	, DT488.C1090
	, DT486.C187
	, DT486.C196
	, DT486.C188
	, DT487.C250
	, DT486.C195
	, DT487.C247
	, DT487.C249
	, DT487.C252
	, DT488.C1088
	, DT486.C194
	, DT486.C198
	, DT485.C326
	, DT488.C1084
	, DT485.C322
FROM
	(
		(
			T15 DT486
		INNER JOIN
			(
				T90 DT488
			INNER JOIN
				T21 DT487
			ON
				DT488.C1092 = DT487.C251
			)
		ON
			DT486.C194 <> DT487.C255
		)
	INNER JOIN
		(
			T27 DT485
		INNER JOIN
			T98 DT484
		ON
			DT485.C325 = DT484.C1203
		)
	ON
		DT486.C197 = DT485.C321
	)
WHERE
	(
		DT488.C1079 = DT486.C191
	)
	AND
	(
		(
			DT488.C1084 = DT487.C257
		)
		OR
		(
			DT485.C324 <> DT487.C253
		)
	)
ORDER BY
	DT488.C1086
	, DT488.C1085
	, DT484.C1202
	, DT486.C193
	, DT487.C248
	, DT488.C1087
	, DT488.C1083
	, DT487.C256
	, DT484.C1201
	, DT487.C258
	, DT486.C192
	, DT487.C253
	, DT488.C1092
	, DT485.C323
	, DT488.C1080
	, DT485.C327
	, DT486.C186
	, DT486.C199
	, DT486.C190
	, DT486.C197
	, DT485.C319
	, DT487.C251
	, DT485.C325
	, DT487.C255
	, DT488.C1082
	, DT485.C320
	, DT488.C1081
	, DT486.C191
	, DT488.C1090
	, DT486.C187
	, DT486.C196
	, DT486.C188
	, DT487.C250
	, DT486.C195
	, DT487.C247
	, DT487.C249
	, DT487.C252
	, DT488.C1088
	, DT486.C194
	, DT486.C198
	, DT485.C326
	, DT488.C1084
	, DT485.C322
LIMIT 326;


SELECT
	DT490.C219
	, DT489.C539
	, DT493.C828
	, DT490.C227
	, DT492.C101
	, DT492.C107
	, DT491.C108
FROM
	(
		T46 DT489
	INNER JOIN
		(
			(
				T7 DT491
			INNER JOIN
				T7 DT492
			ON
				DT491.C97 > DT492.C98
			)
		INNER JOIN
			(
				T69 DT493
			INNER JOIN
				T18 DT490
			ON
				DT493.C837 = DT490.C228
			)
		ON
			DT491.C89 <> DT493.C827
		)
	ON
		DT489.C542 > DT491.C106
	)
WHERE
	(
		DT489.C539 = DT490.C228
	)
	AND
	(
		DT492.C90 <> DT489.C544
	)
ORDER BY
	DT490.C219
	, DT489.C539
	, DT493.C828
	, DT490.C227
	, DT492.C101
	, DT492.C107
	, DT491.C108
LIMIT 711;


SELECT
	DT494.C1140
	, DT494.C1136
	, DT495.C63
	, DT494.C1144
	, DT495.C54
	, DT495.C64
	, DT494.C1138
	, DT495.C56
	, DT495.C60
	, DT495.C57
	, DT494.C1137
FROM
	(
		T93 DT494
	INNER JOIN
		T4 DT495
	ON
		DT494.C1136 > DT495.C61
	)
WHERE
	(
		(
			DT495.C62 = DT494.C1136
		)
		OR
		(
			DT495.C60 > DT495.C61
		)
	)
	OR
	(
		(
			(
				DT495.C56 = DT495.C54
			)
			AND
			(
				DT495.C58 = DT495.C65
			)
		)
		OR
		(
			DT495.C60 < DT495.C56
		)
	)
ORDER BY
	DT494.C1140
	, DT494.C1136
	, DT495.C63
	, DT494.C1144
	, DT495.C54
	, DT495.C64
	, DT494.C1138
	, DT495.C56
	, DT495.C60
	, DT495.C57
	, DT494.C1137
LIMIT 793;


SELECT
	DT497.C7
	, DT496.C625
	, DT498.C146
	, DT498.C138
	, DT498.C151
	, DT498.C140
	, DT496.C626
	, DT496.C635
	, DT497.C9
	, DT498.C150
	, DT498.C147
	, DT496.C629
	, DT496.C630
	, DT496.C631
	, DT497.C4
	, DT496.C628
	, DT498.C148
	, DT498.C143
	, DT496.C632
	, DT497.C11
	, DT498.C142
FROM
	(
		(
			T52 DT496
		INNER JOIN
			T10 DT498
		ON
			DT496.C628 = DT498.C143
		)
	INNER JOIN
		T1 DT497
	ON
		DT498.C147 > DT497.C13
	)
WHERE
	(
		(
			DT498.C140 > DT497.C11
		)
		OR
		(
			DT496.C627 = DT497.C9
		)
	)
	AND
	(
		DT497.C7 <> DT498.C138
	)
ORDER BY
	DT497.C7
	, DT496.C625
	, DT498.C146
	, DT498.C138
	, DT498.C151
	, DT498.C140
	, DT496.C626
	, DT496.C635
	, DT497.C9
	, DT498.C150
	, DT498.C147
	, DT496.C629
	, DT496.C630
	, DT496.C631
	, DT497.C4
	, DT496.C628
	, DT498.C148
	, DT498.C143
	, DT496.C632
	, DT497.C11
	, DT498.C142
LIMIT 970;


SELECT
	DT501.C440
	, DT500.C481
FROM
	(
		(
			(
				T42 DT500
			INNER JOIN
				T37 DT501
			ON
				DT500.C485 <> DT501.C440
			)
		INNER JOIN
			(
				T89 DT503
			INNER JOIN
				T99 DT499
			ON
				DT503.C1076 > DT499.C1207
			)
		ON
			DT500.C486 = DT499.C1206
		)
	INNER JOIN
		T79 DT502
	ON
		DT500.C475 < DT502.C980
	)
WHERE
	(
		DT500.C485 > DT500.C486
	)
	AND
	(
		DT503.C1077 = DT500.C477
	)
ORDER BY
	DT501.C440
	, DT500.C481
LIMIT 974;


SELECT
	DT508.C988
	, DT508.C986
	, DT506.C706
	, DT507.C74
	, DT505.C870
	, DT505.C874
	, DT506.C704
	, DT506.C712
	, DT505.C879
	, DT505.C887
	, DT506.C708
	, DT505.C886
	, DT504.C932
	, DT505.C878
	, DT506.C699
	, DT505.C888
	, DT507.C69
	, DT505.C869
	, DT504.C937
	, DT507.C72
	, DT504.C936
	, DT505.C876
	, DT505.C867
	, DT505.C871
	, DT505.C884
	, DT507.C71
	, DT505.C880
	, DT506.C707
	, DT504.C933
	, DT507.C70
	, DT505.C885
	, DT505.C881
	, DT506.C701
	, DT506.C698
	, DT508.C987
	, DT505.C882
	, DT505.C883
	, DT506.C709
	, DT505.C877
	, DT506.C700
	, DT504.C935
	, DT507.C68
	, DT505.C868
	, DT505.C873
	, DT508.C989
	, DT506.C702
	, DT505.C875
	, DT504.C930
	, DT507.C67
	, DT505.C872
	, DT507.C73
	, DT507.C66
	, DT504.C934
	, DT506.C711
	, DT504.C931
	, DT506.C705
FROM
	(
		(
			T72 DT505
		INNER JOIN
			T80 DT508
		ON
			DT505.C870 < DT508.C986
		)
	INNER JOIN
		(
			T58 DT506
		INNER JOIN
			(
				T5 DT507
			INNER JOIN
				T75 DT504
			ON
				DT507.C74 = DT504.C937
			)
		ON
			DT506.C702 < DT504.C935
		)
	ON
		DT508.C986 = DT506.C704
	)
WHERE
	(
		DT506.C711 = DT507.C71
	)
	AND
	(
		DT504.C934 = DT505.C887
	)
ORDER BY
	DT508.C988
	, DT508.C986
	, DT506.C706
	, DT507.C74
	, DT505.C870
	, DT505.C874
	, DT506.C704
	, DT506.C712
	, DT505.C879
	, DT505.C887
	, DT506.C708
	, DT505.C886
	, DT504.C932
	, DT505.C878
	, DT506.C699
	, DT505.C888
	, DT507.C69
	, DT505.C869
	, DT504.C937
	, DT507.C72
	, DT504.C936
	, DT505.C876
	, DT505.C867
	, DT505.C871
	, DT505.C884
	, DT507.C71
	, DT505.C880
	, DT506.C707
	, DT504.C933
	, DT507.C70
	, DT505.C885
	, DT505.C881
	, DT506.C701
	, DT506.C698
	, DT508.C987
	, DT505.C882
	, DT505.C883
	, DT506.C709
	, DT505.C877
	, DT506.C700
	, DT504.C935
	, DT507.C68
	, DT505.C868
	, DT505.C873
	, DT508.C989
	, DT506.C702
	, DT505.C875
	, DT504.C930
	, DT507.C67
	, DT505.C872
	, DT507.C73
	, DT507.C66
	, DT504.C934
	, DT506.C711
	, DT504.C931
	, DT506.C705
LIMIT 890;


SELECT
	DT511.C725
	, DT510.C335
	, DT509.C720
	, DT510.C337
	, DT511.C731
	, DT509.C724
	, DT510.C340
	, DT509.C723
	, DT511.C730
	, DT511.C726
	, DT510.C334
	, DT509.C719
	, DT509.C718
	, DT511.C735
	, DT509.C717
	, DT509.C722
	, DT510.C339
	, DT511.C732
	, DT509.C721
	, DT511.C733
	, DT511.C739
FROM
	(
		(
			T61 DT511
		INNER JOIN
			T60 DT509
		ON
			DT511.C732 = DT509.C720
		)
	INNER JOIN
		T29 DT510
	ON
		DT509.C717 < DT510.C340
	)
WHERE
	(
		DT511.C725 = DT509.C721
	)
	OR
	(
		DT509.C721 <> DT511.C732
	)
ORDER BY
	DT511.C725
	, DT510.C335
	, DT509.C720
	, DT510.C337
	, DT511.C731
	, DT509.C724
	, DT510.C340
	, DT509.C723
	, DT511.C730
	, DT511.C726
	, DT510.C334
	, DT509.C719
	, DT509.C718
	, DT511.C735
	, DT509.C717
	, DT509.C722
	, DT510.C339
	, DT511.C732
	, DT509.C721
	, DT511.C733
	, DT511.C739
LIMIT 769;


SELECT
	DT513.C125
	, DT515.C432
	, DT512.C756
FROM
	(
		T8 DT513
	INNER JOIN
		(
			T63 DT512
		INNER JOIN
			(
				T36 DT515
			INNER JOIN
				T57 DT514
			ON
				DT515.C430 <> DT514.C688
			)
		ON
			DT512.C746 <> DT514.C689
		)
	ON
		DT513.C110 = DT512.C758
	)
WHERE
	(
		(
			DT514.C682 = DT514.C697
		)
		OR
		(
			DT513.C122 < DT512.C758
		)
	)
	AND
	(
		DT515.C430 > DT515.C425
	)
ORDER BY
	DT513.C125
	, DT515.C432
	, DT512.C756
LIMIT 130;


SELECT
	DT517.C347
	, DT517.C352
	, DT516.C1199
	, DT516.C1195
	, DT517.C348
	, DT517.C363
	, DT517.C351
	, DT517.C359
	, DT516.C1198
	, DT517.C360
FROM
	(
		T97 DT516
	INNER JOIN
		T31 DT517
	ON
		DT516.C1195 < DT517.C361
	)
WHERE
	(
		DT517.C349 = DT516.C1199
	)
	OR
	(
		DT517.C352 <> DT517.C344
	)
ORDER BY
	DT517.C347
	, DT517.C352
	, DT516.C1199
	, DT516.C1195
	, DT517.C348
	, DT517.C363
	, DT517.C351
	, DT517.C359
	, DT516.C1198
	, DT517.C360
LIMIT 790;


SELECT
	DT518.C418
	, DT522.C108
	, DT522.C103
	, DT522.C92
	, DT518.C415
	, DT522.C94
	, DT518.C416
	, DT522.C107
	, DT521.C223
	, DT518.C417
	, DT518.C412
	, DT522.C96
	, DT522.C99
	, DT522.C97
	, DT519.C2
	, DT518.C413
	, DT520.C205
	, DT520.C201
	, DT520.C203
	, DT521.C229
FROM
	(
		(
			T7 DT522
		INNER JOIN
			(
				(
					T0 DT519
				INNER JOIN
					T35 DT518
				ON
					DT519.C3 < DT518.C417
				)
			INNER JOIN
				T16 DT520
			ON
				DT518.C411 <> DT520.C205
			)
		ON
			DT522.C106 > DT520.C201
		)
	INNER JOIN
		T18 DT521
	ON
		DT522.C107 < DT521.C227
	)
WHERE
	(
		DT521.C219 > DT519.C0
	)
	AND
	(
		(
			DT519.C0 = DT521.C219
		)
		OR
		(
			(
				(
					DT522.C108 > DT518.C412
				)
				AND
				(
					DT522.C105 = DT521.C227
				)
			)
			AND
			(
				DT522.C90 < DT518.C415
			)
		)
	)
ORDER BY
	DT518.C418
	, DT522.C108
	, DT522.C103
	, DT522.C92
	, DT518.C415
	, DT522.C94
	, DT518.C416
	, DT522.C107
	, DT521.C223
	, DT518.C417
	, DT518.C412
	, DT522.C96
	, DT522.C99
	, DT522.C97
	, DT519.C2
	, DT518.C413
	, DT520.C205
	, DT520.C201
	, DT520.C203
	, DT521.C229
LIMIT 519;


SELECT
	DT524.C555
	, DT523.C183
FROM
	(
		T14 DT523
	INNER JOIN
		T47 DT524
	ON
		DT523.C185 = DT524.C555
	)
WHERE
	(
		DT524.C549 < DT524.C557
	)
	AND
	(
		(
			DT523.C183 = DT524.C566
		)
		OR
		(
			(
				DT524.C565 > DT524.C562
			)
			AND
			(
				DT523.C182 < DT524.C555
			)
		)
	)
ORDER BY
	DT524.C555
	, DT523.C183
LIMIT 412;


SELECT
	DT526.C244
	, DT525.C1202
FROM
	(
		T20 DT526
	INNER JOIN
		(
			T98 DT525
		INNER JOIN
			T62 DT527
		ON
			DT525.C1201 = DT527.C740
		)
	ON
		DT526.C235 = DT525.C1203
	)
WHERE
	(
		DT526.C244 = DT526.C237
	)
	AND
	(
		DT526.C245 = DT527.C742
	)
ORDER BY
	DT526.C244
	, DT525.C1202
LIMIT 530;


SELECT
	DT530.C425
	, DT528.C1190
	, DT529.C673
	, DT529.C671
	, DT530.C435
	, DT528.C1196
	, DT528.C1191
	, DT529.C681
	, DT528.C1195
	, DT530.C430
	, DT529.C668
	, DT530.C434
	, DT528.C1199
	, DT529.C677
FROM
	(
		T56 DT529
	INNER JOIN
		(
			T97 DT528
		INNER JOIN
			T36 DT530
		ON
			DT528.C1199 < DT530.C437
		)
	ON
		DT529.C669 < DT530.C424
	)
WHERE
	(
		DT528.C1197 <> DT529.C680
	)
	AND
	(
		DT528.C1195 < DT528.C1192
	)
ORDER BY
	DT530.C425
	, DT528.C1190
	, DT529.C673
	, DT529.C671
	, DT530.C435
	, DT528.C1196
	, DT528.C1191
	, DT529.C681
	, DT528.C1195
	, DT530.C430
	, DT529.C668
	, DT530.C434
	, DT528.C1199
	, DT529.C677
LIMIT 366;


SELECT
	DT534.C705
	, DT533.C642
	, DT533.C649
	, DT531.C300
	, DT534.C707
	, DT533.C648
	, DT533.C643
	, DT532.C1159
	, DT532.C1160
	, DT533.C641
	, DT532.C1153
	, DT532.C1150
	, DT531.C312
	, DT531.C309
	, DT531.C317
	, DT533.C650
	, DT533.C639
FROM
	(
		(
			T53 DT533
		INNER JOIN
			T58 DT534
		ON
			DT533.C651 <> DT534.C711
		)
	INNER JOIN
		(
			T26 DT531
		INNER JOIN
			T94 DT532
		ON
			DT531.C302 < DT532.C1146
		)
	ON
		DT533.C638 = DT531.C300
	)
WHERE
	(
		DT533.C649 > DT531.C318
	)
	OR
	(
		(
			DT531.C317 < DT532.C1154
		)
		AND
		(
			(
				DT532.C1148 = DT533.C649
			)
			AND
			(
				DT532.C1145 > DT534.C699
			)
		)
	)
ORDER BY
	DT534.C705
	, DT533.C642
	, DT533.C649
	, DT531.C300
	, DT534.C707
	, DT533.C648
	, DT533.C643
	, DT532.C1159
	, DT532.C1160
	, DT533.C641
	, DT532.C1153
	, DT532.C1150
	, DT531.C312
	, DT531.C309
	, DT531.C317
	, DT533.C650
	, DT533.C639
LIMIT 488;


SELECT
	DT536.C1064
	, DT537.C846
	, DT538.C205
	, DT537.C852
	, DT537.C842
	, DT535.C1203
	, DT536.C1072
	, DT538.C206
	, DT536.C1069
	, DT536.C1065
	, DT538.C204
	, DT535.C1202
	, DT536.C1075
	, DT537.C844
	, DT537.C843
	, DT536.C1071
	, DT537.C854
	, DT537.C855
	, DT537.C850
	, DT537.C853
	, DT538.C201
	, DT538.C202
	, DT538.C203
	, DT537.C847
	, DT536.C1070
	, DT536.C1073
	, DT537.C858
	, DT535.C1201
	, DT537.C848
	, DT536.C1074
FROM
	(
		(
			(
				T98 DT535
			INNER JOIN
				T88 DT536
			ON
				DT535.C1201 = DT536.C1067
			)
		INNER JOIN
			T16 DT538
		ON
			DT536.C1069 > DT538.C203
		)
	INNER JOIN
		T70 DT537
	ON
		DT536.C1075 <> DT537.C852
	)
WHERE
	(
		DT537.C844 = DT537.C852
	)
	OR
	(
		DT537.C855 = DT538.C200
	)
ORDER BY
	DT536.C1064
	, DT537.C846
	, DT538.C205
	, DT537.C852
	, DT537.C842
	, DT535.C1203
	, DT536.C1072
	, DT538.C206
	, DT536.C1069
	, DT536.C1065
	, DT538.C204
	, DT535.C1202
	, DT536.C1075
	, DT537.C844
	, DT537.C843
	, DT536.C1071
	, DT537.C854
	, DT537.C855
	, DT537.C850
	, DT537.C853
	, DT538.C201
	, DT538.C202
	, DT538.C203
	, DT537.C847
	, DT536.C1070
	, DT536.C1073
	, DT537.C858
	, DT535.C1201
	, DT537.C848
	, DT536.C1074
LIMIT 719;


SELECT
	DT543.C1123
	, DT541.C768
	, DT541.C774
	, DT541.C779
	, DT542.C262
	, DT539.C214
	, DT542.C269
	, DT540.C368
	, DT542.C259
	, DT540.C369
FROM
	(
		(
			(
				(
					T22 DT542
				INNER JOIN
					T92 DT543
				ON
					DT542.C263 = DT543.C1126
				)
			INNER JOIN
				T17 DT539
			ON
				DT543.C1118 < DT539.C213
			)
		INNER JOIN
			T64 DT541
		ON
			DT542.C264 < DT541.C765
		)
	INNER JOIN
		T32 DT540
	ON
		DT543.C1121 < DT540.C366
	)
WHERE
	(
		DT540.C365 < DT543.C1135
	)
	OR
	(
		(
			DT542.C264 > DT541.C768
		)
		OR
		(
			(
				DT543.C1124 = DT541.C767
			)
			AND
			(
				(
					DT541.C781 = DT539.C213
				)
				AND
				(
					DT539.C209 = DT541.C772
				)
			)
		)
	)
ORDER BY
	DT543.C1123
	, DT541.C768
	, DT541.C774
	, DT541.C779
	, DT542.C262
	, DT539.C214
	, DT542.C269
	, DT540.C368
	, DT542.C259
	, DT540.C369
LIMIT 545;


SELECT
	DT545.C1077
	, DT546.C339
	, DT544.C78
	, DT547.C1177
	, DT544.C81
	, DT547.C1184
	, DT544.C76
	, DT547.C1185
	, DT546.C334
	, DT544.C77
	, DT545.C1078
	, DT547.C1189
	, DT547.C1179
	, DT547.C1180
	, DT544.C75
	, DT544.C87
	, DT544.C79
FROM
	(
		(
			T29 DT546
		INNER JOIN
			T96 DT547
		ON
			DT546.C335 > DT547.C1180
		)
	INNER JOIN
		(
			T6 DT544
		INNER JOIN
			T89 DT545
		ON
			DT544.C77 <> DT545.C1076
		)
	ON
		DT547.C1184 = DT544.C87
	)
WHERE
	(
		(
			DT544.C86 = DT544.C79
		)
		AND
		(
			(
				DT547.C1185 > DT544.C76
			)
			AND
			(
				DT547.C1180 > DT546.C339
			)
		)
	)
	AND
	(
		(
			DT544.C84 = DT544.C82
		)
		OR
		(
			DT544.C86 = DT547.C1185
		)
	)
ORDER BY
	DT545.C1077
	, DT546.C339
	, DT544.C78
	, DT547.C1177
	, DT544.C81
	, DT547.C1184
	, DT544.C76
	, DT547.C1185
	, DT546.C334
	, DT544.C77
	, DT545.C1078
	, DT547.C1189
	, DT547.C1179
	, DT547.C1180
	, DT544.C75
	, DT544.C87
	, DT544.C79
LIMIT 365;


SELECT
	DT552.C584
	, DT549.C806
	, DT552.C576
	, DT550.C667
	, DT552.C572
	, DT549.C799
	, DT552.C569
	, DT551.C827
	, DT548.C599
	, DT549.C801
	, DT551.C832
	, DT550.C665
	, DT548.C596
	, DT552.C568
	, DT551.C829
	, DT551.C835
	, DT549.C804
	, DT549.C798
	, DT552.C582
	, DT548.C598
	, DT552.C573
	, DT551.C824
	, DT548.C593
	, DT552.C577
	, DT549.C808
	, DT550.C662
	, DT549.C803
	, DT549.C807
	, DT551.C838
	, DT549.C805
	, DT549.C802
	, DT551.C825
	, DT550.C658
	, DT551.C830
	, DT550.C661
	, DT552.C578
FROM
	(
		(
			(
				(
					T66 DT549
				INNER JOIN
					T49 DT548
				ON
					DT549.C806 < DT548.C593
				)
			INNER JOIN
				T69 DT551
			ON
				DT549.C799 = DT551.C838
			)
		INNER JOIN
			T55 DT550
		ON
			DT551.C834 <> DT550.C662
		)
	INNER JOIN
		T48 DT552
	ON
		DT548.C591 < DT552.C577
	)
WHERE
	(
		DT551.C824 = DT550.C658
	)
	AND
	(
		(
			DT551.C828 = DT551.C827
		)
		AND
		(
			DT552.C579 = DT552.C574
		)
	)
ORDER BY
	DT552.C584
	, DT549.C806
	, DT552.C576
	, DT550.C667
	, DT552.C572
	, DT549.C799
	, DT552.C569
	, DT551.C827
	, DT548.C599
	, DT549.C801
	, DT551.C832
	, DT550.C665
	, DT548.C596
	, DT552.C568
	, DT551.C829
	, DT551.C835
	, DT549.C804
	, DT549.C798
	, DT552.C582
	, DT548.C598
	, DT552.C573
	, DT551.C824
	, DT548.C593
	, DT552.C577
	, DT549.C808
	, DT550.C662
	, DT549.C803
	, DT549.C807
	, DT551.C838
	, DT549.C805
	, DT549.C802
	, DT551.C825
	, DT550.C658
	, DT551.C830
	, DT550.C661
	, DT552.C578
LIMIT 419;


SELECT
	DT555.C457
	, DT556.C856
	, DT554.C165
	, DT556.C849
	, DT556.C854
	, DT555.C459
	, DT554.C174
	, DT555.C463
	, DT553.C231
	, DT555.C455
	, DT554.C176
	, DT554.C166
	, DT555.C470
	, DT554.C170
	, DT555.C461
	, DT554.C171
	, DT555.C451
	, DT556.C844
	, DT554.C172
	, DT554.C168
	, DT555.C452
	, DT553.C232
	, DT556.C851
	, DT556.C859
	, DT554.C167
	, DT555.C468
	, DT556.C840
FROM
	(
		(
			T41 DT555
		INNER JOIN
			T13 DT554
		ON
			DT555.C460 = DT554.C178
		)
	INNER JOIN
		(
			T70 DT556
		INNER JOIN
			T19 DT553
		ON
			DT556.C853 = DT553.C231
		)
	ON
		DT554.C176 = DT556.C855
	)
WHERE
	(
		DT556.C858 < DT556.C854
	)
	AND
	(
		DT555.C467 < DT555.C469
	)
ORDER BY
	DT555.C457
	, DT556.C856
	, DT554.C165
	, DT556.C849
	, DT556.C854
	, DT555.C459
	, DT554.C174
	, DT555.C463
	, DT553.C231
	, DT555.C455
	, DT554.C176
	, DT554.C166
	, DT555.C470
	, DT554.C170
	, DT555.C461
	, DT554.C171
	, DT555.C451
	, DT556.C844
	, DT554.C172
	, DT554.C168
	, DT555.C452
	, DT553.C232
	, DT556.C851
	, DT556.C859
	, DT554.C167
	, DT555.C468
	, DT556.C840
LIMIT 573;


SELECT
	DT559.C782
	, DT559.C769
	, DT559.C767
	, DT557.C715
	, DT558.C241
	, DT559.C779
	, DT559.C768
FROM
	(
		(
			T20 DT558
		INNER JOIN
			T59 DT557
		ON
			DT558.C238 <> DT557.C713
		)
	INNER JOIN
		T64 DT559
	ON
		DT558.C245 > DT559.C782
	)
WHERE
	(
		(
			DT559.C767 > DT558.C242
		)
		AND
		(
			DT558.C244 <> DT558.C244
		)
	)
	AND
	(
		DT558.C237 < DT557.C716
	)
ORDER BY
	DT559.C782
	, DT559.C769
	, DT559.C767
	, DT557.C715
	, DT558.C241
	, DT559.C779
	, DT559.C768
LIMIT 627;


SELECT
	DT560.C1035
	, DT562.C1191
	, DT560.C1038
	, DT560.C1029
	, DT560.C1031
	, DT561.C785
	, DT561.C787
	, DT561.C788
	, DT562.C1194
	, DT562.C1193
	, DT560.C1034
	, DT560.C1032
	, DT560.C1036
	, DT561.C791
	, DT561.C796
	, DT560.C1042
	, DT561.C790
	, DT561.C789
	, DT560.C1046
	, DT562.C1198
	, DT560.C1039
	, DT560.C1040
	, DT560.C1043
	, DT561.C797
	, DT560.C1033
	, DT560.C1044
	, DT561.C786
	, DT561.C793
	, DT562.C1196
	, DT561.C783
	, DT560.C1041
	, DT561.C784
	, DT562.C1199
	, DT560.C1037
	, DT562.C1195
	, DT560.C1030
	, DT562.C1197
	, DT560.C1045
	, DT562.C1190
FROM
	(
		(
			T65 DT561
		INNER JOIN
			T97 DT562
		ON
			DT561.C784 = DT562.C1200
		)
	INNER JOIN
		T85 DT560
	ON
		DT562.C1200 <> DT560.C1029
	)
WHERE
	(
		DT561.C786 = DT560.C1037
	)
	AND
	(
		DT561.C789 = DT562.C1197
	)
ORDER BY
	DT560.C1035
	, DT562.C1191
	, DT560.C1038
	, DT560.C1029
	, DT560.C1031
	, DT561.C785
	, DT561.C787
	, DT561.C788
	, DT562.C1194
	, DT562.C1193
	, DT560.C1034
	, DT560.C1032
	, DT560.C1036
	, DT561.C791
	, DT561.C796
	, DT560.C1042
	, DT561.C790
	, DT561.C789
	, DT560.C1046
	, DT562.C1198
	, DT560.C1039
	, DT560.C1040
	, DT560.C1043
	, DT561.C797
	, DT560.C1033
	, DT560.C1044
	, DT561.C786
	, DT561.C793
	, DT562.C1196
	, DT561.C783
	, DT560.C1041
	, DT561.C784
	, DT562.C1199
	, DT560.C1037
	, DT562.C1195
	, DT560.C1030
	, DT562.C1197
	, DT560.C1045
	, DT562.C1190
LIMIT 510;


SELECT
	DT563.C1064
FROM
	(
		T24 DT564
	INNER JOIN
		T88 DT563
	ON
		DT564.C280 > DT563.C1070
	)
WHERE
	(
		DT563.C1071 < DT563.C1065
	)
	OR
	(
		(
			(
				DT563.C1071 = DT564.C280
			)
			OR
			(
				DT564.C279 < DT563.C1065
			)
		)
		OR
		(
			DT563.C1075 < DT563.C1067
		)
	)
ORDER BY
	DT563.C1064
LIMIT 364;


SELECT
	DT566.C305
	, DT565.C670
	, DT566.C317
	, DT565.C678
	, DT566.C297
	, DT568.C2
	, DT565.C671
	, DT566.C315
	, DT567.C160
	, DT566.C299
	, DT565.C669
	, DT565.C673
	, DT565.C680
	, DT567.C161
	, DT566.C313
	, DT568.C3
	, DT566.C302
	, DT567.C158
	, DT566.C312
	, DT565.C668
	, DT568.C1
	, DT567.C162
	, DT567.C157
	, DT565.C676
	, DT565.C675
	, DT566.C306
	, DT566.C304
	, DT566.C316
	, DT566.C311
	, DT565.C681
	, DT567.C159
	, DT565.C677
	, DT566.C300
	, DT566.C318
	, DT565.C672
	, DT566.C307
	, DT566.C301
	, DT568.C0
	, DT566.C298
	, DT567.C163
	, DT566.C309
	, DT566.C303
	, DT565.C679
	, DT565.C674
	, DT566.C314
	, DT566.C308
FROM
	(
		(
			T56 DT565
		INNER JOIN
			T26 DT566
		ON
			DT565.C674 = DT566.C313
		)
	INNER JOIN
		(
			T12 DT567
		INNER JOIN
			T0 DT568
		ON
			DT567.C163 < DT568.C0
		)
	ON
		DT566.C316 <> DT568.C3
	)
WHERE
	(
		(
			DT565.C668 = DT565.C671
		)
		OR
		(
			DT566.C311 = DT565.C681
		)
	)
	AND
	(
		(
			DT565.C679 = DT566.C304
		)
		AND
		(
			DT567.C161 = DT566.C309
		)
	)
ORDER BY
	DT566.C305
	, DT565.C670
	, DT566.C317
	, DT565.C678
	, DT566.C297
	, DT568.C2
	, DT565.C671
	, DT566.C315
	, DT567.C160
	, DT566.C299
	, DT565.C669
	, DT565.C673
	, DT565.C680
	, DT567.C161
	, DT566.C313
	, DT568.C3
	, DT566.C302
	, DT567.C158
	, DT566.C312
	, DT565.C668
	, DT568.C1
	, DT567.C162
	, DT567.C157
	, DT565.C676
	, DT565.C675
	, DT566.C306
	, DT566.C304
	, DT566.C316
	, DT566.C311
	, DT565.C681
	, DT567.C159
	, DT565.C677
	, DT566.C300
	, DT566.C318
	, DT565.C672
	, DT566.C307
	, DT566.C301
	, DT568.C0
	, DT566.C298
	, DT567.C163
	, DT566.C309
	, DT566.C303
	, DT565.C679
	, DT565.C674
	, DT566.C314
	, DT566.C308
LIMIT 831;


SELECT
	DT570.C1113
	, DT570.C1094
	, DT571.C545
	, DT570.C1098
	, DT570.C1103
	, DT571.C542
	, DT571.C547
	, DT571.C541
	, DT571.C535
	, DT570.C1100
	, DT570.C1101
	, DT571.C539
	, DT570.C1114
	, DT571.C538
	, DT571.C533
	, DT570.C1105
	, DT570.C1112
	, DT570.C1093
	, DT570.C1097
	, DT570.C1102
	, DT570.C1110
	, DT571.C528
	, DT571.C534
	, DT570.C1111
	, DT571.C529
	, DT570.C1096
	, DT571.C540
	, DT571.C532
	, DT571.C546
	, DT569.C444
	, DT570.C1107
	, DT570.C1095
	, DT571.C544
	, DT571.C543
FROM
	(
		(
			T46 DT571
		INNER JOIN
			T39 DT569
		ON
			DT571.C530 = DT569.C444
		)
	INNER JOIN
		T91 DT570
	ON
		DT571.C528 = DT570.C1096
	)
WHERE
	(
		DT571.C533 = DT570.C1094
	)
	AND
	(
		DT571.C531 < DT571.C533
	)
ORDER BY
	DT570.C1113
	, DT570.C1094
	, DT571.C545
	, DT570.C1098
	, DT570.C1103
	, DT571.C542
	, DT571.C547
	, DT571.C541
	, DT571.C535
	, DT570.C1100
	, DT570.C1101
	, DT571.C539
	, DT570.C1114
	, DT571.C538
	, DT571.C533
	, DT570.C1105
	, DT570.C1112
	, DT570.C1093
	, DT570.C1097
	, DT570.C1102
	, DT570.C1110
	, DT571.C528
	, DT571.C534
	, DT570.C1111
	, DT571.C529
	, DT570.C1096
	, DT571.C540
	, DT571.C532
	, DT571.C546
	, DT569.C444
	, DT570.C1107
	, DT570.C1095
	, DT571.C544
	, DT571.C543
LIMIT 721;


SELECT
	DT574.C262
	, DT573.C1066
	, DT572.C1077
	, DT572.C1078
	, DT573.C1064
	, DT574.C265
FROM
	(
		(
			T88 DT573
		INNER JOIN
			T22 DT574
		ON
			DT573.C1071 <> DT574.C268
		)
	INNER JOIN
		T89 DT572
	ON
		DT573.C1071 < DT572.C1076
	)
WHERE
	(
		(
			(
				DT574.C261 < DT573.C1066
			)
			OR
			(
				DT574.C266 <> DT572.C1076
			)
		)
		OR
		(
			(
				DT573.C1069 > DT574.C262
			)
			AND
			(
				DT573.C1070 = DT573.C1069
			)
		)
	)
	OR
	(
		DT572.C1077 > DT574.C269
	)
ORDER BY
	DT574.C262
	, DT573.C1066
	, DT572.C1077
	, DT572.C1078
	, DT573.C1064
	, DT574.C265
LIMIT 829;


SELECT
	DT575.C337
	, DT575.C335
	, DT576.C979
	, DT575.C340
	, DT576.C981
	, DT576.C985
FROM
	(
		T79 DT576
	INNER JOIN
		T29 DT575
	ON
		DT576.C982 = DT575.C339
	)
WHERE
	(
		(
			DT576.C984 <> DT576.C984
		)
		AND
		(
			(
				DT575.C334 = DT575.C336
			)
			AND
			(
				DT576.C979 = DT575.C339
			)
		)
	)
	AND
	(
		(
			DT575.C338 > DT575.C335
		)
		AND
		(
			DT575.C335 = DT576.C979
		)
	)
ORDER BY
	DT575.C337
	, DT575.C335
	, DT576.C979
	, DT575.C340
	, DT576.C981
	, DT576.C985
LIMIT 340;


SELECT
	DT577.C638
	, DT578.C563
	, DT578.C560
	, DT577.C645
	, DT577.C643
	, DT578.C562
	, DT578.C551
	, DT577.C640
	, DT577.C637
	, DT579.C988
	, DT579.C989
	, DT577.C639
	, DT578.C552
	, DT577.C647
	, DT578.C566
	, DT577.C636
	, DT578.C553
	, DT577.C651
	, DT577.C649
	, DT578.C549
	, DT578.C564
	, DT577.C642
	, DT577.C646
	, DT578.C555
	, DT578.C567
	, DT577.C641
	, DT579.C987
FROM
	(
		(
			T53 DT577
		INNER JOIN
			T80 DT579
		ON
			DT577.C638 = DT579.C986
		)
	INNER JOIN
		T47 DT578
	ON
		DT577.C640 = DT578.C551
	)
WHERE
	(
		(
			DT578.C555 = DT578.C549
		)
		AND
		(
			(
				DT578.C549 = DT577.C638
			)
			AND
			(
				DT577.C645 = DT579.C987
			)
		)
	)
	OR
	(
		(
			DT577.C650 <> DT579.C988
		)
		AND
		(
			DT578.C564 <> DT577.C644
		)
	)
ORDER BY
	DT577.C638
	, DT578.C563
	, DT578.C560
	, DT577.C645
	, DT577.C643
	, DT578.C562
	, DT578.C551
	, DT577.C640
	, DT577.C637
	, DT579.C988
	, DT579.C989
	, DT577.C639
	, DT578.C552
	, DT577.C647
	, DT578.C566
	, DT577.C636
	, DT578.C553
	, DT577.C651
	, DT577.C649
	, DT578.C549
	, DT578.C564
	, DT577.C642
	, DT577.C646
	, DT578.C555
	, DT578.C567
	, DT577.C641
	, DT579.C987
LIMIT 118;


SELECT
	DT581.C188
	, DT581.C193
	, DT582.C1056
	, DT581.C198
	, DT582.C1062
	, DT580.C844
	, DT582.C1063
	, DT581.C195
	, DT581.C186
	, DT581.C190
	, DT580.C858
	, DT580.C856
	, DT580.C846
	, DT581.C196
	, DT582.C1061
	, DT582.C1059
	, DT580.C849
	, DT580.C842
	, DT580.C854
	, DT581.C197
	, DT581.C194
	, DT582.C1058
	, DT582.C1057
	, DT580.C843
	, DT580.C845
	, DT580.C840
	, DT580.C857
	, DT580.C848
	, DT583.C989
	, DT583.C986
	, DT581.C189
	, DT581.C187
	, DT580.C839
	, DT580.C850
	, DT583.C987
	, DT581.C199
	, DT580.C855
	, DT583.C988
FROM
	(
		(
			T70 DT580
		INNER JOIN
			(
				T80 DT583
			INNER JOIN
				T15 DT581
			ON
				DT583.C987 = DT581.C194
			)
		ON
			DT580.C840 = DT581.C197
		)
	INNER JOIN
		T87 DT582
	ON
		DT583.C986 = DT582.C1057
	)
WHERE
	(
		(
			(
				DT580.C844 = DT580.C846
			)
			AND
			(
				(
					DT580.C856 = DT580.C839
				)
				OR
				(
					DT581.C193 < DT582.C1056
				)
			)
		)
		OR
		(
			DT580.C841 = DT581.C187
		)
	)
	AND
	(
		DT580.C845 = DT581.C197
	)
ORDER BY
	DT581.C188
	, DT581.C193
	, DT582.C1056
	, DT581.C198
	, DT582.C1062
	, DT580.C844
	, DT582.C1063
	, DT581.C195
	, DT581.C186
	, DT581.C190
	, DT580.C858
	, DT580.C856
	, DT580.C846
	, DT581.C196
	, DT582.C1061
	, DT582.C1059
	, DT580.C849
	, DT580.C842
	, DT580.C854
	, DT581.C197
	, DT581.C194
	, DT582.C1058
	, DT582.C1057
	, DT580.C843
	, DT580.C845
	, DT580.C840
	, DT580.C857
	, DT580.C848
	, DT583.C989
	, DT583.C986
	, DT581.C189
	, DT581.C187
	, DT580.C839
	, DT580.C850
	, DT583.C987
	, DT581.C199
	, DT580.C855
	, DT583.C988
LIMIT 699;


SELECT
	DT586.C888
	, DT584.C1186
	, DT584.C1181
	, DT585.C312
	, DT584.C1176
	, DT586.C878
	, DT585.C298
	, DT586.C867
	, DT586.C868
	, DT584.C1182
	, DT585.C318
	, DT584.C1183
	, DT585.C297
	, DT586.C886
	, DT586.C870
	, DT586.C871
	, DT585.C308
	, DT585.C315
	, DT586.C880
	, DT585.C311
	, DT584.C1184
	, DT586.C876
	, DT585.C300
	, DT584.C1188
	, DT585.C314
	, DT585.C304
	, DT586.C882
	, DT584.C1180
	, DT586.C872
	, DT585.C307
	, DT585.C313
	, DT586.C885
	, DT585.C316
	, DT586.C877
	, DT585.C301
	, DT586.C874
	, DT586.C879
	, DT586.C887
	, DT586.C875
	, DT586.C884
	, DT584.C1178
	, DT585.C303
	, DT586.C883
	, DT584.C1185
	, DT585.C310
	, DT585.C309
	, DT586.C873
	, DT586.C869
	, DT585.C305
	, DT584.C1179
	, DT585.C317
	, DT584.C1177
	, DT584.C1187
	, DT586.C881
	, DT585.C302
	, DT585.C299
FROM
	(
		(
			T72 DT586
		INNER JOIN
			T96 DT584
		ON
			DT586.C870 > DT584.C1183
		)
	INNER JOIN
		T26 DT585
	ON
		DT584.C1179 > DT585.C297
	)
WHERE
	(
		DT585.C305 = DT586.C885
	)
	AND
	(
		DT585.C306 = DT584.C1187
	)
ORDER BY
	DT586.C888
	, DT584.C1186
	, DT584.C1181
	, DT585.C312
	, DT584.C1176
	, DT586.C878
	, DT585.C298
	, DT586.C867
	, DT586.C868
	, DT584.C1182
	, DT585.C318
	, DT584.C1183
	, DT585.C297
	, DT586.C886
	, DT586.C870
	, DT586.C871
	, DT585.C308
	, DT585.C315
	, DT586.C880
	, DT585.C311
	, DT584.C1184
	, DT586.C876
	, DT585.C300
	, DT584.C1188
	, DT585.C314
	, DT585.C304
	, DT586.C882
	, DT584.C1180
	, DT586.C872
	, DT585.C307
	, DT585.C313
	, DT586.C885
	, DT585.C316
	, DT586.C877
	, DT585.C301
	, DT586.C874
	, DT586.C879
	, DT586.C887
	, DT586.C875
	, DT586.C884
	, DT584.C1178
	, DT585.C303
	, DT586.C883
	, DT584.C1185
	, DT585.C310
	, DT585.C309
	, DT586.C873
	, DT586.C869
	, DT585.C305
	, DT584.C1179
	, DT585.C317
	, DT584.C1177
	, DT584.C1187
	, DT586.C881
	, DT585.C302
	, DT585.C299
LIMIT 628;


SELECT
	DT591.C118
	, DT591.C110
	, DT591.C115
	, DT590.C821
	, DT587.C932
	, DT591.C120
	, DT589.C741
	, DT591.C113
	, DT591.C112
	, DT588.C231
	, DT587.C933
	, DT590.C823
	, DT591.C111
	, DT587.C936
	, DT588.C232
	, DT587.C930
	, DT591.C124
	, DT589.C742
FROM
	(
		(
			T75 DT587
		INNER JOIN
			(
				T8 DT591
			INNER JOIN
				T19 DT588
			ON
				DT591.C111 = DT588.C230
			)
		ON
			DT587.C931 = DT591.C110
		)
	INNER JOIN
		(
			T62 DT589
		INNER JOIN
			T68 DT590
		ON
			DT589.C742 = DT590.C822
		)
	ON
		DT591.C122 < DT590.C821
	)
WHERE
	(
		DT591.C121 = DT591.C123
	)
	AND
	(
		DT589.C741 = DT587.C932
	)
ORDER BY
	DT591.C118
	, DT591.C110
	, DT591.C115
	, DT590.C821
	, DT587.C932
	, DT591.C120
	, DT589.C741
	, DT591.C113
	, DT591.C112
	, DT588.C231
	, DT587.C933
	, DT590.C823
	, DT591.C111
	, DT587.C936
	, DT588.C232
	, DT587.C930
	, DT591.C124
	, DT589.C742
LIMIT 728;


SELECT
	DT593.C410
	, DT592.C640
	, DT594.C571
	, DT595.C180
	, DT592.C642
FROM
	(
		(
			T14 DT595
		INNER JOIN
			(
				T48 DT594
			INNER JOIN
				T0 DT596
			ON
				DT594.C568 < DT596.C2
			)
		ON
			DT595.C185 <> DT594.C569
		)
	INNER JOIN
		(
			T53 DT592
		INNER JOIN
			T34 DT593
		ON
			DT592.C642 > DT593.C408
		)
	ON
		DT594.C572 = DT592.C644
	)
WHERE
	(
		DT592.C649 = DT596.C1
	)
	OR
	(
		DT594.C572 <> DT593.C407
	)
ORDER BY
	DT593.C410
	, DT592.C640
	, DT594.C571
	, DT595.C180
	, DT592.C642
LIMIT 589;


SELECT
	DT598.C870
	, DT597.C978
	, DT598.C867
	, DT597.C973
	, DT597.C966
	, DT597.C970
	, DT598.C881
	, DT598.C868
	, DT598.C880
	, DT597.C968
	, DT598.C876
	, DT597.C976
	, DT598.C875
	, DT598.C885
	, DT598.C874
	, DT598.C887
	, DT598.C883
	, DT597.C965
	, DT598.C871
	, DT598.C873
FROM
	(
		T78 DT597
	INNER JOIN
		T72 DT598
	ON
		DT597.C974 < DT598.C885
	)
WHERE
	(
		DT597.C976 = DT597.C975
	)
	OR
	(
		(
			DT597.C977 < DT598.C888
		)
		AND
		(
			DT598.C886 = DT598.C883
		)
	)
ORDER BY
	DT598.C870
	, DT597.C978
	, DT598.C867
	, DT597.C973
	, DT597.C966
	, DT597.C970
	, DT598.C881
	, DT598.C868
	, DT598.C880
	, DT597.C968
	, DT598.C876
	, DT597.C976
	, DT598.C875
	, DT598.C885
	, DT598.C874
	, DT598.C887
	, DT598.C883
	, DT597.C965
	, DT598.C871
	, DT598.C873
LIMIT 466;


SELECT
	DT600.C693
	, DT600.C689
	, DT599.C876
	, DT599.C872
	, DT599.C871
	, DT599.C870
	, DT601.C439
	, DT601.C438
	, DT600.C690
	, DT600.C682
	, DT599.C887
	, DT600.C686
	, DT600.C696
	, DT599.C877
	, DT600.C685
	, DT600.C694
	, DT600.C691
	, DT599.C881
	, DT600.C695
	, DT600.C692
	, DT600.C687
	, DT599.C883
	, DT599.C868
	, DT599.C884
	, DT599.C875
	, DT599.C867
	, DT601.C440
	, DT599.C886
	, DT599.C873
	, DT599.C888
	, DT599.C878
	, DT599.C882
	, DT599.C874
FROM
	(
		T72 DT599
	INNER JOIN
		(
			T37 DT601
		INNER JOIN
			T57 DT600
		ON
			DT601.C439 = DT600.C684
		)
	ON
		DT599.C884 = DT600.C690
	)
WHERE
	(
		DT599.C872 < DT600.C686
	)
	OR
	(
		DT599.C868 < DT600.C689
	)
ORDER BY
	DT600.C693
	, DT600.C689
	, DT599.C876
	, DT599.C872
	, DT599.C871
	, DT599.C870
	, DT601.C439
	, DT601.C438
	, DT600.C690
	, DT600.C682
	, DT599.C887
	, DT600.C686
	, DT600.C696
	, DT599.C877
	, DT600.C685
	, DT600.C694
	, DT600.C691
	, DT599.C881
	, DT600.C695
	, DT600.C692
	, DT600.C687
	, DT599.C883
	, DT599.C868
	, DT599.C884
	, DT599.C875
	, DT599.C867
	, DT601.C440
	, DT599.C886
	, DT599.C873
	, DT599.C888
	, DT599.C878
	, DT599.C882
	, DT599.C874
LIMIT 723;


SELECT
	DT602.C248
	, DT603.C815
	, DT605.C293
	, DT605.C286
	, DT604.C110
	, DT602.C249
	, DT602.C256
	, DT603.C810
	, DT604.C125
	, DT604.C117
	, DT605.C283
	, DT605.C294
	, DT602.C250
	, DT605.C284
	, DT602.C252
	, DT602.C253
	, DT604.C119
	, DT603.C814
	, DT602.C251
	, DT603.C818
	, DT602.C247
	, DT605.C288
	, DT604.C118
	, DT604.C114
	, DT605.C290
	, DT605.C291
	, DT605.C285
	, DT604.C116
	, DT603.C817
	, DT602.C258
	, DT603.C820
	, DT604.C113
	, DT603.C809
	, DT605.C289
	, DT604.C111
	, DT602.C257
	, DT604.C115
	, DT605.C287
	, DT602.C255
	, DT604.C112
	, DT605.C292
	, DT604.C124
	, DT604.C120
	, DT603.C813
	, DT604.C121
FROM
	(
		(
			T67 DT603
		INNER JOIN
			T21 DT602
		ON
			DT603.C812 = DT602.C247
		)
	INNER JOIN
		(
			T8 DT604
		INNER JOIN
			T25 DT605
		ON
			DT604.C112 > DT605.C295
		)
	ON
		DT602.C251 = DT604.C119
	)
WHERE
	(
		DT602.C247 = DT603.C812
	)
	AND
	(
		DT603.C810 > DT604.C124
	)
ORDER BY
	DT602.C248
	, DT603.C815
	, DT605.C293
	, DT605.C286
	, DT604.C110
	, DT602.C249
	, DT602.C256
	, DT603.C810
	, DT604.C125
	, DT604.C117
	, DT605.C283
	, DT605.C294
	, DT602.C250
	, DT605.C284
	, DT602.C252
	, DT602.C253
	, DT604.C119
	, DT603.C814
	, DT602.C251
	, DT603.C818
	, DT602.C247
	, DT605.C288
	, DT604.C118
	, DT604.C114
	, DT605.C290
	, DT605.C291
	, DT605.C285
	, DT604.C116
	, DT603.C817
	, DT602.C258
	, DT603.C820
	, DT604.C113
	, DT603.C809
	, DT605.C289
	, DT604.C111
	, DT602.C257
	, DT604.C115
	, DT605.C287
	, DT602.C255
	, DT604.C112
	, DT605.C292
	, DT604.C124
	, DT604.C120
	, DT603.C813
	, DT604.C121
LIMIT 304;


SELECT
	DT607.C186
	, DT607.C188
	, DT606.C1082
	, DT608.C633
	, DT606.C1085
	, DT606.C1080
	, DT609.C704
	, DT606.C1087
	, DT609.C707
	, DT609.C700
	, DT607.C193
	, DT606.C1089
	, DT607.C194
	, DT606.C1084
	, DT609.C711
	, DT609.C702
	, DT608.C631
	, DT606.C1081
	, DT609.C698
	, DT608.C634
	, DT607.C192
	, DT607.C199
	, DT606.C1092
	, DT607.C189
	, DT607.C195
	, DT607.C191
	, DT608.C630
	, DT608.C628
	, DT607.C198
FROM
	(
		(
			(
				T15 DT607
			INNER JOIN
				T52 DT608
			ON
				DT607.C199 < DT608.C629
			)
		INNER JOIN
			T90 DT606
		ON
			DT607.C193 = DT606.C1092
		)
	INNER JOIN
		T58 DT609
	ON
		DT607.C195 < DT609.C705
	)
WHERE
	(
		DT606.C1090 < DT607.C196
	)
	AND
	(
		DT609.C698 = DT606.C1092
	)
ORDER BY
	DT607.C186
	, DT607.C188
	, DT606.C1082
	, DT608.C633
	, DT606.C1085
	, DT606.C1080
	, DT609.C704
	, DT606.C1087
	, DT609.C707
	, DT609.C700
	, DT607.C193
	, DT606.C1089
	, DT607.C194
	, DT606.C1084
	, DT609.C711
	, DT609.C702
	, DT608.C631
	, DT606.C1081
	, DT609.C698
	, DT608.C634
	, DT607.C192
	, DT607.C199
	, DT606.C1092
	, DT607.C189
	, DT607.C195
	, DT607.C191
	, DT608.C630
	, DT608.C628
	, DT607.C198
LIMIT 300;


SELECT
	DT610.C910
	, DT610.C920
	, DT610.C927
	, DT614.C1046
	, DT612.C476
	, DT613.C800
	, DT614.C1036
	, DT610.C918
	, DT612.C486
	, DT612.C480
	, DT614.C1043
	, DT610.C912
	, DT610.C928
	, DT611.C481
	, DT612.C475
	, DT612.C474
	, DT614.C1044
	, DT612.C481
	, DT611.C476
	, DT612.C482
	, DT611.C473
	, DT610.C922
	, DT612.C477
	, DT613.C802
	, DT614.C1041
	, DT610.C913
	, DT614.C1038
	, DT611.C483
	, DT614.C1029
	, DT611.C484
	, DT613.C799
	, DT614.C1039
	, DT610.C917
	, DT610.C915
	, DT614.C1034
	, DT613.C806
	, DT611.C478
	, DT610.C926
	, DT612.C484
	, DT613.C805
	, DT612.C479
	, DT611.C474
	, DT614.C1042
	, DT610.C924
	, DT611.C475
	, DT611.C482
	, DT611.C486
	, DT612.C485
	, DT613.C807
	, DT610.C923
	, DT614.C1030
	, DT610.C919
	, DT613.C808
	, DT613.C803
	, DT611.C485
	, DT610.C929
	, DT614.C1031
	, DT611.C479
	, DT613.C804
	, DT614.C1037
	, DT614.C1032
	, DT614.C1045
	, DT610.C925
	, DT613.C801
	, DT610.C916
FROM
	(
		(
			(
				T66 DT613
			INNER JOIN
				T85 DT614
			ON
				DT613.C806 > DT614.C1030
			)
		INNER JOIN
			(
				T42 DT611
			INNER JOIN
				T42 DT612
			ON
				DT611.C473 = DT612.C473
			)
		ON
			DT613.C808 <> DT611.C486
		)
	INNER JOIN
		T74 DT610
	ON
		DT612.C483 = DT610.C915
	)
WHERE
	(
		DT614.C1032 > DT611.C473
	)
	OR
	(
		(
			DT611.C484 > DT613.C802
		)
		OR
		(
			DT614.C1045 = DT612.C477
		)
	)
ORDER BY
	DT610.C910
	, DT610.C920
	, DT610.C927
	, DT614.C1046
	, DT612.C476
	, DT613.C800
	, DT614.C1036
	, DT610.C918
	, DT612.C486
	, DT612.C480
	, DT614.C1043
	, DT610.C912
	, DT610.C928
	, DT611.C481
	, DT612.C475
	, DT612.C474
	, DT614.C1044
	, DT612.C481
	, DT611.C476
	, DT612.C482
	, DT611.C473
	, DT610.C922
	, DT612.C477
	, DT613.C802
	, DT614.C1041
	, DT610.C913
	, DT614.C1038
	, DT611.C483
	, DT614.C1029
	, DT611.C484
	, DT613.C799
	, DT614.C1039
	, DT610.C917
	, DT610.C915
	, DT614.C1034
	, DT613.C806
	, DT611.C478
	, DT610.C926
	, DT612.C484
	, DT613.C805
	, DT612.C479
	, DT611.C474
	, DT614.C1042
	, DT610.C924
	, DT611.C475
	, DT611.C482
	, DT611.C486
	, DT612.C485
	, DT613.C807
	, DT610.C923
	, DT614.C1030
	, DT610.C919
	, DT613.C808
	, DT613.C803
	, DT611.C485
	, DT610.C929
	, DT614.C1031
	, DT611.C479
	, DT613.C804
	, DT614.C1037
	, DT614.C1032
	, DT614.C1045
	, DT610.C925
	, DT613.C801
	, DT610.C916
LIMIT 832;


SELECT
	DT617.C722
	, DT619.C331
	, DT616.C998
	, DT615.C502
	, DT616.C999
	, DT618.C397
	, DT619.C333
	, DT618.C391
	, DT618.C399
	, DT618.C398
	, DT618.C384
	, DT619.C332
	, DT618.C387
	, DT618.C400
	, DT618.C392
	, DT616.C997
	, DT615.C511
	, DT617.C723
	, DT616.C1000
	, DT617.C724
	, DT618.C389
	, DT615.C504
	, DT618.C396
	, DT615.C505
	, DT619.C328
	, DT618.C394
	, DT617.C719
	, DT617.C718
	, DT619.C330
FROM
	(
		(
			(
				T33 DT618
			INNER JOIN
				T28 DT619
			ON
				DT618.C385 = DT619.C333
			)
		INNER JOIN
			T82 DT616
		ON
			DT618.C389 < DT616.C998
		)
	INNER JOIN
		(
			T44 DT615
		INNER JOIN
			T60 DT617
		ON
			DT615.C507 = DT617.C724
		)
	ON
		DT618.C385 <> DT617.C724
	)
WHERE
	(
		(
			DT616.C995 <> DT616.C996
		)
		AND
		(
			DT618.C386 = DT618.C396
		)
	)
	OR
	(
		(
			DT615.C507 = DT619.C332
		)
		AND
		(
			DT616.C996 = DT617.C720
		)
	)
ORDER BY
	DT617.C722
	, DT619.C331
	, DT616.C998
	, DT615.C502
	, DT616.C999
	, DT618.C397
	, DT619.C333
	, DT618.C391
	, DT618.C399
	, DT618.C398
	, DT618.C384
	, DT619.C332
	, DT618.C387
	, DT618.C400
	, DT618.C392
	, DT616.C997
	, DT615.C511
	, DT617.C723
	, DT616.C1000
	, DT617.C724
	, DT618.C389
	, DT615.C504
	, DT618.C396
	, DT615.C505
	, DT619.C328
	, DT618.C394
	, DT617.C719
	, DT617.C718
	, DT619.C330
LIMIT 385;


SELECT
	DT621.C961
	, DT621.C964
	, DT624.C979
	, DT624.C984
	, DT620.C755
	, DT623.C191
	, DT623.C193
	, DT621.C962
	, DT624.C983
	, DT621.C952
	, DT620.C744
FROM
	(
		T77 DT621
	INNER JOIN
		(
			(
				T15 DT623
			INNER JOIN
				T79 DT624
			ON
				DT623.C196 <> DT624.C979
			)
		INNER JOIN
			(
				T68 DT622
			INNER JOIN
				T63 DT620
			ON
				DT622.C821 <> DT620.C746
			)
		ON
			DT623.C197 < DT620.C746
		)
	ON
		DT621.C948 = DT620.C745
	)
WHERE
	(
		(
			DT621.C960 <> DT621.C954
		)
		OR
		(
			DT623.C193 = DT620.C761
		)
	)
	AND
	(
		DT623.C199 > DT621.C963
	)
ORDER BY
	DT621.C961
	, DT621.C964
	, DT624.C979
	, DT624.C984
	, DT620.C755
	, DT623.C191
	, DT623.C193
	, DT621.C962
	, DT624.C983
	, DT621.C952
	, DT620.C744
LIMIT 936;


SELECT
	DT629.C1101
	, DT629.C1093
	, DT628.C724
	, DT627.C203
	, DT625.C183
	, DT626.C1191
	, DT626.C1198
	, DT626.C1196
	, DT628.C717
	, DT629.C1104
	, DT629.C1112
	, DT626.C1192
	, DT629.C1105
	, DT628.C721
	, DT629.C1110
	, DT629.C1107
FROM
	(
		(
			T16 DT627
		INNER JOIN
			T60 DT628
		ON
			DT627.C205 <> DT628.C724
		)
	INNER JOIN
		(
			T97 DT626
		INNER JOIN
			(
				T14 DT625
			INNER JOIN
				T91 DT629
			ON
				DT625.C182 = DT629.C1101
			)
		ON
			DT626.C1191 <> DT629.C1104
		)
	ON
		DT627.C203 = DT629.C1101
	)
WHERE
	(
		DT629.C1108 = DT625.C184
	)
	AND
	(
		DT625.C182 <> DT626.C1197
	)
ORDER BY
	DT629.C1101
	, DT629.C1093
	, DT628.C724
	, DT627.C203
	, DT625.C183
	, DT626.C1191
	, DT626.C1198
	, DT626.C1196
	, DT628.C717
	, DT629.C1104
	, DT629.C1112
	, DT626.C1192
	, DT629.C1105
	, DT628.C721
	, DT629.C1110
	, DT629.C1107
LIMIT 526;


SELECT
	DT631.C1081
	, DT632.C63
	, DT631.C1087
	, DT632.C58
	, DT633.C797
	, DT633.C791
	, DT633.C786
	, DT633.C796
FROM
	(
		(
			T37 DT630
		INNER JOIN
			T90 DT631
		ON
			DT630.C439 <> DT631.C1082
		)
	INNER JOIN
		(
			T4 DT632
		INNER JOIN
			T65 DT633
		ON
			DT632.C53 = DT633.C794
		)
	ON
		DT630.C440 > DT633.C795
	)
WHERE
	(
		DT632.C53 = DT631.C1090
	)
	OR
	(
		DT631.C1084 = DT633.C792
	)
ORDER BY
	DT631.C1081
	, DT632.C63
	, DT631.C1087
	, DT632.C58
	, DT633.C797
	, DT633.C791
	, DT633.C786
	, DT633.C796
LIMIT 302;


SELECT
	DT636.C420
	, DT634.C403
	, DT636.C426
	, DT636.C425
	, DT635.C71
	, DT634.C407
	, DT636.C429
	, DT635.C66
	, DT636.C430
	, DT635.C74
	, DT634.C405
	, DT635.C69
	, DT635.C70
	, DT636.C434
	, DT636.C436
	, DT634.C404
	, DT636.C431
	, DT635.C67
	, DT634.C406
	, DT636.C419
	, DT634.C410
	, DT635.C72
	, DT636.C422
	, DT636.C424
	, DT636.C433
	, DT635.C68
	, DT636.C435
	, DT634.C409
	, DT636.C427
	, DT636.C421
	, DT636.C437
	, DT634.C408
	, DT635.C73
	, DT636.C428
FROM
	(
		(
			T5 DT635
		INNER JOIN
			T34 DT634
		ON
			DT635.C66 = DT634.C409
		)
	INNER JOIN
		T36 DT636
	ON
		DT635.C71 <> DT636.C431
	)
WHERE
	(
		DT636.C434 = DT636.C429
	)
	OR
	(
		DT636.C426 <> DT634.C409
	)
ORDER BY
	DT636.C420
	, DT634.C403
	, DT636.C426
	, DT636.C425
	, DT635.C71
	, DT634.C407
	, DT636.C429
	, DT635.C66
	, DT636.C430
	, DT635.C74
	, DT634.C405
	, DT635.C69
	, DT635.C70
	, DT636.C434
	, DT636.C436
	, DT634.C404
	, DT636.C431
	, DT635.C67
	, DT634.C406
	, DT636.C419
	, DT634.C410
	, DT635.C72
	, DT636.C422
	, DT636.C424
	, DT636.C433
	, DT635.C68
	, DT636.C435
	, DT634.C409
	, DT636.C427
	, DT636.C421
	, DT636.C437
	, DT634.C408
	, DT635.C73
	, DT636.C428
LIMIT 332;


SELECT
	DT641.C634
	, DT639.C753
	, DT641.C627
	, DT640.C121
	, DT638.C649
	, DT639.C751
	, DT640.C122
	, DT638.C651
	, DT638.C638
	, DT638.C639
	, DT639.C761
	, DT639.C760
	, DT637.C404
	, DT641.C628
	, DT637.C409
	, DT637.C402
	, DT639.C756
	, DT641.C629
	, DT638.C645
	, DT638.C636
	, DT640.C118
	, DT639.C745
	, DT640.C114
	, DT640.C112
	, DT641.C632
	, DT641.C633
	, DT639.C748
	, DT640.C116
	, DT638.C642
	, DT638.C647
	, DT639.C763
	, DT640.C123
	, DT640.C117
	, DT638.C637
	, DT639.C758
	, DT641.C635
	, DT639.C755
	, DT638.C644
	, DT640.C119
	, DT637.C406
	, DT638.C641
	, DT638.C648
	, DT640.C124
	, DT639.C746
	, DT638.C646
	, DT637.C405
	, DT639.C762
	, DT639.C752
	, DT639.C743
	, DT638.C652
	, DT640.C125
	, DT641.C625
	, DT640.C111
	, DT638.C640
	, DT639.C749
	, DT639.C750
	, DT640.C110
	, DT637.C407
	, DT641.C631
	, DT637.C410
	, DT637.C403
	, DT639.C744
	, DT640.C120
	, DT639.C757
	, DT641.C626
	, DT638.C653
	, DT639.C759
	, DT641.C630
	, DT638.C650
	, DT638.C643
	, DT640.C115
	, DT640.C113
	, DT639.C754
FROM
	(
		T63 DT639
	INNER JOIN
		(
			(
				T8 DT640
			INNER JOIN
				T52 DT641
			ON
				DT640.C114 = DT641.C628
			)
		INNER JOIN
			(
				T34 DT637
			INNER JOIN
				T53 DT638
			ON
				DT637.C408 = DT638.C638
			)
		ON
			DT640.C115 = DT638.C636
		)
	ON
		DT639.C759 > DT637.C408
	)
WHERE
	(
		(
			DT637.C405 = DT638.C646
		)
		OR
		(
			DT641.C625 = DT639.C749
		)
	)
	AND
	(
		DT639.C751 = DT639.C755
	)
ORDER BY
	DT641.C634
	, DT639.C753
	, DT641.C627
	, DT640.C121
	, DT638.C649
	, DT639.C751
	, DT640.C122
	, DT638.C651
	, DT638.C638
	, DT638.C639
	, DT639.C761
	, DT639.C760
	, DT637.C404
	, DT641.C628
	, DT637.C409
	, DT637.C402
	, DT639.C756
	, DT641.C629
	, DT638.C645
	, DT638.C636
	, DT640.C118
	, DT639.C745
	, DT640.C114
	, DT640.C112
	, DT641.C632
	, DT641.C633
	, DT639.C748
	, DT640.C116
	, DT638.C642
	, DT638.C647
	, DT639.C763
	, DT640.C123
	, DT640.C117
	, DT638.C637
	, DT639.C758
	, DT641.C635
	, DT639.C755
	, DT638.C644
	, DT640.C119
	, DT637.C406
	, DT638.C641
	, DT638.C648
	, DT640.C124
	, DT639.C746
	, DT638.C646
	, DT637.C405
	, DT639.C762
	, DT639.C752
	, DT639.C743
	, DT638.C652
	, DT640.C125
	, DT641.C625
	, DT640.C111
	, DT638.C640
	, DT639.C749
	, DT639.C750
	, DT640.C110
	, DT637.C407
	, DT641.C631
	, DT637.C410
	, DT637.C403
	, DT639.C744
	, DT640.C120
	, DT639.C757
	, DT641.C626
	, DT638.C653
	, DT639.C759
	, DT641.C630
	, DT638.C650
	, DT638.C643
	, DT640.C115
	, DT640.C113
	, DT639.C754
LIMIT 722;


SELECT
	DT642.C1
	, DT645.C191
	, DT644.C1044
	, DT644.C1042
	, DT644.C1043
	, DT644.C1036
	, DT643.C46
	, DT646.C272
	, DT644.C1037
	, DT643.C40
	, DT646.C278
	, DT644.C1032
	, DT644.C1029
	, DT643.C51
	, DT645.C199
	, DT646.C275
	, DT645.C188
	, DT644.C1046
	, DT645.C189
	, DT644.C1031
	, DT643.C50
	, DT646.C276
	, DT644.C1034
	, DT643.C32
	, DT643.C37
	, DT643.C45
	, DT645.C192
	, DT645.C190
	, DT643.C42
	, DT645.C194
	, DT643.C49
	, DT645.C187
	, DT644.C1035
	, DT643.C48
	, DT645.C195
	, DT645.C197
	, DT646.C270
	, DT644.C1030
FROM
	(
		T0 DT642
	INNER JOIN
		(
			T15 DT645
		INNER JOIN
			(
				(
					T23 DT646
				INNER JOIN
					T3 DT643
				ON
					DT646.C274 = DT643.C49
				)
			INNER JOIN
				T85 DT644
			ON
				DT643.C39 <> DT644.C1038
			)
		ON
			DT645.C192 > DT646.C277
		)
	ON
		DT642.C3 > DT644.C1034
	)
WHERE
	(
		DT644.C1037 = DT645.C189
	)
	AND
	(
		DT643.C42 < DT643.C32
	)
ORDER BY
	DT642.C1
	, DT645.C191
	, DT644.C1044
	, DT644.C1042
	, DT644.C1043
	, DT644.C1036
	, DT643.C46
	, DT646.C272
	, DT644.C1037
	, DT643.C40
	, DT646.C278
	, DT644.C1032
	, DT644.C1029
	, DT643.C51
	, DT645.C199
	, DT646.C275
	, DT645.C188
	, DT644.C1046
	, DT645.C189
	, DT644.C1031
	, DT643.C50
	, DT646.C276
	, DT644.C1034
	, DT643.C32
	, DT643.C37
	, DT643.C45
	, DT645.C192
	, DT645.C190
	, DT643.C42
	, DT645.C194
	, DT643.C49
	, DT645.C187
	, DT644.C1035
	, DT643.C48
	, DT645.C195
	, DT645.C197
	, DT646.C270
	, DT644.C1030
LIMIT 199;


SELECT
	DT648.C479
	, DT647.C155
	, DT647.C153
	, DT648.C481
	, DT648.C484
	, DT648.C475
	, DT648.C482
	, DT649.C1139
	, DT649.C1144
	, DT648.C474
	, DT649.C1140
	, DT648.C485
	, DT647.C154
FROM
	(
		T93 DT649
	INNER JOIN
		(
			T11 DT647
		INNER JOIN
			T42 DT648
		ON
			DT647.C155 < DT648.C476
		)
	ON
		DT649.C1136 = DT648.C478
	)
WHERE
	(
		(
			DT649.C1141 = DT648.C477
		)
		OR
		(
			(
				DT648.C481 > DT647.C152
			)
			OR
			(
				DT649.C1139 = DT648.C486
			)
		)
	)
	OR
	(
		(
			DT649.C1142 = DT649.C1139
		)
		AND
		(
			DT648.C479 > DT648.C480
		)
	)
ORDER BY
	DT648.C479
	, DT647.C155
	, DT647.C153
	, DT648.C481
	, DT648.C484
	, DT648.C475
	, DT648.C482
	, DT649.C1139
	, DT649.C1144
	, DT648.C474
	, DT649.C1140
	, DT648.C485
	, DT647.C154
LIMIT 459;


SELECT
	DT651.C253
	, DT651.C252
	, DT651.C257
	, DT650.C996
	, DT651.C250
	, DT651.C254
	, DT651.C251
	, DT651.C255
	, DT651.C258
	, DT650.C997
	, DT650.C995
	, DT650.C1000
	, DT651.C247
	, DT651.C249
FROM
	(
		T21 DT651
	INNER JOIN
		T82 DT650
	ON
		DT651.C251 > DT650.C997
	)
WHERE
	(
		(
			DT651.C257 > DT651.C254
		)
		AND
		(
			DT650.C995 < DT651.C250
		)
	)
	AND
	(
		DT650.C997 = DT651.C256
	)
ORDER BY
	DT651.C253
	, DT651.C252
	, DT651.C257
	, DT650.C996
	, DT651.C250
	, DT651.C254
	, DT651.C251
	, DT651.C255
	, DT651.C258
	, DT650.C997
	, DT650.C995
	, DT650.C1000
	, DT651.C247
	, DT651.C249
LIMIT 159;


SELECT
	DT653.C871
	, DT653.C874
	, DT653.C887
	, DT652.C130
	, DT652.C134
	, DT652.C131
	, DT653.C873
	, DT652.C128
	, DT653.C881
FROM
	(
		T9 DT652
	INNER JOIN
		T72 DT653
	ON
		DT652.C127 = DT653.C875
	)
WHERE
	(
		DT653.C880 = DT653.C867
	)
	OR
	(
		(
			DT652.C137 > DT653.C882
		)
		AND
		(
			DT653.C879 = DT653.C886
		)
	)
ORDER BY
	DT653.C871
	, DT653.C874
	, DT653.C887
	, DT652.C130
	, DT652.C134
	, DT652.C131
	, DT653.C873
	, DT652.C128
	, DT653.C881
LIMIT 749;


SELECT
	DT655.C441
	, DT654.C444
	, DT654.C445
	, DT655.C443
	, DT655.C442
	, DT654.C446
FROM
	(
		T39 DT654
	INNER JOIN
		T38 DT655
	ON
		DT654.C446 <> DT655.C441
	)
WHERE
	(
		DT655.C443 < DT655.C442
	)
	AND
	(
		(
			DT655.C441 < DT654.C445
		)
		AND
		(
			(
				DT655.C441 = DT655.C441
			)
			OR
			(
				(
					DT655.C441 = DT655.C441
				)
				AND
				(
					DT655.C441 <> DT654.C444
				)
			)
		)
	)
ORDER BY
	DT655.C441
	, DT654.C444
	, DT654.C445
	, DT655.C443
	, DT655.C442
	, DT654.C446
LIMIT 604;


SELECT
	DT660.C1122
	, DT656.C460
	, DT660.C1135
	, DT658.C1171
	, DT656.C451
	, DT660.C1133
	, DT660.C1115
	, DT659.C1172
	, DT656.C457
	, DT656.C470
	, DT660.C1119
	, DT656.C472
	, DT657.C1077
	, DT656.C461
	, DT656.C464
	, DT659.C1170
	, DT659.C1171
	, DT660.C1116
	, DT658.C1173
	, DT656.C459
	, DT660.C1123
	, DT660.C1128
	, DT656.C469
	, DT659.C1175
	, DT658.C1175
	, DT659.C1168
	, DT660.C1118
	, DT656.C453
	, DT656.C455
	, DT659.C1167
	, DT656.C454
FROM
	(
		(
			T95 DT659
		INNER JOIN
			(
				T95 DT658
			INNER JOIN
				T89 DT657
			ON
				DT658.C1173 < DT657.C1077
			)
		ON
			DT659.C1173 < DT657.C1078
		)
	INNER JOIN
		(
			T92 DT660
		INNER JOIN
			T41 DT656
		ON
			DT660.C1125 < DT656.C451
		)
	ON
		DT659.C1168 = DT656.C452
	)
WHERE
	(
		(
			DT660.C1121 <> DT656.C464
		)
		OR
		(
			DT656.C459 > DT658.C1170
		)
	)
	OR
	(
		DT660.C1130 <> DT660.C1121
	)
ORDER BY
	DT660.C1122
	, DT656.C460
	, DT660.C1135
	, DT658.C1171
	, DT656.C451
	, DT660.C1133
	, DT660.C1115
	, DT659.C1172
	, DT656.C457
	, DT656.C470
	, DT660.C1119
	, DT656.C472
	, DT657.C1077
	, DT656.C461
	, DT656.C464
	, DT659.C1170
	, DT659.C1171
	, DT660.C1116
	, DT658.C1173
	, DT656.C459
	, DT660.C1123
	, DT660.C1128
	, DT656.C469
	, DT659.C1175
	, DT658.C1175
	, DT659.C1168
	, DT660.C1118
	, DT656.C453
	, DT656.C455
	, DT659.C1167
	, DT656.C454
LIMIT 729;


SELECT
	DT661.C792
FROM
	(
		T65 DT661
	INNER JOIN
		T8 DT662
	ON
		DT661.C788 = DT662.C117
	)
WHERE
	(
		DT661.C791 = DT661.C796
	)
	OR
	(
		(
			(
				DT661.C797 < DT661.C783
			)
			OR
			(
				DT662.C118 <> DT661.C789
			)
		)
		OR
		(
			(
				DT661.C783 = DT661.C789
			)
			OR
			(
				DT662.C114 < DT661.C783
			)
		)
	)
ORDER BY
	DT661.C792
LIMIT 260;


SELECT
	DT663.C827
	, DT663.C836
	, DT664.C64
	, DT664.C60
	, DT663.C832
FROM
	(
		(
			T4 DT664
		INNER JOIN
			T24 DT665
		ON
			DT664.C59 = DT665.C279
		)
	INNER JOIN
		T69 DT663
	ON
		DT664.C53 > DT663.C826
	)
WHERE
	(
		DT664.C53 <> DT664.C60
	)
	OR
	(
		(
			(
				DT663.C833 <> DT664.C61
			)
			AND
			(
				DT663.C831 = DT664.C61
			)
		)
		AND
		(
			DT665.C282 = DT663.C837
		)
	)
ORDER BY
	DT663.C827
	, DT663.C836
	, DT664.C64
	, DT664.C60
	, DT663.C832
LIMIT 796;


SELECT
	DT667.C1059
	, DT666.C724
	, DT667.C1058
	, DT668.C201
	, DT666.C718
	, DT667.C1057
FROM
	(
		T87 DT667
	INNER JOIN
		(
			T60 DT666
		INNER JOIN
			T16 DT668
		ON
			DT666.C719 = DT668.C201
		)
	ON
		DT667.C1063 = DT666.C723
	)
WHERE
	(
		DT668.C201 = DT668.C200
	)
	AND
	(
		(
			DT666.C717 <> DT668.C201
		)
		OR
		(
			(
				DT666.C721 <> DT668.C206
			)
			AND
			(
				DT667.C1061 = DT668.C205
			)
		)
	)
ORDER BY
	DT667.C1059
	, DT666.C724
	, DT667.C1058
	, DT668.C201
	, DT666.C718
	, DT667.C1057
LIMIT 176;


SELECT
	DT673.C226
	, DT672.C232
	, DT671.C1204
	, DT669.C382
	, DT673.C227
	, DT673.C228
	, DT670.C719
	, DT671.C1208
	, DT669.C370
	, DT673.C219
	, DT669.C368
	, DT669.C374
	, DT673.C224
	, DT669.C377
	, DT669.C380
	, DT670.C721
	, DT672.C230
	, DT669.C375
	, DT669.C372
	, DT671.C1205
	, DT673.C223
	, DT669.C381
	, DT673.C221
	, DT671.C1206
	, DT673.C222
	, DT669.C378
	, DT671.C1207
	, DT669.C379
	, DT672.C231
	, DT670.C723
	, DT669.C366
	, DT669.C365
	, DT670.C724
	, DT669.C373
	, DT670.C718
	, DT673.C220
	, DT669.C369
	, DT673.C229
	, DT670.C717
	, DT669.C376
	, DT670.C720
FROM
	(
		(
			(
				T32 DT669
			INNER JOIN
				T19 DT672
			ON
				DT669.C377 = DT672.C231
			)
		INNER JOIN
			T60 DT670
		ON
			DT669.C373 < DT670.C717
		)
	INNER JOIN
		(
			T18 DT673
		INNER JOIN
			T99 DT671
		ON
			DT673.C227 > DT671.C1208
		)
	ON
		DT670.C718 = DT673.C228
	)
WHERE
	(
		(
			DT669.C372 <> DT669.C373
		)
		AND
		(
			(
				DT673.C223 = DT673.C225
			)
			AND
			(
				DT673.C226 <> DT669.C373
			)
		)
	)
	OR
	(
		(
			DT673.C221 < DT669.C380
		)
		AND
		(
			DT669.C367 > DT669.C381
		)
	)
ORDER BY
	DT673.C226
	, DT672.C232
	, DT671.C1204
	, DT669.C382
	, DT673.C227
	, DT673.C228
	, DT670.C719
	, DT671.C1208
	, DT669.C370
	, DT673.C219
	, DT669.C368
	, DT669.C374
	, DT673.C224
	, DT669.C377
	, DT669.C380
	, DT670.C721
	, DT672.C230
	, DT669.C375
	, DT669.C372
	, DT671.C1205
	, DT673.C223
	, DT669.C381
	, DT673.C221
	, DT671.C1206
	, DT673.C222
	, DT669.C378
	, DT671.C1207
	, DT669.C379
	, DT672.C231
	, DT670.C723
	, DT669.C366
	, DT669.C365
	, DT670.C724
	, DT669.C373
	, DT670.C718
	, DT673.C220
	, DT669.C369
	, DT673.C229
	, DT670.C717
	, DT669.C376
	, DT670.C720
LIMIT 497;


SELECT
	DT675.C519
	, DT675.C524
	, DT675.C522
	, DT677.C895
	, DT677.C893
	, DT677.C899
	, DT677.C900
	, DT677.C908
	, DT677.C906
	, DT674.C994
	, DT677.C907
	, DT676.C932
	, DT674.C990
	, DT675.C516
	, DT677.C902
	, DT675.C518
	, DT677.C892
	, DT677.C897
	, DT677.C889
	, DT676.C931
	, DT677.C890
	, DT676.C936
	, DT676.C930
	, DT677.C894
	, DT675.C521
	, DT677.C905
	, DT675.C514
	, DT675.C513
	, DT676.C937
	, DT675.C527
	, DT677.C891
	, DT676.C935
	, DT676.C933
	, DT677.C903
	, DT674.C993
	, DT675.C520
	, DT675.C512
	, DT675.C526
	, DT677.C898
	, DT677.C901
	, DT677.C904
	, DT675.C515
FROM
	(
		(
			(
				T45 DT675
			INNER JOIN
				T73 DT677
			ON
				DT675.C521 = DT677.C901
			)
		INNER JOIN
			T81 DT674
		ON
			DT677.C899 = DT674.C990
		)
	INNER JOIN
		T75 DT676
	ON
		DT675.C516 < DT676.C931
	)
WHERE
	(
		(
			DT675.C525 < DT675.C512
		)
		OR
		(
			DT676.C936 = DT677.C903
		)
	)
	AND
	(
		(
			DT675.C515 < DT677.C903
		)
		AND
		(
			DT677.C907 = DT677.C893
		)
	)
ORDER BY
	DT675.C519
	, DT675.C524
	, DT675.C522
	, DT677.C895
	, DT677.C893
	, DT677.C899
	, DT677.C900
	, DT677.C908
	, DT677.C906
	, DT674.C994
	, DT677.C907
	, DT676.C932
	, DT674.C990
	, DT675.C516
	, DT677.C902
	, DT675.C518
	, DT677.C892
	, DT677.C897
	, DT677.C889
	, DT676.C931
	, DT677.C890
	, DT676.C936
	, DT676.C930
	, DT677.C894
	, DT675.C521
	, DT677.C905
	, DT675.C514
	, DT675.C513
	, DT676.C937
	, DT675.C527
	, DT677.C891
	, DT676.C935
	, DT676.C933
	, DT677.C903
	, DT674.C993
	, DT675.C520
	, DT675.C512
	, DT675.C526
	, DT677.C898
	, DT677.C901
	, DT677.C904
	, DT675.C515
LIMIT 530;


SELECT
	DT680.C1
	, DT679.C809
	, DT679.C813
	, DT679.C817
	, DT679.C820
	, DT678.C1076
	, DT679.C810
	, DT679.C816
	, DT679.C814
	, DT678.C1077
	, DT680.C3
	, DT679.C812
FROM
	(
		T0 DT680
	INNER JOIN
		(
			T67 DT679
		INNER JOIN
			T89 DT678
		ON
			DT679.C815 = DT678.C1077
		)
	ON
		DT680.C3 = DT679.C811
	)
WHERE
	(
		(
			DT679.C811 = DT678.C1077
		)
		AND
		(
			DT679.C815 > DT679.C814
		)
	)
	AND
	(
		(
			(
				DT679.C817 > DT678.C1076
			)
			AND
			(
				DT678.C1077 <> DT678.C1077
			)
		)
		AND
		(
			DT679.C814 < DT679.C819
		)
	)
ORDER BY
	DT680.C1
	, DT679.C809
	, DT679.C813
	, DT679.C817
	, DT679.C820
	, DT678.C1076
	, DT679.C810
	, DT679.C816
	, DT679.C814
	, DT678.C1077
	, DT680.C3
	, DT679.C812
LIMIT 557;


SELECT
	DT681.C198
	, DT681.C194
	, DT683.C572
	, DT683.C585
	, DT683.C578
	, DT683.C577
	, DT683.C568
	, DT681.C199
	, DT681.C193
	, DT682.C934
	, DT683.C583
	, DT682.C930
	, DT682.C935
	, DT683.C575
	, DT683.C579
	, DT683.C574
	, DT683.C570
	, DT681.C195
	, DT682.C937
	, DT681.C188
	, DT683.C569
	, DT683.C571
	, DT682.C933
	, DT681.C196
	, DT683.C573
	, DT683.C581
	, DT681.C197
	, DT682.C936
	, DT683.C582
FROM
	(
		(
			T15 DT681
		INNER JOIN
			T48 DT683
		ON
			DT681.C196 = DT683.C575
		)
	INNER JOIN
		T75 DT682
	ON
		DT683.C576 = DT682.C930
	)
WHERE
	(
		DT682.C931 > DT683.C573
	)
	OR
	(
		(
			DT682.C936 = DT683.C570
		)
		AND
		(
			(
				DT683.C577 = DT681.C198
			)
			OR
			(
				DT681.C186 = DT683.C573
			)
		)
	)
ORDER BY
	DT681.C198
	, DT681.C194
	, DT683.C572
	, DT683.C585
	, DT683.C578
	, DT683.C577
	, DT683.C568
	, DT681.C199
	, DT681.C193
	, DT682.C934
	, DT683.C583
	, DT682.C930
	, DT682.C935
	, DT683.C575
	, DT683.C579
	, DT683.C574
	, DT683.C570
	, DT681.C195
	, DT682.C937
	, DT681.C188
	, DT683.C569
	, DT683.C571
	, DT682.C933
	, DT681.C196
	, DT683.C573
	, DT683.C581
	, DT681.C197
	, DT682.C936
	, DT683.C582
LIMIT 465;


SELECT
	DT685.C623
	, DT684.C440
	, DT685.C615
	, DT685.C621
	, DT685.C611
	, DT685.C610
	, DT685.C612
	, DT685.C619
	, DT685.C624
	, DT685.C618
	, DT684.C439
	, DT685.C614
	, DT685.C608
	, DT685.C616
FROM
	(
		T51 DT685
	INNER JOIN
		T37 DT684
	ON
		DT685.C619 > DT684.C439
	)
WHERE
	(
		DT684.C440 = DT685.C624
	)
	AND
	(
		DT685.C616 = DT684.C440
	)
ORDER BY
	DT685.C623
	, DT684.C440
	, DT685.C615
	, DT685.C621
	, DT685.C611
	, DT685.C610
	, DT685.C612
	, DT685.C619
	, DT685.C624
	, DT685.C618
	, DT684.C439
	, DT685.C614
	, DT685.C608
	, DT685.C616
LIMIT 697;


SELECT
	DT689.C220
	, DT686.C690
	, DT686.C695
	, DT690.C1081
	, DT690.C1087
FROM
	(
		T12 DT688
	INNER JOIN
		(
			(
				T57 DT686
			INNER JOIN
				T18 DT689
			ON
				DT686.C695 = DT689.C226
			)
		INNER JOIN
			(
				T90 DT690
			INNER JOIN
				T29 DT687
			ON
				DT690.C1087 = DT687.C334
			)
		ON
			DT686.C697 = DT687.C339
		)
	ON
		DT688.C161 = DT690.C1085
	)
WHERE
	(
		(
			DT689.C229 < DT686.C685
		)
		OR
		(
			DT686.C687 < DT690.C1092
		)
	)
	AND
	(
		DT690.C1083 = DT687.C339
	)
ORDER BY
	DT689.C220
	, DT686.C690
	, DT686.C695
	, DT690.C1081
	, DT690.C1087
LIMIT 138;


SELECT
	DT692.C1175
	, DT692.C1169
	, DT692.C1167
	, DT692.C1170
	, DT691.C217
FROM
	(
		T95 DT692
	INNER JOIN
		T17 DT691
	ON
		DT692.C1173 <> DT691.C209
	)
WHERE
	(
		DT692.C1175 > DT692.C1173
	)
	AND
	(
		DT692.C1170 <> DT692.C1174
	)
ORDER BY
	DT692.C1175
	, DT692.C1169
	, DT692.C1167
	, DT692.C1170
	, DT691.C217
LIMIT 902;


SELECT
	DT693.C648
	, DT693.C653
	, DT694.C306
	, DT694.C315
	, DT693.C651
	, DT693.C652
	, DT693.C640
	, DT693.C638
	, DT693.C650
	, DT694.C311
	, DT694.C298
	, DT694.C307
	, DT693.C647
	, DT694.C301
	, DT693.C637
	, DT693.C643
	, DT694.C300
	, DT694.C308
	, DT694.C318
	, DT694.C299
	, DT694.C313
	, DT694.C314
	, DT694.C303
	, DT694.C304
	, DT693.C641
	, DT693.C636
FROM
	(
		T53 DT693
	INNER JOIN
		T26 DT694
	ON
		DT693.C641 > DT694.C301
	)
WHERE
	(
		(
			(
				DT693.C636 = DT693.C636
			)
			AND
			(
				DT693.C653 = DT694.C315
			)
		)
		AND
		(
			DT694.C314 < DT693.C643
		)
	)
	AND
	(
		DT693.C646 <> DT694.C314
	)
ORDER BY
	DT693.C648
	, DT693.C653
	, DT694.C306
	, DT694.C315
	, DT693.C651
	, DT693.C652
	, DT693.C640
	, DT693.C638
	, DT693.C650
	, DT694.C311
	, DT694.C298
	, DT694.C307
	, DT693.C647
	, DT694.C301
	, DT693.C637
	, DT693.C643
	, DT694.C300
	, DT694.C308
	, DT694.C318
	, DT694.C299
	, DT694.C313
	, DT694.C314
	, DT694.C303
	, DT694.C304
	, DT693.C641
	, DT693.C636
LIMIT 612;


SELECT
	DT695.C742
	, DT699.C672
	, DT699.C677
	, DT697.C1089
	, DT696.C1163
	, DT699.C668
	, DT696.C1158
	, DT697.C1081
	, DT696.C1166
	, DT697.C1083
	, DT696.C1148
	, DT699.C669
	, DT697.C1090
	, DT697.C1086
	, DT698.C1206
	, DT698.C1207
	, DT696.C1161
	, DT697.C1082
	, DT698.C1204
	, DT699.C676
	, DT697.C1079
	, DT696.C1145
	, DT696.C1153
	, DT698.C1208
	, DT699.C678
	, DT696.C1159
FROM
	(
		(
			(
				T99 DT698
			INNER JOIN
				T90 DT697
			ON
				DT698.C1207 < DT697.C1085
			)
		INNER JOIN
			(
				T94 DT696
			INNER JOIN
				T62 DT695
			ON
				DT696.C1155 = DT695.C741
			)
		ON
			DT697.C1091 > DT696.C1158
		)
	INNER JOIN
		T56 DT699
	ON
		DT696.C1151 = DT699.C677
	)
WHERE
	(
		(
			DT696.C1155 = DT695.C741
		)
		OR
		(
			(
				DT697.C1092 < DT699.C675
			)
			AND
			(
				DT699.C668 > DT698.C1207
			)
		)
	)
	AND
	(
		DT697.C1082 < DT698.C1208
	)
ORDER BY
	DT695.C742
	, DT699.C672
	, DT699.C677
	, DT697.C1089
	, DT696.C1163
	, DT699.C668
	, DT696.C1158
	, DT697.C1081
	, DT696.C1166
	, DT697.C1083
	, DT696.C1148
	, DT699.C669
	, DT697.C1090
	, DT697.C1086
	, DT698.C1206
	, DT698.C1207
	, DT696.C1161
	, DT697.C1082
	, DT698.C1204
	, DT699.C676
	, DT697.C1079
	, DT696.C1145
	, DT696.C1153
	, DT698.C1208
	, DT699.C678
	, DT696.C1159
LIMIT 704;


SELECT
	DT701.C1201
	, DT703.C232
	, DT702.C180
	, DT700.C54
	, DT701.C1202
	, DT702.C185
	, DT700.C58
	, DT700.C65
	, DT700.C57
	, DT703.C231
	, DT700.C60
	, DT700.C53
	, DT700.C64
	, DT702.C181
	, DT702.C184
FROM
	(
		(
			(
				T4 DT700
			INNER JOIN
				T19 DT703
			ON
				DT700.C58 = DT703.C232
			)
		INNER JOIN
			T14 DT702
		ON
			DT700.C64 <> DT702.C185
		)
	INNER JOIN
		T98 DT701
	ON
		DT700.C60 < DT701.C1201
	)
WHERE
	(
		(
			DT703.C230 = DT702.C185
		)
		AND
		(
			DT700.C62 = DT700.C57
		)
	)
	OR
	(
		DT700.C60 <> DT702.C181
	)
ORDER BY
	DT701.C1201
	, DT703.C232
	, DT702.C180
	, DT700.C54
	, DT701.C1202
	, DT702.C185
	, DT700.C58
	, DT700.C65
	, DT700.C57
	, DT703.C231
	, DT700.C60
	, DT700.C53
	, DT700.C64
	, DT702.C181
	, DT702.C184
LIMIT 125;


SELECT
	DT705.C1154
	, DT705.C1155
	, DT707.C20
	, DT707.C29
	, DT707.C25
	, DT705.C1145
FROM
	(
		T37 DT706
	INNER JOIN
		(
			(
				T2 DT707
			INNER JOIN
				T94 DT705
			ON
				DT707.C16 = DT705.C1151
			)
		INNER JOIN
			T62 DT704
		ON
			DT707.C31 = DT704.C740
		)
	ON
		DT706.C439 <> DT707.C28
	)
WHERE
	(
		DT705.C1162 <> DT706.C439
	)
	AND
	(
		DT705.C1155 > DT706.C439
	)
ORDER BY
	DT705.C1154
	, DT705.C1155
	, DT707.C20
	, DT707.C29
	, DT707.C25
	, DT705.C1145
LIMIT 603;


SELECT
	DT710.C491
	, DT708.C657
	, DT710.C495
	, DT710.C496
	, DT708.C654
	, DT710.C498
	, DT710.C494
	, DT710.C493
	, DT708.C656
	, DT710.C497
	, DT709.C445
	, DT710.C492
	, DT710.C501
	, DT710.C488
FROM
	(
		(
			T39 DT709
		INNER JOIN
			T43 DT710
		ON
			DT709.C446 = DT710.C491
		)
	INNER JOIN
		T54 DT708
	ON
		DT710.C493 < DT708.C654
	)
WHERE
	(
		DT710.C494 <> DT710.C492
	)
	OR
	(
		(
			DT709.C446 = DT708.C655
		)
		OR
		(
			DT710.C488 <> DT709.C444
		)
	)
ORDER BY
	DT710.C491
	, DT708.C657
	, DT710.C495
	, DT710.C496
	, DT708.C654
	, DT710.C498
	, DT710.C494
	, DT710.C493
	, DT708.C656
	, DT710.C497
	, DT709.C445
	, DT710.C492
	, DT710.C501
	, DT710.C488
LIMIT 307;


SELECT
	DT713.C240
	, DT711.C525
	, DT711.C526
	, DT714.C403
	, DT711.C523
	, DT713.C234
	, DT711.C524
	, DT711.C519
	, DT713.C243
	, DT711.C515
	, DT714.C405
	, DT712.C1142
	, DT712.C1141
	, DT713.C245
	, DT711.C521
	, DT713.C239
	, DT714.C409
	, DT711.C513
	, DT711.C518
	, DT712.C1140
	, DT714.C404
	, DT713.C233
	, DT711.C522
	, DT712.C1138
	, DT712.C1139
	, DT711.C516
	, DT711.C512
	, DT713.C238
	, DT713.C237
FROM
	(
		(
			T45 DT711
		INNER JOIN
			T93 DT712
		ON
			DT711.C517 = DT712.C1144
		)
	INNER JOIN
		(
			T20 DT713
		INNER JOIN
			T34 DT714
		ON
			DT713.C240 = DT714.C404
		)
	ON
		DT711.C523 < DT713.C235
	)
WHERE
	(
		(
			(
				DT714.C402 = DT711.C512
			)
			AND
			(
				DT713.C243 = DT711.C526
			)
		)
		AND
		(
			DT711.C512 <> DT711.C525
		)
	)
	OR
	(
		(
			DT712.C1138 = DT711.C522
		)
		OR
		(
			DT712.C1141 > DT713.C237
		)
	)
ORDER BY
	DT713.C240
	, DT711.C525
	, DT711.C526
	, DT714.C403
	, DT711.C523
	, DT713.C234
	, DT711.C524
	, DT711.C519
	, DT713.C243
	, DT711.C515
	, DT714.C405
	, DT712.C1142
	, DT712.C1141
	, DT713.C245
	, DT711.C521
	, DT713.C239
	, DT714.C409
	, DT711.C513
	, DT711.C518
	, DT712.C1140
	, DT714.C404
	, DT713.C233
	, DT711.C522
	, DT712.C1138
	, DT712.C1139
	, DT711.C516
	, DT711.C512
	, DT713.C238
	, DT713.C237
LIMIT 797;


SELECT
	DT715.C503
	, DT718.C1079
	, DT716.C769
	, DT716.C764
	, DT718.C1090
	, DT716.C768
	, DT715.C505
	, DT715.C511
	, DT718.C1086
	, DT716.C766
	, DT718.C1084
	, DT717.C1204
	, DT718.C1089
	, DT718.C1083
	, DT718.C1092
	, DT716.C781
	, DT716.C771
	, DT716.C765
	, DT718.C1082
	, DT715.C509
	, DT715.C510
	, DT716.C782
	, DT715.C506
	, DT716.C772
	, DT718.C1087
	, DT716.C776
	, DT716.C778
	, DT715.C502
	, DT715.C507
	, DT718.C1081
	, DT715.C508
	, DT715.C504
FROM
	(
		T90 DT718
	INNER JOIN
		(
			T99 DT717
		INNER JOIN
			(
				T64 DT716
			INNER JOIN
				T44 DT715
			ON
				DT716.C775 > DT715.C505
			)
		ON
			DT717.C1204 <> DT716.C778
		)
	ON
		DT718.C1086 <> DT716.C772
	)
WHERE
	(
		(
			DT716.C781 = DT716.C769
		)
		AND
		(
			(
				DT718.C1080 = DT716.C771
			)
			OR
			(
				DT718.C1083 = DT716.C775
			)
		)
	)
	OR
	(
		DT716.C773 = DT716.C774
	)
ORDER BY
	DT715.C503
	, DT718.C1079
	, DT716.C769
	, DT716.C764
	, DT718.C1090
	, DT716.C768
	, DT715.C505
	, DT715.C511
	, DT718.C1086
	, DT716.C766
	, DT718.C1084
	, DT717.C1204
	, DT718.C1089
	, DT718.C1083
	, DT718.C1092
	, DT716.C781
	, DT716.C771
	, DT716.C765
	, DT718.C1082
	, DT715.C509
	, DT715.C510
	, DT716.C782
	, DT715.C506
	, DT716.C772
	, DT718.C1087
	, DT716.C776
	, DT716.C778
	, DT715.C502
	, DT715.C507
	, DT718.C1081
	, DT715.C508
	, DT715.C504
LIMIT 646;


SELECT
	DT720.C704
	, DT719.C98
	, DT719.C97
	, DT719.C93
	, DT719.C103
	, DT722.C1178
	, DT723.C608
	, DT719.C94
	, DT723.C617
	, DT719.C89
	, DT723.C624
	, DT722.C1185
	, DT722.C1184
	, DT719.C91
	, DT723.C621
	, DT720.C712
	, DT723.C622
	, DT722.C1177
	, DT720.C709
	, DT722.C1183
	, DT720.C711
	, DT719.C105
	, DT720.C698
	, DT719.C108
	, DT723.C611
	, DT723.C618
	, DT722.C1176
	, DT723.C619
	, DT719.C100
	, DT722.C1188
	, DT720.C701
	, DT719.C109
	, DT720.C702
	, DT719.C107
	, DT723.C613
	, DT720.C706
	, DT719.C92
	, DT720.C699
	, DT723.C623
FROM
	(
		(
			(
				T96 DT722
			INNER JOIN
				T30 DT721
			ON
				DT722.C1183 <> DT721.C341
			)
		INNER JOIN
			(
				T51 DT723
			INNER JOIN
				T7 DT719
			ON
				DT723.C611 = DT719.C101
			)
		ON
			DT721.C343 <> DT723.C618
		)
	INNER JOIN
		T58 DT720
	ON
		DT719.C108 = DT720.C708
	)
WHERE
	(
		(
			DT719.C106 > DT719.C94
		)
		OR
		(
			DT722.C1189 < DT719.C91
		)
	)
	OR
	(
		DT719.C103 > DT720.C699
	)
ORDER BY
	DT720.C704
	, DT719.C98
	, DT719.C97
	, DT719.C93
	, DT719.C103
	, DT722.C1178
	, DT723.C608
	, DT719.C94
	, DT723.C617
	, DT719.C89
	, DT723.C624
	, DT722.C1185
	, DT722.C1184
	, DT719.C91
	, DT723.C621
	, DT720.C712
	, DT723.C622
	, DT722.C1177
	, DT720.C709
	, DT722.C1183
	, DT720.C711
	, DT719.C105
	, DT720.C698
	, DT719.C108
	, DT723.C611
	, DT723.C618
	, DT722.C1176
	, DT723.C619
	, DT719.C100
	, DT722.C1188
	, DT720.C701
	, DT719.C109
	, DT720.C702
	, DT719.C107
	, DT723.C613
	, DT720.C706
	, DT719.C92
	, DT720.C699
	, DT723.C623
LIMIT 750;


SELECT
	DT725.C729
	, DT725.C735
	, DT724.C501
	, DT724.C488
	, DT726.C861
FROM
	(
		(
			T61 DT725
		INNER JOIN
			T43 DT724
		ON
			DT725.C739 < DT724.C500
		)
	INNER JOIN
		T71 DT726
	ON
		DT725.C730 = DT726.C861
	)
WHERE
	(
		(
			DT725.C733 > DT725.C734
		)
		AND
		(
			DT724.C498 = DT725.C728
		)
	)
	OR
	(
		(
			(
				DT724.C495 = DT726.C863
			)
			OR
			(
				DT724.C495 <> DT724.C497
			)
		)
		AND
		(
			DT724.C492 > DT725.C732
		)
	)
ORDER BY
	DT725.C729
	, DT725.C735
	, DT724.C501
	, DT724.C488
	, DT726.C861
LIMIT 823;


SELECT
	DT730.C193
	, DT727.C273
	, DT729.C401
	, DT730.C188
	, DT728.C1192
	, DT730.C195
	, DT730.C194
	, DT730.C191
	, DT730.C189
	, DT727.C270
	, DT728.C1197
	, DT729.C395
	, DT730.C190
	, DT727.C274
	, DT729.C384
	, DT729.C396
	, DT729.C391
	, DT729.C394
	, DT729.C390
	, DT729.C397
	, DT727.C272
	, DT729.C399
	, DT729.C385
	, DT727.C278
	, DT730.C197
	, DT727.C275
	, DT729.C389
	, DT728.C1190
	, DT729.C393
	, DT728.C1191
	, DT728.C1199
	, DT729.C398
	, DT727.C271
	, DT730.C196
	, DT728.C1194
	, DT729.C392
	, DT727.C276
	, DT730.C192
	, DT729.C386
	, DT729.C388
	, DT730.C187
	, DT729.C383
	, DT728.C1196
	, DT730.C198
	, DT728.C1198
	, DT730.C186
	, DT729.C400
	, DT727.C277
	, DT730.C199
	, DT728.C1193
	, DT728.C1195
FROM
	(
		(
			T33 DT729
		INNER JOIN
			T97 DT728
		ON
			DT729.C383 = DT728.C1194
		)
	INNER JOIN
		(
			T15 DT730
		INNER JOIN
			T23 DT727
		ON
			DT730.C190 = DT727.C275
		)
	ON
		DT728.C1199 = DT730.C193
	)
WHERE
	(
		(
			DT728.C1199 < DT728.C1190
		)
		OR
		(
			DT729.C398 <> DT729.C397
		)
	)
	AND
	(
		(
			DT729.C397 = DT728.C1194
		)
		OR
		(
			(
				DT730.C187 = DT729.C399
			)
			OR
			(
				DT729.C396 = DT729.C387
			)
		)
	)
ORDER BY
	DT730.C193
	, DT727.C273
	, DT729.C401
	, DT730.C188
	, DT728.C1192
	, DT730.C195
	, DT730.C194
	, DT730.C191
	, DT730.C189
	, DT727.C270
	, DT728.C1197
	, DT729.C395
	, DT730.C190
	, DT727.C274
	, DT729.C384
	, DT729.C396
	, DT729.C391
	, DT729.C394
	, DT729.C390
	, DT729.C397
	, DT727.C272
	, DT729.C399
	, DT729.C385
	, DT727.C278
	, DT730.C197
	, DT727.C275
	, DT729.C389
	, DT728.C1190
	, DT729.C393
	, DT728.C1191
	, DT728.C1199
	, DT729.C398
	, DT727.C271
	, DT730.C196
	, DT728.C1194
	, DT729.C392
	, DT727.C276
	, DT730.C192
	, DT729.C386
	, DT729.C388
	, DT730.C187
	, DT729.C383
	, DT728.C1196
	, DT730.C198
	, DT728.C1198
	, DT730.C186
	, DT729.C400
	, DT727.C277
	, DT730.C199
	, DT728.C1193
	, DT728.C1195
LIMIT 239;


SELECT
	DT731.C1208
FROM
	(
		(
			T81 DT732
		INNER JOIN
			(
				T35 DT733
			INNER JOIN
				(
					T39 DT735
				INNER JOIN
					T99 DT731
				ON
					DT735.C445 = DT731.C1204
				)
			ON
				DT733.C411 > DT731.C1205
			)
		ON
			DT732.C992 > DT733.C411
		)
	INNER JOIN
		T38 DT734
	ON
		DT731.C1207 = DT734.C443
	)
WHERE
	(
		(
			(
				DT733.C413 = DT732.C993
			)
			OR
			(
				DT731.C1206 = DT733.C416
			)
		)
		OR
		(
			DT733.C417 > DT731.C1204
		)
	)
	AND
	(
		DT733.C414 = DT734.C441
	)
ORDER BY
	DT731.C1208
LIMIT 498;


SELECT
	DT736.C440
	, DT737.C327
	, DT736.C438
	, DT737.C325
FROM
	(
		T27 DT737
	INNER JOIN
		T37 DT736
	ON
		DT737.C322 <> DT736.C439
	)
WHERE
	(
		DT736.C440 <> DT737.C320
	)
	AND
	(
		(
			DT737.C323 <> DT736.C438
		)
		OR
		(
			DT737.C324 <> DT737.C325
		)
	)
ORDER BY
	DT736.C440
	, DT737.C327
	, DT736.C438
	, DT737.C325
LIMIT 811;


SELECT
	DT738.C486
	, DT739.C279
FROM
	(
		T42 DT738
	INNER JOIN
		T24 DT739
	ON
		DT738.C477 = DT739.C282
	)
WHERE
	(
		(
			DT738.C485 <> DT738.C473
		)
		OR
		(
			DT738.C485 = DT739.C280
		)
	)
	OR
	(
		(
			DT738.C486 = DT738.C483
		)
		AND
		(
			DT738.C480 <> DT739.C282
		)
	)
ORDER BY
	DT738.C486
	, DT739.C279
LIMIT 562;


SELECT
	DT742.C316
	, DT741.C189
	, DT742.C300
	, DT742.C318
	, DT740.C482
	, DT740.C479
	, DT740.C476
	, DT740.C481
	, DT740.C486
	, DT740.C477
	, DT742.C309
	, DT741.C199
	, DT742.C317
	, DT742.C297
	, DT741.C193
	, DT742.C306
	, DT740.C480
	, DT742.C305
	, DT740.C473
	, DT740.C484
	, DT741.C198
	, DT742.C298
	, DT741.C195
	, DT741.C187
	, DT742.C299
	, DT740.C474
	, DT742.C313
FROM
	(
		(
			T15 DT741
		INNER JOIN
			T42 DT740
		ON
			DT741.C193 = DT740.C475
		)
	INNER JOIN
		T26 DT742
	ON
		DT741.C189 = DT742.C303
	)
WHERE
	(
		DT742.C312 = DT742.C309
	)
	AND
	(
		(
			DT742.C305 = DT740.C474
		)
		AND
		(
			DT741.C196 = DT740.C478
		)
	)
ORDER BY
	DT742.C316
	, DT741.C189
	, DT742.C300
	, DT742.C318
	, DT740.C482
	, DT740.C479
	, DT740.C476
	, DT740.C481
	, DT740.C486
	, DT740.C477
	, DT742.C309
	, DT741.C199
	, DT742.C317
	, DT742.C297
	, DT741.C193
	, DT742.C306
	, DT740.C480
	, DT742.C305
	, DT740.C473
	, DT740.C484
	, DT741.C198
	, DT742.C298
	, DT741.C195
	, DT741.C187
	, DT742.C299
	, DT740.C474
	, DT742.C313
LIMIT 242;


SELECT
	DT746.C514
	, DT744.C16
	, DT743.C196
	, DT743.C194
	, DT744.C30
	, DT746.C517
	, DT746.C521
	, DT744.C28
	, DT743.C197
	, DT744.C17
	, DT744.C22
	, DT744.C25
	, DT746.C524
	, DT746.C515
	, DT743.C190
	, DT744.C23
	, DT743.C186
	, DT745.C123
	, DT745.C125
	, DT746.C518
	, DT745.C119
	, DT745.C113
	, DT745.C120
	, DT745.C117
	, DT744.C18
	, DT745.C112
	, DT744.C31
	, DT745.C118
	, DT746.C516
	, DT743.C193
	, DT743.C195
	, DT745.C116
	, DT744.C29
	, DT744.C24
	, DT743.C192
	, DT745.C110
	, DT746.C519
	, DT743.C188
	, DT746.C527
	, DT745.C124
	, DT745.C111
	, DT744.C15
	, DT744.C19
	, DT743.C199
	, DT743.C191
	, DT743.C189
	, DT746.C520
	, DT744.C27
	, DT746.C512
	, DT746.C523
	, DT743.C187
	, DT744.C20
	, DT746.C526
	, DT745.C115
	, DT744.C26
	, DT746.C513
	, DT744.C21
	, DT745.C114
	, DT746.C522
	, DT743.C198
FROM
	(
		(
			(
				T45 DT746
			INNER JOIN
				T8 DT745
			ON
				DT746.C517 = DT745.C110
			)
		INNER JOIN
			T15 DT743
		ON
			DT746.C517 = DT743.C194
		)
	INNER JOIN
		T2 DT744
	ON
		DT745.C110 = DT744.C22
	)
WHERE
	(
		(
			DT746.C525 = DT746.C527
		)
		OR
		(
			DT743.C191 = DT745.C112
		)
	)
	OR
	(
		(
			DT746.C527 < DT745.C119
		)
		AND
		(
			(
				DT746.C519 < DT743.C195
			)
			AND
			(
				DT745.C116 = DT744.C15
			)
		)
	)
ORDER BY
	DT746.C514
	, DT744.C16
	, DT743.C196
	, DT743.C194
	, DT744.C30
	, DT746.C517
	, DT746.C521
	, DT744.C28
	, DT743.C197
	, DT744.C17
	, DT744.C22
	, DT744.C25
	, DT746.C524
	, DT746.C515
	, DT743.C190
	, DT744.C23
	, DT743.C186
	, DT745.C123
	, DT745.C125
	, DT746.C518
	, DT745.C119
	, DT745.C113
	, DT745.C120
	, DT745.C117
	, DT744.C18
	, DT745.C112
	, DT744.C31
	, DT745.C118
	, DT746.C516
	, DT743.C193
	, DT743.C195
	, DT745.C116
	, DT744.C29
	, DT744.C24
	, DT743.C192
	, DT745.C110
	, DT746.C519
	, DT743.C188
	, DT746.C527
	, DT745.C124
	, DT745.C111
	, DT744.C15
	, DT744.C19
	, DT743.C199
	, DT743.C191
	, DT743.C189
	, DT746.C520
	, DT744.C27
	, DT746.C512
	, DT746.C523
	, DT743.C187
	, DT744.C20
	, DT746.C526
	, DT745.C115
	, DT744.C26
	, DT746.C513
	, DT744.C21
	, DT745.C114
	, DT746.C522
	, DT743.C198
LIMIT 957;


SELECT
	DT748.C26
	, DT748.C31
	, DT748.C16
FROM
	(
		T2 DT748
	INNER JOIN
		T54 DT747
	ON
		DT748.C22 <> DT747.C655
	)
WHERE
	(
		DT747.C657 <> DT747.C656
	)
	AND
	(
		(
			(
				DT748.C20 = DT748.C26
			)
			AND
			(
				(
					DT748.C19 = DT748.C24
				)
				OR
				(
					DT748.C16 = DT748.C24
				)
			)
		)
		OR
		(
			DT748.C22 = DT747.C657
		)
	)
ORDER BY
	DT748.C26
	, DT748.C31
	, DT748.C16
LIMIT 287;


SELECT
	DT750.C481
	, DT751.C495
	, DT750.C480
	, DT750.C474
	, DT750.C483
	, DT751.C492
	, DT749.C41
	, DT749.C37
	, DT749.C50
	, DT751.C491
	, DT751.C497
	, DT751.C499
	, DT749.C47
	, DT751.C496
	, DT750.C485
	, DT751.C488
	, DT751.C501
	, DT751.C493
	, DT751.C498
FROM
	(
		(
			T3 DT749
		INNER JOIN
			T42 DT750
		ON
			DT749.C33 = DT750.C477
		)
	INNER JOIN
		T43 DT751
	ON
		DT750.C473 = DT751.C489
	)
WHERE
	(
		DT749.C34 <> DT750.C482
	)
	OR
	(
		DT750.C473 = DT749.C36
	)
ORDER BY
	DT750.C481
	, DT751.C495
	, DT750.C480
	, DT750.C474
	, DT750.C483
	, DT751.C492
	, DT749.C41
	, DT749.C37
	, DT749.C50
	, DT751.C491
	, DT751.C497
	, DT751.C499
	, DT749.C47
	, DT751.C496
	, DT750.C485
	, DT751.C488
	, DT751.C501
	, DT751.C493
	, DT751.C498
LIMIT 541;


SELECT
	DT752.C526
	, DT752.C522
	, DT753.C197
	, DT755.C341
	, DT752.C524
	, DT753.C194
	, DT752.C512
	, DT752.C517
	, DT752.C515
	, DT756.C1050
	, DT753.C195
	, DT755.C343
	, DT756.C1052
	, DT752.C523
	, DT753.C189
	, DT753.C187
	, DT752.C516
	, DT754.C328
	, DT753.C196
	, DT752.C514
	, DT752.C525
	, DT756.C1051
	, DT752.C520
	, DT753.C188
	, DT752.C521
	, DT756.C1049
	, DT753.C198
	, DT753.C192
	, DT752.C519
	, DT754.C330
	, DT753.C190
	, DT756.C1047
	, DT753.C191
	, DT753.C193
	, DT754.C329
	, DT756.C1055
	, DT756.C1053
	, DT753.C186
	, DT756.C1048
	, DT754.C333
	, DT756.C1054
FROM
	(
		(
			(
				T30 DT755
			INNER JOIN
				T45 DT752
			ON
				DT755.C342 = DT752.C522
			)
		INNER JOIN
			(
				T28 DT754
			INNER JOIN
				T15 DT753
			ON
				DT754.C332 = DT753.C192
			)
		ON
			DT755.C342 > DT753.C190
		)
	INNER JOIN
		T86 DT756
	ON
		DT754.C330 <> DT756.C1053
	)
WHERE
	(
		DT752.C515 = DT754.C332
	)
	AND
	(
		(
			(
				DT753.C188 = DT752.C512
			)
			AND
			(
				DT754.C332 = DT754.C331
			)
		)
		AND
		(
			DT752.C517 > DT756.C1047
		)
	)
ORDER BY
	DT752.C526
	, DT752.C522
	, DT753.C197
	, DT755.C341
	, DT752.C524
	, DT753.C194
	, DT752.C512
	, DT752.C517
	, DT752.C515
	, DT756.C1050
	, DT753.C195
	, DT755.C343
	, DT756.C1052
	, DT752.C523
	, DT753.C189
	, DT753.C187
	, DT752.C516
	, DT754.C328
	, DT753.C196
	, DT752.C514
	, DT752.C525
	, DT756.C1051
	, DT752.C520
	, DT753.C188
	, DT752.C521
	, DT756.C1049
	, DT753.C198
	, DT753.C192
	, DT752.C519
	, DT754.C330
	, DT753.C190
	, DT756.C1047
	, DT753.C191
	, DT753.C193
	, DT754.C329
	, DT756.C1055
	, DT756.C1053
	, DT753.C186
	, DT756.C1048
	, DT754.C333
	, DT756.C1054
LIMIT 281;


SELECT
	DT761.C1123
	, DT759.C289
	, DT757.C1154
FROM
	(
		(
			T94 DT757
		INNER JOIN
			(
				(
					T25 DT759
				INNER JOIN
					T2 DT760
				ON
					DT759.C293 = DT760.C28
				)
			INNER JOIN
				T5 DT758
			ON
				DT759.C283 = DT758.C66
			)
		ON
			DT757.C1151 <> DT759.C284
		)
	INNER JOIN
		T92 DT761
	ON
		DT760.C29 = DT761.C1130
	)
WHERE
	(
		(
			DT757.C1147 = DT761.C1127
		)
		OR
		(
			DT760.C20 <> DT758.C73
		)
	)
	OR
	(
		(
			DT760.C20 > DT761.C1122
		)
		AND
		(
			(
				DT758.C70 < DT758.C67
			)
			OR
			(
				DT760.C23 = DT759.C290
			)
		)
	)
ORDER BY
	DT761.C1123
	, DT759.C289
	, DT757.C1154
LIMIT 538;


SELECT
	DT764.C69
	, DT763.C943
	, DT764.C72
	, DT762.C709
	, DT762.C707
	, DT762.C706
	, DT764.C70
	, DT763.C945
	, DT762.C700
	, DT762.C698
	, DT762.C705
FROM
	(
		(
			T5 DT764
		INNER JOIN
			T58 DT762
		ON
			DT764.C73 < DT762.C705
		)
	INNER JOIN
		T76 DT763
	ON
		DT764.C71 = DT763.C945
	)
WHERE
	(
		DT762.C703 = DT762.C712
	)
	OR
	(
		DT763.C944 = DT762.C699
	)
ORDER BY
	DT764.C69
	, DT763.C943
	, DT764.C72
	, DT762.C709
	, DT762.C707
	, DT762.C706
	, DT764.C70
	, DT763.C945
	, DT762.C700
	, DT762.C698
	, DT762.C705
LIMIT 476;


SELECT
	DT765.C481
	, DT765.C485
	, DT766.C232
	, DT765.C479
	, DT765.C483
	, DT765.C476
	, DT766.C231
	, DT765.C474
FROM
	(
		T19 DT766
	INNER JOIN
		T42 DT765
	ON
		DT766.C232 < DT765.C475
	)
WHERE
	(
		DT765.C486 = DT765.C479
	)
	AND
	(
		(
			DT765.C476 <> DT766.C232
		)
		AND
		(
			(
				(
					DT765.C484 <> DT765.C486
				)
				AND
				(
					DT765.C485 < DT765.C475
				)
			)
			AND
			(
				DT765.C479 = DT765.C478
			)
		)
	)
ORDER BY
	DT765.C481
	, DT765.C485
	, DT766.C232
	, DT765.C479
	, DT765.C483
	, DT765.C476
	, DT766.C231
	, DT765.C474
LIMIT 400;


SELECT
	DT768.C1015
	, DT767.C450
	, DT769.C825
	, DT768.C1023
	, DT770.C1054
	, DT768.C1013
	, DT768.C1021
	, DT770.C1047
	, DT768.C1025
	, DT768.C1009
	, DT770.C1052
	, DT768.C1024
	, DT768.C1028
	, DT768.C1017
	, DT767.C447
	, DT770.C1055
	, DT768.C1018
	, DT769.C833
	, DT769.C827
	, DT768.C1011
	, DT768.C1016
	, DT768.C1022
FROM
	(
		(
			T40 DT767
		INNER JOIN
			T86 DT770
		ON
			DT767.C448 <> DT770.C1049
		)
	INNER JOIN
		(
			T69 DT769
		INNER JOIN
			T84 DT768
		ON
			DT769.C833 = DT768.C1022
		)
	ON
		DT770.C1050 > DT769.C828
	)
WHERE
	(
		(
			DT770.C1054 <> DT769.C829
		)
		AND
		(
			DT768.C1024 > DT768.C1022
		)
	)
	AND
	(
		(
			DT768.C1010 < DT768.C1026
		)
		AND
		(
			DT768.C1015 = DT767.C449
		)
	)
ORDER BY
	DT768.C1015
	, DT767.C450
	, DT769.C825
	, DT768.C1023
	, DT770.C1054
	, DT768.C1013
	, DT768.C1021
	, DT770.C1047
	, DT768.C1025
	, DT768.C1009
	, DT770.C1052
	, DT768.C1024
	, DT768.C1028
	, DT768.C1017
	, DT767.C447
	, DT770.C1055
	, DT768.C1018
	, DT769.C833
	, DT769.C827
	, DT768.C1011
	, DT768.C1016
	, DT768.C1022
LIMIT 966;


SELECT
	DT772.C69
	, DT771.C721
FROM
	(
		T60 DT771
	INNER JOIN
		T5 DT772
	ON
		DT771.C724 = DT772.C71
	)
WHERE
	(
		DT772.C68 < DT771.C718
	)
	AND
	(
		DT772.C70 = DT772.C74
	)
ORDER BY
	DT772.C69
	, DT771.C721
LIMIT 238;


SELECT
	DT773.C427
	, DT774.C1020
	, DT775.C478
	, DT773.C424
	, DT773.C437
	, DT774.C1027
	, DT774.C1028
	, DT773.C426
	, DT774.C1021
	, DT774.C1017
	, DT774.C1010
	, DT775.C474
	, DT774.C1016
	, DT774.C1009
	, DT773.C431
	, DT773.C432
	, DT773.C422
	, DT775.C477
	, DT775.C481
	, DT775.C484
	, DT774.C1025
	, DT775.C485
	, DT774.C1022
	, DT773.C425
	, DT774.C1018
	, DT775.C483
	, DT773.C428
	, DT773.C436
	, DT774.C1008
	, DT775.C473
	, DT774.C1024
	, DT774.C1012
	, DT775.C476
	, DT774.C1014
	, DT774.C1015
	, DT775.C479
	, DT773.C419
	, DT773.C423
	, DT773.C429
	, DT773.C435
	, DT775.C480
	, DT775.C475
	, DT775.C482
	, DT773.C420
	, DT775.C486
	, DT773.C430
	, DT774.C1013
	, DT774.C1026
	, DT774.C1019
	, DT774.C1023
	, DT774.C1011
	, DT773.C434
FROM
	(
		T84 DT774
	INNER JOIN
		(
			T36 DT773
		INNER JOIN
			T42 DT775
		ON
			DT773.C432 = DT775.C474
		)
	ON
		DT774.C1013 = DT773.C434
	)
WHERE
	(
		DT774.C1010 = DT775.C483
	)
	AND
	(
		(
			(
				DT774.C1020 = DT774.C1020
			)
			AND
			(
				(
					DT773.C437 = DT775.C475
				)
				OR
				(
					DT773.C427 < DT775.C474
				)
			)
		)
		OR
		(
			DT774.C1021 = DT773.C432
		)
	)
ORDER BY
	DT773.C427
	, DT774.C1020
	, DT775.C478
	, DT773.C424
	, DT773.C437
	, DT774.C1027
	, DT774.C1028
	, DT773.C426
	, DT774.C1021
	, DT774.C1017
	, DT774.C1010
	, DT775.C474
	, DT774.C1016
	, DT774.C1009
	, DT773.C431
	, DT773.C432
	, DT773.C422
	, DT775.C477
	, DT775.C481
	, DT775.C484
	, DT774.C1025
	, DT775.C485
	, DT774.C1022
	, DT773.C425
	, DT774.C1018
	, DT775.C483
	, DT773.C428
	, DT773.C436
	, DT774.C1008
	, DT775.C473
	, DT774.C1024
	, DT774.C1012
	, DT775.C476
	, DT774.C1014
	, DT774.C1015
	, DT775.C479
	, DT773.C419
	, DT773.C423
	, DT773.C429
	, DT773.C435
	, DT775.C480
	, DT775.C475
	, DT775.C482
	, DT773.C420
	, DT775.C486
	, DT773.C430
	, DT774.C1013
	, DT774.C1026
	, DT774.C1019
	, DT774.C1023
	, DT774.C1011
	, DT773.C434
LIMIT 734;


SELECT
	DT778.C68
	, DT778.C74
	, DT779.C665
	, DT779.C660
	, DT779.C664
	, DT777.C1181
	, DT776.C95
	, DT776.C101
	, DT776.C109
	, DT776.C89
	, DT777.C1179
	, DT777.C1187
	, DT779.C659
	, DT776.C93
	, DT779.C662
	, DT776.C92
FROM
	(
		(
			T55 DT779
		INNER JOIN
			T5 DT778
		ON
			DT779.C664 = DT778.C72
		)
	INNER JOIN
		(
			T7 DT776
		INNER JOIN
			T96 DT777
		ON
			DT776.C95 < DT777.C1184
		)
	ON
		DT778.C73 = DT776.C94
	)
WHERE
	(
		(
			(
				DT776.C105 <> DT778.C74
			)
			AND
			(
				DT776.C102 = DT776.C99
			)
		)
		OR
		(
			DT777.C1183 = DT778.C66
		)
	)
	AND
	(
		(
			DT778.C74 > DT779.C666
		)
		AND
		(
			DT778.C66 = DT776.C103
		)
	)
ORDER BY
	DT778.C68
	, DT778.C74
	, DT779.C665
	, DT779.C660
	, DT779.C664
	, DT777.C1181
	, DT776.C95
	, DT776.C101
	, DT776.C109
	, DT776.C89
	, DT777.C1179
	, DT777.C1187
	, DT779.C659
	, DT776.C93
	, DT779.C662
	, DT776.C92
LIMIT 442;


SELECT
	DT780.C278
	, DT781.C82
	, DT780.C275
	, DT781.C88
	, DT781.C75
	, DT780.C271
	, DT781.C76
	, DT781.C79
	, DT781.C86
	, DT781.C80
	, DT781.C85
	, DT781.C78
FROM
	(
		T6 DT781
	INNER JOIN
		T23 DT780
	ON
		DT781.C83 > DT780.C273
	)
WHERE
	(
		DT781.C79 = DT780.C273
	)
	AND
	(
		DT780.C274 < DT781.C84
	)
ORDER BY
	DT780.C278
	, DT781.C82
	, DT780.C275
	, DT781.C88
	, DT781.C75
	, DT780.C271
	, DT781.C76
	, DT781.C79
	, DT781.C86
	, DT781.C80
	, DT781.C85
	, DT781.C78
LIMIT 565;


SELECT
	DT784.C343
	, DT783.C414
	, DT782.C1063
	, DT783.C413
	, DT782.C1058
	, DT782.C1060
	, DT782.C1057
	, DT782.C1059
	, DT783.C415
	, DT782.C1062
	, DT783.C416
	, DT783.C411
	, DT783.C417
	, DT783.C412
	, DT782.C1056
	, DT784.C341
	, DT783.C418
	, DT782.C1061
FROM
	(
		(
			T87 DT782
		INNER JOIN
			T30 DT784
		ON
			DT782.C1057 = DT784.C341
		)
	INNER JOIN
		T35 DT783
	ON
		DT782.C1056 <> DT783.C416
	)
WHERE
	(
		DT783.C416 = DT783.C416
	)
	AND
	(
		(
			DT783.C411 = DT782.C1058
		)
		AND
		(
			DT783.C411 > DT782.C1061
		)
	)
ORDER BY
	DT784.C343
	, DT783.C414
	, DT782.C1063
	, DT783.C413
	, DT782.C1058
	, DT782.C1060
	, DT782.C1057
	, DT782.C1059
	, DT783.C415
	, DT782.C1062
	, DT783.C416
	, DT783.C411
	, DT783.C417
	, DT783.C412
	, DT782.C1056
	, DT784.C341
	, DT783.C418
	, DT782.C1061
LIMIT 820;



SELECT
	DT101.C383
	, DT100.C501
	, DT100.C498
	, DT101.C392
	, DT101.C393
	, DT101.C389
	, DT100.C497
	, DT102.C339
	, DT102.C340
	, DT101.C396
	, DT100.C500
	, DT100.C495
	, DT100.C494
	, DT101.C385
	, DT100.C490
	, DT100.C496
FROM
	(
		(
			T43 DT100
		INNER JOIN
			T33 DT101
		ON
			DT100.C498 = DT101.C401
		)
	RIGHT OUTER JOIN
		T29 DT102
	ON
		DT101.C389 <> DT102.C336
	)
WHERE
	(
		(
			DT101.C388 <> DT102.C337
		)
		AND
		(
			DT101.C399 < DT101.C391
		)
	)
	OR
	(
		(
			DT100.C490 = DT101.C386
		)
		AND
		(
			DT100.C494 = DT101.C399
		)
	)
ORDER BY
	DT101.C383
	, DT100.C501
	, DT100.C498
	, DT101.C392
	, DT101.C393
	, DT101.C389
	, DT100.C497
	, DT102.C339
	, DT102.C340
	, DT101.C396
	, DT100.C500
	, DT100.C495
	, DT100.C494
	, DT101.C385
	, DT100.C490
	, DT100.C496
LIMIT 828;


SELECT
	DT105.C314
	, DT104.C674
	, DT105.C300
	, DT105.C298
	, DT105.C310
	, DT105.C317
	, DT103.C508
	, DT105.C315
	, DT103.C510
	, DT105.C305
	, DT105.C312
	, DT104.C671
	, DT103.C507
	, DT104.C679
	, DT104.C678
	, DT105.C303
	, DT104.C680
	, DT104.C681
	, DT105.C307
	, DT103.C502
	, DT103.C509
	, DT104.C670
	, DT105.C309
	, DT105.C311
	, DT105.C318
	, DT104.C677
FROM
	(
		(
			T56 DT104
		INNER JOIN
			T26 DT105
		ON
			DT104.C670 = DT105.C308
		)
	RIGHT OUTER JOIN
		T44 DT103
	ON
		DT105.C304 = DT103.C504
	)
WHERE
	(
		DT105.C314 = DT104.C679
	)
	AND
	(
		DT104.C674 <> DT105.C312
	)
ORDER BY
	DT105.C314
	, DT104.C674
	, DT105.C300
	, DT105.C298
	, DT105.C310
	, DT105.C317
	, DT103.C508
	, DT105.C315
	, DT103.C510
	, DT105.C305
	, DT105.C312
	, DT104.C671
	, DT103.C507
	, DT104.C679
	, DT104.C678
	, DT105.C303
	, DT104.C680
	, DT104.C681
	, DT105.C307
	, DT103.C502
	, DT103.C509
	, DT104.C670
	, DT105.C309
	, DT105.C311
	, DT105.C318
	, DT104.C677
LIMIT 564;


SELECT
	DT106.C255
	, DT106.C256
	, DT108.C25
	, DT108.C21
	, DT108.C18
	, DT108.C22
	, DT108.C17
	, DT108.C16
	, DT108.C20
	, DT106.C257
	, DT106.C254
	, DT108.C31
	, DT107.C742
	, DT108.C27
FROM
	(
		T2 DT108
	INNER JOIN
		(
			T21 DT106
		INNER JOIN
			T62 DT107
		ON
			DT106.C250 > DT107.C741
		)
	ON
		DT108.C27 = DT106.C251
	)
WHERE
	(
		DT108.C30 = DT108.C16
	)
	AND
	(
		DT106.C247 <> DT108.C15
	)
ORDER BY
	DT106.C255
	, DT106.C256
	, DT108.C25
	, DT108.C21
	, DT108.C18
	, DT108.C22
	, DT108.C17
	, DT108.C16
	, DT108.C20
	, DT106.C257
	, DT106.C254
	, DT108.C31
	, DT107.C742
	, DT108.C27
LIMIT 201;


SELECT
	DT109.C511
	, DT110.C61
	, DT111.C78
	, DT112.C680
	, DT110.C55
	, DT113.C227
	, DT109.C505
	, DT110.C64
	, DT109.C502
	, DT112.C668
	, DT110.C60
	, DT112.C675
	, DT112.C669
	, DT109.C504
	, DT111.C77
	, DT113.C229
	, DT111.C79
	, DT111.C88
	, DT112.C679
	, DT110.C59
	, DT113.C224
	, DT109.C509
	, DT112.C676
	, DT111.C87
	, DT111.C76
	, DT109.C507
	, DT110.C63
	, DT113.C220
	, DT113.C221
	, DT112.C674
	, DT113.C225
	, DT111.C85
	, DT112.C670
	, DT113.C223
	, DT110.C58
	, DT109.C506
	, DT111.C82
	, DT109.C510
	, DT112.C671
	, DT112.C677
	, DT113.C228
	, DT113.C222
	, DT112.C672
	, DT112.C678
	, DT109.C508
	, DT112.C673
	, DT113.C219
	, DT111.C80
	, DT110.C56
	, DT111.C86
	, DT110.C57
FROM
	(
		T18 DT113
	INNER JOIN
		(
			T6 DT111
		RIGHT OUTER JOIN
			(
				T44 DT109
			CROSS JOIN
				(
					T56 DT112
				INNER JOIN
					T4 DT110
				ON
					DT112.C669 <> DT110.C64
				)
			)
		ON
			DT111.C81 < DT109.C510
		)
	ON
		DT113.C220 = DT111.C80
	)
WHERE
	(
		DT109.C502 < DT109.C511
	)
	AND
	(
		(
			DT111.C80 <> DT111.C86
		)
		AND
		(
			DT112.C679 <> DT112.C679
		)
	)
ORDER BY
	DT109.C511
	, DT110.C61
	, DT111.C78
	, DT112.C680
	, DT110.C55
	, DT113.C227
	, DT109.C505
	, DT110.C64
	, DT109.C502
	, DT112.C668
	, DT110.C60
	, DT112.C675
	, DT112.C669
	, DT109.C504
	, DT111.C77
	, DT113.C229
	, DT111.C79
	, DT111.C88
	, DT112.C679
	, DT110.C59
	, DT113.C224
	, DT109.C509
	, DT112.C676
	, DT111.C87
	, DT111.C76
	, DT109.C507
	, DT110.C63
	, DT113.C220
	, DT113.C221
	, DT112.C674
	, DT113.C225
	, DT111.C85
	, DT112.C670
	, DT113.C223
	, DT110.C58
	, DT109.C506
	, DT111.C82
	, DT109.C510
	, DT112.C671
	, DT112.C677
	, DT113.C228
	, DT113.C222
	, DT112.C672
	, DT112.C678
	, DT109.C508
	, DT112.C673
	, DT113.C219
	, DT111.C80
	, DT110.C56
	, DT111.C86
	, DT110.C57
LIMIT 230;


SELECT
	DT117.C834
	, DT115.C9
	, DT117.C826
	, DT114.C809
	, DT114.C811
	, DT114.C817
	, DT114.C816
	, DT115.C4
	, DT117.C825
	, DT117.C828
	, DT117.C837
	, DT115.C10
	, DT115.C6
FROM
	(
		(
			T37 DT116
		INNER JOIN
			T69 DT117
		ON
			DT116.C438 <> DT117.C832
		)
	RIGHT OUTER JOIN
		(
			T67 DT114
		INNER JOIN
			T1 DT115
		ON
			DT114.C816 = DT115.C5
		)
	ON
		DT117.C838 < DT114.C814
	)
WHERE
	(
		(
			DT114.C812 <> DT116.C439
		)
		AND
		(
			DT115.C13 = DT116.C438
		)
	)
	OR
	(
		DT114.C811 = DT114.C813
	)
ORDER BY
	DT117.C834
	, DT115.C9
	, DT117.C826
	, DT114.C809
	, DT114.C811
	, DT114.C817
	, DT114.C816
	, DT115.C4
	, DT117.C825
	, DT117.C828
	, DT117.C837
	, DT115.C10
	, DT115.C6
LIMIT 332;


SELECT
	DT121.C956
	, DT118.C973
	, DT118.C966
	, DT121.C950
	, DT121.C948
	, DT121.C951
	, DT121.C949
	, DT121.C952
	, DT121.C955
	, DT122.C321
	, DT121.C964
	, DT119.C1203
	, DT120.C67
	, DT118.C976
	, DT122.C322
	, DT121.C963
	, DT121.C953
	, DT120.C74
	, DT121.C957
	, DT121.C961
	, DT119.C1201
	, DT122.C325
	, DT119.C1202
	, DT121.C947
FROM
	(
		T78 DT118
	RIGHT OUTER JOIN
		(
			(
				T98 DT119
			INNER JOIN
				T27 DT122
			ON
				DT119.C1202 <> DT122.C321
			)
		INNER JOIN
			(
				T77 DT121
			CROSS JOIN
				T5 DT120
			)
		ON
			DT122.C325 < DT121.C955
		)
	ON
		DT118.C977 = DT121.C963
	)
WHERE
	(
		DT119.C1203 = DT120.C66
	)
	AND
	(
		DT121.C948 = DT118.C975
	)
ORDER BY
	DT121.C956
	, DT118.C973
	, DT118.C966
	, DT121.C950
	, DT121.C948
	, DT121.C951
	, DT121.C949
	, DT121.C952
	, DT121.C955
	, DT122.C321
	, DT121.C964
	, DT119.C1203
	, DT120.C67
	, DT118.C976
	, DT122.C322
	, DT121.C963
	, DT121.C953
	, DT120.C74
	, DT121.C957
	, DT121.C961
	, DT119.C1201
	, DT122.C325
	, DT119.C1202
	, DT121.C947
LIMIT 817;


SELECT
	DT126.C405
	, DT125.C605
	, DT126.C409
	, DT124.C510
	, DT124.C504
	, DT124.C507
	, DT127.C1201
	, DT126.C406
	, DT123.C455
	, DT123.C453
	, DT123.C462
	, DT123.C452
	, DT123.C457
	, DT123.C459
	, DT123.C472
	, DT125.C604
	, DT126.C410
	, DT124.C502
	, DT124.C508
	, DT123.C468
	, DT123.C454
	, DT123.C456
	, DT126.C407
	, DT124.C509
FROM
	(
		(
			(
				T34 DT126
			LEFT OUTER JOIN
				T44 DT124
			ON
				DT126.C402 > DT124.C511
			)
		RIGHT OUTER JOIN
			(
				T41 DT123
			LEFT OUTER JOIN
				T98 DT127
			ON
				DT123.C458 > DT127.C1201
			)
		ON
			DT126.C409 = DT123.C465
		)
	INNER JOIN
		T50 DT125
	ON
		DT127.C1202 = DT125.C603
	)
WHERE
	(
		DT123.C469 < DT123.C470
	)
	AND
	(
		DT123.C452 = DT127.C1201
	)
ORDER BY
	DT126.C405
	, DT125.C605
	, DT126.C409
	, DT124.C510
	, DT124.C504
	, DT124.C507
	, DT127.C1201
	, DT126.C406
	, DT123.C455
	, DT123.C453
	, DT123.C462
	, DT123.C452
	, DT123.C457
	, DT123.C459
	, DT123.C472
	, DT125.C604
	, DT126.C410
	, DT124.C502
	, DT124.C508
	, DT123.C468
	, DT123.C454
	, DT123.C456
	, DT126.C407
	, DT124.C509
LIMIT 505;


SELECT
	DT128.C453
	, DT129.C792
	, DT129.C785
	, DT128.C464
	, DT128.C460
	, DT128.C469
	, DT129.C796
	, DT128.C462
	, DT128.C461
	, DT128.C459
	, DT129.C790
	, DT128.C454
	, DT128.C455
	, DT128.C465
	, DT129.C793
	, DT128.C452
	, DT129.C797
	, DT129.C784
	, DT129.C783
	, DT129.C788
	, DT128.C466
	, DT128.C467
	, DT128.C456
	, DT128.C470
	, DT128.C458
	, DT129.C787
FROM
	(
		T41 DT128
	INNER JOIN
		T65 DT129
	ON
		DT128.C454 = DT129.C788
	)
WHERE
	(
		(
			DT128.C461 = DT128.C463
		)
		OR
		(
			DT129.C789 = DT128.C465
		)
	)
	AND
	(
		DT128.C472 <> DT128.C453
	)
ORDER BY
	DT128.C453
	, DT129.C792
	, DT129.C785
	, DT128.C464
	, DT128.C460
	, DT128.C469
	, DT129.C796
	, DT128.C462
	, DT128.C461
	, DT128.C459
	, DT129.C790
	, DT128.C454
	, DT128.C455
	, DT128.C465
	, DT129.C793
	, DT128.C452
	, DT129.C797
	, DT129.C784
	, DT129.C783
	, DT129.C788
	, DT128.C466
	, DT128.C467
	, DT128.C456
	, DT128.C470
	, DT128.C458
	, DT129.C787
LIMIT 406;


SELECT
	DT130.C176
	, DT133.C794
	, DT133.C793
	, DT132.C1199
	, DT130.C175
	, DT130.C177
	, DT132.C1200
	, DT131.C606
	, DT130.C171
	, DT130.C164
	, DT131.C607
	, DT133.C792
	, DT132.C1196
	, DT131.C602
	, DT132.C1195
	, DT132.C1198
FROM
	(
		(
			T65 DT133
		CROSS JOIN
			(
				T97 DT132
			RIGHT OUTER JOIN
				T50 DT131
			ON
				DT132.C1199 = DT131.C604
			)
		)
	INNER JOIN
		T13 DT130
	ON
		DT131.C605 = DT130.C176
	)
WHERE
	(
		(
			DT130.C175 = DT130.C175
		)
		OR
		(
			DT133.C793 < DT133.C790
		)
	)
	AND
	(
		(
			DT133.C797 < DT133.C797
		)
		AND
		(
			DT133.C785 = DT132.C1195
		)
	)
ORDER BY
	DT130.C176
	, DT133.C794
	, DT133.C793
	, DT132.C1199
	, DT130.C175
	, DT130.C177
	, DT132.C1200
	, DT131.C606
	, DT130.C171
	, DT130.C164
	, DT131.C607
	, DT133.C792
	, DT132.C1196
	, DT131.C602
	, DT132.C1195
	, DT132.C1198
LIMIT 713;


SELECT
	DT135.C523
	, DT135.C513
	, DT135.C515
	, DT134.C1004
	, DT135.C521
	, DT135.C524
	, DT134.C1003
	, DT135.C517
	, DT135.C527
	, DT134.C1007
	, DT135.C512
	, DT135.C520
	, DT135.C514
	, DT135.C525
FROM
	(
		T45 DT135
	INNER JOIN
		T83 DT134
	ON
		DT135.C522 > DT134.C1005
	)
WHERE
	(
		DT134.C1007 < DT135.C518
	)
	AND
	(
		(
			DT135.C516 < DT135.C520
		)
		AND
		(
			DT135.C515 = DT134.C1003
		)
	)
ORDER BY
	DT135.C523
	, DT135.C513
	, DT135.C515
	, DT134.C1004
	, DT135.C521
	, DT135.C524
	, DT134.C1003
	, DT135.C517
	, DT135.C527
	, DT134.C1007
	, DT135.C512
	, DT135.C520
	, DT135.C514
	, DT135.C525
LIMIT 984;


SELECT
	DT137.C711
	, DT137.C703
	, DT137.C707
	, DT137.C712
	, DT137.C701
	, DT136.C439
	, DT137.C705
	, DT137.C704
	, DT137.C699
	, DT136.C440
	, DT137.C706
	, DT137.C698
	, DT137.C709
	, DT137.C710
	, DT137.C702
	, DT137.C708
	, DT137.C700
FROM
	(
		T37 DT136
	CROSS JOIN
		T58 DT137
	)
WHERE
	(
		DT137.C707 > DT137.C706
	)
	AND
	(
		(
			(
				DT137.C706 > DT137.C709
			)
			OR
			(
				DT137.C710 <> DT137.C700
			)
		)
		AND
		(
			DT137.C705 = DT137.C706
		)
	)
ORDER BY
	DT137.C711
	, DT137.C703
	, DT137.C707
	, DT137.C712
	, DT137.C701
	, DT136.C439
	, DT137.C705
	, DT137.C704
	, DT137.C699
	, DT136.C440
	, DT137.C706
	, DT137.C698
	, DT137.C709
	, DT137.C710
	, DT137.C702
	, DT137.C708
	, DT137.C700
LIMIT 103;


SELECT
	DT140.C333
	, DT141.C525
	, DT140.C329
	, DT142.C1133
	, DT142.C1135
	, DT141.C517
	, DT141.C522
	, DT141.C512
	, DT142.C1121
	, DT142.C1115
	, DT142.C1131
	, DT142.C1125
	, DT138.C740
	, DT141.C519
	, DT142.C1118
	, DT141.C515
	, DT138.C742
	, DT142.C1128
	, DT141.C524
	, DT142.C1126
	, DT142.C1116
	, DT139.C993
	, DT140.C328
	, DT142.C1120
	, DT141.C516
	, DT142.C1127
	, DT141.C521
	, DT139.C990
	, DT142.C1130
	, DT141.C520
	, DT139.C991
	, DT141.C523
	, DT142.C1117
	, DT138.C741
	, DT139.C994
	, DT140.C330
	, DT141.C514
	, DT140.C332
	, DT141.C527
	, DT141.C518
	, DT142.C1129
	, DT139.C992
	, DT142.C1134
	, DT142.C1124
	, DT142.C1123
	, DT142.C1122
	, DT141.C526
	, DT141.C513
	, DT142.C1132
	, DT140.C331
FROM
	(
		T62 DT138
	RIGHT OUTER JOIN
		(
			(
				T45 DT141
			CROSS JOIN
				T28 DT140
			)
		RIGHT OUTER JOIN
			(
				T81 DT139
			RIGHT OUTER JOIN
				T92 DT142
			ON
				DT139.C990 <> DT142.C1129
			)
		ON
			DT141.C515 > DT139.C990
		)
	ON
		DT138.C740 <> DT141.C523
	)
WHERE
	(
		DT142.C1116 = DT142.C1116
	)
	OR
	(
		DT141.C526 = DT142.C1117
	)
ORDER BY
	DT140.C333
	, DT141.C525
	, DT140.C329
	, DT142.C1133
	, DT142.C1135
	, DT141.C517
	, DT141.C522
	, DT141.C512
	, DT142.C1121
	, DT142.C1115
	, DT142.C1131
	, DT142.C1125
	, DT138.C740
	, DT141.C519
	, DT142.C1118
	, DT141.C515
	, DT138.C742
	, DT142.C1128
	, DT141.C524
	, DT142.C1126
	, DT142.C1116
	, DT139.C993
	, DT140.C328
	, DT142.C1120
	, DT141.C516
	, DT142.C1127
	, DT141.C521
	, DT139.C990
	, DT142.C1130
	, DT141.C520
	, DT139.C991
	, DT141.C523
	, DT142.C1117
	, DT138.C741
	, DT139.C994
	, DT140.C330
	, DT141.C514
	, DT140.C332
	, DT141.C527
	, DT141.C518
	, DT142.C1129
	, DT139.C992
	, DT142.C1134
	, DT142.C1124
	, DT142.C1123
	, DT142.C1122
	, DT141.C526
	, DT141.C513
	, DT142.C1132
	, DT140.C331
LIMIT 803;


SELECT
	DT143.C184
	, DT143.C182
	, DT144.C1207
	, DT144.C1205
	, DT144.C1208
	, DT143.C181
	, DT144.C1206
	, DT143.C183
	, DT144.C1204
FROM
	(
		T99 DT144
	INNER JOIN
		T14 DT143
	ON
		DT144.C1205 = DT143.C180
	)
WHERE
	(
		(
			DT144.C1205 > DT144.C1207
		)
		AND
		(
			(
				DT143.C180 < DT143.C181
			)
			AND
			(
				DT143.C184 = DT144.C1206
			)
		)
	)
	OR
	(
		DT143.C180 > DT144.C1208
	)
ORDER BY
	DT143.C184
	, DT143.C182
	, DT144.C1207
	, DT144.C1205
	, DT144.C1208
	, DT143.C181
	, DT144.C1206
	, DT143.C183
	, DT144.C1204
LIMIT 994;


SELECT
	DT146.C664
	, DT145.C813
	, DT145.C810
	, DT146.C659
	, DT145.C816
	, DT145.C814
	, DT145.C817
	, DT145.C820
	, DT145.C812
	, DT146.C658
	, DT145.C815
	, DT146.C660
FROM
	(
		T55 DT146
	INNER JOIN
		T67 DT145
	ON
		DT146.C660 = DT145.C814
	)
WHERE
	(
		DT146.C665 = DT145.C820
	)
	OR
	(
		(
			(
				DT146.C665 = DT146.C659
			)
			OR
			(
				DT145.C809 = DT145.C811
			)
		)
		AND
		(
			DT146.C661 = DT146.C661
		)
	)
ORDER BY
	DT146.C664
	, DT145.C813
	, DT145.C810
	, DT146.C659
	, DT145.C816
	, DT145.C814
	, DT145.C817
	, DT145.C820
	, DT145.C812
	, DT146.C658
	, DT145.C815
	, DT146.C660
LIMIT 469;


SELECT
	DT147.C932
	, DT147.C934
	, DT147.C937
	, DT149.C632
	, DT149.C630
	, DT149.C626
	, DT147.C931
	, DT148.C328
	, DT149.C631
	, DT148.C332
	, DT147.C936
	, DT149.C633
	, DT148.C329
	, DT149.C625
	, DT149.C627
	, DT149.C634
	, DT148.C331
	, DT148.C330
	, DT147.C930
	, DT147.C933
	, DT149.C628
	, DT147.C935
	, DT149.C635
	, DT149.C629
	, DT148.C333
FROM
	(
		(
			T52 DT149
		INNER JOIN
			T75 DT147
		ON
			DT149.C632 = DT147.C936
		)
	CROSS JOIN
		T28 DT148
	)
WHERE
	(
		(
			DT149.C626 <> DT149.C627
		)
		AND
		(
			DT149.C626 = DT149.C633
		)
	)
	AND
	(
		DT147.C934 = DT148.C328
	)
ORDER BY
	DT147.C932
	, DT147.C934
	, DT147.C937
	, DT149.C632
	, DT149.C630
	, DT149.C626
	, DT147.C931
	, DT148.C328
	, DT149.C631
	, DT148.C332
	, DT147.C936
	, DT149.C633
	, DT148.C329
	, DT149.C625
	, DT149.C627
	, DT149.C634
	, DT148.C331
	, DT148.C330
	, DT147.C930
	, DT147.C933
	, DT149.C628
	, DT147.C935
	, DT149.C635
	, DT149.C629
	, DT148.C333
LIMIT 828;


SELECT
	DT150.C978
	, DT152.C95
	, DT151.C1004
	, DT150.C971
	, DT152.C102
	, DT152.C99
	, DT152.C89
	, DT151.C1001
	, DT152.C101
	, DT150.C965
	, DT150.C970
	, DT152.C96
	, DT152.C106
	, DT150.C976
	, DT152.C91
FROM
	(
		(
			T7 DT152
		INNER JOIN
			T83 DT151
		ON
			DT152.C100 = DT151.C1002
		)
	CROSS JOIN
		(
			T82 DT153
		INNER JOIN
			T78 DT150
		ON
			DT153.C996 <> DT150.C966
		)
	)
WHERE
	(
		DT152.C107 < DT152.C92
	)
	OR
	(
		(
			DT152.C103 > DT151.C1004
		)
		AND
		(
			DT151.C1004 < DT152.C105
		)
	)
ORDER BY
	DT150.C978
	, DT152.C95
	, DT151.C1004
	, DT150.C971
	, DT152.C102
	, DT152.C99
	, DT152.C89
	, DT151.C1001
	, DT152.C101
	, DT150.C965
	, DT150.C970
	, DT152.C96
	, DT152.C106
	, DT150.C976
	, DT152.C91
LIMIT 308;


SELECT
	DT154.C572
	, DT155.C305
	, DT154.C570
	, DT154.C584
	, DT155.C316
	, DT155.C317
	, DT155.C314
	, DT155.C313
	, DT155.C308
	, DT154.C573
	, DT154.C569
	, DT155.C310
	, DT155.C298
	, DT154.C581
	, DT155.C299
	, DT154.C574
	, DT155.C297
FROM
	(
		T26 DT155
	INNER JOIN
		T48 DT154
	ON
		DT155.C307 > DT154.C574
	)
WHERE
	(
		(
			DT155.C312 = DT155.C297
		)
		AND
		(
			(
				DT155.C312 = DT155.C301
			)
			AND
			(
				DT155.C307 = DT155.C312
			)
		)
	)
	OR
	(
		DT155.C306 = DT154.C573
	)
ORDER BY
	DT154.C572
	, DT155.C305
	, DT154.C570
	, DT154.C584
	, DT155.C316
	, DT155.C317
	, DT155.C314
	, DT155.C313
	, DT155.C308
	, DT154.C573
	, DT154.C569
	, DT155.C310
	, DT155.C298
	, DT154.C581
	, DT155.C299
	, DT154.C574
	, DT155.C297
LIMIT 640;


SELECT
	DT156.C909
	, DT157.C255
	, DT156.C907
	, DT157.C248
	, DT157.C252
	, DT156.C903
	, DT156.C896
	, DT156.C900
	, DT156.C890
	, DT157.C257
	, DT157.C250
	, DT157.C254
	, DT156.C905
	, DT156.C908
	, DT157.C249
	, DT157.C253
	, DT157.C256
	, DT156.C904
	, DT156.C902
	, DT156.C895
	, DT156.C889
	, DT157.C251
	, DT156.C901
	, DT156.C893
	, DT157.C247
	, DT156.C897
	, DT156.C906
	, DT156.C891
	, DT156.C898
FROM
	(
		T73 DT156
	CROSS JOIN
		T21 DT157
	)
WHERE
	(
		DT156.C907 < DT156.C902
	)
	AND
	(
		(
			(
				DT157.C257 = DT156.C896
			)
			AND
			(
				DT157.C255 = DT156.C909
			)
		)
		AND
		(
			DT156.C900 = DT156.C890
		)
	)
ORDER BY
	DT156.C909
	, DT157.C255
	, DT156.C907
	, DT157.C248
	, DT157.C252
	, DT156.C903
	, DT156.C896
	, DT156.C900
	, DT156.C890
	, DT157.C257
	, DT157.C250
	, DT157.C254
	, DT156.C905
	, DT156.C908
	, DT157.C249
	, DT157.C253
	, DT157.C256
	, DT156.C904
	, DT156.C902
	, DT156.C895
	, DT156.C889
	, DT157.C251
	, DT156.C901
	, DT156.C893
	, DT157.C247
	, DT156.C897
	, DT156.C906
	, DT156.C891
	, DT156.C898
LIMIT 589;


SELECT
	DT161.C868
	, DT160.C320
	, DT161.C870
	, DT161.C882
	, DT161.C869
	, DT158.C449
	, DT158.C447
	, DT161.C888
	, DT159.C835
	, DT159.C830
	, DT159.C837
	, DT161.C883
	, DT159.C828
	, DT158.C450
	, DT161.C881
	, DT159.C833
	, DT160.C321
	, DT159.C836
	, DT159.C834
	, DT161.C880
	, DT161.C875
FROM
	(
		(
			T69 DT159
		LEFT OUTER JOIN
			(
				T27 DT160
			INNER JOIN
				T72 DT161
			ON
				DT160.C322 > DT161.C879
			)
		ON
			DT159.C835 <> DT160.C321
		)
	CROSS JOIN
		T40 DT158
	)
WHERE
	(
		DT161.C885 > DT160.C323
	)
	AND
	(
		DT159.C829 = DT161.C876
	)
ORDER BY
	DT161.C868
	, DT160.C320
	, DT161.C870
	, DT161.C882
	, DT161.C869
	, DT158.C449
	, DT158.C447
	, DT161.C888
	, DT159.C835
	, DT159.C830
	, DT159.C837
	, DT161.C883
	, DT159.C828
	, DT158.C450
	, DT161.C881
	, DT159.C833
	, DT160.C321
	, DT159.C836
	, DT159.C834
	, DT161.C880
	, DT161.C875
LIMIT 493;


SELECT
	DT163.C425
	, DT163.C430
	, DT162.C905
	, DT162.C895
FROM
	(
		(
			T30 DT164
		INNER JOIN
			T73 DT162
		ON
			DT164.C341 <> DT162.C908
		)
	INNER JOIN
		T36 DT163
	ON
		DT162.C901 = DT163.C426
	)
WHERE
	(
		(
			DT163.C433 = DT164.C342
		)
		OR
		(
			(
				DT163.C422 = DT162.C894
			)
			OR
			(
				DT163.C419 <> DT162.C892
			)
		)
	)
	OR
	(
		DT162.C895 > DT163.C420
	)
ORDER BY
	DT163.C425
	, DT163.C430
	, DT162.C905
	, DT162.C895
LIMIT 144;


SELECT
	DT166.C1205
	, DT165.C309
	, DT165.C316
	, DT165.C310
	, DT165.C313
	, DT166.C1208
	, DT165.C298
	, DT165.C300
	, DT165.C301
	, DT165.C314
	, DT165.C303
	, DT165.C306
	, DT165.C315
	, DT165.C297
	, DT165.C305
	, DT165.C304
	, DT165.C308
	, DT166.C1207
	, DT165.C299
	, DT165.C307
	, DT166.C1206
FROM
	(
		T26 DT165
	RIGHT OUTER JOIN
		T99 DT166
	ON
		DT165.C308 = DT166.C1208
	)
WHERE
	(
		DT166.C1205 <> DT165.C312
	)
	OR
	(
		DT166.C1206 <> DT165.C312
	)
ORDER BY
	DT166.C1205
	, DT165.C309
	, DT165.C316
	, DT165.C310
	, DT165.C313
	, DT166.C1208
	, DT165.C298
	, DT165.C300
	, DT165.C301
	, DT165.C314
	, DT165.C303
	, DT165.C306
	, DT165.C315
	, DT165.C297
	, DT165.C305
	, DT165.C304
	, DT165.C308
	, DT166.C1207
	, DT165.C299
	, DT165.C307
	, DT166.C1206
LIMIT 829;


SELECT
	DT170.C572
	, DT167.C243
	, DT170.C576
	, DT167.C246
	, DT168.C980
	, DT170.C568
	, DT170.C578
	, DT168.C979
FROM
	(
		(
			T20 DT167
		INNER JOIN
			(
				T88 DT169
			INNER JOIN
				T48 DT170
			ON
				DT169.C1068 <> DT170.C568
			)
		ON
			DT167.C237 = DT169.C1074
		)
	RIGHT OUTER JOIN
		T79 DT168
	ON
		DT169.C1074 > DT168.C985
	)
WHERE
	(
		(
			DT170.C572 < DT168.C981
		)
		AND
		(
			(
				DT168.C985 < DT168.C984
			)
			OR
			(
				DT169.C1075 = DT167.C236
			)
		)
	)
	AND
	(
		DT170.C582 > DT169.C1066
	)
ORDER BY
	DT170.C572
	, DT167.C243
	, DT170.C576
	, DT167.C246
	, DT168.C980
	, DT170.C568
	, DT170.C578
	, DT168.C979
LIMIT 479;


SELECT
	DT173.C872
	, DT171.C72
	, DT173.C876
	, DT173.C879
	, DT173.C869
	, DT173.C883
	, DT173.C881
	, DT173.C877
	, DT171.C71
	, DT173.C868
	, DT173.C880
	, DT172.C280
	, DT172.C282
	, DT173.C884
	, DT171.C68
	, DT171.C74
	, DT171.C69
	, DT173.C873
	, DT172.C281
	, DT173.C882
	, DT173.C867
	, DT172.C279
	, DT173.C875
	, DT171.C70
	, DT171.C66
	, DT173.C885
	, DT173.C887
	, DT171.C73
	, DT173.C886
	, DT171.C67
FROM
	(
		T24 DT172
	LEFT OUTER JOIN
		(
			T5 DT171
		LEFT OUTER JOIN
			T72 DT173
		ON
			DT171.C68 < DT173.C880
		)
	ON
		DT172.C282 > DT173.C879
	)
WHERE
	(
		DT172.C281 = DT173.C886
	)
	OR
	(
		DT173.C884 > DT173.C868
	)
ORDER BY
	DT173.C872
	, DT171.C72
	, DT173.C876
	, DT173.C879
	, DT173.C869
	, DT173.C883
	, DT173.C881
	, DT173.C877
	, DT171.C71
	, DT173.C868
	, DT173.C880
	, DT172.C280
	, DT172.C282
	, DT173.C884
	, DT171.C68
	, DT171.C74
	, DT171.C69
	, DT173.C873
	, DT172.C281
	, DT173.C882
	, DT173.C867
	, DT172.C279
	, DT173.C875
	, DT171.C70
	, DT171.C66
	, DT173.C885
	, DT173.C887
	, DT171.C73
	, DT173.C886
	, DT171.C67
LIMIT 994;


SELECT
	DT175.C188
	, DT175.C192
	, DT175.C186
	, DT176.C126
	, DT174.C1089
	, DT175.C191
	, DT174.C1079
	, DT174.C1091
	, DT174.C1081
	, DT174.C1083
	, DT175.C193
	, DT176.C132
	, DT176.C136
	, DT176.C128
	, DT176.C134
	, DT174.C1084
	, DT174.C1086
	, DT174.C1087
	, DT175.C194
	, DT175.C187
	, DT174.C1090
	, DT175.C189
	, DT174.C1092
	, DT175.C196
	, DT175.C195
	, DT175.C199
FROM
	(
		T15 DT175
	CROSS JOIN
		(
			T90 DT174
		LEFT OUTER JOIN
			T9 DT176
		ON
			DT174.C1091 = DT176.C126
		)
	)
WHERE
	(
		DT176.C132 = DT176.C126
	)
	OR
	(
		(
			DT174.C1081 < DT175.C193
		)
		OR
		(
			(
				DT176.C134 < DT174.C1079
			)
			AND
			(
				DT174.C1084 = DT175.C197
			)
		)
	)
ORDER BY
	DT175.C188
	, DT175.C192
	, DT175.C186
	, DT176.C126
	, DT174.C1089
	, DT175.C191
	, DT174.C1079
	, DT174.C1091
	, DT174.C1081
	, DT174.C1083
	, DT175.C193
	, DT176.C132
	, DT176.C136
	, DT176.C128
	, DT176.C134
	, DT174.C1084
	, DT174.C1086
	, DT174.C1087
	, DT175.C194
	, DT175.C187
	, DT174.C1090
	, DT175.C189
	, DT174.C1092
	, DT175.C196
	, DT175.C195
	, DT175.C199
LIMIT 288;


SELECT
	DT178.C1055
	, DT177.C754
	, DT177.C755
	, DT179.C477
	, DT177.C749
	, DT178.C1049
	, DT179.C484
	, DT177.C759
	, DT179.C475
	, DT178.C1048
	, DT179.C480
FROM
	(
		(
			T86 DT178
		RIGHT OUTER JOIN
			T63 DT177
		ON
			DT178.C1052 > DT177.C755
		)
	CROSS JOIN
		T42 DT179
	)
WHERE
	(
		(
			DT179.C477 = DT178.C1055
		)
		OR
		(
			DT177.C751 = DT178.C1049
		)
	)
	OR
	(
		DT177.C752 < DT178.C1053
	)
ORDER BY
	DT178.C1055
	, DT177.C754
	, DT177.C755
	, DT179.C477
	, DT177.C749
	, DT178.C1049
	, DT179.C484
	, DT177.C759
	, DT179.C475
	, DT178.C1048
	, DT179.C480
LIMIT 155;


SELECT
	DT181.C368
	, DT180.C1084
	, DT180.C1082
	, DT180.C1083
	, DT181.C369
FROM
	(
		T32 DT181
	RIGHT OUTER JOIN
		T90 DT180
	ON
		DT181.C366 < DT180.C1084
	)
WHERE
	(
		(
			DT181.C381 = DT180.C1089
		)
		AND
		(
			DT180.C1079 < DT180.C1080
		)
	)
	OR
	(
		(
			DT180.C1084 < DT180.C1090
		)
		OR
		(
			DT181.C381 <> DT180.C1080
		)
	)
ORDER BY
	DT181.C368
	, DT180.C1084
	, DT180.C1082
	, DT180.C1083
	, DT181.C369
LIMIT 947;


SELECT
	DT183.C1201
	, DT183.C1202
	, DT184.C439
	, DT182.C166
	, DT182.C174
	, DT183.C1203
	, DT182.C164
	, DT184.C438
	, DT182.C173
	, DT182.C178
	, DT182.C171
	, DT182.C167
FROM
	(
		T37 DT184
	RIGHT OUTER JOIN
		(
			T13 DT182
		RIGHT OUTER JOIN
			T98 DT183
		ON
			DT182.C166 > DT183.C1203
		)
	ON
		DT184.C440 < DT182.C165
	)
WHERE
	(
		(
			DT182.C166 < DT182.C174
		)
		OR
		(
			DT182.C173 = DT182.C170
		)
	)
	AND
	(
		DT182.C167 = DT182.C169
	)
ORDER BY
	DT183.C1201
	, DT183.C1202
	, DT184.C439
	, DT182.C166
	, DT182.C174
	, DT183.C1203
	, DT182.C164
	, DT184.C438
	, DT182.C173
	, DT182.C178
	, DT182.C171
	, DT182.C167
LIMIT 578;


SELECT
	DT185.C738
	, DT186.C975
	, DT185.C731
FROM
	(
		T61 DT185
	CROSS JOIN
		(
			T95 DT187
		LEFT OUTER JOIN
			T78 DT186
		ON
			DT187.C1167 > DT186.C966
		)
	)
WHERE
	(
		(
			DT185.C734 = DT186.C974
		)
		AND
		(
			(
				DT185.C735 = DT185.C739
			)
			AND
			(
				DT186.C975 <> DT185.C735
			)
		)
	)
	OR
	(
		DT187.C1168 <> DT185.C730
	)
ORDER BY
	DT185.C738
	, DT186.C975
	, DT185.C731
LIMIT 569;


SELECT
	DT190.C635
	, DT189.C740
	, DT192.C355
	, DT192.C354
	, DT192.C351
	, DT190.C629
	, DT188.C411
	, DT191.C908
	, DT192.C346
	, DT192.C349
FROM
	(
		T73 DT191
	RIGHT OUTER JOIN
		(
			(
				T62 DT189
			INNER JOIN
				T31 DT192
			ON
				DT189.C742 < DT192.C361
			)
		LEFT OUTER JOIN
			(
				T35 DT188
			RIGHT OUTER JOIN
				T52 DT190
			ON
				DT188.C417 < DT190.C629
			)
		ON
			DT192.C358 = DT190.C631
		)
	ON
		DT191.C905 < DT192.C347
	)
WHERE
	(
		DT191.C892 < DT190.C633
	)
	OR
	(
		(
			DT190.C626 < DT190.C633
		)
		AND
		(
			DT191.C897 = DT192.C354
		)
	)
ORDER BY
	DT190.C635
	, DT189.C740
	, DT192.C355
	, DT192.C354
	, DT192.C351
	, DT190.C629
	, DT188.C411
	, DT191.C908
	, DT192.C346
	, DT192.C349
LIMIT 963;


SELECT
	DT194.C901
	, DT194.C889
	, DT194.C900
	, DT194.C907
	, DT194.C892
	, DT194.C906
	, DT194.C903
	, DT193.C152
	, DT194.C898
	, DT194.C891
	, DT194.C897
FROM
	(
		T73 DT194
	RIGHT OUTER JOIN
		T11 DT193
	ON
		DT194.C908 < DT193.C152
	)
WHERE
	(
		DT194.C908 < DT194.C900
	)
	AND
	(
		DT194.C909 = DT194.C902
	)
ORDER BY
	DT194.C901
	, DT194.C889
	, DT194.C900
	, DT194.C907
	, DT194.C892
	, DT194.C906
	, DT194.C903
	, DT193.C152
	, DT194.C898
	, DT194.C891
	, DT194.C897
LIMIT 748;


SELECT
	DT195.C751
	, DT197.C688
	, DT195.C762
	, DT196.C301
	, DT197.C694
	, DT197.C687
	, DT195.C746
	, DT195.C752
	, DT196.C309
	, DT195.C756
	, DT196.C314
	, DT197.C691
	, DT195.C753
	, DT196.C306
	, DT196.C304
	, DT198.C330
	, DT197.C696
	, DT199.C517
	, DT195.C745
	, DT195.C758
	, DT195.C748
	, DT196.C299
	, DT199.C513
	, DT197.C682
	, DT196.C311
	, DT199.C512
	, DT196.C297
	, DT196.C308
	, DT199.C518
	, DT196.C307
	, DT195.C749
	, DT196.C317
	, DT196.C313
	, DT195.C750
	, DT196.C305
	, DT196.C318
	, DT199.C516
	, DT195.C763
	, DT198.C331
	, DT199.C525
	, DT199.C522
	, DT195.C754
	, DT199.C526
	, DT195.C743
	, DT195.C759
	, DT199.C520
	, DT196.C316
	, DT195.C744
	, DT197.C692
	, DT196.C312
	, DT199.C524
	, DT199.C515
	, DT195.C755
	, DT199.C514
	, DT197.C683
	, DT196.C302
FROM
	(
		(
			T26 DT196
		LEFT OUTER JOIN
			(
				(
					T45 DT199
				CROSS JOIN
					T63 DT195
				)
			CROSS JOIN
				T28 DT198
			)
		ON
			DT196.C310 = DT195.C761
		)
	INNER JOIN
		T57 DT197
	ON
		DT196.C303 < DT197.C693
	)
WHERE
	(
		DT195.C761 = DT199.C523
	)
	AND
	(
		(
			DT199.C517 = DT197.C693
		)
		OR
		(
			DT199.C521 = DT195.C760
		)
	)
ORDER BY
	DT195.C751
	, DT197.C688
	, DT195.C762
	, DT196.C301
	, DT197.C694
	, DT197.C687
	, DT195.C746
	, DT195.C752
	, DT196.C309
	, DT195.C756
	, DT196.C314
	, DT197.C691
	, DT195.C753
	, DT196.C306
	, DT196.C304
	, DT198.C330
	, DT197.C696
	, DT199.C517
	, DT195.C745
	, DT195.C758
	, DT195.C748
	, DT196.C299
	, DT199.C513
	, DT197.C682
	, DT196.C311
	, DT199.C512
	, DT196.C297
	, DT196.C308
	, DT199.C518
	, DT196.C307
	, DT195.C749
	, DT196.C317
	, DT196.C313
	, DT195.C750
	, DT196.C305
	, DT196.C318
	, DT199.C516
	, DT195.C763
	, DT198.C331
	, DT199.C525
	, DT199.C522
	, DT195.C754
	, DT199.C526
	, DT195.C743
	, DT195.C759
	, DT199.C520
	, DT196.C316
	, DT195.C744
	, DT197.C692
	, DT196.C312
	, DT199.C524
	, DT199.C515
	, DT195.C755
	, DT199.C514
	, DT197.C683
	, DT196.C302
LIMIT 335;


SELECT
	DT201.C471
	, DT201.C462
	, DT200.C195
	, DT200.C191
	, DT202.C575
	, DT200.C187
	, DT201.C455
	, DT201.C454
	, DT201.C467
	, DT201.C459
	, DT202.C585
	, DT202.C578
	, DT201.C465
	, DT202.C570
	, DT201.C453
	, DT202.C583
	, DT202.C582
	, DT201.C458
	, DT201.C452
	, DT201.C469
	, DT202.C579
	, DT201.C451
	, DT200.C188
	, DT201.C472
	, DT201.C460
	, DT202.C568
	, DT200.C196
	, DT201.C457
	, DT201.C461
	, DT200.C198
	, DT200.C193
	, DT200.C192
	, DT202.C574
	, DT201.C470
	, DT202.C584
	, DT200.C186
	, DT201.C466
	, DT201.C463
	, DT201.C464
	, DT202.C580
	, DT201.C468
	, DT202.C573
	, DT202.C569
	, DT200.C190
	, DT200.C189
FROM
	(
		(
			T15 DT200
		LEFT OUTER JOIN
			T48 DT202
		ON
			DT200.C196 <> DT202.C580
		)
	CROSS JOIN
		T41 DT201
	)
WHERE
	(
		DT202.C580 > DT200.C186
	)
	OR
	(
		DT202.C568 > DT202.C578
	)
ORDER BY
	DT201.C471
	, DT201.C462
	, DT200.C195
	, DT200.C191
	, DT202.C575
	, DT200.C187
	, DT201.C455
	, DT201.C454
	, DT201.C467
	, DT201.C459
	, DT202.C585
	, DT202.C578
	, DT201.C465
	, DT202.C570
	, DT201.C453
	, DT202.C583
	, DT202.C582
	, DT201.C458
	, DT201.C452
	, DT201.C469
	, DT202.C579
	, DT201.C451
	, DT200.C188
	, DT201.C472
	, DT201.C460
	, DT202.C568
	, DT200.C196
	, DT201.C457
	, DT201.C461
	, DT200.C198
	, DT200.C193
	, DT200.C192
	, DT202.C574
	, DT201.C470
	, DT202.C584
	, DT200.C186
	, DT201.C466
	, DT201.C463
	, DT201.C464
	, DT202.C580
	, DT201.C468
	, DT202.C573
	, DT202.C569
	, DT200.C190
	, DT200.C189
LIMIT 828;


SELECT
	DT205.C992
	, DT203.C153
	, DT204.C200
	, DT205.C990
	, DT205.C994
	, DT203.C154
	, DT203.C156
FROM
	(
		(
			T16 DT204
		RIGHT OUTER JOIN
			T11 DT203
		ON
			DT204.C200 = DT203.C153
		)
	INNER JOIN
		T81 DT205
	ON
		DT204.C204 = DT205.C994
	)
WHERE
	(
		DT205.C991 = DT204.C200
	)
	OR
	(
		(
			DT204.C205 = DT205.C994
		)
		OR
		(
			DT203.C155 <> DT204.C205
		)
	)
ORDER BY
	DT205.C992
	, DT203.C153
	, DT204.C200
	, DT205.C990
	, DT205.C994
	, DT203.C154
	, DT203.C156
LIMIT 985;


SELECT
	DT209.C410
	, DT209.C408
	, DT206.C906
	, DT207.C1056
	, DT208.C1108
	, DT208.C1106
	, DT206.C907
	, DT206.C908
	, DT208.C1109
	, DT209.C403
	, DT207.C1059
	, DT208.C1101
	, DT206.C891
	, DT206.C904
	, DT208.C1105
	, DT209.C404
	, DT208.C1111
	, DT208.C1100
	, DT206.C902
	, DT206.C894
	, DT207.C1063
	, DT208.C1104
	, DT209.C407
	, DT207.C1057
	, DT208.C1098
	, DT207.C1060
	, DT206.C905
	, DT208.C1093
	, DT208.C1114
	, DT206.C890
	, DT207.C1062
	, DT209.C402
	, DT208.C1103
	, DT209.C409
	, DT208.C1110
	, DT208.C1095
	, DT206.C898
	, DT206.C909
	, DT208.C1094
	, DT206.C899
	, DT208.C1107
	, DT208.C1099
	, DT208.C1113
	, DT208.C1096
	, DT206.C892
	, DT206.C897
	, DT207.C1061
	, DT206.C889
	, DT206.C901
	, DT208.C1102
	, DT207.C1058
	, DT209.C405
	, DT208.C1097
	, DT209.C406
FROM
	(
		T91 DT208
	CROSS JOIN
		(
			(
				T87 DT207
			RIGHT OUTER JOIN
				T34 DT209
			ON
				DT207.C1057 = DT209.C403
			)
		INNER JOIN
			T73 DT206
		ON
			DT207.C1063 = DT206.C905
		)
	)
WHERE
	(
		DT207.C1062 = DT206.C895
	)
	OR
	(
		(
			DT209.C403 <> DT207.C1060
		)
		OR
		(
			(
				DT208.C1110 < DT206.C895
			)
			AND
			(
				DT209.C405 = DT206.C898
			)
		)
	)
ORDER BY
	DT209.C410
	, DT209.C408
	, DT206.C906
	, DT207.C1056
	, DT208.C1108
	, DT208.C1106
	, DT206.C907
	, DT206.C908
	, DT208.C1109
	, DT209.C403
	, DT207.C1059
	, DT208.C1101
	, DT206.C891
	, DT206.C904
	, DT208.C1105
	, DT209.C404
	, DT208.C1111
	, DT208.C1100
	, DT206.C902
	, DT206.C894
	, DT207.C1063
	, DT208.C1104
	, DT209.C407
	, DT207.C1057
	, DT208.C1098
	, DT207.C1060
	, DT206.C905
	, DT208.C1093
	, DT208.C1114
	, DT206.C890
	, DT207.C1062
	, DT209.C402
	, DT208.C1103
	, DT209.C409
	, DT208.C1110
	, DT208.C1095
	, DT206.C898
	, DT206.C909
	, DT208.C1094
	, DT206.C899
	, DT208.C1107
	, DT208.C1099
	, DT208.C1113
	, DT208.C1096
	, DT206.C892
	, DT206.C897
	, DT207.C1061
	, DT206.C889
	, DT206.C901
	, DT208.C1102
	, DT207.C1058
	, DT209.C405
	, DT208.C1097
	, DT209.C406
LIMIT 299;


SELECT
	DT210.C1000
	, DT210.C996
	, DT211.C714
	, DT211.C716
FROM
	(
		T59 DT211
	LEFT OUTER JOIN
		T82 DT210
	ON
		DT211.C714 = DT210.C998
	)
WHERE
	(
		DT211.C713 < DT211.C713
	)
	OR
	(
		(
			DT210.C996 = DT211.C716
		)
		AND
		(
			DT210.C999 > DT210.C997
		)
	)
ORDER BY
	DT210.C1000
	, DT210.C996
	, DT211.C714
	, DT211.C716
LIMIT 900;


SELECT
	DT212.C1197
	, DT212.C1200
	, DT212.C1193
	, DT212.C1192
	, DT212.C1195
	, DT212.C1196
	, DT213.C445
	, DT213.C446
	, DT212.C1199
	, DT212.C1198
	, DT212.C1191
	, DT213.C444
	, DT212.C1194
FROM
	(
		T97 DT212
	INNER JOIN
		T39 DT213
	ON
		DT212.C1200 = DT213.C446
	)
WHERE
	(
		(
			DT213.C444 = DT212.C1193
		)
		AND
		(
			DT212.C1191 < DT212.C1198
		)
	)
	AND
	(
		DT212.C1194 = DT212.C1194
	)
ORDER BY
	DT212.C1197
	, DT212.C1200
	, DT212.C1193
	, DT212.C1192
	, DT212.C1195
	, DT212.C1196
	, DT213.C445
	, DT213.C446
	, DT212.C1199
	, DT212.C1198
	, DT212.C1191
	, DT213.C444
	, DT212.C1194
LIMIT 677;


SELECT
	DT214.C989
	, DT215.C1005
	, DT215.C1007
	, DT214.C988
	, DT215.C1002
FROM
	(
		T83 DT215
	LEFT OUTER JOIN
		T80 DT214
	ON
		DT215.C1001 > DT214.C987
	)
WHERE
	(
		DT214.C987 = DT215.C1004
	)
	OR
	(
		DT214.C987 < DT215.C1004
	)
ORDER BY
	DT214.C989
	, DT215.C1005
	, DT215.C1007
	, DT214.C988
	, DT215.C1002
LIMIT 405;


SELECT
	DT217.C173
	, DT218.C657
	, DT217.C169
	, DT219.C993
	, DT217.C167
	, DT216.C620
	, DT217.C177
	, DT216.C624
	, DT217.C174
	, DT217.C164
	, DT218.C655
	, DT216.C611
	, DT217.C172
	, DT216.C619
	, DT216.C615
	, DT217.C166
	, DT216.C608
	, DT219.C991
	, DT217.C175
	, DT217.C176
	, DT216.C612
	, DT216.C609
	, DT216.C617
	, DT216.C622
	, DT219.C992
	, DT219.C994
	, DT216.C610
	, DT218.C654
	, DT216.C618
	, DT216.C614
	, DT216.C621
	, DT216.C616
	, DT219.C990
	, DT217.C168
	, DT217.C170
	, DT217.C171
	, DT217.C178
	, DT217.C165
	, DT218.C656
FROM
	(
		(
			(
				T81 DT219
			CROSS JOIN
				T13 DT217
			)
		RIGHT OUTER JOIN
			T54 DT218
		ON
			DT217.C179 < DT218.C657
		)
	INNER JOIN
		T51 DT216
	ON
		DT219.C992 = DT216.C608
	)
WHERE
	(
		DT216.C618 = DT216.C620
	)
	AND
	(
		DT216.C613 < DT219.C992
	)
ORDER BY
	DT217.C173
	, DT218.C657
	, DT217.C169
	, DT219.C993
	, DT217.C167
	, DT216.C620
	, DT217.C177
	, DT216.C624
	, DT217.C174
	, DT217.C164
	, DT218.C655
	, DT216.C611
	, DT217.C172
	, DT216.C619
	, DT216.C615
	, DT217.C166
	, DT216.C608
	, DT219.C991
	, DT217.C175
	, DT217.C176
	, DT216.C612
	, DT216.C609
	, DT216.C617
	, DT216.C622
	, DT219.C992
	, DT219.C994
	, DT216.C610
	, DT218.C654
	, DT216.C618
	, DT216.C614
	, DT216.C621
	, DT216.C616
	, DT219.C990
	, DT217.C168
	, DT217.C170
	, DT217.C171
	, DT217.C178
	, DT217.C165
	, DT218.C656
LIMIT 574;


SELECT
	DT221.C554
	, DT220.C239
	, DT220.C242
	, DT223.C558
	, DT222.C997
	, DT223.C550
	, DT223.C557
	, DT221.C566
	, DT223.C565
	, DT221.C567
	, DT220.C238
	, DT223.C559
	, DT221.C549
	, DT223.C551
	, DT220.C244
	, DT221.C557
	, DT221.C548
	, DT221.C562
	, DT223.C563
	, DT222.C1000
	, DT223.C556
	, DT223.C560
	, DT222.C996
	, DT223.C553
	, DT223.C567
FROM
	(
		(
			T20 DT220
		CROSS JOIN
			T82 DT222
		)
	INNER JOIN
		(
			T47 DT221
		RIGHT OUTER JOIN
			T47 DT223
		ON
			DT221.C550 = DT223.C548
		)
	ON
		DT220.C237 <> DT223.C559
	)
WHERE
	(
		(
			DT223.C561 = DT222.C998
		)
		AND
		(
			DT221.C560 < DT223.C557
		)
	)
	OR
	(
		DT223.C558 < DT223.C550
	)
ORDER BY
	DT221.C554
	, DT220.C239
	, DT220.C242
	, DT223.C558
	, DT222.C997
	, DT223.C550
	, DT223.C557
	, DT221.C566
	, DT223.C565
	, DT221.C567
	, DT220.C238
	, DT223.C559
	, DT221.C549
	, DT223.C551
	, DT220.C244
	, DT221.C557
	, DT221.C548
	, DT221.C562
	, DT223.C563
	, DT222.C1000
	, DT223.C556
	, DT223.C560
	, DT222.C996
	, DT223.C553
	, DT223.C567
LIMIT 276;


SELECT
	DT225.C547
	, DT225.C528
	, DT224.C442
	, DT225.C529
	, DT225.C533
	, DT225.C546
	, DT225.C530
	, DT225.C534
	, DT225.C531
	, DT225.C545
	, DT225.C539
	, DT225.C538
	, DT225.C536
	, DT225.C544
	, DT225.C532
FROM
	(
		T38 DT224
	CROSS JOIN
		T46 DT225
	)
WHERE
	(
		(
			DT224.C442 = DT225.C537
		)
		AND
		(
			DT224.C443 > DT225.C538
		)
	)
	OR
	(
		DT225.C536 = DT225.C542
	)
ORDER BY
	DT225.C547
	, DT225.C528
	, DT224.C442
	, DT225.C529
	, DT225.C533
	, DT225.C546
	, DT225.C530
	, DT225.C534
	, DT225.C531
	, DT225.C545
	, DT225.C539
	, DT225.C538
	, DT225.C536
	, DT225.C544
	, DT225.C532
LIMIT 180;


SELECT
	DT229.C1148
	, DT229.C1149
	, DT228.C9
	, DT229.C1156
	, DT229.C1154
	, DT229.C1153
	, DT228.C10
	, DT229.C1160
	, DT226.C599
	, DT229.C1162
	, DT226.C589
	, DT228.C13
	, DT229.C1159
	, DT226.C597
	, DT226.C596
	, DT227.C181
	, DT229.C1147
	, DT226.C594
	, DT226.C598
	, DT227.C184
	, DT226.C591
	, DT228.C7
	, DT226.C593
	, DT228.C8
	, DT229.C1166
	, DT229.C1155
	, DT227.C185
	, DT229.C1165
	, DT229.C1145
	, DT229.C1151
	, DT229.C1157
	, DT226.C595
	, DT229.C1158
	, DT228.C14
	, DT229.C1161
	, DT227.C182
	, DT226.C592
	, DT228.C6
	, DT227.C183
	, DT226.C588
	, DT228.C11
	, DT229.C1146
	, DT226.C587
	, DT229.C1163
	, DT226.C586
	, DT228.C4
	, DT228.C12
	, DT229.C1164
	, DT226.C590
	, DT228.C5
FROM
	(
		(
			(
				T1 DT228
			INNER JOIN
				T14 DT227
			ON
				DT228.C12 < DT227.C181
			)
		CROSS JOIN
			T49 DT226
		)
	INNER JOIN
		T94 DT229
	ON
		DT227.C181 > DT229.C1149
	)
WHERE
	(
		DT226.C597 <> DT228.C13
	)
	AND
	(
		DT228.C8 = DT229.C1156
	)
ORDER BY
	DT229.C1148
	, DT229.C1149
	, DT228.C9
	, DT229.C1156
	, DT229.C1154
	, DT229.C1153
	, DT228.C10
	, DT229.C1160
	, DT226.C599
	, DT229.C1162
	, DT226.C589
	, DT228.C13
	, DT229.C1159
	, DT226.C597
	, DT226.C596
	, DT227.C181
	, DT229.C1147
	, DT226.C594
	, DT226.C598
	, DT227.C184
	, DT226.C591
	, DT228.C7
	, DT226.C593
	, DT228.C8
	, DT229.C1166
	, DT229.C1155
	, DT227.C185
	, DT229.C1165
	, DT229.C1145
	, DT229.C1151
	, DT229.C1157
	, DT226.C595
	, DT229.C1158
	, DT228.C14
	, DT229.C1161
	, DT227.C182
	, DT226.C592
	, DT228.C6
	, DT227.C183
	, DT226.C588
	, DT228.C11
	, DT229.C1146
	, DT226.C587
	, DT229.C1163
	, DT226.C586
	, DT228.C4
	, DT228.C12
	, DT229.C1164
	, DT226.C590
	, DT228.C5
LIMIT 959;


SELECT
	DT231.C1068
	, DT230.C1204
	, DT230.C1208
	, DT230.C1207
	, DT231.C1067
	, DT231.C1064
	, DT231.C1065
	, DT230.C1205
	, DT231.C1069
	, DT231.C1066
	, DT231.C1073
	, DT231.C1070
	, DT231.C1071
	, DT230.C1206
	, DT231.C1074
	, DT231.C1072
	, DT231.C1075
FROM
	(
		T99 DT230
	INNER JOIN
		T88 DT231
	ON
		DT230.C1208 = DT231.C1065
	)
WHERE
	(
		DT230.C1207 = DT231.C1069
	)
	AND
	(
		DT231.C1072 = DT230.C1205
	)
ORDER BY
	DT231.C1068
	, DT230.C1204
	, DT230.C1208
	, DT230.C1207
	, DT231.C1067
	, DT231.C1064
	, DT231.C1065
	, DT230.C1205
	, DT231.C1069
	, DT231.C1066
	, DT231.C1073
	, DT231.C1070
	, DT231.C1071
	, DT230.C1206
	, DT231.C1074
	, DT231.C1072
	, DT231.C1075
LIMIT 202;


SELECT
	DT232.C683
	, DT232.C693
	, DT232.C694
	, DT232.C682
	, DT232.C692
	, DT232.C685
FROM
	(
		T30 DT233
	RIGHT OUTER JOIN
		T57 DT232
	ON
		DT233.C342 = DT232.C687
	)
WHERE
	(
		DT233.C342 = DT232.C697
	)
	OR
	(
		DT232.C694 = DT232.C689
	)
ORDER BY
	DT232.C683
	, DT232.C693
	, DT232.C694
	, DT232.C682
	, DT232.C692
	, DT232.C685
LIMIT 271;


SELECT
	DT236.C15
	, DT234.C1190
	, DT234.C1199
	, DT236.C25
	, DT235.C206
	, DT236.C30
	, DT236.C27
	, DT235.C201
	, DT234.C1200
	, DT234.C1192
	, DT236.C19
	, DT236.C20
	, DT234.C1196
	, DT235.C200
	, DT236.C17
FROM
	(
		(
			T16 DT235
		INNER JOIN
			T2 DT236
		ON
			DT235.C204 = DT236.C31
		)
	RIGHT OUTER JOIN
		T97 DT234
	ON
		DT236.C24 > DT234.C1192
	)
WHERE
	(
		DT236.C27 = DT234.C1200
	)
	AND
	(
		(
			DT236.C23 = DT234.C1200
		)
		AND
		(
			DT234.C1195 <> DT236.C18
		)
	)
ORDER BY
	DT236.C15
	, DT234.C1190
	, DT234.C1199
	, DT236.C25
	, DT235.C206
	, DT236.C30
	, DT236.C27
	, DT235.C201
	, DT234.C1200
	, DT234.C1192
	, DT236.C19
	, DT236.C20
	, DT234.C1196
	, DT235.C200
	, DT236.C17
LIMIT 660;


SELECT
	DT238.C305
	, DT237.C247
	, DT238.C308
	, DT237.C249
	, DT238.C313
	, DT237.C255
	, DT238.C307
	, DT237.C248
	, DT238.C306
	, DT238.C297
	, DT238.C314
	, DT238.C309
	, DT238.C301
	, DT238.C310
	, DT238.C311
	, DT237.C251
FROM
	(
		T26 DT238
	CROSS JOIN
		T21 DT237
	)
WHERE
	(
		DT238.C309 = DT237.C250
	)
	OR
	(
		(
			DT237.C256 = DT238.C304
		)
		OR
		(
			DT238.C303 = DT238.C317
		)
	)
ORDER BY
	DT238.C305
	, DT237.C247
	, DT238.C308
	, DT237.C249
	, DT238.C313
	, DT237.C255
	, DT238.C307
	, DT237.C248
	, DT238.C306
	, DT238.C297
	, DT238.C314
	, DT238.C309
	, DT238.C301
	, DT238.C310
	, DT238.C311
	, DT237.C251
LIMIT 500;


SELECT
	DT240.C110
	, DT239.C866
	, DT240.C116
	, DT240.C115
FROM
	(
		T8 DT240
	INNER JOIN
		T71 DT239
	ON
		DT240.C116 > DT239.C861
	)
WHERE
	(
		DT240.C121 > DT240.C120
	)
	AND
	(
		(
			(
				DT240.C122 < DT240.C113
			)
			AND
			(
				DT240.C117 = DT240.C111
			)
		)
		AND
		(
			DT240.C110 < DT240.C116
		)
	)
ORDER BY
	DT240.C110
	, DT239.C866
	, DT240.C116
	, DT240.C115
LIMIT 685;


SELECT
	DT242.C167
	, DT242.C178
	, DT242.C172
	, DT243.C449
FROM
	(
		T13 DT242
	LEFT OUTER JOIN
		(
			T40 DT243
		RIGHT OUTER JOIN
			T0 DT241
		ON
			DT243.C450 < DT241.C1
		)
	ON
		DT242.C179 < DT241.C3
	)
WHERE
	(
		DT242.C177 <> DT242.C170
	)
	AND
	(
		(
			DT242.C175 > DT243.C450
		)
		OR
		(
			DT242.C171 > DT242.C178
		)
	)
ORDER BY
	DT242.C167
	, DT242.C178
	, DT242.C172
	, DT243.C449
LIMIT 117;


SELECT
	DT244.C659
FROM
	(
		(
			(
				T14 DT247
			RIGHT OUTER JOIN
				T24 DT246
			ON
				DT247.C185 <> DT246.C280
			)
		LEFT OUTER JOIN
			T55 DT244
		ON
			DT246.C282 = DT244.C667
		)
	CROSS JOIN
		T17 DT245
	)
WHERE
	(
		DT245.C215 = DT244.C661
	)
	OR
	(
		(
			DT244.C660 = DT244.C666
		)
		OR
		(
			DT247.C183 > DT245.C211
		)
	)
ORDER BY
	DT244.C659
LIMIT 978;


SELECT
	DT250.C866
FROM
	(
		T71 DT250
	RIGHT OUTER JOIN
		(
			T50 DT248
		LEFT OUTER JOIN
			T73 DT249
		ON
			DT248.C607 = DT249.C902
		)
	ON
		DT250.C863 = DT249.C904
	)
WHERE
	(
		DT249.C889 = DT248.C601
	)
	AND
	(
		(
			DT250.C861 > DT249.C906
		)
		OR
		(
			DT249.C900 = DT249.C895
		)
	)
ORDER BY
	DT250.C866
LIMIT 447;


SELECT
	DT252.C364
	, DT253.C317
	, DT252.C379
	, DT253.C310
	, DT253.C297
	, DT253.C301
	, DT252.C367
	, DT251.C500
	, DT251.C496
	, DT252.C368
	, DT251.C495
	, DT253.C305
	, DT253.C308
	, DT252.C365
	, DT251.C498
	, DT252.C375
	, DT253.C307
	, DT253.C313
	, DT251.C490
	, DT251.C487
	, DT251.C494
	, DT251.C492
	, DT253.C300
	, DT252.C376
	, DT253.C316
	, DT251.C501
	, DT251.C499
	, DT253.C318
	, DT253.C304
	, DT252.C377
	, DT253.C299
	, DT251.C493
	, DT252.C381
	, DT253.C298
	, DT252.C378
	, DT252.C369
	, DT251.C488
	, DT253.C303
	, DT253.C312
	, DT253.C315
	, DT251.C489
	, DT253.C302
	, DT253.C314
FROM
	(
		(
			T32 DT252
		LEFT OUTER JOIN
			T26 DT253
		ON
			DT252.C368 < DT253.C303
		)
	INNER JOIN
		T43 DT251
	ON
		DT252.C370 > DT251.C495
	)
WHERE
	(
		DT251.C488 < DT252.C379
	)
	OR
	(
		(
			DT252.C369 < DT251.C491
		)
		OR
		(
			DT253.C313 = DT253.C318
		)
	)
ORDER BY
	DT252.C364
	, DT253.C317
	, DT252.C379
	, DT253.C310
	, DT253.C297
	, DT253.C301
	, DT252.C367
	, DT251.C500
	, DT251.C496
	, DT252.C368
	, DT251.C495
	, DT253.C305
	, DT253.C308
	, DT252.C365
	, DT251.C498
	, DT252.C375
	, DT253.C307
	, DT253.C313
	, DT251.C490
	, DT251.C487
	, DT251.C494
	, DT251.C492
	, DT253.C300
	, DT252.C376
	, DT253.C316
	, DT251.C501
	, DT251.C499
	, DT253.C318
	, DT253.C304
	, DT252.C377
	, DT253.C299
	, DT251.C493
	, DT252.C381
	, DT253.C298
	, DT252.C378
	, DT252.C369
	, DT251.C488
	, DT253.C303
	, DT253.C312
	, DT253.C315
	, DT251.C489
	, DT253.C302
	, DT253.C314
LIMIT 504;


SELECT
	DT254.C6
	, DT254.C7
	, DT256.C1070
	, DT256.C1072
	, DT256.C1074
	, DT254.C14
	, DT257.C614
	, DT254.C5
	, DT254.C8
	, DT255.C281
	, DT257.C622
FROM
	(
		(
			(
				T1 DT254
			INNER JOIN
				T88 DT256
			ON
				DT254.C14 = DT256.C1074
			)
		INNER JOIN
			T24 DT255
		ON
			DT254.C4 > DT255.C281
		)
	INNER JOIN
		T51 DT257
	ON
		DT256.C1072 = DT257.C610
	)
WHERE
	(
		(
			DT256.C1065 > DT257.C623
		)
		OR
		(
			DT254.C4 = DT257.C618
		)
	)
	AND
	(
		DT257.C612 <> DT256.C1073
	)
ORDER BY
	DT254.C6
	, DT254.C7
	, DT256.C1070
	, DT256.C1072
	, DT256.C1074
	, DT254.C14
	, DT257.C614
	, DT254.C5
	, DT254.C8
	, DT255.C281
	, DT257.C622
LIMIT 693;


SELECT
	DT260.C1101
	, DT259.C526
	, DT261.C11
	, DT260.C1095
	, DT260.C1094
	, DT259.C514
	, DT260.C1112
	, DT261.C10
	, DT259.C523
	, DT260.C1103
	, DT260.C1105
	, DT261.C14
	, DT259.C524
FROM
	(
		T1 DT261
	LEFT OUTER JOIN
		(
			T91 DT260
		CROSS JOIN
			(
				T88 DT258
			LEFT OUTER JOIN
				T45 DT259
			ON
				DT258.C1074 < DT259.C514
			)
		)
	ON
		DT261.C13 > DT258.C1064
	)
WHERE
	(
		DT259.C512 > DT260.C1093
	)
	AND
	(
		(
			DT261.C6 < DT258.C1066
		)
		AND
		(
			(
				DT260.C1110 < DT258.C1069
			)
			OR
			(
				DT260.C1109 > DT261.C8
			)
		)
	)
ORDER BY
	DT260.C1101
	, DT259.C526
	, DT261.C11
	, DT260.C1095
	, DT260.C1094
	, DT259.C514
	, DT260.C1112
	, DT261.C10
	, DT259.C523
	, DT260.C1103
	, DT260.C1105
	, DT261.C14
	, DT259.C524
LIMIT 378;


SELECT
	DT263.C768
	, DT263.C764
	, DT263.C781
	, DT262.C724
	, DT264.C1057
	, DT263.C767
	, DT263.C776
	, DT262.C718
	, DT262.C721
	, DT264.C1061
	, DT264.C1059
	, DT263.C777
	, DT263.C775
	, DT262.C723
	, DT263.C766
	, DT262.C720
	, DT263.C778
	, DT264.C1063
	, DT263.C770
	, DT262.C717
FROM
	(
		(
			T87 DT264
		LEFT OUTER JOIN
			T60 DT262
		ON
			DT264.C1057 < DT262.C721
		)
	RIGHT OUTER JOIN
		T64 DT263
	ON
		DT262.C722 <> DT263.C772
	)
WHERE
	(
		(
			DT263.C781 <> DT263.C775
		)
		AND
		(
			DT263.C774 <> DT262.C721
		)
	)
	OR
	(
		(
			DT263.C769 = DT262.C718
		)
		AND
		(
			DT263.C767 < DT263.C775
		)
	)
ORDER BY
	DT263.C768
	, DT263.C764
	, DT263.C781
	, DT262.C724
	, DT264.C1057
	, DT263.C767
	, DT263.C776
	, DT262.C718
	, DT262.C721
	, DT264.C1061
	, DT264.C1059
	, DT263.C777
	, DT263.C775
	, DT262.C723
	, DT263.C766
	, DT262.C720
	, DT263.C778
	, DT264.C1063
	, DT263.C770
	, DT262.C717
LIMIT 985;


SELECT
	DT267.C318
	, DT268.C448
	, DT267.C304
	, DT265.C1080
FROM
	(
		(
			(
				T40 DT268
			LEFT OUTER JOIN
				T38 DT266
			ON
				DT268.C448 < DT266.C442
			)
		INNER JOIN
			T26 DT267
		ON
			DT266.C442 > DT267.C318
		)
	INNER JOIN
		T90 DT265
	ON
		DT267.C298 = DT265.C1079
	)
WHERE
	(
		(
			DT268.C448 = DT267.C305
		)
		OR
		(
			DT267.C314 <> DT266.C441
		)
	)
	OR
	(
		DT267.C317 > DT267.C301
	)
ORDER BY
	DT267.C318
	, DT268.C448
	, DT267.C304
	, DT265.C1080
LIMIT 142;


SELECT
	DT271.C765
	, DT271.C771
	, DT270.C284
	, DT271.C766
	, DT269.C205
	, DT271.C782
	, DT270.C292
	, DT270.C291
	, DT270.C290
	, DT271.C780
	, DT270.C296
	, DT270.C289
	, DT271.C773
	, DT271.C767
	, DT271.C778
	, DT269.C201
	, DT271.C764
	, DT271.C769
	, DT271.C777
	, DT270.C288
	, DT270.C286
	, DT271.C768
	, DT271.C772
	, DT271.C781
	, DT270.C285
	, DT270.C287
	, DT269.C206
	, DT269.C203
	, DT269.C204
	, DT270.C293
	, DT270.C283
	, DT271.C774
FROM
	(
		(
			T64 DT271
		INNER JOIN
			T25 DT270
		ON
			DT271.C780 = DT270.C294
		)
	INNER JOIN
		T16 DT269
	ON
		DT270.C292 < DT269.C203
	)
WHERE
	(
		DT269.C205 < DT271.C782
	)
	OR
	(
		DT269.C205 = DT269.C203
	)
ORDER BY
	DT271.C765
	, DT271.C771
	, DT270.C284
	, DT271.C766
	, DT269.C205
	, DT271.C782
	, DT270.C292
	, DT270.C291
	, DT270.C290
	, DT271.C780
	, DT270.C296
	, DT270.C289
	, DT271.C773
	, DT271.C767
	, DT271.C778
	, DT269.C201
	, DT271.C764
	, DT271.C769
	, DT271.C777
	, DT270.C288
	, DT270.C286
	, DT271.C768
	, DT271.C772
	, DT271.C781
	, DT270.C285
	, DT270.C287
	, DT269.C206
	, DT269.C203
	, DT269.C204
	, DT270.C293
	, DT270.C283
	, DT271.C774
LIMIT 206;


SELECT
	DT272.C727
	, DT272.C728
	, DT273.C1000
	, DT272.C729
	, DT272.C730
	, DT272.C732
	, DT272.C736
	, DT273.C996
	, DT273.C997
	, DT272.C738
	, DT273.C998
FROM
	(
		T61 DT272
	LEFT OUTER JOIN
		T82 DT273
	ON
		DT272.C727 = DT273.C995
	)
WHERE
	(
		DT272.C733 > DT272.C732
	)
	AND
	(
		(
			DT272.C726 = DT272.C732
		)
		AND
		(
			DT272.C726 = DT272.C731
		)
	)
ORDER BY
	DT272.C727
	, DT272.C728
	, DT273.C1000
	, DT272.C729
	, DT272.C730
	, DT272.C732
	, DT272.C736
	, DT273.C996
	, DT273.C997
	, DT272.C738
	, DT273.C998
LIMIT 201;


SELECT
	DT275.C516
	, DT275.C527
	, DT276.C209
	, DT275.C525
	, DT275.C519
	, DT276.C215
	, DT276.C212
	, DT274.C328
	, DT276.C216
	, DT275.C518
	, DT275.C515
	, DT276.C214
	, DT274.C330
	, DT274.C333
	, DT276.C211
	, DT275.C517
	, DT275.C513
	, DT276.C207
	, DT275.C512
	, DT276.C208
	, DT275.C514
	, DT276.C210
	, DT276.C217
	, DT275.C520
	, DT276.C218
	, DT275.C523
	, DT275.C524
	, DT274.C329
	, DT276.C213
FROM
	(
		T45 DT275
	LEFT OUTER JOIN
		(
			T28 DT274
		INNER JOIN
			T17 DT276
		ON
			DT274.C332 > DT276.C207
		)
	ON
		DT275.C522 = DT274.C330
	)
WHERE
	(
		DT276.C211 > DT275.C524
	)
	AND
	(
		DT275.C515 <> DT275.C524
	)
ORDER BY
	DT275.C516
	, DT275.C527
	, DT276.C209
	, DT275.C525
	, DT275.C519
	, DT276.C215
	, DT276.C212
	, DT274.C328
	, DT276.C216
	, DT275.C518
	, DT275.C515
	, DT276.C214
	, DT274.C330
	, DT274.C333
	, DT276.C211
	, DT275.C517
	, DT275.C513
	, DT276.C207
	, DT275.C512
	, DT276.C208
	, DT275.C514
	, DT276.C210
	, DT276.C217
	, DT275.C520
	, DT276.C218
	, DT275.C523
	, DT275.C524
	, DT274.C329
	, DT276.C213
LIMIT 450;


SELECT
	DT278.C978
	, DT277.C569
	, DT278.C974
	, DT277.C580
	, DT278.C972
FROM
	(
		T78 DT278
	INNER JOIN
		T48 DT277
	ON
		DT278.C977 = DT277.C581
	)
WHERE
	(
		DT278.C975 = DT278.C976
	)
	OR
	(
		(
			DT278.C971 = DT277.C577
		)
		OR
		(
			DT278.C975 > DT277.C577
		)
	)
ORDER BY
	DT278.C978
	, DT277.C569
	, DT278.C974
	, DT277.C580
	, DT278.C972
LIMIT 460;


SELECT
	DT280.C56
	, DT281.C525
	, DT281.C514
	, DT282.C198
	, DT281.C527
	, DT282.C191
	, DT280.C62
	, DT280.C58
	, DT280.C63
	, DT282.C197
	, DT283.C664
	, DT281.C520
	, DT279.C941
	, DT281.C512
	, DT281.C523
	, DT279.C944
	, DT282.C196
	, DT283.C667
	, DT282.C189
	, DT280.C60
	, DT280.C64
	, DT283.C666
	, DT280.C59
	, DT281.C524
	, DT280.C54
	, DT282.C188
	, DT279.C946
	, DT282.C192
	, DT282.C199
	, DT279.C940
	, DT280.C55
	, DT281.C516
	, DT282.C186
	, DT283.C658
	, DT282.C187
	, DT282.C194
FROM
	(
		(
			(
				T15 DT282
			RIGHT OUTER JOIN
				T55 DT283
			ON
				DT282.C196 = DT283.C665
			)
		INNER JOIN
			(
				T4 DT280
			INNER JOIN
				T76 DT279
			ON
				DT280.C61 = DT279.C941
			)
		ON
			DT282.C198 = DT280.C61
		)
	LEFT OUTER JOIN
		T45 DT281
	ON
		DT280.C61 <> DT281.C525
	)
WHERE
	(
		DT281.C517 <> DT283.C662
	)
	OR
	(
		DT282.C193 = DT283.C662
	)
ORDER BY
	DT280.C56
	, DT281.C525
	, DT281.C514
	, DT282.C198
	, DT281.C527
	, DT282.C191
	, DT280.C62
	, DT280.C58
	, DT280.C63
	, DT282.C197
	, DT283.C664
	, DT281.C520
	, DT279.C941
	, DT281.C512
	, DT281.C523
	, DT279.C944
	, DT282.C196
	, DT283.C667
	, DT282.C189
	, DT280.C60
	, DT280.C64
	, DT283.C666
	, DT280.C59
	, DT281.C524
	, DT280.C54
	, DT282.C188
	, DT279.C946
	, DT282.C192
	, DT282.C199
	, DT279.C940
	, DT280.C55
	, DT281.C516
	, DT282.C186
	, DT283.C658
	, DT282.C187
	, DT282.C194
LIMIT 642;


SELECT
	DT284.C750
	, DT285.C515
	, DT285.C517
	, DT284.C748
	, DT284.C754
	, DT285.C512
	, DT284.C763
	, DT285.C526
	, DT284.C745
	, DT285.C525
	, DT285.C520
	, DT284.C747
	, DT284.C746
	, DT284.C743
	, DT285.C519
	, DT284.C762
	, DT285.C521
	, DT285.C518
	, DT285.C514
	, DT284.C755
	, DT284.C756
	, DT284.C744
	, DT284.C760
	, DT284.C749
	, DT285.C522
	, DT284.C753
	, DT284.C751
	, DT285.C516
	, DT284.C752
	, DT285.C523
	, DT284.C761
	, DT284.C759
	, DT285.C527
	, DT284.C757
	, DT285.C513
	, DT285.C524
	, DT284.C758
FROM
	(
		T63 DT284
	RIGHT OUTER JOIN
		T45 DT285
	ON
		DT284.C744 <> DT285.C517
	)
WHERE
	(
		(
			DT284.C755 < DT284.C756
		)
		OR
		(
			DT284.C750 = DT284.C750
		)
	)
	AND
	(
		(
			DT284.C756 > DT284.C759
		)
		AND
		(
			DT285.C518 < DT284.C745
		)
	)
ORDER BY
	DT284.C750
	, DT285.C515
	, DT285.C517
	, DT284.C748
	, DT284.C754
	, DT285.C512
	, DT284.C763
	, DT285.C526
	, DT284.C745
	, DT285.C525
	, DT285.C520
	, DT284.C747
	, DT284.C746
	, DT284.C743
	, DT285.C519
	, DT284.C762
	, DT285.C521
	, DT285.C518
	, DT285.C514
	, DT284.C755
	, DT284.C756
	, DT284.C744
	, DT284.C760
	, DT284.C749
	, DT285.C522
	, DT284.C753
	, DT284.C751
	, DT285.C516
	, DT284.C752
	, DT285.C523
	, DT284.C761
	, DT284.C759
	, DT285.C527
	, DT284.C757
	, DT285.C513
	, DT285.C524
	, DT284.C758
LIMIT 233;


SELECT
	DT287.C658
	, DT287.C660
	, DT286.C504
	, DT286.C511
	, DT286.C510
	, DT286.C509
	, DT287.C659
	, DT286.C505
	, DT287.C664
	, DT287.C667
	, DT286.C502
	, DT287.C661
	, DT287.C665
	, DT286.C503
	, DT286.C506
FROM
	(
		T55 DT287
	LEFT OUTER JOIN
		T44 DT286
	ON
		DT287.C663 <> DT286.C510
	)
WHERE
	(
		(
			DT286.C506 < DT287.C665
		)
		AND
		(
			DT287.C660 = DT287.C666
		)
	)
	OR
	(
		(
			DT286.C502 <> DT286.C503
		)
		OR
		(
			DT286.C503 = DT286.C509
		)
	)
ORDER BY
	DT287.C658
	, DT287.C660
	, DT286.C504
	, DT286.C511
	, DT286.C510
	, DT286.C509
	, DT287.C659
	, DT286.C505
	, DT287.C664
	, DT287.C667
	, DT286.C502
	, DT287.C661
	, DT287.C665
	, DT286.C503
	, DT286.C506
LIMIT 953;


SELECT
	DT288.C854
	, DT289.C143
	, DT289.C146
	, DT288.C840
	, DT288.C844
	, DT288.C857
	, DT289.C151
	, DT288.C845
	, DT289.C144
	, DT288.C849
	, DT288.C859
	, DT288.C851
	, DT289.C142
	, DT288.C848
	, DT289.C149
	, DT288.C846
	, DT288.C853
	, DT288.C856
	, DT289.C139
	, DT288.C847
	, DT289.C141
	, DT289.C140
	, DT288.C839
	, DT288.C852
	, DT288.C843
	, DT288.C855
	, DT288.C850
	, DT289.C147
	, DT289.C138
	, DT289.C145
	, DT289.C150
FROM
	(
		T10 DT289
	INNER JOIN
		T70 DT288
	ON
		DT289.C142 = DT288.C859
	)
WHERE
	(
		(
			DT288.C842 > DT288.C840
		)
		OR
		(
			DT288.C856 = DT288.C840
		)
	)
	AND
	(
		(
			DT288.C859 > DT288.C858
		)
		OR
		(
			DT288.C853 <> DT289.C140
		)
	)
ORDER BY
	DT288.C854
	, DT289.C143
	, DT289.C146
	, DT288.C840
	, DT288.C844
	, DT288.C857
	, DT289.C151
	, DT288.C845
	, DT289.C144
	, DT288.C849
	, DT288.C859
	, DT288.C851
	, DT289.C142
	, DT288.C848
	, DT289.C149
	, DT288.C846
	, DT288.C853
	, DT288.C856
	, DT289.C139
	, DT288.C847
	, DT289.C141
	, DT289.C140
	, DT288.C839
	, DT288.C852
	, DT288.C843
	, DT288.C855
	, DT288.C850
	, DT289.C147
	, DT289.C138
	, DT289.C145
	, DT289.C150
LIMIT 930;


SELECT
	DT291.C225
	, DT292.C838
	, DT293.C1074
	, DT293.C1071
	, DT292.C828
	, DT292.C836
	, DT293.C1075
	, DT290.C729
	, DT293.C1069
	, DT291.C224
	, DT290.C725
	, DT290.C737
	, DT291.C219
	, DT293.C1067
	, DT291.C227
	, DT291.C220
	, DT290.C733
	, DT292.C827
	, DT290.C730
	, DT293.C1068
	, DT293.C1066
	, DT292.C830
	, DT292.C825
	, DT292.C834
	, DT292.C824
	, DT291.C222
	, DT290.C739
	, DT290.C727
	, DT292.C832
	, DT292.C833
	, DT292.C826
	, DT290.C738
	, DT293.C1065
	, DT293.C1072
	, DT290.C735
	, DT291.C221
	, DT290.C732
	, DT293.C1070
	, DT290.C734
	, DT291.C229
	, DT293.C1073
	, DT292.C829
	, DT291.C226
	, DT292.C831
	, DT292.C837
FROM
	(
		(
			T69 DT292
		INNER JOIN
			(
				T88 DT293
			INNER JOIN
				T61 DT290
			ON
				DT293.C1075 <> DT290.C736
			)
		ON
			DT292.C826 = DT290.C734
		)
	RIGHT OUTER JOIN
		T18 DT291
	ON
		DT292.C834 = DT291.C221
	)
WHERE
	(
		DT293.C1068 = DT292.C833
	)
	AND
	(
		(
			DT290.C731 > DT292.C827
		)
		OR
		(
			DT292.C830 = DT290.C727
		)
	)
ORDER BY
	DT291.C225
	, DT292.C838
	, DT293.C1074
	, DT293.C1071
	, DT292.C828
	, DT292.C836
	, DT293.C1075
	, DT290.C729
	, DT293.C1069
	, DT291.C224
	, DT290.C725
	, DT290.C737
	, DT291.C219
	, DT293.C1067
	, DT291.C227
	, DT291.C220
	, DT290.C733
	, DT292.C827
	, DT290.C730
	, DT293.C1068
	, DT293.C1066
	, DT292.C830
	, DT292.C825
	, DT292.C834
	, DT292.C824
	, DT291.C222
	, DT290.C739
	, DT290.C727
	, DT292.C832
	, DT292.C833
	, DT292.C826
	, DT290.C738
	, DT293.C1065
	, DT293.C1072
	, DT290.C735
	, DT291.C221
	, DT290.C732
	, DT293.C1070
	, DT290.C734
	, DT291.C229
	, DT293.C1073
	, DT292.C829
	, DT291.C226
	, DT292.C831
	, DT292.C837
LIMIT 867;


SELECT
	DT294.C38
	, DT294.C49
	, DT294.C46
	, DT294.C42
	, DT294.C33
	, DT296.C274
	, DT295.C802
	, DT295.C798
	, DT294.C35
	, DT294.C50
	, DT296.C278
	, DT295.C807
	, DT294.C51
	, DT294.C39
	, DT295.C799
	, DT296.C272
	, DT294.C32
	, DT294.C40
	, DT295.C805
	, DT295.C803
	, DT295.C801
	, DT295.C804
	, DT294.C48
FROM
	(
		(
			T3 DT294
		LEFT OUTER JOIN
			T23 DT296
		ON
			DT294.C35 < DT296.C274
		)
	INNER JOIN
		T66 DT295
	ON
		DT294.C42 = DT295.C808
	)
WHERE
	(
		DT296.C274 < DT295.C807
	)
	OR
	(
		(
			DT295.C798 = DT295.C804
		)
		OR
		(
			DT294.C47 = DT294.C32
		)
	)
ORDER BY
	DT294.C38
	, DT294.C49
	, DT294.C46
	, DT294.C42
	, DT294.C33
	, DT296.C274
	, DT295.C802
	, DT295.C798
	, DT294.C35
	, DT294.C50
	, DT296.C278
	, DT295.C807
	, DT294.C51
	, DT294.C39
	, DT295.C799
	, DT296.C272
	, DT294.C32
	, DT294.C40
	, DT295.C805
	, DT295.C803
	, DT295.C801
	, DT295.C804
	, DT294.C48
LIMIT 675;


SELECT
	DT297.C1166
	, DT298.C418
	, DT297.C1146
	, DT297.C1145
	, DT297.C1159
	, DT298.C414
	, DT297.C1147
	, DT297.C1157
	, DT298.C411
	, DT297.C1160
	, DT297.C1164
	, DT297.C1158
	, DT297.C1165
	, DT297.C1163
	, DT297.C1150
	, DT297.C1152
	, DT297.C1161
	, DT297.C1156
	, DT298.C413
	, DT297.C1151
	, DT297.C1149
	, DT298.C416
FROM
	(
		T35 DT298
	INNER JOIN
		T94 DT297
	ON
		DT298.C413 = DT297.C1166
	)
WHERE
	(
		DT297.C1161 = DT297.C1151
	)
	OR
	(
		DT297.C1146 = DT297.C1153
	)
ORDER BY
	DT297.C1166
	, DT298.C418
	, DT297.C1146
	, DT297.C1145
	, DT297.C1159
	, DT298.C414
	, DT297.C1147
	, DT297.C1157
	, DT298.C411
	, DT297.C1160
	, DT297.C1164
	, DT297.C1158
	, DT297.C1165
	, DT297.C1163
	, DT297.C1150
	, DT297.C1152
	, DT297.C1161
	, DT297.C1156
	, DT298.C413
	, DT297.C1151
	, DT297.C1149
	, DT298.C416
LIMIT 355;


SELECT
	DT299.C910
	, DT302.C867
	, DT299.C919
	, DT301.C67
	, DT302.C871
	, DT299.C913
	, DT301.C71
	, DT299.C911
	, DT302.C886
	, DT299.C916
	, DT302.C875
	, DT303.C251
	, DT299.C928
	, DT299.C923
	, DT299.C918
	, DT301.C69
	, DT302.C880
	, DT300.C997
	, DT301.C66
	, DT299.C917
	, DT302.C870
	, DT300.C995
	, DT302.C879
FROM
	(
		(
			(
				T72 DT302
			INNER JOIN
				T21 DT303
			ON
				DT302.C880 > DT303.C256
			)
		LEFT OUTER JOIN
			(
				T82 DT300
			RIGHT OUTER JOIN
				T5 DT301
			ON
				DT300.C996 = DT301.C67
			)
		ON
			DT302.C867 < DT301.C66
		)
	INNER JOIN
		T74 DT299
	ON
		DT301.C73 = DT299.C914
	)
WHERE
	(
		DT302.C867 = DT299.C926
	)
	AND
	(
		DT303.C250 = DT303.C250
	)
ORDER BY
	DT299.C910
	, DT302.C867
	, DT299.C919
	, DT301.C67
	, DT302.C871
	, DT299.C913
	, DT301.C71
	, DT299.C911
	, DT302.C886
	, DT299.C916
	, DT302.C875
	, DT303.C251
	, DT299.C928
	, DT299.C923
	, DT299.C918
	, DT301.C69
	, DT302.C880
	, DT300.C997
	, DT301.C66
	, DT299.C917
	, DT302.C870
	, DT300.C995
	, DT302.C879
LIMIT 520;


SELECT
	DT306.C741
	, DT307.C976
	, DT304.C940
	, DT307.C965
	, DT307.C970
	, DT305.C643
	, DT305.C642
	, DT304.C945
	, DT307.C971
	, DT307.C975
	, DT305.C652
	, DT304.C939
	, DT305.C648
	, DT305.C641
	, DT307.C974
	, DT307.C973
	, DT304.C944
	, DT304.C938
	, DT305.C638
	, DT307.C972
	, DT304.C942
	, DT305.C651
	, DT305.C649
	, DT305.C653
	, DT305.C639
	, DT307.C967
FROM
	(
		(
			T62 DT306
		CROSS JOIN
			T76 DT304
		)
	INNER JOIN
		(
			T78 DT307
		LEFT OUTER JOIN
			T53 DT305
		ON
			DT307.C965 <> DT305.C645
		)
	ON
		DT304.C938 = DT305.C653
	)
WHERE
	(
		DT304.C946 > DT304.C946
	)
	AND
	(
		DT307.C969 < DT306.C742
	)
ORDER BY
	DT306.C741
	, DT307.C976
	, DT304.C940
	, DT307.C965
	, DT307.C970
	, DT305.C643
	, DT305.C642
	, DT304.C945
	, DT307.C971
	, DT307.C975
	, DT305.C652
	, DT304.C939
	, DT305.C648
	, DT305.C641
	, DT307.C974
	, DT307.C973
	, DT304.C944
	, DT304.C938
	, DT305.C638
	, DT307.C972
	, DT304.C942
	, DT305.C651
	, DT305.C649
	, DT305.C653
	, DT305.C639
	, DT307.C967
LIMIT 523;


SELECT
	DT309.C54
	, DT309.C57
	, DT308.C997
FROM
	(
		T76 DT310
	INNER JOIN
		(
			T82 DT308
		LEFT OUTER JOIN
			T4 DT309
		ON
			DT308.C997 > DT309.C53
		)
	ON
		DT310.C941 = DT309.C53
	)
WHERE
	(
		(
			DT310.C943 = DT309.C53
		)
		OR
		(
			DT309.C60 > DT308.C998
		)
	)
	OR
	(
		DT310.C944 > DT309.C61
	)
ORDER BY
	DT309.C54
	, DT309.C57
	, DT308.C997
LIMIT 166;


SELECT
	DT313.C659
	, DT314.C154
	, DT311.C504
	, DT312.C501
	, DT312.C489
	, DT311.C506
	, DT311.C508
	, DT312.C487
FROM
	(
		(
			(
				T55 DT313
			INNER JOIN
				T11 DT314
			ON
				DT313.C660 > DT314.C154
			)
		INNER JOIN
			T43 DT312
		ON
			DT313.C660 < DT312.C490
		)
	CROSS JOIN
		T44 DT311
	)
WHERE
	(
		DT313.C660 = DT313.C660
	)
	AND
	(
		DT311.C507 <> DT312.C496
	)
ORDER BY
	DT313.C659
	, DT314.C154
	, DT311.C504
	, DT312.C501
	, DT312.C489
	, DT311.C506
	, DT311.C508
	, DT312.C487
LIMIT 804;


SELECT
	DT315.C628
	, DT315.C625
	, DT315.C626
	, DT316.C69
	, DT316.C67
	, DT316.C66
	, DT316.C70
	, DT315.C630
	, DT316.C72
	, DT316.C74
	, DT315.C634
	, DT315.C631
	, DT315.C633
	, DT315.C627
	, DT316.C68
	, DT315.C632
	, DT315.C629
	, DT316.C71
FROM
	(
		T5 DT316
	INNER JOIN
		T52 DT315
	ON
		DT316.C66 > DT315.C635
	)
WHERE
	(
		(
			DT315.C634 <> DT315.C631
		)
		AND
		(
			DT315.C632 = DT315.C627
		)
	)
	AND
	(
		(
			DT315.C630 < DT315.C635
		)
		OR
		(
			DT315.C629 = DT316.C70
		)
	)
ORDER BY
	DT315.C628
	, DT315.C625
	, DT315.C626
	, DT316.C69
	, DT316.C67
	, DT316.C66
	, DT316.C70
	, DT315.C630
	, DT316.C72
	, DT316.C74
	, DT315.C634
	, DT315.C631
	, DT315.C633
	, DT315.C627
	, DT316.C68
	, DT315.C632
	, DT315.C629
	, DT316.C71
LIMIT 914;


SELECT
	DT318.C856
	, DT321.C281
	, DT318.C840
	, DT319.C1068
	, DT318.C844
	, DT320.C409
	, DT318.C848
	, DT318.C845
	, DT319.C1070
	, DT317.C604
	, DT319.C1069
	, DT318.C850
	, DT319.C1067
	, DT321.C282
	, DT317.C607
	, DT318.C842
	, DT319.C1075
	, DT317.C603
	, DT318.C846
	, DT318.C839
	, DT320.C402
	, DT318.C855
	, DT318.C858
	, DT319.C1071
	, DT318.C859
	, DT320.C407
	, DT317.C602
	, DT318.C849
	, DT319.C1073
	, DT319.C1066
	, DT318.C847
	, DT320.C404
	, DT321.C280
	, DT317.C600
	, DT319.C1072
	, DT320.C403
	, DT317.C605
	, DT320.C406
	, DT318.C852
	, DT318.C857
	, DT320.C410
	, DT318.C851
	, DT320.C408
	, DT318.C843
	, DT319.C1074
	, DT319.C1065
	, DT317.C606
	, DT319.C1064
	, DT317.C601
	, DT320.C405
	, DT318.C854
	, DT318.C841
	, DT321.C279
	, DT318.C853
FROM
	(
		T88 DT319
	RIGHT OUTER JOIN
		(
			T50 DT317
		INNER JOIN
			(
				T24 DT321
			INNER JOIN
				(
					T34 DT320
				LEFT OUTER JOIN
					T70 DT318
				ON
					DT320.C408 < DT318.C850
				)
			ON
				DT321.C281 > DT318.C859
			)
		ON
			DT317.C607 > DT318.C848
		)
	ON
		DT319.C1066 <> DT318.C844
	)
WHERE
	(
		(
			DT317.C607 <> DT318.C850
		)
		OR
		(
			DT320.C402 > DT318.C844
		)
	)
	OR
	(
		DT318.C859 = DT321.C281
	)
ORDER BY
	DT318.C856
	, DT321.C281
	, DT318.C840
	, DT319.C1068
	, DT318.C844
	, DT320.C409
	, DT318.C848
	, DT318.C845
	, DT319.C1070
	, DT317.C604
	, DT319.C1069
	, DT318.C850
	, DT319.C1067
	, DT321.C282
	, DT317.C607
	, DT318.C842
	, DT319.C1075
	, DT317.C603
	, DT318.C846
	, DT318.C839
	, DT320.C402
	, DT318.C855
	, DT318.C858
	, DT319.C1071
	, DT318.C859
	, DT320.C407
	, DT317.C602
	, DT318.C849
	, DT319.C1073
	, DT319.C1066
	, DT318.C847
	, DT320.C404
	, DT321.C280
	, DT317.C600
	, DT319.C1072
	, DT320.C403
	, DT317.C605
	, DT320.C406
	, DT318.C852
	, DT318.C857
	, DT320.C410
	, DT318.C851
	, DT320.C408
	, DT318.C843
	, DT319.C1074
	, DT319.C1065
	, DT317.C606
	, DT319.C1064
	, DT317.C601
	, DT320.C405
	, DT318.C854
	, DT318.C841
	, DT321.C279
	, DT318.C853
LIMIT 530;


SELECT
	DT324.C705
	, DT323.C580
	, DT322.C1003
	, DT322.C1001
	, DT323.C576
	, DT325.C323
	, DT324.C699
	, DT323.C582
	, DT325.C327
	, DT322.C1007
	, DT323.C578
	, DT325.C326
	, DT325.C321
	, DT324.C711
	, DT323.C575
	, DT324.C710
	, DT324.C698
	, DT323.C574
	, DT323.C583
	, DT323.C577
	, DT323.C569
	, DT322.C1005
	, DT325.C325
	, DT323.C584
	, DT323.C585
	, DT325.C319
	, DT325.C322
FROM
	(
		(
			T83 DT322
		RIGHT OUTER JOIN
			(
				T48 DT323
			INNER JOIN
				T58 DT324
			ON
				DT323.C579 = DT324.C699
			)
		ON
			DT322.C1006 = DT323.C571
		)
	CROSS JOIN
		T27 DT325
	)
WHERE
	(
		(
			DT323.C582 = DT325.C327
		)
		AND
		(
			DT323.C580 = DT324.C704
		)
	)
	AND
	(
		DT324.C702 = DT323.C585
	)
ORDER BY
	DT324.C705
	, DT323.C580
	, DT322.C1003
	, DT322.C1001
	, DT323.C576
	, DT325.C323
	, DT324.C699
	, DT323.C582
	, DT325.C327
	, DT322.C1007
	, DT323.C578
	, DT325.C326
	, DT325.C321
	, DT324.C711
	, DT323.C575
	, DT324.C710
	, DT324.C698
	, DT323.C574
	, DT323.C583
	, DT323.C577
	, DT323.C569
	, DT322.C1005
	, DT325.C325
	, DT323.C584
	, DT323.C585
	, DT325.C319
	, DT325.C322
LIMIT 430;


SELECT
	DT329.C952
	, DT329.C951
	, DT328.C986
	, DT328.C988
	, DT326.C973
	, DT327.C472
	, DT326.C978
	, DT329.C953
	, DT330.C403
	, DT329.C964
	, DT329.C958
	, DT330.C407
	, DT327.C470
	, DT327.C451
	, DT327.C460
	, DT330.C402
	, DT327.C459
	, DT330.C406
	, DT327.C467
	, DT329.C947
	, DT329.C957
	, DT330.C404
	, DT330.C409
	, DT327.C469
	, DT326.C965
	, DT329.C950
FROM
	(
		(
			T78 DT326
		INNER JOIN
			(
				T77 DT329
			INNER JOIN
				T41 DT327
			ON
				DT329.C956 > DT327.C472
			)
		ON
			DT326.C978 > DT327.C455
		)
	CROSS JOIN
		(
			T80 DT328
		INNER JOIN
			T34 DT330
		ON
			DT328.C988 = DT330.C403
		)
	)
WHERE
	(
		DT326.C978 > DT326.C976
	)
	OR
	(
		DT327.C462 = DT330.C407
	)
ORDER BY
	DT329.C952
	, DT329.C951
	, DT328.C986
	, DT328.C988
	, DT326.C973
	, DT327.C472
	, DT326.C978
	, DT329.C953
	, DT330.C403
	, DT329.C964
	, DT329.C958
	, DT330.C407
	, DT327.C470
	, DT327.C451
	, DT327.C460
	, DT330.C402
	, DT327.C459
	, DT330.C406
	, DT327.C467
	, DT329.C947
	, DT329.C957
	, DT330.C404
	, DT330.C409
	, DT327.C469
	, DT326.C965
	, DT329.C950
LIMIT 297;


SELECT
	DT334.C276
	, DT333.C961
	, DT333.C958
	, DT332.C1136
	, DT332.C1144
	, DT333.C963
	, DT334.C270
	, DT333.C960
	, DT332.C1140
	, DT333.C947
	, DT333.C952
	, DT334.C278
	, DT333.C957
	, DT333.C951
	, DT331.C866
	, DT333.C956
	, DT332.C1143
	, DT334.C273
	, DT331.C865
	, DT332.C1138
	, DT332.C1137
	, DT333.C950
	, DT334.C274
FROM
	(
		(
			T23 DT334
		INNER JOIN
			T77 DT333
		ON
			DT334.C271 > DT333.C953
		)
	LEFT OUTER JOIN
		(
			T93 DT332
		LEFT OUTER JOIN
			T71 DT331
		ON
			DT332.C1141 = DT331.C861
		)
	ON
		DT333.C952 = DT332.C1141
	)
WHERE
	(
		(
			DT333.C958 < DT333.C964
		)
		OR
		(
			DT332.C1144 = DT332.C1139
		)
	)
	OR
	(
		(
			DT334.C277 = DT333.C950
		)
		OR
		(
			DT332.C1144 = DT332.C1143
		)
	)
ORDER BY
	DT334.C276
	, DT333.C961
	, DT333.C958
	, DT332.C1136
	, DT332.C1144
	, DT333.C963
	, DT334.C270
	, DT333.C960
	, DT332.C1140
	, DT333.C947
	, DT333.C952
	, DT334.C278
	, DT333.C957
	, DT333.C951
	, DT331.C866
	, DT333.C956
	, DT332.C1143
	, DT334.C273
	, DT331.C865
	, DT332.C1138
	, DT332.C1137
	, DT333.C950
	, DT334.C274
LIMIT 941;


SELECT
	DT336.C231
FROM
	(
		(
			T23 DT337
		RIGHT OUTER JOIN
			T19 DT336
		ON
			DT337.C276 > DT336.C230
		)
	CROSS JOIN
		T17 DT335
	)
WHERE
	(
		(
			DT336.C231 > DT335.C216
		)
		OR
		(
			(
				DT337.C274 < DT335.C213
			)
			OR
			(
				DT335.C213 > DT335.C210
			)
		)
	)
	AND
	(
		DT337.C272 = DT336.C232
	)
ORDER BY
	DT336.C231
LIMIT 729;


SELECT
	DT338.C1059
FROM
	(
		T6 DT339
	INNER JOIN
		(
			T47 DT340
		LEFT OUTER JOIN
			(
				T18 DT341
			LEFT OUTER JOIN
				T87 DT338
			ON
				DT341.C225 = DT338.C1056
			)
		ON
			DT340.C560 > DT338.C1059
		)
	ON
		DT339.C76 <> DT340.C549
	)
WHERE
	(
		DT339.C86 < DT340.C565
	)
	OR
	(
		DT340.C566 = DT338.C1056
	)
ORDER BY
	DT338.C1059
LIMIT 807;


SELECT
	DT343.C279
	, DT342.C356
	, DT342.C349
	, DT344.C987
	, DT342.C351
	, DT342.C345
	, DT342.C350
	, DT343.C280
	, DT342.C347
	, DT342.C362
	, DT342.C348
	, DT342.C359
	, DT342.C344
	, DT343.C282
	, DT342.C360
	, DT342.C358
	, DT345.C444
	, DT342.C361
	, DT342.C346
	, DT342.C357
	, DT342.C353
FROM
	(
		T24 DT343
	INNER JOIN
		(
			(
				T31 DT342
			INNER JOIN
				T80 DT344
			ON
				DT342.C344 <> DT344.C988
			)
		CROSS JOIN
			T39 DT345
		)
	ON
		DT343.C281 > DT342.C354
	)
WHERE
	(
		(
			DT345.C444 < DT342.C363
		)
		OR
		(
			DT343.C280 <> DT343.C281
		)
	)
	OR
	(
		DT342.C354 <> DT342.C357
	)
ORDER BY
	DT343.C279
	, DT342.C356
	, DT342.C349
	, DT344.C987
	, DT342.C351
	, DT342.C345
	, DT342.C350
	, DT343.C280
	, DT342.C347
	, DT342.C362
	, DT342.C348
	, DT342.C359
	, DT342.C344
	, DT343.C282
	, DT342.C360
	, DT342.C358
	, DT345.C444
	, DT342.C361
	, DT342.C346
	, DT342.C357
	, DT342.C353
LIMIT 868;


SELECT
	DT347.C699
	, DT349.C606
	, DT349.C600
	, DT347.C711
	, DT349.C607
	, DT346.C634
	, DT347.C700
	, DT348.C1202
	, DT347.C702
	, DT348.C1203
FROM
	(
		(
			T58 DT347
		CROSS JOIN
			(
				T52 DT346
			LEFT OUTER JOIN
				T98 DT348
			ON
				DT346.C627 = DT348.C1202
			)
		)
	LEFT OUTER JOIN
		T50 DT349
	ON
		DT346.C635 > DT349.C605
	)
WHERE
	(
		DT347.C712 < DT346.C630
	)
	OR
	(
		(
			DT346.C631 = DT347.C707
		)
		AND
		(
			DT347.C707 = DT347.C699
		)
	)
ORDER BY
	DT347.C699
	, DT349.C606
	, DT349.C600
	, DT347.C711
	, DT349.C607
	, DT346.C634
	, DT347.C700
	, DT348.C1202
	, DT347.C702
	, DT348.C1203
LIMIT 753;


SELECT
	DT353.C236
	, DT351.C1085
	, DT352.C1139
	, DT353.C245
	, DT354.C344
FROM
	(
		(
			T90 DT351
		INNER JOIN
			T9 DT350
		ON
			DT351.C1090 < DT350.C136
		)
	INNER JOIN
		(
			T20 DT353
		RIGHT OUTER JOIN
			(
				T93 DT352
			LEFT OUTER JOIN
				T31 DT354
			ON
				DT352.C1136 = DT354.C361
			)
		ON
			DT353.C234 > DT354.C353
		)
	ON
		DT350.C126 = DT353.C239
	)
WHERE
	(
		DT351.C1088 <> DT352.C1142
	)
	OR
	(
		DT351.C1085 > DT354.C344
	)
ORDER BY
	DT353.C236
	, DT351.C1085
	, DT352.C1139
	, DT353.C245
	, DT354.C344
LIMIT 834;


SELECT
	DT357.C624
	, DT357.C611
	, DT355.C456
	, DT357.C613
	, DT355.C457
	, DT357.C609
	, DT356.C132
	, DT357.C621
	, DT356.C126
	, DT355.C461
	, DT356.C137
	, DT355.C458
	, DT355.C466
	, DT355.C462
	, DT355.C469
	, DT356.C131
	, DT357.C616
	, DT355.C472
	, DT357.C617
	, DT355.C471
FROM
	(
		T41 DT355
	LEFT OUTER JOIN
		(
			T9 DT356
		INNER JOIN
			T51 DT357
		ON
			DT356.C127 <> DT357.C613
		)
	ON
		DT355.C460 = DT357.C623
	)
WHERE
	(
		(
			DT356.C128 = DT355.C466
		)
		AND
		(
			(
				DT355.C466 = DT355.C463
			)
			OR
			(
				DT355.C465 = DT355.C461
			)
		)
	)
	AND
	(
		DT357.C616 = DT357.C620
	)
ORDER BY
	DT357.C624
	, DT357.C611
	, DT355.C456
	, DT357.C613
	, DT355.C457
	, DT357.C609
	, DT356.C132
	, DT357.C621
	, DT356.C126
	, DT355.C461
	, DT356.C137
	, DT355.C458
	, DT355.C466
	, DT355.C462
	, DT355.C469
	, DT356.C131
	, DT357.C616
	, DT355.C472
	, DT357.C617
	, DT355.C471
LIMIT 849;


SELECT
	DT360.C339
	, DT359.C79
	, DT359.C77
	, DT359.C88
	, DT359.C84
	, DT358.C716
	, DT360.C338
	, DT359.C78
	, DT360.C334
	, DT359.C86
	, DT359.C81
	, DT360.C340
	, DT359.C76
	, DT359.C85
	, DT358.C714
	, DT359.C82
	, DT359.C75
	, DT359.C83
	, DT360.C336
	, DT360.C337
	, DT360.C335
	, DT359.C80
	, DT359.C87
FROM
	(
		T6 DT359
	INNER JOIN
		(
			T29 DT360
		INNER JOIN
			T59 DT358
		ON
			DT360.C336 = DT358.C714
		)
	ON
		DT359.C87 <> DT360.C338
	)
WHERE
	(
		(
			DT359.C84 < DT359.C83
		)
		AND
		(
			DT359.C83 > DT359.C78
		)
	)
	OR
	(
		(
			DT360.C334 = DT360.C335
		)
		AND
		(
			DT360.C335 > DT359.C84
		)
	)
ORDER BY
	DT360.C339
	, DT359.C79
	, DT359.C77
	, DT359.C88
	, DT359.C84
	, DT358.C716
	, DT360.C338
	, DT359.C78
	, DT360.C334
	, DT359.C86
	, DT359.C81
	, DT360.C340
	, DT359.C76
	, DT359.C85
	, DT358.C714
	, DT359.C82
	, DT359.C75
	, DT359.C83
	, DT360.C336
	, DT360.C337
	, DT360.C335
	, DT359.C80
	, DT359.C87
LIMIT 776;


SELECT
	DT362.C931
	, DT364.C1009
	, DT362.C930
	, DT361.C429
	, DT361.C419
	, DT364.C1010
	, DT361.C430
	, DT361.C426
	, DT364.C1028
	, DT364.C1013
	, DT361.C434
	, DT362.C933
	, DT361.C425
	, DT363.C132
	, DT364.C1016
	, DT361.C424
	, DT361.C427
	, DT362.C935
	, DT362.C934
	, DT363.C130
	, DT364.C1023
	, DT364.C1011
	, DT361.C422
	, DT364.C1008
	, DT361.C436
FROM
	(
		T36 DT361
	CROSS JOIN
		(
			(
				T75 DT362
			INNER JOIN
				T84 DT364
			ON
				DT362.C937 = DT364.C1011
			)
		INNER JOIN
			T9 DT363
		ON
			DT364.C1008 > DT363.C127
		)
	)
WHERE
	(
		(
			DT364.C1025 > DT361.C437
		)
		AND
		(
			DT364.C1012 = DT364.C1008
		)
	)
	OR
	(
		DT361.C430 <> DT361.C420
	)
ORDER BY
	DT362.C931
	, DT364.C1009
	, DT362.C930
	, DT361.C429
	, DT361.C419
	, DT364.C1010
	, DT361.C430
	, DT361.C426
	, DT364.C1028
	, DT364.C1013
	, DT361.C434
	, DT362.C933
	, DT361.C425
	, DT363.C132
	, DT364.C1016
	, DT361.C424
	, DT361.C427
	, DT362.C935
	, DT362.C934
	, DT363.C130
	, DT364.C1023
	, DT364.C1011
	, DT361.C422
	, DT364.C1008
	, DT361.C436
LIMIT 828;


SELECT
	DT366.C434
	, DT366.C427
	, DT366.C425
	, DT366.C426
	, DT365.C230
	, DT366.C429
FROM
	(
		T19 DT365
	INNER JOIN
		T36 DT366
	ON
		DT365.C231 > DT366.C432
	)
WHERE
	(
		DT366.C432 <> DT366.C434
	)
	AND
	(
		(
			(
				DT366.C426 > DT366.C426
			)
			OR
			(
				DT366.C428 > DT365.C230
			)
		)
		OR
		(
			DT366.C434 <> DT366.C428
		)
	)
ORDER BY
	DT366.C434
	, DT366.C427
	, DT366.C425
	, DT366.C426
	, DT365.C230
	, DT366.C429
LIMIT 350;


SELECT
	DT369.C231
	, DT368.C479
	, DT368.C477
	, DT367.C446
	, DT368.C480
	, DT368.C482
	, DT368.C475
	, DT368.C485
	, DT368.C476
	, DT368.C483
	, DT367.C444
	, DT368.C484
	, DT368.C473
	, DT368.C474
	, DT368.C481
	, DT367.C445
	, DT369.C230
	, DT368.C486
FROM
	(
		(
			T19 DT369
		RIGHT OUTER JOIN
			T42 DT368
		ON
			DT369.C231 < DT368.C486
		)
	INNER JOIN
		T39 DT367
	ON
		DT368.C486 < DT367.C446
	)
WHERE
	(
		DT368.C485 = DT368.C473
	)
	AND
	(
		DT368.C484 <> DT368.C478
	)
ORDER BY
	DT369.C231
	, DT368.C479
	, DT368.C477
	, DT367.C446
	, DT368.C480
	, DT368.C482
	, DT368.C475
	, DT368.C485
	, DT368.C476
	, DT368.C483
	, DT367.C444
	, DT368.C484
	, DT368.C473
	, DT368.C474
	, DT368.C481
	, DT367.C445
	, DT369.C230
	, DT368.C486
LIMIT 718;


SELECT
	DT371.C291
	, DT371.C284
FROM
	(
		T5 DT370
	LEFT OUTER JOIN
		T25 DT371
	ON
		DT370.C69 < DT371.C287
	)
WHERE
	(
		(
			DT371.C289 > DT370.C73
		)
		AND
		(
			DT370.C73 = DT371.C291
		)
	)
	OR
	(
		(
			DT371.C287 <> DT371.C289
		)
		AND
		(
			DT371.C295 = DT371.C285
		)
	)
ORDER BY
	DT371.C291
	, DT371.C284
LIMIT 593;


SELECT
	DT373.C199
	, DT373.C187
	, DT375.C865
	, DT372.C713
	, DT376.C440
	, DT373.C189
	, DT374.C331
	, DT372.C716
	, DT374.C330
	, DT375.C864
	, DT374.C332
	, DT373.C188
	, DT375.C860
	, DT373.C196
	, DT374.C333
	, DT373.C190
FROM
	(
		T59 DT372
	INNER JOIN
		(
			T37 DT376
		INNER JOIN
			(
				T15 DT373
			LEFT OUTER JOIN
				(
					T71 DT375
				LEFT OUTER JOIN
					T28 DT374
				ON
					DT375.C861 = DT374.C329
				)
			ON
				DT373.C189 <> DT374.C328
			)
		ON
			DT376.C439 = DT374.C331
		)
	ON
		DT372.C715 > DT375.C862
	)
WHERE
	(
		(
			DT373.C196 > DT373.C197
		)
		OR
		(
			DT374.C328 < DT374.C332
		)
	)
	AND
	(
		(
			DT375.C862 < DT375.C865
		)
		OR
		(
			DT375.C866 = DT373.C186
		)
	)
ORDER BY
	DT373.C199
	, DT373.C187
	, DT375.C865
	, DT372.C713
	, DT376.C440
	, DT373.C189
	, DT374.C331
	, DT372.C716
	, DT374.C330
	, DT375.C864
	, DT374.C332
	, DT373.C188
	, DT375.C860
	, DT373.C196
	, DT374.C333
	, DT373.C190
LIMIT 187;


SELECT
	DT378.C606
	, DT377.C612
	, DT377.C619
	, DT377.C621
	, DT377.C623
	, DT377.C611
	, DT377.C616
	, DT378.C605
FROM
	(
		T51 DT377
	INNER JOIN
		T50 DT378
	ON
		DT377.C619 > DT378.C600
	)
WHERE
	(
		DT377.C623 = DT377.C620
	)
	OR
	(
		(
			DT377.C624 > DT378.C601
		)
		AND
		(
			(
				DT377.C608 = DT378.C600
			)
			OR
			(
				DT378.C600 <> DT378.C605
			)
		)
	)
ORDER BY
	DT378.C606
	, DT377.C612
	, DT377.C619
	, DT377.C621
	, DT377.C623
	, DT377.C611
	, DT377.C616
	, DT378.C605
LIMIT 238;


SELECT
	DT380.C764
	, DT380.C777
	, DT381.C704
	, DT380.C780
	, DT380.C781
	, DT380.C772
	, DT380.C769
	, DT380.C775
	, DT381.C703
	, DT380.C778
	, DT381.C707
	, DT380.C773
	, DT381.C705
	, DT379.C1078
	, DT381.C708
	, DT380.C766
	, DT379.C1076
	, DT381.C701
	, DT381.C710
	, DT380.C779
FROM
	(
		T89 DT379
	RIGHT OUTER JOIN
		(
			T64 DT380
		RIGHT OUTER JOIN
			T58 DT381
		ON
			DT380.C778 = DT381.C707
		)
	ON
		DT379.C1078 = DT380.C772
	)
WHERE
	(
		DT381.C702 > DT381.C706
	)
	AND
	(
		(
			DT381.C703 <> DT380.C778
		)
		OR
		(
			(
				DT381.C701 <> DT380.C764
			)
			OR
			(
				DT381.C710 > DT380.C778
			)
		)
	)
ORDER BY
	DT380.C764
	, DT380.C777
	, DT381.C704
	, DT380.C780
	, DT380.C781
	, DT380.C772
	, DT380.C769
	, DT380.C775
	, DT381.C703
	, DT380.C778
	, DT381.C707
	, DT380.C773
	, DT381.C705
	, DT379.C1078
	, DT381.C708
	, DT380.C766
	, DT379.C1076
	, DT381.C701
	, DT381.C710
	, DT380.C779
LIMIT 507;


SELECT
	DT385.C986
	, DT383.C482
	, DT382.C741
	, DT383.C474
	, DT385.C988
	, DT384.C225
	, DT384.C226
	, DT383.C479
	, DT382.C740
	, DT384.C224
	, DT383.C484
	, DT385.C989
	, DT383.C473
	, DT385.C987
	, DT383.C483
	, DT383.C486
	, DT384.C223
	, DT384.C227
	, DT383.C475
	, DT383.C478
	, DT383.C481
	, DT384.C221
	, DT384.C219
	, DT383.C485
	, DT382.C742
FROM
	(
		(
			(
				T18 DT384
			RIGHT OUTER JOIN
				T62 DT382
			ON
				DT384.C225 = DT382.C742
			)
		INNER JOIN
			T80 DT385
		ON
			DT384.C219 <> DT385.C986
		)
	INNER JOIN
		T42 DT383
	ON
		DT384.C222 = DT383.C482
	)
WHERE
	(
		(
			DT383.C479 = DT384.C227
		)
		OR
		(
			DT382.C740 < DT383.C481
		)
	)
	OR
	(
		(
			DT384.C220 <> DT384.C219
		)
		OR
		(
			DT385.C989 = DT383.C479
		)
	)
ORDER BY
	DT385.C986
	, DT383.C482
	, DT382.C741
	, DT383.C474
	, DT385.C988
	, DT384.C225
	, DT384.C226
	, DT383.C479
	, DT382.C740
	, DT384.C224
	, DT383.C484
	, DT385.C989
	, DT383.C473
	, DT385.C987
	, DT383.C483
	, DT383.C486
	, DT384.C223
	, DT384.C227
	, DT383.C475
	, DT383.C478
	, DT383.C481
	, DT384.C221
	, DT384.C219
	, DT383.C485
	, DT382.C742
LIMIT 141;


SELECT
	DT388.C131
	, DT388.C133
	, DT386.C963
	, DT388.C128
	, DT389.C1186
	, DT389.C1182
	, DT388.C130
	, DT387.C507
	, DT388.C132
	, DT388.C137
	, DT386.C961
	, DT386.C955
	, DT387.C502
	, DT386.C951
	, DT386.C954
	, DT386.C949
	, DT386.C958
	, DT389.C1183
	, DT388.C136
	, DT389.C1184
	, DT386.C948
	, DT386.C956
	, DT386.C952
	, DT389.C1185
	, DT386.C964
FROM
	(
		(
			T96 DT389
		INNER JOIN
			T9 DT388
		ON
			DT389.C1181 = DT388.C129
		)
	LEFT OUTER JOIN
		(
			T44 DT387
		LEFT OUTER JOIN
			T77 DT386
		ON
			DT387.C505 < DT386.C956
		)
	ON
		DT388.C135 <> DT386.C964
	)
WHERE
	(
		(
			DT386.C959 = DT387.C503
		)
		AND
		(
			DT389.C1178 > DT387.C508
		)
	)
	AND
	(
		DT386.C951 > DT386.C950
	)
ORDER BY
	DT388.C131
	, DT388.C133
	, DT386.C963
	, DT388.C128
	, DT389.C1186
	, DT389.C1182
	, DT388.C130
	, DT387.C507
	, DT388.C132
	, DT388.C137
	, DT386.C961
	, DT386.C955
	, DT387.C502
	, DT386.C951
	, DT386.C954
	, DT386.C949
	, DT386.C958
	, DT389.C1183
	, DT388.C136
	, DT389.C1184
	, DT386.C948
	, DT386.C956
	, DT386.C952
	, DT389.C1185
	, DT386.C964
LIMIT 463;


SELECT
	DT390.C100
	, DT390.C109
	, DT390.C96
	, DT390.C99
	, DT390.C92
	, DT391.C408
	, DT391.C407
	, DT390.C107
	, DT390.C95
FROM
	(
		T34 DT391
	LEFT OUTER JOIN
		T7 DT390
	ON
		DT391.C408 = DT390.C108
	)
WHERE
	(
		(
			DT391.C408 = DT390.C104
		)
		OR
		(
			DT391.C408 > DT391.C409
		)
	)
	AND
	(
		DT391.C405 < DT390.C100
	)
ORDER BY
	DT390.C100
	, DT390.C109
	, DT390.C96
	, DT390.C99
	, DT390.C92
	, DT391.C408
	, DT391.C407
	, DT390.C107
	, DT390.C95
LIMIT 755;


SELECT
	DT393.C1160
	, DT393.C1154
	, DT393.C1157
	, DT393.C1148
	, DT393.C1165
	, DT393.C1151
	, DT393.C1145
	, DT392.C227
	, DT393.C1149
	, DT392.C229
	, DT393.C1162
	, DT393.C1152
	, DT392.C221
	, DT393.C1164
	, DT392.C228
	, DT393.C1146
	, DT393.C1147
	, DT392.C222
	, DT392.C223
	, DT393.C1153
	, DT392.C226
	, DT393.C1161
	, DT393.C1155
	, DT393.C1150
	, DT393.C1158
	, DT392.C225
	, DT392.C224
	, DT393.C1166
	, DT392.C219
	, DT392.C220
FROM
	(
		T18 DT392
	INNER JOIN
		T94 DT393
	ON
		DT392.C221 = DT393.C1146
	)
WHERE
	(
		DT392.C222 = DT392.C227
	)
	AND
	(
		DT393.C1164 < DT392.C228
	)
ORDER BY
	DT393.C1160
	, DT393.C1154
	, DT393.C1157
	, DT393.C1148
	, DT393.C1165
	, DT393.C1151
	, DT393.C1145
	, DT392.C227
	, DT393.C1149
	, DT392.C229
	, DT393.C1162
	, DT393.C1152
	, DT392.C221
	, DT393.C1164
	, DT392.C228
	, DT393.C1146
	, DT393.C1147
	, DT392.C222
	, DT392.C223
	, DT393.C1153
	, DT392.C226
	, DT393.C1161
	, DT393.C1155
	, DT393.C1150
	, DT393.C1158
	, DT392.C225
	, DT392.C224
	, DT393.C1166
	, DT392.C219
	, DT392.C220
LIMIT 961;


SELECT
	DT398.C130
	, DT397.C1082
	, DT398.C136
	, DT396.C832
	, DT396.C838
	, DT394.C1193
	, DT396.C828
	, DT396.C835
	, DT397.C1079
	, DT395.C73
	, DT395.C74
	, DT397.C1089
	, DT397.C1088
	, DT394.C1192
	, DT394.C1197
	, DT396.C831
	, DT398.C128
	, DT394.C1199
	, DT396.C829
	, DT398.C137
	, DT396.C827
	, DT397.C1086
	, DT397.C1090
	, DT396.C837
	, DT394.C1198
	, DT397.C1084
	, DT395.C72
	, DT397.C1081
	, DT395.C69
	, DT398.C131
	, DT397.C1080
	, DT394.C1194
	, DT394.C1190
	, DT396.C836
	, DT397.C1083
	, DT398.C135
	, DT396.C834
	, DT397.C1085
	, DT395.C70
	, DT395.C67
	, DT395.C66
FROM
	(
		T69 DT396
	RIGHT OUTER JOIN
		(
			T9 DT398
		INNER JOIN
			(
				(
					T97 DT394
				INNER JOIN
					T90 DT397
				ON
					DT394.C1191 <> DT397.C1083
				)
			INNER JOIN
				T5 DT395
			ON
				DT394.C1194 < DT395.C69
			)
		ON
			DT398.C128 = DT394.C1197
		)
	ON
		DT396.C827 = DT398.C130
	)
WHERE
	(
		(
			DT396.C830 < DT396.C834
		)
		AND
		(
			(
				DT396.C830 <> DT397.C1090
			)
			OR
			(
				DT398.C131 = DT397.C1084
			)
		)
	)
	AND
	(
		DT397.C1084 = DT396.C824
	)
ORDER BY
	DT398.C130
	, DT397.C1082
	, DT398.C136
	, DT396.C832
	, DT396.C838
	, DT394.C1193
	, DT396.C828
	, DT396.C835
	, DT397.C1079
	, DT395.C73
	, DT395.C74
	, DT397.C1089
	, DT397.C1088
	, DT394.C1192
	, DT394.C1197
	, DT396.C831
	, DT398.C128
	, DT394.C1199
	, DT396.C829
	, DT398.C137
	, DT396.C827
	, DT397.C1086
	, DT397.C1090
	, DT396.C837
	, DT394.C1198
	, DT397.C1084
	, DT395.C72
	, DT397.C1081
	, DT395.C69
	, DT398.C131
	, DT397.C1080
	, DT394.C1194
	, DT394.C1190
	, DT396.C836
	, DT397.C1083
	, DT398.C135
	, DT396.C834
	, DT397.C1085
	, DT395.C70
	, DT395.C67
	, DT395.C66
LIMIT 356;


SELECT
	DT400.C622
	, DT400.C611
	, DT399.C269
	, DT399.C259
	, DT399.C261
	, DT399.C260
	, DT400.C617
	, DT400.C610
	, DT400.C614
	, DT400.C623
	, DT400.C624
	, DT400.C608
	, DT399.C263
	, DT400.C615
	, DT400.C609
	, DT399.C264
	, DT400.C621
	, DT400.C616
	, DT399.C267
	, DT399.C266
	, DT400.C619
	, DT400.C613
	, DT400.C612
	, DT399.C262
	, DT400.C620
	, DT399.C265
	, DT399.C268
FROM
	(
		T22 DT399
	LEFT OUTER JOIN
		T51 DT400
	ON
		DT399.C268 = DT400.C622
	)
WHERE
	(
		(
			DT400.C612 = DT400.C620
		)
		AND
		(
			DT399.C261 = DT400.C610
		)
	)
	AND
	(
		DT400.C618 < DT399.C268
	)
ORDER BY
	DT400.C622
	, DT400.C611
	, DT399.C269
	, DT399.C259
	, DT399.C261
	, DT399.C260
	, DT400.C617
	, DT400.C610
	, DT400.C614
	, DT400.C623
	, DT400.C624
	, DT400.C608
	, DT399.C263
	, DT400.C615
	, DT400.C609
	, DT399.C264
	, DT400.C621
	, DT400.C616
	, DT399.C267
	, DT399.C266
	, DT400.C619
	, DT400.C613
	, DT400.C612
	, DT399.C262
	, DT400.C620
	, DT399.C265
	, DT399.C268
LIMIT 694;


SELECT
	DT402.C964
	, DT401.C977
	, DT402.C955
	, DT402.C957
	, DT402.C951
	, DT403.C866
	, DT403.C861
	, DT401.C971
	, DT403.C864
	, DT404.C12
	, DT402.C958
	, DT402.C960
	, DT401.C969
	, DT401.C976
	, DT403.C863
	, DT404.C14
	, DT401.C974
	, DT401.C973
	, DT402.C953
	, DT402.C947
	, DT401.C970
	, DT404.C6
	, DT401.C972
	, DT402.C952
	, DT402.C948
	, DT401.C968
	, DT402.C963
	, DT401.C965
	, DT402.C959
	, DT402.C954
	, DT404.C13
	, DT403.C862
	, DT404.C10
	, DT403.C865
	, DT404.C4
	, DT403.C860
	, DT402.C949
	, DT401.C975
	, DT404.C8
	, DT401.C967
	, DT402.C950
	, DT401.C978
FROM
	(
		(
			T77 DT402
		INNER JOIN
			T1 DT404
		ON
			DT402.C950 = DT404.C5
		)
	RIGHT OUTER JOIN
		(
			T71 DT403
		INNER JOIN
			T78 DT401
		ON
			DT403.C866 > DT401.C978
		)
	ON
		DT404.C13 = DT401.C971
	)
WHERE
	(
		(
			DT402.C957 = DT401.C977
		)
		OR
		(
			DT403.C864 = DT402.C961
		)
	)
	AND
	(
		(
			DT401.C974 = DT404.C10
		)
		OR
		(
			DT404.C13 = DT401.C972
		)
	)
ORDER BY
	DT402.C964
	, DT401.C977
	, DT402.C955
	, DT402.C957
	, DT402.C951
	, DT403.C866
	, DT403.C861
	, DT401.C971
	, DT403.C864
	, DT404.C12
	, DT402.C958
	, DT402.C960
	, DT401.C969
	, DT401.C976
	, DT403.C863
	, DT404.C14
	, DT401.C974
	, DT401.C973
	, DT402.C953
	, DT402.C947
	, DT401.C970
	, DT404.C6
	, DT401.C972
	, DT402.C952
	, DT402.C948
	, DT401.C968
	, DT402.C963
	, DT401.C965
	, DT402.C959
	, DT402.C954
	, DT404.C13
	, DT403.C862
	, DT404.C10
	, DT403.C865
	, DT404.C4
	, DT403.C860
	, DT402.C949
	, DT401.C975
	, DT404.C8
	, DT401.C967
	, DT402.C950
	, DT401.C978
LIMIT 713;


SELECT
	DT405.C123
	, DT405.C121
	, DT405.C110
	, DT405.C114
	, DT405.C117
	, DT406.C66
	, DT407.C1138
FROM
	(
		(
			T5 DT406
		INNER JOIN
			T8 DT405
		ON
			DT406.C68 = DT405.C119
		)
	INNER JOIN
		T93 DT407
	ON
		DT406.C67 > DT407.C1141
	)
WHERE
	(
		DT405.C124 <> DT406.C74
	)
	OR
	(
		(
			DT407.C1138 < DT407.C1141
		)
		AND
		(
			(
				DT407.C1139 > DT407.C1136
			)
			OR
			(
				DT405.C121 <> DT405.C110
			)
		)
	)
ORDER BY
	DT405.C123
	, DT405.C121
	, DT405.C110
	, DT405.C114
	, DT405.C117
	, DT406.C66
	, DT407.C1138
LIMIT 676;


SELECT
	DT408.C683
	, DT408.C697
	, DT408.C695
	, DT408.C682
FROM
	(
		(
			T57 DT408
		INNER JOIN
			T5 DT409
		ON
			DT408.C693 = DT409.C70
		)
	INNER JOIN
		T11 DT410
	ON
		DT408.C695 = DT410.C154
	)
WHERE
	(
		(
			DT410.C153 > DT409.C71
		)
		OR
		(
			DT408.C685 = DT408.C692
		)
	)
	OR
	(
		DT408.C690 = DT409.C69
	)
ORDER BY
	DT408.C683
	, DT408.C697
	, DT408.C695
	, DT408.C682
LIMIT 248;


SELECT
	DT415.C416
	, DT411.C970
	, DT412.C77
	, DT415.C413
	, DT412.C79
	, DT414.C221
	, DT412.C87
	, DT412.C78
	, DT411.C978
	, DT413.C1144
	, DT412.C86
	, DT411.C969
	, DT414.C227
	, DT415.C414
	, DT411.C966
	, DT413.C1136
	, DT414.C228
	, DT411.C971
	, DT411.C972
	, DT415.C411
	, DT413.C1139
	, DT411.C973
	, DT415.C415
	, DT412.C88
	, DT414.C223
	, DT412.C80
	, DT411.C968
	, DT413.C1142
	, DT414.C219
FROM
	(
		(
			T93 DT413
		INNER JOIN
			T35 DT415
		ON
			DT413.C1141 > DT415.C413
		)
	LEFT OUTER JOIN
		(
			(
				T18 DT414
			RIGHT OUTER JOIN
				T6 DT412
			ON
				DT414.C225 = DT412.C87
			)
		INNER JOIN
			T78 DT411
		ON
			DT412.C80 < DT411.C972
		)
	ON
		DT413.C1138 = DT412.C75
	)
WHERE
	(
		DT412.C87 <> DT412.C78
	)
	OR
	(
		(
			DT414.C219 = DT414.C226
		)
		AND
		(
			DT411.C978 < DT411.C973
		)
	)
ORDER BY
	DT415.C416
	, DT411.C970
	, DT412.C77
	, DT415.C413
	, DT412.C79
	, DT414.C221
	, DT412.C87
	, DT412.C78
	, DT411.C978
	, DT413.C1144
	, DT412.C86
	, DT411.C969
	, DT414.C227
	, DT415.C414
	, DT411.C966
	, DT413.C1136
	, DT414.C228
	, DT411.C971
	, DT411.C972
	, DT415.C411
	, DT413.C1139
	, DT411.C973
	, DT415.C415
	, DT412.C88
	, DT414.C223
	, DT412.C80
	, DT411.C968
	, DT413.C1142
	, DT414.C219
LIMIT 222;


SELECT
	DT417.C643
	, DT417.C638
	, DT417.C636
	, DT416.C281
	, DT417.C651
	, DT417.C648
	, DT417.C640
	, DT417.C653
	, DT416.C279
	, DT417.C650
	, DT416.C282
	, DT417.C644
	, DT417.C647
FROM
	(
		T24 DT416
	INNER JOIN
		T53 DT417
	ON
		DT416.C279 = DT417.C651
	)
WHERE
	(
		DT416.C281 = DT417.C650
	)
	OR
	(
		DT417.C643 = DT417.C643
	)
ORDER BY
	DT417.C643
	, DT417.C638
	, DT417.C636
	, DT416.C281
	, DT417.C651
	, DT417.C648
	, DT417.C640
	, DT417.C653
	, DT416.C279
	, DT417.C650
	, DT416.C282
	, DT417.C644
	, DT417.C647
LIMIT 595;


SELECT
	DT420.C700
	, DT420.C699
	, DT422.C979
	, DT418.C730
	, DT420.C704
	, DT420.C711
	, DT418.C734
	, DT418.C739
	, DT418.C737
	, DT419.C675
	, DT420.C707
	, DT419.C670
	, DT419.C679
	, DT420.C703
	, DT422.C983
	, DT421.C1078
	, DT419.C676
	, DT419.C674
	, DT420.C708
	, DT418.C729
	, DT422.C981
	, DT421.C1076
	, DT419.C681
	, DT418.C738
	, DT419.C680
	, DT418.C736
	, DT418.C726
	, DT419.C672
	, DT418.C732
	, DT419.C671
	, DT420.C701
	, DT420.C710
	, DT420.C702
	, DT418.C728
	, DT420.C698
	, DT422.C984
	, DT419.C677
FROM
	(
		(
			(
				T56 DT419
			INNER JOIN
				T89 DT421
			ON
				DT419.C680 > DT421.C1078
			)
		LEFT OUTER JOIN
			T61 DT418
		ON
			DT419.C669 <> DT418.C731
		)
	INNER JOIN
		(
			T58 DT420
		LEFT OUTER JOIN
			T79 DT422
		ON
			DT420.C703 = DT422.C979
		)
	ON
		DT418.C728 = DT420.C698
	)
WHERE
	(
		(
			DT420.C698 = DT421.C1076
		)
		OR
		(
			DT418.C737 <> DT418.C738
		)
	)
	AND
	(
		DT422.C981 > DT418.C729
	)
ORDER BY
	DT420.C700
	, DT420.C699
	, DT422.C979
	, DT418.C730
	, DT420.C704
	, DT420.C711
	, DT418.C734
	, DT418.C739
	, DT418.C737
	, DT419.C675
	, DT420.C707
	, DT419.C670
	, DT419.C679
	, DT420.C703
	, DT422.C983
	, DT421.C1078
	, DT419.C676
	, DT419.C674
	, DT420.C708
	, DT418.C729
	, DT422.C981
	, DT421.C1076
	, DT419.C681
	, DT418.C738
	, DT419.C680
	, DT418.C736
	, DT418.C726
	, DT419.C672
	, DT418.C732
	, DT419.C671
	, DT420.C701
	, DT420.C710
	, DT420.C702
	, DT418.C728
	, DT420.C698
	, DT422.C984
	, DT419.C677
LIMIT 119;


SELECT
	DT423.C913
	, DT426.C586
	, DT423.C919
	, DT427.C1199
	, DT423.C910
	, DT426.C592
	, DT426.C590
	, DT423.C914
	, DT425.C1053
	, DT425.C1055
	, DT427.C1193
	, DT423.C920
	, DT425.C1051
	, DT426.C588
	, DT425.C1047
	, DT426.C596
	, DT425.C1050
	, DT425.C1048
	, DT427.C1192
	, DT427.C1190
	, DT423.C929
	, DT423.C911
	, DT423.C926
	, DT423.C918
	, DT424.C0
	, DT423.C928
	, DT423.C916
	, DT424.C1
	, DT423.C927
	, DT425.C1054
	, DT427.C1194
	, DT423.C924
FROM
	(
		T86 DT425
	RIGHT OUTER JOIN
		(
			T0 DT424
		CROSS JOIN
			(
				T74 DT423
			INNER JOIN
				(
					T97 DT427
				RIGHT OUTER JOIN
					T49 DT426
				ON
					DT427.C1194 > DT426.C589
				)
			ON
				DT423.C920 = DT426.C598
			)
		)
	ON
		DT425.C1052 > DT427.C1198
	)
WHERE
	(
		(
			DT427.C1192 < DT427.C1196
		)
		OR
		(
			DT427.C1199 > DT426.C596
		)
	)
	OR
	(
		DT423.C924 > DT424.C1
	)
ORDER BY
	DT423.C913
	, DT426.C586
	, DT423.C919
	, DT427.C1199
	, DT423.C910
	, DT426.C592
	, DT426.C590
	, DT423.C914
	, DT425.C1053
	, DT425.C1055
	, DT427.C1193
	, DT423.C920
	, DT425.C1051
	, DT426.C588
	, DT425.C1047
	, DT426.C596
	, DT425.C1050
	, DT425.C1048
	, DT427.C1192
	, DT427.C1190
	, DT423.C929
	, DT423.C911
	, DT423.C926
	, DT423.C918
	, DT424.C0
	, DT423.C928
	, DT423.C916
	, DT424.C1
	, DT423.C927
	, DT425.C1054
	, DT427.C1194
	, DT423.C924
LIMIT 580;


SELECT
	DT429.C979
	, DT428.C80
	, DT428.C77
	, DT430.C367
	, DT429.C980
	, DT428.C86
	, DT430.C380
	, DT430.C373
	, DT428.C82
	, DT430.C366
FROM
	(
		(
			T79 DT429
		RIGHT OUTER JOIN
			T6 DT428
		ON
			DT429.C980 > DT428.C75
		)
	LEFT OUTER JOIN
		T32 DT430
	ON
		DT428.C80 <> DT430.C372
	)
WHERE
	(
		DT430.C375 = DT430.C369
	)
	OR
	(
		DT430.C366 = DT429.C981
	)
ORDER BY
	DT429.C979
	, DT428.C80
	, DT428.C77
	, DT430.C367
	, DT429.C980
	, DT428.C86
	, DT430.C380
	, DT430.C373
	, DT428.C82
	, DT430.C366
LIMIT 191;


SELECT
	DT431.C387
	, DT432.C265
	, DT431.C385
	, DT431.C392
	, DT431.C400
	, DT433.C747
	, DT433.C758
	, DT433.C744
	, DT431.C389
	, DT432.C262
	, DT432.C259
	, DT431.C398
	, DT432.C267
	, DT432.C266
	, DT433.C752
	, DT431.C388
	, DT433.C760
	, DT432.C260
	, DT433.C750
	, DT432.C264
	, DT431.C397
	, DT433.C748
	, DT433.C745
	, DT433.C754
	, DT432.C261
	, DT433.C756
	, DT432.C269
	, DT431.C386
	, DT432.C268
	, DT431.C396
	, DT431.C384
	, DT433.C757
	, DT431.C399
	, DT433.C762
	, DT431.C401
	, DT433.C761
	, DT433.C746
	, DT431.C394
	, DT431.C393
	, DT433.C751
	, DT433.C743
FROM
	(
		T33 DT431
	INNER JOIN
		(
			T22 DT432
		LEFT OUTER JOIN
			T63 DT433
		ON
			DT432.C262 = DT433.C762
		)
	ON
		DT431.C383 = DT433.C761
	)
WHERE
	(
		DT433.C746 < DT433.C751
	)
	AND
	(
		DT433.C759 < DT431.C387
	)
ORDER BY
	DT431.C387
	, DT432.C265
	, DT431.C385
	, DT431.C392
	, DT431.C400
	, DT433.C747
	, DT433.C758
	, DT433.C744
	, DT431.C389
	, DT432.C262
	, DT432.C259
	, DT431.C398
	, DT432.C267
	, DT432.C266
	, DT433.C752
	, DT431.C388
	, DT433.C760
	, DT432.C260
	, DT433.C750
	, DT432.C264
	, DT431.C397
	, DT433.C748
	, DT433.C745
	, DT433.C754
	, DT432.C261
	, DT433.C756
	, DT432.C269
	, DT431.C386
	, DT432.C268
	, DT431.C396
	, DT431.C384
	, DT433.C757
	, DT431.C399
	, DT433.C762
	, DT431.C401
	, DT433.C761
	, DT433.C746
	, DT431.C394
	, DT431.C393
	, DT433.C751
	, DT433.C743
LIMIT 574;


SELECT
	DT434.C1
	, DT436.C998
	, DT435.C170
	, DT434.C2
	, DT438.C412
	, DT438.C413
	, DT435.C174
	, DT438.C415
	, DT436.C996
	, DT435.C175
	, DT435.C173
	, DT438.C416
	, DT436.C997
	, DT435.C164
	, DT435.C166
	, DT438.C418
FROM
	(
		(
			(
				(
					T0 DT434
				LEFT OUTER JOIN
					T82 DT436
				ON
					DT434.C1 = DT436.C998
				)
			INNER JOIN
				T24 DT437
			ON
				DT434.C2 = DT437.C281
			)
		RIGHT OUTER JOIN
			T35 DT438
		ON
			DT436.C999 = DT438.C417
		)
	INNER JOIN
		T13 DT435
	ON
		DT437.C282 < DT435.C178
	)
WHERE
	(
		(
			DT435.C165 < DT438.C414
		)
		AND
		(
			DT435.C166 < DT438.C416
		)
	)
	OR
	(
		DT435.C165 <> DT436.C996
	)
ORDER BY
	DT434.C1
	, DT436.C998
	, DT435.C170
	, DT434.C2
	, DT438.C412
	, DT438.C413
	, DT435.C174
	, DT438.C415
	, DT436.C996
	, DT435.C175
	, DT435.C173
	, DT438.C416
	, DT436.C997
	, DT435.C164
	, DT435.C166
	, DT438.C418
LIMIT 145;


SELECT
	DT443.C1188
	, DT441.C13
	, DT442.C1077
	, DT443.C1184
	, DT441.C11
	, DT439.C684
	, DT442.C1078
	, DT443.C1189
	, DT439.C682
FROM
	(
		(
			T1 DT441
		RIGHT OUTER JOIN
			T89 DT442
		ON
			DT441.C10 > DT442.C1077
		)
	RIGHT OUTER JOIN
		(
			T57 DT439
		LEFT OUTER JOIN
			(
				T96 DT443
			CROSS JOIN
				T39 DT440
			)
		ON
			DT439.C697 <> DT443.C1180
		)
	ON
		DT442.C1076 > DT443.C1183
	)
WHERE
	(
		(
			DT443.C1178 > DT439.C691
		)
		OR
		(
			DT443.C1186 > DT443.C1177
		)
	)
	AND
	(
		DT443.C1177 = DT439.C689
	)
ORDER BY
	DT443.C1188
	, DT441.C13
	, DT442.C1077
	, DT443.C1184
	, DT441.C11
	, DT439.C684
	, DT442.C1078
	, DT443.C1189
	, DT439.C682
LIMIT 790;


SELECT
	DT447.C42
	, DT446.C508
	, DT445.C153
	, DT446.C507
	, DT445.C155
	, DT447.C33
	, DT444.C446
	, DT447.C34
	, DT447.C39
	, DT446.C504
	, DT445.C156
	, DT447.C47
	, DT446.C510
	, DT447.C40
	, DT446.C505
	, DT446.C502
	, DT446.C511
	, DT447.C36
	, DT447.C50
	, DT447.C37
	, DT446.C509
	, DT447.C45
	, DT446.C503
	, DT447.C44
	, DT447.C48
	, DT444.C445
	, DT445.C152
FROM
	(
		T39 DT444
	LEFT OUTER JOIN
		(
			(
				T44 DT446
			CROSS JOIN
				T11 DT445
			)
		LEFT OUTER JOIN
			T3 DT447
		ON
			DT446.C509 < DT447.C35
		)
	ON
		DT444.C445 < DT447.C47
	)
WHERE
	(
		(
			DT444.C446 = DT447.C52
		)
		AND
		(
			DT444.C444 = DT447.C40
		)
	)
	OR
	(
		DT447.C49 < DT445.C154
	)
ORDER BY
	DT447.C42
	, DT446.C508
	, DT445.C153
	, DT446.C507
	, DT445.C155
	, DT447.C33
	, DT444.C446
	, DT447.C34
	, DT447.C39
	, DT446.C504
	, DT445.C156
	, DT447.C47
	, DT446.C510
	, DT447.C40
	, DT446.C505
	, DT446.C502
	, DT446.C511
	, DT447.C36
	, DT447.C50
	, DT447.C37
	, DT446.C509
	, DT447.C45
	, DT446.C503
	, DT447.C44
	, DT447.C48
	, DT444.C445
	, DT445.C152
LIMIT 636;


SELECT
	DT448.C779
	, DT449.C448
	, DT448.C771
	, DT449.C449
	, DT451.C737
	, DT448.C769
	, DT450.C1051
	, DT448.C768
	, DT448.C782
	, DT451.C725
	, DT451.C736
	, DT451.C730
	, DT451.C739
	, DT450.C1049
	, DT448.C778
	, DT448.C777
	, DT448.C776
	, DT451.C731
	, DT450.C1048
	, DT450.C1047
	, DT451.C727
	, DT448.C772
	, DT448.C770
	, DT448.C765
	, DT450.C1055
	, DT450.C1054
	, DT449.C450
	, DT451.C735
	, DT450.C1053
	, DT448.C774
FROM
	(
		T61 DT451
	INNER JOIN
		(
			(
				T40 DT449
			INNER JOIN
				T64 DT448
			ON
				DT449.C449 <> DT448.C768
			)
		INNER JOIN
			T86 DT450
		ON
			DT449.C450 = DT450.C1050
		)
	ON
		DT451.C730 = DT450.C1050
	)
WHERE
	(
		DT451.C736 > DT451.C737
	)
	AND
	(
		DT449.C450 > DT449.C447
	)
ORDER BY
	DT448.C779
	, DT449.C448
	, DT448.C771
	, DT449.C449
	, DT451.C737
	, DT448.C769
	, DT450.C1051
	, DT448.C768
	, DT448.C782
	, DT451.C725
	, DT451.C736
	, DT451.C730
	, DT451.C739
	, DT450.C1049
	, DT448.C778
	, DT448.C777
	, DT448.C776
	, DT451.C731
	, DT450.C1048
	, DT450.C1047
	, DT451.C727
	, DT448.C772
	, DT448.C770
	, DT448.C765
	, DT450.C1055
	, DT450.C1054
	, DT449.C450
	, DT451.C735
	, DT450.C1053
	, DT448.C774
LIMIT 381;


SELECT
	DT454.C32
	, DT454.C34
	, DT454.C48
	, DT455.C155
	, DT454.C42
	, DT452.C803
	, DT454.C46
	, DT452.C800
	, DT454.C44
	, DT454.C47
	, DT453.C210
	, DT452.C798
FROM
	(
		T17 DT453
	INNER JOIN
		(
			(
				T3 DT454
			RIGHT OUTER JOIN
				T11 DT455
			ON
				DT454.C44 = DT455.C155
			)
		RIGHT OUTER JOIN
			(
				T80 DT456
			LEFT OUTER JOIN
				T66 DT452
			ON
				DT456.C988 <> DT452.C804
			)
		ON
			DT455.C154 > DT452.C801
		)
	ON
		DT453.C211 = DT452.C807
	)
WHERE
	(
		DT452.C807 = DT453.C213
	)
	OR
	(
		(
			DT452.C802 = DT454.C44
		)
		OR
		(
			(
				DT454.C46 = DT452.C808
			)
			AND
			(
				DT452.C798 = DT452.C802
			)
		)
	)
ORDER BY
	DT454.C32
	, DT454.C34
	, DT454.C48
	, DT455.C155
	, DT454.C42
	, DT452.C803
	, DT454.C46
	, DT452.C800
	, DT454.C44
	, DT454.C47
	, DT453.C210
	, DT452.C798
LIMIT 790;


SELECT
	DT457.C496
	, DT458.C98
	, DT458.C108
	, DT457.C500
	, DT457.C488
	, DT458.C107
	, DT457.C487
	, DT458.C97
	, DT457.C497
	, DT458.C94
	, DT457.C501
	, DT458.C105
	, DT457.C489
	, DT457.C490
	, DT458.C91
	, DT457.C499
	, DT458.C93
	, DT457.C493
	, DT458.C109
	, DT457.C492
	, DT458.C95
	, DT458.C89
	, DT458.C103
	, DT458.C90
	, DT457.C494
	, DT458.C101
	, DT458.C96
	, DT457.C498
	, DT458.C92
	, DT458.C99
	, DT458.C100
	, DT457.C495
	, DT458.C102
	, DT457.C491
	, DT458.C106
	, DT458.C104
FROM
	(
		T43 DT457
	RIGHT OUTER JOIN
		T7 DT458
	ON
		DT457.C499 <> DT458.C105
	)
WHERE
	(
		DT458.C105 = DT457.C488
	)
	OR
	(
		DT457.C490 <> DT457.C490
	)
ORDER BY
	DT457.C496
	, DT458.C98
	, DT458.C108
	, DT457.C500
	, DT457.C488
	, DT458.C107
	, DT457.C487
	, DT458.C97
	, DT457.C497
	, DT458.C94
	, DT457.C501
	, DT458.C105
	, DT457.C489
	, DT457.C490
	, DT458.C91
	, DT457.C499
	, DT458.C93
	, DT457.C493
	, DT458.C109
	, DT457.C492
	, DT458.C95
	, DT458.C89
	, DT458.C103
	, DT458.C90
	, DT457.C494
	, DT458.C101
	, DT458.C96
	, DT457.C498
	, DT458.C92
	, DT458.C99
	, DT458.C100
	, DT457.C495
	, DT458.C102
	, DT457.C491
	, DT458.C106
	, DT458.C104
LIMIT 173;


SELECT
	DT461.C777
	, DT460.C915
	, DT459.C845
	, DT459.C853
	, DT460.C918
	, DT461.C778
	, DT459.C849
	, DT461.C765
	, DT459.C856
	, DT460.C929
	, DT461.C764
	, DT459.C855
	, DT460.C924
	, DT461.C767
	, DT459.C841
	, DT461.C782
	, DT460.C920
	, DT459.C842
	, DT461.C779
	, DT462.C193
	, DT461.C771
	, DT460.C927
	, DT462.C191
	, DT461.C766
	, DT460.C911
	, DT460.C912
	, DT460.C917
	, DT459.C850
	, DT460.C910
	, DT461.C770
	, DT461.C776
	, DT462.C195
	, DT462.C188
	, DT462.C192
	, DT459.C848
	, DT460.C926
	, DT459.C854
	, DT459.C846
	, DT459.C851
	, DT462.C186
	, DT461.C772
	, DT460.C913
	, DT460.C925
	, DT462.C187
	, DT459.C852
	, DT461.C775
	, DT460.C919
	, DT461.C780
	, DT461.C768
	, DT461.C773
	, DT459.C859
	, DT459.C839
	, DT459.C843
	, DT462.C197
	, DT462.C199
	, DT461.C774
	, DT460.C922
	, DT460.C928
	, DT460.C923
	, DT462.C196
	, DT459.C847
	, DT460.C916
	, DT459.C857
	, DT460.C914
	, DT461.C769
	, DT459.C858
	, DT462.C189
	, DT459.C840
	, DT459.C844
FROM
	(
		T70 DT459
	INNER JOIN
		(
			T15 DT462
		RIGHT OUTER JOIN
			(
				T74 DT460
			INNER JOIN
				T64 DT461
			ON
				DT460.C916 < DT461.C780
			)
		ON
			DT462.C192 < DT461.C782
		)
	ON
		DT459.C848 = DT461.C771
	)
WHERE
	(
		DT459.C847 = DT459.C850
	)
	AND
	(
		DT459.C841 = DT462.C186
	)
ORDER BY
	DT461.C777
	, DT460.C915
	, DT459.C845
	, DT459.C853
	, DT460.C918
	, DT461.C778
	, DT459.C849
	, DT461.C765
	, DT459.C856
	, DT460.C929
	, DT461.C764
	, DT459.C855
	, DT460.C924
	, DT461.C767
	, DT459.C841
	, DT461.C782
	, DT460.C920
	, DT459.C842
	, DT461.C779
	, DT462.C193
	, DT461.C771
	, DT460.C927
	, DT462.C191
	, DT461.C766
	, DT460.C911
	, DT460.C912
	, DT460.C917
	, DT459.C850
	, DT460.C910
	, DT461.C770
	, DT461.C776
	, DT462.C195
	, DT462.C188
	, DT462.C192
	, DT459.C848
	, DT460.C926
	, DT459.C854
	, DT459.C846
	, DT459.C851
	, DT462.C186
	, DT461.C772
	, DT460.C913
	, DT460.C925
	, DT462.C187
	, DT459.C852
	, DT461.C775
	, DT460.C919
	, DT461.C780
	, DT461.C768
	, DT461.C773
	, DT459.C859
	, DT459.C839
	, DT459.C843
	, DT462.C197
	, DT462.C199
	, DT461.C774
	, DT460.C922
	, DT460.C928
	, DT460.C923
	, DT462.C196
	, DT459.C847
	, DT460.C916
	, DT459.C857
	, DT460.C914
	, DT461.C769
	, DT459.C858
	, DT462.C189
	, DT459.C840
	, DT459.C844
LIMIT 388;


SELECT
	DT463.C194
	, DT464.C137
	, DT464.C128
	, DT463.C196
	, DT464.C132
	, DT464.C135
	, DT463.C198
	, DT463.C191
	, DT463.C197
	, DT464.C129
	, DT464.C130
	, DT464.C133
	, DT463.C199
	, DT463.C186
	, DT463.C195
	, DT463.C187
	, DT463.C188
	, DT463.C192
	, DT464.C131
	, DT464.C127
	, DT463.C190
	, DT463.C189
	, DT464.C126
	, DT463.C193
FROM
	(
		T9 DT464
	CROSS JOIN
		T15 DT463
	)
WHERE
	(
		DT464.C137 = DT464.C135
	)
	OR
	(
		(
			DT464.C130 = DT464.C137
		)
		AND
		(
			DT464.C130 = DT463.C193
		)
	)
ORDER BY
	DT463.C194
	, DT464.C137
	, DT464.C128
	, DT463.C196
	, DT464.C132
	, DT464.C135
	, DT463.C198
	, DT463.C191
	, DT463.C197
	, DT464.C129
	, DT464.C130
	, DT464.C133
	, DT463.C199
	, DT463.C186
	, DT463.C195
	, DT463.C187
	, DT463.C188
	, DT463.C192
	, DT464.C131
	, DT464.C127
	, DT463.C190
	, DT463.C189
	, DT464.C126
	, DT463.C193
LIMIT 798;


SELECT
	DT465.C597
	, DT465.C591
	, DT465.C596
	, DT466.C154
	, DT466.C156
FROM
	(
		T11 DT466
	RIGHT OUTER JOIN
		(
			T75 DT467
		INNER JOIN
			T49 DT465
		ON
			DT467.C932 = DT465.C587
		)
	ON
		DT466.C156 = DT465.C596
	)
WHERE
	(
		DT466.C155 <> DT465.C588
	)
	AND
	(
		(
			DT467.C931 > DT466.C152
		)
		OR
		(
			DT467.C934 > DT465.C586
		)
	)
ORDER BY
	DT465.C597
	, DT465.C591
	, DT465.C596
	, DT466.C154
	, DT466.C156
LIMIT 774;


SELECT
	DT469.C980
	, DT469.C984
	, DT468.C831
FROM
	(
		T79 DT469
	INNER JOIN
		T69 DT468
	ON
		DT469.C984 = DT468.C831
	)
WHERE
	(
		(
			DT469.C980 <> DT469.C984
		)
		AND
		(
			DT468.C827 <> DT469.C979
		)
	)
	AND
	(
		DT469.C983 = DT468.C824
	)
ORDER BY
	DT469.C980
	, DT469.C984
	, DT468.C831
LIMIT 911;


SELECT
	DT471.C1089
	, DT471.C1084
	, DT471.C1081
	, DT470.C299
	, DT471.C1079
	, DT470.C317
	, DT470.C303
	, DT470.C311
	, DT470.C314
	, DT471.C1085
	, DT471.C1087
	, DT470.C313
	, DT471.C1082
	, DT471.C1080
	, DT470.C318
	, DT470.C297
	, DT470.C312
	, DT470.C300
	, DT470.C307
	, DT470.C316
FROM
	(
		T90 DT471
	INNER JOIN
		T26 DT470
	ON
		DT471.C1092 = DT470.C307
	)
WHERE
	(
		(
			DT470.C314 = DT471.C1085
		)
		AND
		(
			DT471.C1092 <> DT471.C1084
		)
	)
	AND
	(
		(
			DT470.C300 < DT471.C1080
		)
		OR
		(
			DT471.C1089 = DT470.C310
		)
	)
ORDER BY
	DT471.C1089
	, DT471.C1084
	, DT471.C1081
	, DT470.C299
	, DT471.C1079
	, DT470.C317
	, DT470.C303
	, DT470.C311
	, DT470.C314
	, DT471.C1085
	, DT471.C1087
	, DT470.C313
	, DT471.C1082
	, DT471.C1080
	, DT470.C318
	, DT470.C297
	, DT470.C312
	, DT470.C300
	, DT470.C307
	, DT470.C316
LIMIT 984;


SELECT
	DT473.C63
	, DT472.C524
	, DT473.C58
	, DT473.C57
	, DT472.C514
	, DT476.C741
	, DT476.C740
	, DT472.C517
	, DT475.C1171
	, DT474.C286
	, DT475.C1169
	, DT473.C56
	, DT472.C518
	, DT474.C287
	, DT476.C742
	, DT474.C295
	, DT475.C1168
	, DT472.C519
	, DT474.C284
	, DT472.C513
	, DT474.C296
	, DT472.C520
	, DT475.C1172
	, DT473.C53
	, DT473.C62
	, DT473.C55
	, DT475.C1173
	, DT474.C292
	, DT474.C289
	, DT475.C1170
	, DT473.C61
	, DT474.C291
	, DT472.C516
	, DT472.C525
	, DT472.C527
	, DT472.C523
	, DT475.C1167
	, DT472.C522
	, DT473.C65
	, DT474.C294
	, DT472.C521
	, DT473.C64
	, DT474.C290
	, DT473.C60
	, DT472.C512
	, DT474.C283
	, DT474.C293
	, DT473.C59
FROM
	(
		(
			(
				T4 DT473
			INNER JOIN
				T25 DT474
			ON
				DT473.C64 <> DT474.C290
			)
		LEFT OUTER JOIN
			T45 DT472
		ON
			DT473.C64 <> DT472.C515
		)
	RIGHT OUTER JOIN
		(
			T95 DT475
		CROSS JOIN
			T62 DT476
		)
	ON
		DT473.C60 = DT475.C1167
	)
WHERE
	(
		(
			DT474.C291 <> DT474.C284
		)
		OR
		(
			DT474.C283 = DT472.C526
		)
	)
	AND
	(
		(
			DT472.C522 = DT474.C284
		)
		AND
		(
			DT474.C283 = DT472.C526
		)
	)
ORDER BY
	DT473.C63
	, DT472.C524
	, DT473.C58
	, DT473.C57
	, DT472.C514
	, DT476.C741
	, DT476.C740
	, DT472.C517
	, DT475.C1171
	, DT474.C286
	, DT475.C1169
	, DT473.C56
	, DT472.C518
	, DT474.C287
	, DT476.C742
	, DT474.C295
	, DT475.C1168
	, DT472.C519
	, DT474.C284
	, DT472.C513
	, DT474.C296
	, DT472.C520
	, DT475.C1172
	, DT473.C53
	, DT473.C62
	, DT473.C55
	, DT475.C1173
	, DT474.C292
	, DT474.C289
	, DT475.C1170
	, DT473.C61
	, DT474.C291
	, DT472.C516
	, DT472.C525
	, DT472.C527
	, DT472.C523
	, DT475.C1167
	, DT472.C522
	, DT473.C65
	, DT474.C294
	, DT472.C521
	, DT473.C64
	, DT474.C290
	, DT473.C60
	, DT472.C512
	, DT474.C283
	, DT474.C293
	, DT473.C59
LIMIT 857;


SELECT
	DT477.C1185
	, DT477.C1179
	, DT477.C1183
	, DT477.C1189
	, DT480.C802
	, DT477.C1177
	, DT478.C359
	, DT478.C348
	, DT477.C1181
	, DT480.C801
	, DT478.C345
	, DT481.C145
	, DT478.C347
	, DT478.C363
	, DT478.C350
	, DT481.C147
	, DT477.C1178
	, DT477.C1187
	, DT480.C806
	, DT481.C150
	, DT481.C144
	, DT477.C1180
	, DT477.C1188
	, DT481.C149
	, DT478.C354
	, DT477.C1176
	, DT478.C355
	, DT478.C349
	, DT479.C230
	, DT481.C142
	, DT477.C1184
	, DT478.C357
	, DT478.C353
	, DT478.C360
	, DT478.C356
	, DT480.C805
	, DT478.C344
	, DT479.C232
	, DT481.C148
	, DT478.C351
	, DT481.C138
	, DT477.C1182
	, DT480.C800
	, DT480.C799
	, DT478.C346
	, DT478.C358
	, DT479.C231
	, DT480.C808
	, DT481.C146
	, DT481.C141
	, DT481.C139
	, DT480.C803
	, DT481.C140
	, DT480.C798
	, DT477.C1186
	, DT478.C352
	, DT480.C804
FROM
	(
		T31 DT478
	LEFT OUTER JOIN
		(
			T96 DT477
		CROSS JOIN
			(
				(
					T10 DT481
				INNER JOIN
					T66 DT480
				ON
					DT481.C143 > DT480.C807
				)
			INNER JOIN
				T19 DT479
			ON
				DT480.C804 = DT479.C232
			)
		)
	ON
		DT478.C359 = DT477.C1181
	)
WHERE
	(
		DT477.C1176 = DT477.C1189
	)
	OR
	(
		(
			DT480.C801 = DT480.C800
		)
		OR
		(
			(
				DT477.C1188 < DT481.C151
			)
			AND
			(
				DT478.C349 = DT481.C143
			)
		)
	)
ORDER BY
	DT477.C1185
	, DT477.C1179
	, DT477.C1183
	, DT477.C1189
	, DT480.C802
	, DT477.C1177
	, DT478.C359
	, DT478.C348
	, DT477.C1181
	, DT480.C801
	, DT478.C345
	, DT481.C145
	, DT478.C347
	, DT478.C363
	, DT478.C350
	, DT481.C147
	, DT477.C1178
	, DT477.C1187
	, DT480.C806
	, DT481.C150
	, DT481.C144
	, DT477.C1180
	, DT477.C1188
	, DT481.C149
	, DT478.C354
	, DT477.C1176
	, DT478.C355
	, DT478.C349
	, DT479.C230
	, DT481.C142
	, DT477.C1184
	, DT478.C357
	, DT478.C353
	, DT478.C360
	, DT478.C356
	, DT480.C805
	, DT478.C344
	, DT479.C232
	, DT481.C148
	, DT478.C351
	, DT481.C138
	, DT477.C1182
	, DT480.C800
	, DT480.C799
	, DT478.C346
	, DT478.C358
	, DT479.C231
	, DT480.C808
	, DT481.C146
	, DT481.C141
	, DT481.C139
	, DT480.C803
	, DT481.C140
	, DT480.C798
	, DT477.C1186
	, DT478.C352
	, DT480.C804
LIMIT 963;


SELECT
	DT482.C842
	, DT482.C854
	, DT482.C852
	, DT482.C859
	, DT483.C360
	, DT483.C357
	, DT482.C858
	, DT482.C841
	, DT482.C853
	, DT482.C849
	, DT483.C344
	, DT483.C352
	, DT482.C846
FROM
	(
		T70 DT482
	RIGHT OUTER JOIN
		T31 DT483
	ON
		DT482.C847 = DT483.C344
	)
WHERE
	(
		DT482.C859 = DT482.C858
	)
	OR
	(
		(
			DT483.C356 = DT483.C361
		)
		OR
		(
			DT482.C846 <> DT482.C849
		)
	)
ORDER BY
	DT482.C842
	, DT482.C854
	, DT482.C852
	, DT482.C859
	, DT483.C360
	, DT483.C357
	, DT482.C858
	, DT482.C841
	, DT482.C853
	, DT482.C849
	, DT483.C344
	, DT483.C352
	, DT482.C846
LIMIT 992;


SELECT
	DT484.C958
	, DT486.C312
	, DT485.C719
	, DT484.C961
FROM
	(
		(
			T77 DT484
		RIGHT OUTER JOIN
			T26 DT486
		ON
			DT484.C958 = DT486.C318
		)
	LEFT OUTER JOIN
		T60 DT485
	ON
		DT486.C318 = DT485.C724
	)
WHERE
	(
		DT484.C949 = DT484.C957
	)
	AND
	(
		DT485.C724 = DT485.C721
	)
ORDER BY
	DT484.C958
	, DT486.C312
	, DT485.C719
	, DT484.C961
LIMIT 863;


SELECT
	DT488.C949
	, DT487.C895
	, DT490.C158
	, DT487.C902
	, DT489.C127
	, DT489.C128
FROM
	(
		T12 DT490
	INNER JOIN
		(
			(
				(
					T33 DT491
				LEFT OUTER JOIN
					T77 DT488
				ON
					DT491.C396 = DT488.C961
				)
			INNER JOIN
				T73 DT487
			ON
				DT491.C398 <> DT487.C897
			)
		RIGHT OUTER JOIN
			T9 DT489
		ON
			DT487.C902 > DT489.C130
		)
	ON
		DT490.C162 <> DT487.C895
	)
WHERE
	(
		(
			DT490.C160 = DT491.C390
		)
		AND
		(
			DT487.C907 = DT488.C947
		)
	)
	OR
	(
		DT491.C386 < DT488.C957
	)
ORDER BY
	DT488.C949
	, DT487.C895
	, DT490.C158
	, DT487.C902
	, DT489.C127
	, DT489.C128
LIMIT 335;


SELECT
	DT493.C188
	, DT494.C585
	, DT494.C575
	, DT494.C570
	, DT493.C190
	, DT493.C189
	, DT494.C576
	, DT492.C999
	, DT494.C574
	, DT494.C569
	, DT493.C191
	, DT494.C572
	, DT494.C582
	, DT493.C198
	, DT494.C580
	, DT494.C568
	, DT494.C581
	, DT494.C571
	, DT494.C579
	, DT494.C573
	, DT493.C192
	, DT493.C199
	, DT494.C578
	, DT493.C195
FROM
	(
		(
			T48 DT494
		INNER JOIN
			T82 DT492
		ON
			DT494.C584 <> DT492.C996
		)
	CROSS JOIN
		T15 DT493
	)
WHERE
	(
		(
			DT493.C196 = DT494.C577
		)
		AND
		(
			(
				DT494.C569 = DT492.C995
			)
			OR
			(
				DT493.C189 > DT494.C578
			)
		)
	)
	OR
	(
		DT494.C576 > DT494.C572
	)
ORDER BY
	DT493.C188
	, DT494.C585
	, DT494.C575
	, DT494.C570
	, DT493.C190
	, DT493.C189
	, DT494.C576
	, DT492.C999
	, DT494.C574
	, DT494.C569
	, DT493.C191
	, DT494.C572
	, DT494.C582
	, DT493.C198
	, DT494.C580
	, DT494.C568
	, DT494.C581
	, DT494.C571
	, DT494.C579
	, DT494.C573
	, DT493.C192
	, DT493.C199
	, DT494.C578
	, DT493.C195
LIMIT 467;


SELECT
	DT495.C1141
	, DT495.C1142
FROM
	(
		T71 DT497
	CROSS JOIN
		(
			T89 DT496
		INNER JOIN
			T93 DT495
		ON
			DT496.C1076 > DT495.C1136
		)
	)
WHERE
	(
		(
			DT495.C1140 > DT497.C865
		)
		AND
		(
			DT495.C1139 = DT495.C1137
		)
	)
	OR
	(
		DT495.C1140 = DT495.C1136
	)
ORDER BY
	DT495.C1141
	, DT495.C1142
LIMIT 665;


SELECT
	DT498.C143
FROM
	(
		T99 DT499
	INNER JOIN
		T10 DT498
	ON
		DT499.C1204 <> DT498.C148
	)
WHERE
	(
		DT498.C139 > DT499.C1205
	)
	OR
	(
		(
			DT498.C141 = DT498.C148
		)
		OR
		(
			(
				DT498.C148 > DT498.C149
			)
			AND
			(
				DT498.C147 < DT498.C140
			)
		)
	)
ORDER BY
	DT498.C143
LIMIT 553;


SELECT
	DT500.C946
	, DT501.C991
	, DT500.C938
	, DT501.C992
	, DT500.C942
	, DT500.C945
	, DT500.C943
	, DT501.C990
FROM
	(
		(
			T24 DT502
		CROSS JOIN
			T81 DT501
		)
	CROSS JOIN
		T76 DT500
	)
WHERE
	(
		DT502.C282 = DT501.C992
	)
	OR
	(
		DT500.C942 < DT500.C940
	)
ORDER BY
	DT500.C946
	, DT501.C991
	, DT500.C938
	, DT501.C992
	, DT500.C942
	, DT500.C945
	, DT500.C943
	, DT501.C990
LIMIT 109;


SELECT
	DT505.C603
	, DT503.C592
	, DT505.C602
	, DT506.C140
	, DT503.C594
	, DT504.C129
	, DT505.C600
	, DT504.C133
	, DT505.C606
	, DT506.C145
	, DT506.C143
	, DT503.C590
	, DT505.C607
	, DT503.C595
	, DT506.C148
	, DT503.C586
	, DT504.C137
	, DT504.C136
	, DT506.C147
	, DT506.C141
	, DT506.C138
	, DT503.C598
	, DT504.C131
	, DT505.C604
	, DT504.C130
	, DT504.C126
	, DT503.C588
	, DT503.C587
	, DT506.C150
	, DT505.C601
	, DT504.C132
	, DT506.C146
	, DT505.C605
	, DT504.C127
	, DT506.C142
FROM
	(
		T10 DT506
	CROSS JOIN
		(
			(
				T50 DT505
			CROSS JOIN
				T49 DT503
			)
		INNER JOIN
			T9 DT504
		ON
			DT503.C592 < DT504.C126
		)
	)
WHERE
	(
		(
			DT506.C151 = DT505.C602
		)
		OR
		(
			DT506.C148 > DT504.C127
		)
	)
	OR
	(
		DT503.C589 = DT503.C586
	)
ORDER BY
	DT505.C603
	, DT503.C592
	, DT505.C602
	, DT506.C140
	, DT503.C594
	, DT504.C129
	, DT505.C600
	, DT504.C133
	, DT505.C606
	, DT506.C145
	, DT506.C143
	, DT503.C590
	, DT505.C607
	, DT503.C595
	, DT506.C148
	, DT503.C586
	, DT504.C137
	, DT504.C136
	, DT506.C147
	, DT506.C141
	, DT506.C138
	, DT503.C598
	, DT504.C131
	, DT505.C604
	, DT504.C130
	, DT504.C126
	, DT503.C588
	, DT503.C587
	, DT506.C150
	, DT505.C601
	, DT504.C132
	, DT506.C146
	, DT505.C605
	, DT504.C127
	, DT506.C142
LIMIT 641;


SELECT
	DT509.C63
	, DT507.C234
	, DT509.C62
	, DT509.C61
	, DT508.C414
	, DT509.C59
	, DT508.C418
	, DT509.C53
	, DT509.C55
	, DT507.C246
	, DT509.C60
	, DT508.C415
	, DT509.C58
	, DT509.C56
	, DT507.C236
	, DT507.C235
	, DT509.C65
	, DT509.C57
	, DT508.C413
	, DT507.C241
	, DT507.C240
	, DT507.C233
	, DT507.C238
	, DT507.C243
	, DT508.C416
	, DT507.C244
	, DT508.C412
	, DT507.C245
FROM
	(
		T20 DT507
	RIGHT OUTER JOIN
		(
			T4 DT509
		LEFT OUTER JOIN
			T35 DT508
		ON
			DT509.C53 = DT508.C411
		)
	ON
		DT507.C237 = DT509.C57
	)
WHERE
	(
		DT507.C241 > DT507.C241
	)
	AND
	(
		DT507.C242 > DT508.C417
	)
ORDER BY
	DT509.C63
	, DT507.C234
	, DT509.C62
	, DT509.C61
	, DT508.C414
	, DT509.C59
	, DT508.C418
	, DT509.C53
	, DT509.C55
	, DT507.C246
	, DT509.C60
	, DT508.C415
	, DT509.C58
	, DT509.C56
	, DT507.C236
	, DT507.C235
	, DT509.C65
	, DT509.C57
	, DT508.C413
	, DT507.C241
	, DT507.C240
	, DT507.C233
	, DT507.C238
	, DT507.C243
	, DT508.C416
	, DT507.C244
	, DT508.C412
	, DT507.C245
LIMIT 650;


SELECT
	DT511.C368
	, DT512.C754
	, DT512.C763
	, DT511.C371
	, DT512.C762
	, DT511.C370
	, DT511.C376
	, DT512.C758
	, DT512.C759
	, DT512.C753
	, DT511.C382
	, DT512.C755
	, DT511.C377
	, DT512.C756
	, DT510.C10
	, DT512.C747
	, DT511.C372
	, DT510.C9
	, DT512.C752
	, DT511.C374
	, DT511.C378
	, DT512.C751
	, DT512.C749
	, DT510.C13
	, DT512.C746
	, DT512.C757
	, DT512.C760
	, DT510.C14
	, DT512.C743
	, DT510.C8
	, DT510.C7
	, DT512.C744
	, DT511.C365
	, DT512.C761
	, DT510.C4
	, DT512.C745
	, DT511.C375
	, DT510.C12
	, DT510.C6
	, DT511.C367
	, DT511.C381
	, DT511.C379
FROM
	(
		T32 DT511
	RIGHT OUTER JOIN
		(
			T1 DT510
		LEFT OUTER JOIN
			T63 DT512
		ON
			DT510.C5 <> DT512.C757
		)
	ON
		DT511.C367 <> DT512.C756
	)
WHERE
	(
		DT511.C364 <> DT512.C755
	)
	AND
	(
		DT510.C4 <> DT512.C746
	)
ORDER BY
	DT511.C368
	, DT512.C754
	, DT512.C763
	, DT511.C371
	, DT512.C762
	, DT511.C370
	, DT511.C376
	, DT512.C758
	, DT512.C759
	, DT512.C753
	, DT511.C382
	, DT512.C755
	, DT511.C377
	, DT512.C756
	, DT510.C10
	, DT512.C747
	, DT511.C372
	, DT510.C9
	, DT512.C752
	, DT511.C374
	, DT511.C378
	, DT512.C751
	, DT512.C749
	, DT510.C13
	, DT512.C746
	, DT512.C757
	, DT512.C760
	, DT510.C14
	, DT512.C743
	, DT510.C8
	, DT510.C7
	, DT512.C744
	, DT511.C365
	, DT512.C761
	, DT510.C4
	, DT512.C745
	, DT511.C375
	, DT510.C12
	, DT510.C6
	, DT511.C367
	, DT511.C381
	, DT511.C379
LIMIT 491;


SELECT
	DT517.C1086
	, DT513.C800
	, DT516.C247
	, DT515.C976
	, DT516.C256
	, DT514.C1144
	, DT517.C1084
	, DT513.C801
	, DT515.C966
	, DT515.C977
	, DT513.C807
	, DT514.C1138
	, DT514.C1140
	, DT517.C1085
	, DT517.C1088
	, DT516.C255
	, DT515.C971
	, DT513.C798
	, DT516.C257
	, DT516.C250
	, DT515.C972
	, DT517.C1092
	, DT513.C799
	, DT517.C1082
	, DT516.C254
	, DT517.C1083
	, DT513.C808
	, DT515.C967
	, DT516.C258
	, DT515.C975
	, DT515.C973
	, DT517.C1091
	, DT516.C251
	, DT517.C1090
	, DT513.C805
	, DT514.C1136
	, DT515.C970
	, DT517.C1089
	, DT515.C965
	, DT515.C978
	, DT515.C969
	, DT516.C253
	, DT515.C968
	, DT516.C249
	, DT513.C806
	, DT514.C1141
	, DT517.C1081
	, DT516.C252
	, DT514.C1142
	, DT517.C1079
	, DT517.C1080
	, DT514.C1143
FROM
	(
		(
			T93 DT514
		INNER JOIN
			(
				T21 DT516
			LEFT OUTER JOIN
				T78 DT515
			ON
				DT516.C257 < DT515.C976
			)
		ON
			DT514.C1144 = DT516.C257
		)
	INNER JOIN
		(
			T66 DT513
		RIGHT OUTER JOIN
			T90 DT517
		ON
			DT513.C799 = DT517.C1087
		)
	ON
		DT515.C975 = DT517.C1089
	)
WHERE
	(
		DT515.C968 = DT516.C248
	)
	AND
	(
		DT515.C966 = DT517.C1091
	)
ORDER BY
	DT517.C1086
	, DT513.C800
	, DT516.C247
	, DT515.C976
	, DT516.C256
	, DT514.C1144
	, DT517.C1084
	, DT513.C801
	, DT515.C966
	, DT515.C977
	, DT513.C807
	, DT514.C1138
	, DT514.C1140
	, DT517.C1085
	, DT517.C1088
	, DT516.C255
	, DT515.C971
	, DT513.C798
	, DT516.C257
	, DT516.C250
	, DT515.C972
	, DT517.C1092
	, DT513.C799
	, DT517.C1082
	, DT516.C254
	, DT517.C1083
	, DT513.C808
	, DT515.C967
	, DT516.C258
	, DT515.C975
	, DT515.C973
	, DT517.C1091
	, DT516.C251
	, DT517.C1090
	, DT513.C805
	, DT514.C1136
	, DT515.C970
	, DT517.C1089
	, DT515.C965
	, DT515.C978
	, DT515.C969
	, DT516.C253
	, DT515.C968
	, DT516.C249
	, DT513.C806
	, DT514.C1141
	, DT517.C1081
	, DT516.C252
	, DT514.C1142
	, DT517.C1079
	, DT517.C1080
	, DT514.C1143
LIMIT 886;


SELECT
	DT520.C925
	, DT520.C910
	, DT521.C1001
	, DT520.C921
	, DT520.C923
	, DT520.C917
	, DT518.C1187
	, DT518.C1188
	, DT520.C916
	, DT518.C1185
	, DT520.C926
	, DT521.C1004
	, DT520.C929
FROM
	(
		(
			(
				T74 DT520
			INNER JOIN
				T80 DT519
			ON
				DT520.C926 > DT519.C988
			)
		INNER JOIN
			T96 DT518
		ON
			DT520.C921 < DT518.C1186
		)
	RIGHT OUTER JOIN
		T83 DT521
	ON
		DT520.C926 < DT521.C1003
	)
WHERE
	(
		DT520.C928 = DT518.C1187
	)
	OR
	(
		DT520.C924 = DT521.C1005
	)
ORDER BY
	DT520.C925
	, DT520.C910
	, DT521.C1001
	, DT520.C921
	, DT520.C923
	, DT520.C917
	, DT518.C1187
	, DT518.C1188
	, DT520.C916
	, DT518.C1185
	, DT520.C926
	, DT521.C1004
	, DT520.C929
LIMIT 192;


SELECT
	DT524.C427
	, DT523.C1005
	, DT524.C421
	, DT524.C422
	, DT525.C1171
	, DT522.C943
	, DT524.C430
	, DT522.C946
	, DT523.C1002
	, DT524.C423
	, DT523.C1003
	, DT524.C437
	, DT524.C419
	, DT524.C425
	, DT522.C942
	, DT524.C431
	, DT525.C1175
	, DT525.C1174
	, DT525.C1170
	, DT524.C436
	, DT525.C1172
	, DT522.C940
	, DT522.C944
	, DT525.C1169
	, DT523.C1006
	, DT524.C426
FROM
	(
		T83 DT523
	INNER JOIN
		(
			(
				T36 DT524
			CROSS JOIN
				T95 DT525
			)
		INNER JOIN
			T76 DT522
		ON
			DT525.C1169 = DT522.C943
		)
	ON
		DT523.C1005 = DT522.C944
	)
WHERE
	(
		(
			DT523.C1007 = DT524.C435
		)
		AND
		(
			(
				DT524.C435 = DT522.C946
			)
			AND
			(
				DT524.C420 > DT524.C432
			)
		)
	)
	OR
	(
		DT525.C1171 < DT524.C429
	)
ORDER BY
	DT524.C427
	, DT523.C1005
	, DT524.C421
	, DT524.C422
	, DT525.C1171
	, DT522.C943
	, DT524.C430
	, DT522.C946
	, DT523.C1002
	, DT524.C423
	, DT523.C1003
	, DT524.C437
	, DT524.C419
	, DT524.C425
	, DT522.C942
	, DT524.C431
	, DT525.C1175
	, DT525.C1174
	, DT525.C1170
	, DT524.C436
	, DT525.C1172
	, DT522.C940
	, DT522.C944
	, DT525.C1169
	, DT523.C1006
	, DT524.C426
LIMIT 366;


SELECT
	DT527.C208
	, DT527.C212
	, DT527.C215
	, DT527.C214
	, DT526.C152
	, DT526.C156
	, DT527.C213
FROM
	(
		T11 DT526
	LEFT OUTER JOIN
		T17 DT527
	ON
		DT526.C155 = DT527.C218
	)
WHERE
	(
		DT526.C155 = DT526.C156
	)
	AND
	(
		(
			DT526.C155 > DT527.C210
		)
		OR
		(
			DT527.C211 <> DT527.C215
		)
	)
ORDER BY
	DT527.C208
	, DT527.C212
	, DT527.C215
	, DT527.C214
	, DT526.C152
	, DT526.C156
	, DT527.C213
LIMIT 554;


SELECT
	DT531.C1010
	, DT528.C679
	, DT532.C1045
	, DT529.C436
	, DT530.C827
	, DT532.C1041
	, DT528.C678
	, DT532.C1042
	, DT530.C832
	, DT528.C674
	, DT528.C680
	, DT531.C1022
	, DT532.C1040
	, DT528.C675
	, DT530.C826
	, DT529.C432
	, DT528.C673
	, DT531.C1012
	, DT530.C824
	, DT531.C1016
	, DT530.C829
	, DT530.C837
	, DT529.C437
FROM
	(
		T69 DT530
	CROSS JOIN
		(
			(
				T56 DT528
			INNER JOIN
				T85 DT532
			ON
				DT528.C681 = DT532.C1038
			)
		LEFT OUTER JOIN
			(
				T84 DT531
			RIGHT OUTER JOIN
				T36 DT529
			ON
				DT531.C1009 < DT529.C429
			)
		ON
			DT528.C680 = DT529.C423
		)
	)
WHERE
	(
		(
			DT531.C1025 < DT531.C1028
		)
		OR
		(
			DT532.C1039 = DT528.C680
		)
	)
	OR
	(
		(
			DT529.C421 < DT530.C825
		)
		OR
		(
			DT528.C670 = DT529.C429
		)
	)
ORDER BY
	DT531.C1010
	, DT528.C679
	, DT532.C1045
	, DT529.C436
	, DT530.C827
	, DT532.C1041
	, DT528.C678
	, DT532.C1042
	, DT530.C832
	, DT528.C674
	, DT528.C680
	, DT531.C1022
	, DT532.C1040
	, DT528.C675
	, DT530.C826
	, DT529.C432
	, DT528.C673
	, DT531.C1012
	, DT530.C824
	, DT531.C1016
	, DT530.C829
	, DT530.C837
	, DT529.C437
LIMIT 669;


SELECT
	DT533.C550
	, DT534.C603
	, DT534.C601
	, DT533.C564
	, DT533.C562
	, DT533.C566
	, DT533.C552
	, DT533.C549
	, DT533.C554
	, DT534.C606
	, DT534.C602
	, DT533.C563
	, DT533.C559
	, DT533.C551
	, DT534.C607
	, DT533.C555
	, DT533.C560
	, DT533.C565
	, DT533.C556
	, DT534.C605
	, DT533.C567
	, DT534.C604
	, DT533.C548
	, DT533.C561
	, DT534.C600
	, DT533.C553
FROM
	(
		T47 DT533
	LEFT OUTER JOIN
		T50 DT534
	ON
		DT533.C563 = DT534.C601
	)
WHERE
	(
		(
			DT533.C561 = DT533.C555
		)
		AND
		(
			DT534.C603 = DT534.C607
		)
	)
	AND
	(
		(
			DT533.C555 = DT534.C603
		)
		AND
		(
			DT534.C607 <> DT533.C557
		)
	)
ORDER BY
	DT533.C550
	, DT534.C603
	, DT534.C601
	, DT533.C564
	, DT533.C562
	, DT533.C566
	, DT533.C552
	, DT533.C549
	, DT533.C554
	, DT534.C606
	, DT534.C602
	, DT533.C563
	, DT533.C559
	, DT533.C551
	, DT534.C607
	, DT533.C555
	, DT533.C560
	, DT533.C565
	, DT533.C556
	, DT534.C605
	, DT533.C567
	, DT534.C604
	, DT533.C548
	, DT533.C561
	, DT534.C600
	, DT533.C553
LIMIT 614;


SELECT
	DT537.C438
	, DT535.C623
	, DT538.C813
	, DT535.C624
	, DT536.C10
	, DT535.C620
	, DT536.C11
	, DT535.C611
	, DT538.C811
	, DT535.C612
	, DT535.C617
	, DT535.C621
	, DT536.C8
	, DT535.C618
	, DT535.C615
	, DT537.C439
	, DT538.C812
	, DT536.C9
	, DT538.C820
	, DT535.C609
	, DT536.C12
	, DT538.C815
	, DT535.C616
	, DT536.C7
	, DT536.C6
	, DT536.C13
	, DT538.C816
	, DT535.C613
FROM
	(
		(
			T1 DT536
		CROSS JOIN
			(
				T37 DT537
			LEFT OUTER JOIN
				T67 DT538
			ON
				DT537.C440 = DT538.C813
			)
		)
	INNER JOIN
		T51 DT535
	ON
		DT537.C440 > DT535.C623
	)
WHERE
	(
		(
			DT538.C818 <> DT536.C12
		)
		AND
		(
			DT538.C814 = DT536.C5
		)
	)
	OR
	(
		(
			DT536.C14 = DT538.C815
		)
		OR
		(
			DT538.C815 > DT535.C617
		)
	)
ORDER BY
	DT537.C438
	, DT535.C623
	, DT538.C813
	, DT535.C624
	, DT536.C10
	, DT535.C620
	, DT536.C11
	, DT535.C611
	, DT538.C811
	, DT535.C612
	, DT535.C617
	, DT535.C621
	, DT536.C8
	, DT535.C618
	, DT535.C615
	, DT537.C439
	, DT538.C812
	, DT536.C9
	, DT538.C820
	, DT535.C609
	, DT536.C12
	, DT538.C815
	, DT535.C616
	, DT536.C7
	, DT536.C6
	, DT536.C13
	, DT538.C816
	, DT535.C613
LIMIT 436;


SELECT
	DT541.C637
	, DT541.C641
	, DT540.C541
	, DT541.C650
	, DT541.C644
	, DT540.C534
	, DT539.C350
	, DT540.C545
	, DT541.C642
	, DT541.C653
	, DT539.C360
	, DT540.C546
	, DT540.C536
	, DT539.C353
	, DT539.C351
	, DT540.C540
	, DT540.C528
	, DT539.C363
	, DT541.C638
	, DT540.C533
	, DT540.C543
	, DT541.C652
	, DT539.C346
	, DT539.C348
	, DT540.C530
	, DT541.C647
	, DT540.C535
	, DT539.C355
FROM
	(
		(
			T46 DT540
		LEFT OUTER JOIN
			T53 DT541
		ON
			DT540.C530 < DT541.C637
		)
	LEFT OUTER JOIN
		T31 DT539
	ON
		DT540.C533 <> DT539.C359
	)
WHERE
	(
		DT541.C650 = DT539.C362
	)
	OR
	(
		DT541.C652 = DT540.C547
	)
ORDER BY
	DT541.C637
	, DT541.C641
	, DT540.C541
	, DT541.C650
	, DT541.C644
	, DT540.C534
	, DT539.C350
	, DT540.C545
	, DT541.C642
	, DT541.C653
	, DT539.C360
	, DT540.C546
	, DT540.C536
	, DT539.C353
	, DT539.C351
	, DT540.C540
	, DT540.C528
	, DT539.C363
	, DT541.C638
	, DT540.C533
	, DT540.C543
	, DT541.C652
	, DT539.C346
	, DT539.C348
	, DT540.C530
	, DT541.C647
	, DT540.C535
	, DT539.C355
LIMIT 314;


SELECT
	DT546.C290
	, DT544.C596
	, DT543.C674
FROM
	(
		(
			T2 DT545
		INNER JOIN
			T56 DT543
		ON
			DT545.C26 = DT543.C680
		)
	LEFT OUTER JOIN
		(
			T49 DT544
		INNER JOIN
			(
				T25 DT546
			INNER JOIN
				T37 DT542
			ON
				DT546.C285 = DT542.C440
			)
		ON
			DT544.C596 > DT546.C287
		)
	ON
		DT545.C15 < DT546.C293
	)
WHERE
	(
		DT545.C21 < DT543.C677
	)
	AND
	(
		DT543.C669 < DT546.C287
	)
ORDER BY
	DT546.C290
	, DT544.C596
	, DT543.C674
LIMIT 121;


SELECT
	DT547.C661
	, DT548.C360
	, DT550.C160
	, DT548.C363
	, DT548.C346
	, DT548.C350
	, DT548.C347
	, DT548.C345
	, DT547.C666
	, DT547.C662
	, DT550.C158
	, DT548.C359
	, DT548.C344
	, DT548.C351
	, DT550.C163
	, DT548.C349
	, DT548.C358
	, DT548.C353
	, DT550.C162
	, DT547.C660
	, DT550.C157
	, DT548.C357
	, DT548.C361
	, DT547.C658
FROM
	(
		(
			T55 DT547
		INNER JOIN
			(
				T89 DT549
			INNER JOIN
				T31 DT548
			ON
				DT549.C1078 < DT548.C344
			)
		ON
			DT547.C662 < DT548.C347
		)
	RIGHT OUTER JOIN
		T12 DT550
	ON
		DT548.C346 = DT550.C159
	)
WHERE
	(
		(
			DT548.C351 = DT548.C357
		)
		OR
		(
			DT548.C345 = DT547.C659
		)
	)
	AND
	(
		(
			DT548.C344 > DT548.C346
		)
		OR
		(
			DT550.C163 = DT550.C159
		)
	)
ORDER BY
	DT547.C661
	, DT548.C360
	, DT550.C160
	, DT548.C363
	, DT548.C346
	, DT548.C350
	, DT548.C347
	, DT548.C345
	, DT547.C666
	, DT547.C662
	, DT550.C158
	, DT548.C359
	, DT548.C344
	, DT548.C351
	, DT550.C163
	, DT548.C349
	, DT548.C358
	, DT548.C353
	, DT550.C162
	, DT547.C660
	, DT550.C157
	, DT548.C357
	, DT548.C361
	, DT547.C658
LIMIT 169;


SELECT
	DT552.C716
	, DT551.C665
	, DT552.C714
	, DT551.C662
	, DT551.C664
	, DT551.C659
FROM
	(
		T59 DT552
	CROSS JOIN
		T55 DT551
	)
WHERE
	(
		(
			DT552.C716 > DT551.C659
		)
		OR
		(
			DT551.C664 = DT551.C662
		)
	)
	AND
	(
		DT551.C664 = DT551.C661
	)
ORDER BY
	DT552.C716
	, DT551.C665
	, DT552.C714
	, DT551.C662
	, DT551.C664
	, DT551.C659
LIMIT 484;


SELECT
	DT555.C217
	, DT553.C1110
	, DT553.C1104
	, DT554.C264
	, DT553.C1107
	, DT553.C1094
	, DT554.C260
	, DT554.C268
	, DT555.C213
	, DT553.C1108
	, DT555.C218
	, DT553.C1099
	, DT553.C1102
	, DT555.C210
	, DT553.C1096
	, DT553.C1101
	, DT554.C265
	, DT554.C261
	, DT553.C1111
	, DT553.C1100
	, DT554.C266
	, DT553.C1095
	, DT553.C1105
	, DT554.C262
	, DT555.C207
	, DT554.C267
	, DT553.C1112
	, DT555.C215
	, DT553.C1114
	, DT553.C1098
	, DT555.C211
	, DT555.C209
	, DT554.C259
	, DT553.C1113
	, DT554.C269
	, DT555.C208
	, DT555.C216
FROM
	(
		(
			T91 DT553
		LEFT OUTER JOIN
			T22 DT554
		ON
			DT553.C1113 < DT554.C268
		)
	INNER JOIN
		T17 DT555
	ON
		DT554.C260 = DT555.C212
	)
WHERE
	(
		DT553.C1110 = DT553.C1106
	)
	AND
	(
		(
			DT553.C1101 = DT555.C218
		)
		OR
		(
			DT555.C209 = DT555.C213
		)
	)
ORDER BY
	DT555.C217
	, DT553.C1110
	, DT553.C1104
	, DT554.C264
	, DT553.C1107
	, DT553.C1094
	, DT554.C260
	, DT554.C268
	, DT555.C213
	, DT553.C1108
	, DT555.C218
	, DT553.C1099
	, DT553.C1102
	, DT555.C210
	, DT553.C1096
	, DT553.C1101
	, DT554.C265
	, DT554.C261
	, DT553.C1111
	, DT553.C1100
	, DT554.C266
	, DT553.C1095
	, DT553.C1105
	, DT554.C262
	, DT555.C207
	, DT554.C267
	, DT553.C1112
	, DT555.C215
	, DT553.C1114
	, DT553.C1098
	, DT555.C211
	, DT555.C209
	, DT554.C259
	, DT553.C1113
	, DT554.C269
	, DT555.C208
	, DT555.C216
LIMIT 990;


SELECT
	DT559.C921
	, DT556.C598
	, DT556.C588
	, DT556.C591
	, DT557.C1139
	, DT557.C1140
	, DT557.C1142
	, DT559.C923
	, DT559.C922
	, DT556.C595
	, DT556.C592
	, DT556.C594
	, DT559.C910
	, DT559.C917
	, DT558.C321
	, DT559.C911
	, DT557.C1144
	, DT558.C327
	, DT559.C929
	, DT556.C599
	, DT558.C319
	, DT558.C322
	, DT559.C919
	, DT556.C596
	, DT558.C325
	, DT557.C1141
	, DT559.C913
	, DT559.C927
	, DT557.C1136
	, DT558.C323
	, DT557.C1138
	, DT556.C587
	, DT556.C597
	, DT559.C925
	, DT556.C593
	, DT556.C586
	, DT558.C324
	, DT559.C924
	, DT559.C912
FROM
	(
		(
			T93 DT557
		CROSS JOIN
			T74 DT559
		)
	RIGHT OUTER JOIN
		(
			T49 DT556
		RIGHT OUTER JOIN
			T27 DT558
		ON
			DT556.C586 < DT558.C320
		)
	ON
		DT559.C919 < DT556.C588
	)
WHERE
	(
		(
			DT558.C321 = DT556.C591
		)
		OR
		(
			DT559.C922 < DT557.C1141
		)
	)
	AND
	(
		(
			DT559.C912 < DT557.C1143
		)
		OR
		(
			DT558.C327 <> DT557.C1136
		)
	)
ORDER BY
	DT559.C921
	, DT556.C598
	, DT556.C588
	, DT556.C591
	, DT557.C1139
	, DT557.C1140
	, DT557.C1142
	, DT559.C923
	, DT559.C922
	, DT556.C595
	, DT556.C592
	, DT556.C594
	, DT559.C910
	, DT559.C917
	, DT558.C321
	, DT559.C911
	, DT557.C1144
	, DT558.C327
	, DT559.C929
	, DT556.C599
	, DT558.C319
	, DT558.C322
	, DT559.C919
	, DT556.C596
	, DT558.C325
	, DT557.C1141
	, DT559.C913
	, DT559.C927
	, DT557.C1136
	, DT558.C323
	, DT557.C1138
	, DT556.C587
	, DT556.C597
	, DT559.C925
	, DT556.C593
	, DT556.C586
	, DT558.C324
	, DT559.C924
	, DT559.C912
LIMIT 218;


SELECT
	DT561.C1172
	, DT560.C1042
	, DT561.C1168
	, DT560.C1044
	, DT560.C1038
	, DT560.C1036
	, DT562.C417
	, DT563.C658
	, DT561.C1169
	, DT563.C662
	, DT562.C415
	, DT560.C1029
	, DT562.C414
	, DT563.C667
	, DT560.C1043
	, DT562.C413
	, DT560.C1030
	, DT561.C1173
	, DT560.C1034
	, DT561.C1167
	, DT563.C664
	, DT560.C1041
	, DT563.C666
	, DT560.C1045
	, DT561.C1175
	, DT560.C1037
	, DT563.C665
	, DT561.C1170
	, DT561.C1171
	, DT560.C1033
	, DT563.C660
	, DT560.C1035
	, DT563.C659
	, DT563.C663
FROM
	(
		T95 DT561
	INNER JOIN
		(
			T35 DT562
		RIGHT OUTER JOIN
			(
				T55 DT563
			RIGHT OUTER JOIN
				T85 DT560
			ON
				DT563.C659 = DT560.C1037
			)
		ON
			DT562.C414 = DT560.C1046
		)
	ON
		DT561.C1169 <> DT563.C659
	)
WHERE
	(
		(
			DT561.C1168 = DT560.C1033
		)
		AND
		(
			DT560.C1036 <> DT562.C412
		)
	)
	OR
	(
		DT563.C666 = DT561.C1169
	)
ORDER BY
	DT561.C1172
	, DT560.C1042
	, DT561.C1168
	, DT560.C1044
	, DT560.C1038
	, DT560.C1036
	, DT562.C417
	, DT563.C658
	, DT561.C1169
	, DT563.C662
	, DT562.C415
	, DT560.C1029
	, DT562.C414
	, DT563.C667
	, DT560.C1043
	, DT562.C413
	, DT560.C1030
	, DT561.C1173
	, DT560.C1034
	, DT561.C1167
	, DT563.C664
	, DT560.C1041
	, DT563.C666
	, DT560.C1045
	, DT561.C1175
	, DT560.C1037
	, DT563.C665
	, DT561.C1170
	, DT561.C1171
	, DT560.C1033
	, DT563.C660
	, DT560.C1035
	, DT563.C659
	, DT563.C663
LIMIT 154;


SELECT
	DT564.C521
	, DT565.C75
	, DT566.C237
	, DT565.C88
	, DT564.C525
	, DT565.C87
	, DT564.C522
	, DT566.C245
	, DT566.C234
	, DT565.C86
	, DT565.C77
	, DT564.C524
	, DT565.C84
	, DT566.C235
FROM
	(
		(
			T6 DT565
		INNER JOIN
			T20 DT566
		ON
			DT565.C77 = DT566.C234
		)
	INNER JOIN
		T45 DT564
	ON
		DT565.C76 = DT564.C523
	)
WHERE
	(
		(
			DT564.C512 = DT564.C526
		)
		OR
		(
			DT565.C76 = DT565.C78
		)
	)
	OR
	(
		(
			DT564.C514 <> DT565.C75
		)
		AND
		(
			DT565.C77 < DT564.C514
		)
	)
ORDER BY
	DT564.C521
	, DT565.C75
	, DT566.C237
	, DT565.C88
	, DT564.C525
	, DT565.C87
	, DT564.C522
	, DT566.C245
	, DT566.C234
	, DT565.C86
	, DT565.C77
	, DT564.C524
	, DT565.C84
	, DT566.C235
LIMIT 212;


SELECT
	DT569.C217
	, DT569.C216
	, DT569.C209
	, DT568.C185
	, DT569.C208
FROM
	(
		(
			T0 DT567
		CROSS JOIN
			T17 DT569
		)
	INNER JOIN
		T14 DT568
	ON
		DT569.C208 = DT568.C180
	)
WHERE
	(
		(
			DT568.C183 = DT569.C210
		)
		OR
		(
			DT569.C209 = DT569.C215
		)
	)
	AND
	(
		DT567.C3 <> DT569.C215
	)
ORDER BY
	DT569.C217
	, DT569.C216
	, DT569.C209
	, DT568.C185
	, DT569.C208
LIMIT 264;


SELECT
	DT570.C834
	, DT571.C199
	, DT573.C729
	, DT570.C833
	, DT574.C447
	, DT571.C188
	, DT571.C192
	, DT573.C735
	, DT570.C824
	, DT571.C191
	, DT572.C446
	, DT570.C827
	, DT570.C825
	, DT570.C838
	, DT574.C449
	, DT573.C730
	, DT570.C837
	, DT571.C186
	, DT573.C733
	, DT571.C198
	, DT573.C727
	, DT570.C832
	, DT570.C835
	, DT573.C725
	, DT574.C450
	, DT571.C195
	, DT570.C831
FROM
	(
		(
			(
				T61 DT573
			INNER JOIN
				(
					T15 DT571
				RIGHT OUTER JOIN
					T39 DT572
				ON
					DT571.C199 < DT572.C444
				)
			ON
				DT573.C737 < DT571.C186
			)
		INNER JOIN
			T40 DT574
		ON
			DT571.C199 = DT574.C449
		)
	RIGHT OUTER JOIN
		T69 DT570
	ON
		DT574.C450 < DT570.C836
	)
WHERE
	(
		DT573.C735 <> DT573.C736
	)
	OR
	(
		(
			DT571.C186 < DT573.C729
		)
		AND
		(
			DT570.C838 <> DT570.C835
		)
	)
ORDER BY
	DT570.C834
	, DT571.C199
	, DT573.C729
	, DT570.C833
	, DT574.C447
	, DT571.C188
	, DT571.C192
	, DT573.C735
	, DT570.C824
	, DT571.C191
	, DT572.C446
	, DT570.C827
	, DT570.C825
	, DT570.C838
	, DT574.C449
	, DT573.C730
	, DT570.C837
	, DT571.C186
	, DT573.C733
	, DT571.C198
	, DT573.C727
	, DT570.C832
	, DT570.C835
	, DT573.C725
	, DT574.C450
	, DT571.C195
	, DT570.C831
LIMIT 171;


SELECT
	DT577.C794
	, DT576.C609
	, DT576.C618
	, DT576.C611
	, DT576.C610
	, DT577.C784
	, DT576.C615
	, DT577.C788
	, DT577.C786
	, DT576.C616
	, DT577.C783
	, DT577.C796
	, DT577.C793
	, DT577.C785
	, DT577.C792
	, DT576.C622
	, DT575.C1076
	, DT577.C797
	, DT576.C608
	, DT575.C1078
	, DT576.C619
	, DT576.C617
	, DT577.C787
FROM
	(
		(
			T65 DT577
		INNER JOIN
			T89 DT575
		ON
			DT577.C787 < DT575.C1078
		)
	INNER JOIN
		T51 DT576
	ON
		DT577.C797 = DT576.C609
	)
WHERE
	(
		DT576.C622 < DT577.C785
	)
	OR
	(
		DT577.C783 < DT577.C785
	)
ORDER BY
	DT577.C794
	, DT576.C609
	, DT576.C618
	, DT576.C611
	, DT576.C610
	, DT577.C784
	, DT576.C615
	, DT577.C788
	, DT577.C786
	, DT576.C616
	, DT577.C783
	, DT577.C796
	, DT577.C793
	, DT577.C785
	, DT577.C792
	, DT576.C622
	, DT575.C1076
	, DT577.C797
	, DT576.C608
	, DT575.C1078
	, DT576.C619
	, DT576.C617
	, DT577.C787
LIMIT 286;


SELECT
	DT579.C373
	, DT579.C376
	, DT578.C731
	, DT578.C739
	, DT578.C733
	, DT578.C726
	, DT578.C729
	, DT579.C365
	, DT579.C369
FROM
	(
		T61 DT578
	INNER JOIN
		T32 DT579
	ON
		DT578.C733 > DT579.C380
	)
WHERE
	(
		DT579.C373 = DT578.C732
	)
	OR
	(
		(
			DT579.C380 = DT579.C368
		)
		OR
		(
			DT578.C736 = DT578.C736
		)
	)
ORDER BY
	DT579.C373
	, DT579.C376
	, DT578.C731
	, DT578.C739
	, DT578.C733
	, DT578.C726
	, DT578.C729
	, DT579.C365
	, DT579.C369
LIMIT 155;


SELECT
	DT583.C1056
	, DT582.C261
	, DT583.C1063
	, DT583.C1058
	, DT582.C262
	, DT583.C1057
	, DT582.C260
	, DT580.C1140
	, DT581.C718
	, DT581.C721
FROM
	(
		(
			T22 DT582
		CROSS JOIN
			(
				T93 DT580
			RIGHT OUTER JOIN
				T60 DT581
			ON
				DT580.C1136 = DT581.C720
			)
		)
	LEFT OUTER JOIN
		T87 DT583
	ON
		DT580.C1137 = DT583.C1058
	)
WHERE
	(
		(
			DT582.C259 = DT580.C1143
		)
		OR
		(
			DT580.C1141 <> DT582.C264
		)
	)
	AND
	(
		DT581.C722 > DT581.C724
	)
ORDER BY
	DT583.C1056
	, DT582.C261
	, DT583.C1063
	, DT583.C1058
	, DT582.C262
	, DT583.C1057
	, DT582.C260
	, DT580.C1140
	, DT581.C718
	, DT581.C721
LIMIT 568;


SELECT
	DT584.C81
	, DT584.C79
	, DT585.C138
	, DT585.C143
	, DT584.C76
	, DT584.C86
	, DT585.C150
	, DT584.C78
	, DT584.C80
	, DT584.C85
	, DT585.C139
	, DT584.C75
	, DT584.C82
	, DT585.C144
	, DT584.C87
	, DT585.C151
FROM
	(
		T10 DT585
	LEFT OUTER JOIN
		T6 DT584
	ON
		DT585.C142 <> DT584.C86
	)
WHERE
	(
		DT584.C82 < DT584.C78
	)
	AND
	(
		(
			(
				DT584.C87 = DT585.C145
			)
			OR
			(
				DT585.C150 <> DT585.C143
			)
		)
		AND
		(
			DT584.C83 = DT584.C88
		)
	)
ORDER BY
	DT584.C81
	, DT584.C79
	, DT585.C138
	, DT585.C143
	, DT584.C76
	, DT584.C86
	, DT585.C150
	, DT584.C78
	, DT584.C80
	, DT584.C85
	, DT585.C139
	, DT584.C75
	, DT584.C82
	, DT585.C144
	, DT584.C87
	, DT585.C151
LIMIT 204;


SELECT
	DT589.C887
	, DT587.C1188
	, DT589.C883
	, DT588.C312
	, DT587.C1184
	, DT589.C869
	, DT588.C317
	, DT589.C888
	, DT589.C874
	, DT588.C298
	, DT588.C311
	, DT587.C1178
	, DT589.C879
	, DT589.C885
	, DT588.C303
	, DT586.C441
	, DT587.C1186
	, DT589.C871
	, DT587.C1182
	, DT587.C1185
	, DT588.C302
	, DT587.C1181
	, DT588.C299
	, DT588.C305
	, DT589.C873
	, DT588.C297
	, DT588.C309
	, DT589.C884
	, DT589.C886
	, DT587.C1183
	, DT587.C1176
	, DT589.C875
	, DT588.C307
	, DT589.C881
	, DT588.C304
	, DT588.C306
	, DT587.C1180
	, DT589.C868
	, DT588.C313
	, DT588.C316
	, DT588.C301
	, DT589.C876
	, DT589.C882
	, DT587.C1179
	, DT588.C315
	, DT589.C872
	, DT589.C877
	, DT586.C443
	, DT588.C314
FROM
	(
		T96 DT587
	RIGHT OUTER JOIN
		(
			T26 DT588
		LEFT OUTER JOIN
			(
				T72 DT589
			LEFT OUTER JOIN
				T38 DT586
			ON
				DT589.C878 = DT586.C442
			)
		ON
			DT588.C318 = DT589.C868
		)
	ON
		DT587.C1184 = DT588.C308
	)
WHERE
	(
		(
			DT588.C316 < DT588.C311
		)
		AND
		(
			DT587.C1188 = DT589.C868
		)
	)
	AND
	(
		DT588.C302 < DT589.C872
	)
ORDER BY
	DT589.C887
	, DT587.C1188
	, DT589.C883
	, DT588.C312
	, DT587.C1184
	, DT589.C869
	, DT588.C317
	, DT589.C888
	, DT589.C874
	, DT588.C298
	, DT588.C311
	, DT587.C1178
	, DT589.C879
	, DT589.C885
	, DT588.C303
	, DT586.C441
	, DT587.C1186
	, DT589.C871
	, DT587.C1182
	, DT587.C1185
	, DT588.C302
	, DT587.C1181
	, DT588.C299
	, DT588.C305
	, DT589.C873
	, DT588.C297
	, DT588.C309
	, DT589.C884
	, DT589.C886
	, DT587.C1183
	, DT587.C1176
	, DT589.C875
	, DT588.C307
	, DT589.C881
	, DT588.C304
	, DT588.C306
	, DT587.C1180
	, DT589.C868
	, DT588.C313
	, DT588.C316
	, DT588.C301
	, DT589.C876
	, DT589.C882
	, DT587.C1179
	, DT588.C315
	, DT589.C872
	, DT589.C877
	, DT586.C443
	, DT588.C314
LIMIT 279;


SELECT
	DT593.C215
	, DT593.C211
	, DT592.C1158
	, DT593.C208
	, DT591.C330
	, DT592.C1149
	, DT593.C214
	, DT590.C179
	, DT592.C1163
	, DT592.C1164
	, DT590.C172
	, DT592.C1150
	, DT591.C332
	, DT592.C1161
	, DT592.C1157
	, DT590.C175
	, DT592.C1145
	, DT590.C167
	, DT590.C178
	, DT592.C1160
	, DT593.C209
	, DT592.C1153
	, DT592.C1148
	, DT592.C1156
	, DT591.C328
	, DT591.C331
	, DT592.C1165
	, DT592.C1154
	, DT590.C169
	, DT593.C218
	, DT590.C166
	, DT593.C216
	, DT590.C170
	, DT590.C176
	, DT590.C177
	, DT593.C213
	, DT590.C173
	, DT592.C1162
	, DT592.C1152
	, DT593.C212
	, DT590.C171
	, DT592.C1151
	, DT590.C174
	, DT592.C1146
FROM
	(
		(
			T94 DT592
		INNER JOIN
			T17 DT593
		ON
			DT592.C1155 = DT593.C208
		)
	CROSS JOIN
		(
			T13 DT590
		INNER JOIN
			T28 DT591
		ON
			DT590.C165 < DT591.C328
		)
	)
WHERE
	(
		(
			DT593.C217 = DT590.C167
		)
		AND
		(
			DT593.C212 <> DT590.C173
		)
	)
	OR
	(
		DT593.C218 = DT591.C333
	)
ORDER BY
	DT593.C215
	, DT593.C211
	, DT592.C1158
	, DT593.C208
	, DT591.C330
	, DT592.C1149
	, DT593.C214
	, DT590.C179
	, DT592.C1163
	, DT592.C1164
	, DT590.C172
	, DT592.C1150
	, DT591.C332
	, DT592.C1161
	, DT592.C1157
	, DT590.C175
	, DT592.C1145
	, DT590.C167
	, DT590.C178
	, DT592.C1160
	, DT593.C209
	, DT592.C1153
	, DT592.C1148
	, DT592.C1156
	, DT591.C328
	, DT591.C331
	, DT592.C1165
	, DT592.C1154
	, DT590.C169
	, DT593.C218
	, DT590.C166
	, DT593.C216
	, DT590.C170
	, DT590.C176
	, DT590.C177
	, DT593.C213
	, DT590.C173
	, DT592.C1162
	, DT592.C1152
	, DT593.C212
	, DT590.C171
	, DT592.C1151
	, DT590.C174
	, DT592.C1146
LIMIT 793;


SELECT
	DT595.C228
	, DT595.C226
	, DT594.C469
	, DT594.C462
	, DT594.C461
	, DT594.C458
	, DT594.C470
	, DT595.C225
	, DT595.C222
	, DT594.C466
	, DT597.C341
	, DT594.C460
	, DT596.C343
	, DT594.C456
FROM
	(
		(
			(
				T41 DT594
			INNER JOIN
				T30 DT597
			ON
				DT594.C461 = DT597.C342
			)
		INNER JOIN
			T30 DT596
		ON
			DT594.C451 > DT596.C342
		)
	INNER JOIN
		T18 DT595
	ON
		DT594.C451 = DT595.C225
	)
WHERE
	(
		(
			DT595.C224 > DT594.C470
		)
		OR
		(
			DT594.C470 = DT594.C472
		)
	)
	OR
	(
		DT595.C221 < DT594.C471
	)
ORDER BY
	DT595.C228
	, DT595.C226
	, DT594.C469
	, DT594.C462
	, DT594.C461
	, DT594.C458
	, DT594.C470
	, DT595.C225
	, DT595.C222
	, DT594.C466
	, DT597.C341
	, DT594.C460
	, DT596.C343
	, DT594.C456
LIMIT 882;


SELECT
	DT601.C987
	, DT600.C13
	, DT600.C9
	, DT600.C8
	, DT600.C7
	, DT599.C540
	, DT599.C539
	, DT601.C988
	, DT599.C542
	, DT599.C537
	, DT599.C546
	, DT598.C993
	, DT600.C14
	, DT599.C545
	, DT598.C991
	, DT601.C989
	, DT599.C531
	, DT598.C992
	, DT598.C990
	, DT599.C547
	, DT599.C533
	, DT600.C5
	, DT599.C534
	, DT600.C12
	, DT600.C4
	, DT599.C541
	, DT599.C536
	, DT600.C10
	, DT599.C538
	, DT599.C528
	, DT599.C532
	, DT600.C11
	, DT598.C994
	, DT599.C544
	, DT599.C535
	, DT599.C543
FROM
	(
		(
			(
				T1 DT600
			INNER JOIN
				T46 DT599
			ON
				DT600.C12 = DT599.C529
			)
		INNER JOIN
			T80 DT601
		ON
			DT599.C534 = DT601.C989
		)
	INNER JOIN
		T81 DT598
	ON
		DT600.C9 < DT598.C991
	)
WHERE
	(
		DT598.C992 > DT601.C986
	)
	AND
	(
		(
			DT601.C988 = DT599.C534
		)
		OR
		(
			DT598.C994 = DT600.C8
		)
	)
ORDER BY
	DT601.C987
	, DT600.C13
	, DT600.C9
	, DT600.C8
	, DT600.C7
	, DT599.C540
	, DT599.C539
	, DT601.C988
	, DT599.C542
	, DT599.C537
	, DT599.C546
	, DT598.C993
	, DT600.C14
	, DT599.C545
	, DT598.C991
	, DT601.C989
	, DT599.C531
	, DT598.C992
	, DT598.C990
	, DT599.C547
	, DT599.C533
	, DT600.C5
	, DT599.C534
	, DT600.C12
	, DT600.C4
	, DT599.C541
	, DT599.C536
	, DT600.C10
	, DT599.C538
	, DT599.C528
	, DT599.C532
	, DT600.C11
	, DT598.C994
	, DT599.C544
	, DT599.C535
	, DT599.C543
LIMIT 766;


SELECT
	DT602.C117
	, DT603.C292
	, DT603.C283
	, DT604.C87
	, DT604.C75
	, DT604.C84
	, DT602.C112
	, DT605.C360
	, DT605.C350
	, DT605.C361
	, DT603.C293
	, DT604.C76
	, DT605.C362
	, DT604.C78
	, DT604.C79
	, DT605.C352
	, DT602.C118
FROM
	(
		(
			T8 DT602
		LEFT OUTER JOIN
			T6 DT604
		ON
			DT602.C117 = DT604.C82
		)
	CROSS JOIN
		(
			T31 DT605
		INNER JOIN
			T25 DT603
		ON
			DT605.C353 > DT603.C288
		)
	)
WHERE
	(
		DT605.C359 = DT605.C349
	)
	OR
	(
		DT602.C114 = DT602.C123
	)
ORDER BY
	DT602.C117
	, DT603.C292
	, DT603.C283
	, DT604.C87
	, DT604.C75
	, DT604.C84
	, DT602.C112
	, DT605.C360
	, DT605.C350
	, DT605.C361
	, DT603.C293
	, DT604.C76
	, DT605.C362
	, DT604.C78
	, DT604.C79
	, DT605.C352
	, DT602.C118
LIMIT 567;


SELECT
	DT606.C476
	, DT606.C483
	, DT606.C481
	, DT607.C572
	, DT606.C485
	, DT607.C583
	, DT607.C581
	, DT607.C585
	, DT607.C575
	, DT607.C584
	, DT606.C480
	, DT606.C484
	, DT607.C578
	, DT606.C474
	, DT607.C582
	, DT606.C479
	, DT607.C571
	, DT607.C568
	, DT607.C576
	, DT606.C486
	, DT607.C569
	, DT607.C580
FROM
	(
		T48 DT607
	INNER JOIN
		T42 DT606
	ON
		DT607.C582 > DT606.C484
	)
WHERE
	(
		DT606.C484 <> DT606.C474
	)
	AND
	(
		(
			DT607.C584 < DT607.C568
		)
		AND
		(
			DT606.C485 = DT607.C583
		)
	)
ORDER BY
	DT606.C476
	, DT606.C483
	, DT606.C481
	, DT607.C572
	, DT606.C485
	, DT607.C583
	, DT607.C581
	, DT607.C585
	, DT607.C575
	, DT607.C584
	, DT606.C480
	, DT606.C484
	, DT607.C578
	, DT606.C474
	, DT607.C582
	, DT606.C479
	, DT607.C571
	, DT607.C568
	, DT607.C576
	, DT606.C486
	, DT607.C569
	, DT607.C580
LIMIT 367;


SELECT
	DT608.C2
	, DT610.C657
	, DT609.C603
FROM
	(
		(
			T50 DT609
		RIGHT OUTER JOIN
			T54 DT610
		ON
			DT609.C606 > DT610.C654
		)
	LEFT OUTER JOIN
		T0 DT608
	ON
		DT609.C606 = DT608.C2
	)
WHERE
	(
		DT610.C657 = DT609.C600
	)
	OR
	(
		DT609.C605 = DT609.C605
	)
ORDER BY
	DT608.C2
	, DT610.C657
	, DT609.C603
LIMIT 426;


SELECT
	DT612.C1058
	, DT612.C1062
	, DT612.C1061
	, DT611.C975
	, DT613.C1136
	, DT611.C977
	, DT613.C1137
	, DT611.C976
	, DT613.C1142
	, DT612.C1060
	, DT611.C966
	, DT611.C973
	, DT613.C1139
	, DT611.C972
	, DT612.C1057
	, DT611.C969
	, DT612.C1059
	, DT611.C965
	, DT611.C974
	, DT613.C1141
	, DT613.C1140
	, DT611.C970
	, DT611.C968
	, DT612.C1056
	, DT613.C1144
	, DT613.C1138
	, DT611.C967
	, DT612.C1063
	, DT611.C978
	, DT611.C971
	, DT613.C1143
FROM
	(
		(
			T78 DT611
		LEFT OUTER JOIN
			T87 DT612
		ON
			DT611.C967 > DT612.C1059
		)
	LEFT OUTER JOIN
		T93 DT613
	ON
		DT611.C972 = DT613.C1141
	)
WHERE
	(
		(
			DT613.C1143 = DT612.C1061
		)
		OR
		(
			DT613.C1139 <> DT611.C975
		)
	)
	AND
	(
		DT613.C1141 = DT613.C1143
	)
ORDER BY
	DT612.C1058
	, DT612.C1062
	, DT612.C1061
	, DT611.C975
	, DT613.C1136
	, DT611.C977
	, DT613.C1137
	, DT611.C976
	, DT613.C1142
	, DT612.C1060
	, DT611.C966
	, DT611.C973
	, DT613.C1139
	, DT611.C972
	, DT612.C1057
	, DT611.C969
	, DT612.C1059
	, DT611.C965
	, DT611.C974
	, DT613.C1141
	, DT613.C1140
	, DT611.C970
	, DT611.C968
	, DT612.C1056
	, DT613.C1144
	, DT613.C1138
	, DT611.C967
	, DT612.C1063
	, DT611.C978
	, DT611.C971
	, DT613.C1143
LIMIT 1000;


SELECT
	DT615.C815
	, DT614.C1137
	, DT614.C1141
	, DT615.C819
	, DT615.C811
	, DT614.C1144
	, DT615.C809
	, DT614.C1138
	, DT614.C1143
	, DT615.C817
	, DT615.C816
	, DT615.C813
FROM
	(
		T67 DT615
	RIGHT OUTER JOIN
		T93 DT614
	ON
		DT615.C809 > DT614.C1140
	)
WHERE
	(
		DT615.C820 = DT614.C1143
	)
	OR
	(
		(
			DT614.C1141 <> DT614.C1137
		)
		OR
		(
			(
				DT615.C809 > DT614.C1141
			)
			AND
			(
				DT614.C1137 = DT615.C813
			)
		)
	)
ORDER BY
	DT615.C815
	, DT614.C1137
	, DT614.C1141
	, DT615.C819
	, DT615.C811
	, DT614.C1144
	, DT615.C809
	, DT614.C1138
	, DT614.C1143
	, DT615.C817
	, DT615.C816
	, DT615.C813
LIMIT 162;


SELECT
	DT617.C549
	, DT616.C935
	, DT617.C556
FROM
	(
		T75 DT616
	CROSS JOIN
		(
			T47 DT617
		RIGHT OUTER JOIN
			T30 DT618
		ON
			DT617.C558 = DT618.C343
		)
	)
WHERE
	(
		DT617.C551 < DT617.C549
	)
	AND
	(
		(
			DT617.C556 <> DT617.C565
		)
		AND
		(
			DT617.C554 < DT617.C557
		)
	)
ORDER BY
	DT617.C549
	, DT616.C935
	, DT617.C556
LIMIT 566;


SELECT
	DT619.C958
	, DT621.C186
	, DT621.C189
	, DT622.C980
	, DT619.C962
	, DT619.C963
	, DT619.C956
	, DT621.C190
	, DT619.C950
	, DT621.C194
FROM
	(
		(
			T77 DT619
		INNER JOIN
			T68 DT620
		ON
			DT619.C949 < DT620.C823
		)
	INNER JOIN
		(
			T15 DT621
		RIGHT OUTER JOIN
			T79 DT622
		ON
			DT621.C187 <> DT622.C984
		)
	ON
		DT619.C952 < DT621.C198
	)
WHERE
	(
		(
			DT621.C195 = DT619.C954
		)
		OR
		(
			(
				DT619.C954 < DT619.C950
			)
			AND
			(
				DT621.C187 > DT622.C984
			)
		)
	)
	OR
	(
		DT619.C962 = DT619.C962
	)
ORDER BY
	DT619.C958
	, DT621.C186
	, DT621.C189
	, DT622.C980
	, DT619.C962
	, DT619.C963
	, DT619.C956
	, DT621.C190
	, DT619.C950
	, DT621.C194
LIMIT 936;


SELECT
	DT627.C1103
	, DT627.C1109
	, DT625.C201
	, DT624.C1195
	, DT627.C1107
	, DT627.C1096
	, DT624.C1191
	, DT627.C1110
	, DT623.C182
	, DT623.C180
	, DT627.C1100
	, DT625.C205
	, DT626.C723
	, DT627.C1111
	, DT625.C206
FROM
	(
		(
			T91 DT627
		CROSS JOIN
			T14 DT623
		)
	LEFT OUTER JOIN
		(
			T97 DT624
		INNER JOIN
			(
				T16 DT625
			RIGHT OUTER JOIN
				T60 DT626
			ON
				DT625.C206 > DT626.C724
			)
		ON
			DT624.C1194 = DT625.C201
		)
	ON
		DT627.C1105 = DT624.C1196
	)
WHERE
	(
		DT623.C182 < DT624.C1196
	)
	AND
	(
		DT627.C1106 < DT627.C1093
	)
ORDER BY
	DT627.C1103
	, DT627.C1109
	, DT625.C201
	, DT624.C1195
	, DT627.C1107
	, DT627.C1096
	, DT624.C1191
	, DT627.C1110
	, DT623.C182
	, DT623.C180
	, DT627.C1100
	, DT625.C205
	, DT626.C723
	, DT627.C1111
	, DT625.C206
LIMIT 988;


SELECT
	DT631.C891
	, DT628.C43
	, DT630.C239
	, DT628.C47
	, DT630.C241
	, DT629.C476
	, DT631.C900
	, DT631.C898
	, DT628.C37
	, DT631.C906
	, DT629.C485
	, DT630.C245
	, DT630.C236
	, DT628.C49
	, DT630.C246
	, DT631.C893
	, DT629.C477
	, DT628.C40
	, DT631.C897
	, DT629.C473
	, DT631.C899
	, DT631.C895
	, DT628.C48
FROM
	(
		(
			T73 DT631
		RIGHT OUTER JOIN
			T42 DT629
		ON
			DT631.C891 = DT629.C473
		)
	INNER JOIN
		(
			T3 DT628
		INNER JOIN
			T20 DT630
		ON
			DT628.C40 <> DT630.C236
		)
	ON
		DT631.C891 = DT630.C237
	)
WHERE
	(
		DT630.C244 = DT631.C894
	)
	AND
	(
		DT628.C34 = DT628.C51
	)
ORDER BY
	DT631.C891
	, DT628.C43
	, DT630.C239
	, DT628.C47
	, DT630.C241
	, DT629.C476
	, DT631.C900
	, DT631.C898
	, DT628.C37
	, DT631.C906
	, DT629.C485
	, DT630.C245
	, DT630.C236
	, DT628.C49
	, DT630.C246
	, DT631.C893
	, DT629.C477
	, DT628.C40
	, DT631.C897
	, DT629.C473
	, DT631.C899
	, DT631.C895
	, DT628.C48
LIMIT 467;


SELECT
	DT633.C379
	, DT635.C209
	, DT632.C328
	, DT634.C644
	, DT633.C368
	, DT634.C649
	, DT632.C332
	, DT634.C650
	, DT635.C215
	, DT633.C366
	, DT634.C642
	, DT634.C647
	, DT633.C372
	, DT633.C374
	, DT635.C213
	, DT632.C333
	, DT634.C639
	, DT635.C211
	, DT634.C646
	, DT635.C212
	, DT632.C331
	, DT633.C378
	, DT635.C214
	, DT634.C638
	, DT632.C329
	, DT633.C375
	, DT634.C643
	, DT634.C641
	, DT633.C364
	, DT634.C645
FROM
	(
		(
			T17 DT635
		LEFT OUTER JOIN
			(
				T53 DT634
			RIGHT OUTER JOIN
				T32 DT633
			ON
				DT634.C652 = DT633.C378
			)
		ON
			DT635.C217 = DT633.C365
		)
	INNER JOIN
		T28 DT632
	ON
		DT633.C369 > DT632.C328
	)
WHERE
	(
		DT635.C212 <> DT635.C211
	)
	AND
	(
		DT634.C638 = DT633.C376
	)
ORDER BY
	DT633.C379
	, DT635.C209
	, DT632.C328
	, DT634.C644
	, DT633.C368
	, DT634.C649
	, DT632.C332
	, DT634.C650
	, DT635.C215
	, DT633.C366
	, DT634.C642
	, DT634.C647
	, DT633.C372
	, DT633.C374
	, DT635.C213
	, DT632.C333
	, DT634.C639
	, DT635.C211
	, DT634.C646
	, DT635.C212
	, DT632.C331
	, DT633.C378
	, DT635.C214
	, DT634.C638
	, DT632.C329
	, DT633.C375
	, DT634.C643
	, DT634.C641
	, DT633.C364
	, DT634.C645
LIMIT 422;


SELECT
	DT637.C919
	, DT636.C425
	, DT636.C420
	, DT636.C428
	, DT636.C423
	, DT637.C916
	, DT636.C419
	, DT636.C434
	, DT636.C430
	, DT637.C925
	, DT637.C911
FROM
	(
		T74 DT637
	LEFT OUTER JOIN
		T36 DT636
	ON
		DT637.C918 = DT636.C421
	)
WHERE
	(
		DT636.C425 = DT636.C433
	)
	OR
	(
		(
			DT636.C425 = DT637.C912
		)
		AND
		(
			(
				DT636.C433 <> DT636.C424
			)
			OR
			(
				DT637.C929 = DT637.C913
			)
		)
	)
ORDER BY
	DT637.C919
	, DT636.C425
	, DT636.C420
	, DT636.C428
	, DT636.C423
	, DT637.C916
	, DT636.C419
	, DT636.C434
	, DT636.C430
	, DT637.C925
	, DT637.C911
LIMIT 642;


SELECT
	DT638.C455
	, DT639.C998
	, DT639.C996
	, DT638.C459
	, DT638.C451
	, DT638.C467
	, DT639.C997
	, DT638.C469
	, DT638.C464
	, DT638.C465
	, DT638.C470
	, DT638.C471
	, DT639.C995
	, DT639.C999
	, DT639.C1000
	, DT638.C458
	, DT638.C468
FROM
	(
		T82 DT639
	CROSS JOIN
		T41 DT638
	)
WHERE
	(
		(
			DT638.C464 <> DT638.C461
		)
		AND
		(
			(
				DT638.C464 = DT638.C454
			)
			AND
			(
				DT638.C468 = DT639.C998
			)
		)
	)
	OR
	(
		DT638.C471 < DT638.C459
	)
ORDER BY
	DT638.C455
	, DT639.C998
	, DT639.C996
	, DT638.C459
	, DT638.C451
	, DT638.C467
	, DT639.C997
	, DT638.C469
	, DT638.C464
	, DT638.C465
	, DT638.C470
	, DT638.C471
	, DT639.C995
	, DT639.C999
	, DT639.C1000
	, DT638.C458
	, DT638.C468
LIMIT 985;


SELECT
	DT642.C724
	, DT640.C455
	, DT641.C1200
	, DT641.C1198
	, DT640.C466
FROM
	(
		(
			T41 DT640
		LEFT OUTER JOIN
			T97 DT641
		ON
			DT640.C459 < DT641.C1200
		)
	CROSS JOIN
		T60 DT642
	)
WHERE
	(
		(
			DT640.C456 <> DT642.C723
		)
		OR
		(
			DT640.C460 > DT640.C455
		)
	)
	AND
	(
		DT642.C720 = DT641.C1194
	)
ORDER BY
	DT642.C724
	, DT640.C455
	, DT641.C1200
	, DT641.C1198
	, DT640.C466
LIMIT 828;


SELECT
	DT645.C758
	, DT644.C81
	, DT644.C75
	, DT643.C1143
	, DT644.C79
	, DT645.C747
	, DT645.C753
	, DT644.C77
	, DT645.C752
	, DT645.C750
	, DT644.C80
FROM
	(
		(
			T93 DT643
		INNER JOIN
			T63 DT645
		ON
			DT643.C1137 = DT645.C749
		)
	CROSS JOIN
		T6 DT644
	)
WHERE
	(
		DT644.C77 > DT644.C78
	)
	AND
	(
		(
			(
				DT645.C744 = DT643.C1141
			)
			AND
			(
				DT644.C80 > DT645.C749
			)
		)
		OR
		(
			DT643.C1142 = DT644.C88
		)
	)
ORDER BY
	DT645.C758
	, DT644.C81
	, DT644.C75
	, DT643.C1143
	, DT644.C79
	, DT645.C747
	, DT645.C753
	, DT644.C77
	, DT645.C752
	, DT645.C750
	, DT644.C80
LIMIT 210;


SELECT
	DT646.C111
	, DT646.C122
	, DT647.C81
	, DT646.C121
	, DT646.C120
FROM
	(
		T8 DT646
	LEFT OUTER JOIN
		T6 DT647
	ON
		DT646.C119 = DT647.C85
	)
WHERE
	(
		(
			DT646.C125 = DT646.C116
		)
		AND
		(
			DT646.C115 < DT647.C81
		)
	)
	AND
	(
		DT647.C79 = DT646.C119
	)
ORDER BY
	DT646.C111
	, DT646.C122
	, DT647.C81
	, DT646.C121
	, DT646.C120
LIMIT 766;


SELECT
	DT648.C19
	, DT648.C30
	, DT649.C130
	, DT649.C133
	, DT649.C131
	, DT648.C18
	, DT649.C128
	, DT648.C25
	, DT648.C22
	, DT648.C20
	, DT648.C28
	, DT649.C127
	, DT649.C135
	, DT648.C21
	, DT649.C126
FROM
	(
		T9 DT649
	CROSS JOIN
		T2 DT648
	)
WHERE
	(
		(
			DT648.C16 <> DT648.C18
		)
		AND
		(
			DT649.C126 < DT648.C15
		)
	)
	OR
	(
		(
			DT649.C137 = DT648.C18
		)
		OR
		(
			DT648.C21 = DT649.C128
		)
	)
ORDER BY
	DT648.C19
	, DT648.C30
	, DT649.C130
	, DT649.C133
	, DT649.C131
	, DT648.C18
	, DT649.C128
	, DT648.C25
	, DT648.C22
	, DT648.C20
	, DT648.C28
	, DT649.C127
	, DT649.C135
	, DT648.C21
	, DT649.C126
LIMIT 394;


SELECT
	DT651.C418
	, DT650.C868
	, DT650.C873
	, DT651.C413
	, DT650.C881
	, DT652.C1004
	, DT650.C882
	, DT651.C417
	, DT650.C870
	, DT650.C887
	, DT650.C885
	, DT650.C869
	, DT652.C1001
	, DT650.C879
	, DT652.C1007
	, DT652.C1006
	, DT651.C416
	, DT650.C875
	, DT650.C877
	, DT651.C411
	, DT650.C876
FROM
	(
		(
			T35 DT651
		RIGHT OUTER JOIN
			T72 DT650
		ON
			DT651.C416 <> DT650.C868
		)
	LEFT OUTER JOIN
		T83 DT652
	ON
		DT650.C867 <> DT652.C1007
	)
WHERE
	(
		DT650.C882 <> DT651.C411
	)
	OR
	(
		(
			DT650.C880 = DT650.C880
		)
		AND
		(
			DT650.C881 < DT650.C867
		)
	)
ORDER BY
	DT651.C418
	, DT650.C868
	, DT650.C873
	, DT651.C413
	, DT650.C881
	, DT652.C1004
	, DT650.C882
	, DT651.C417
	, DT650.C870
	, DT650.C887
	, DT650.C885
	, DT650.C869
	, DT652.C1001
	, DT650.C879
	, DT652.C1007
	, DT652.C1006
	, DT651.C416
	, DT650.C875
	, DT650.C877
	, DT651.C411
	, DT650.C876
LIMIT 168;


SELECT
	DT654.C1178
	, DT654.C1182
	, DT655.C231
FROM
	(
		(
			(
				T99 DT656
			RIGHT OUTER JOIN
				T93 DT653
			ON
				DT656.C1206 < DT653.C1143
			)
		LEFT OUTER JOIN
			T96 DT654
		ON
			DT653.C1142 = DT654.C1183
		)
	INNER JOIN
		T19 DT655
	ON
		DT654.C1188 < DT655.C232
	)
WHERE
	(
		(
			DT654.C1178 = DT653.C1139
		)
		OR
		(
			DT654.C1179 <> DT653.C1144
		)
	)
	AND
	(
		DT654.C1183 > DT656.C1206
	)
ORDER BY
	DT654.C1178
	, DT654.C1182
	, DT655.C231
LIMIT 333;


SELECT
	DT659.C45
	, DT660.C833
	, DT659.C35
	, DT660.C834
	, DT660.C824
	, DT661.C0
	, DT660.C830
	, DT660.C828
	, DT660.C836
	, DT659.C36
	, DT660.C829
	, DT658.C181
	, DT659.C46
	, DT660.C831
	, DT657.C656
	, DT659.C39
	, DT659.C48
	, DT659.C51
	, DT660.C825
	, DT660.C837
	, DT658.C180
	, DT661.C3
	, DT661.C1
	, DT659.C34
	, DT659.C44
	, DT659.C50
	, DT659.C32
	, DT660.C832
	, DT659.C33
	, DT657.C657
	, DT658.C185
	, DT661.C2
	, DT659.C38
FROM
	(
		(
			(
				T0 DT661
			LEFT OUTER JOIN
				(
					T69 DT660
				INNER JOIN
					T3 DT659
				ON
					DT660.C828 = DT659.C43
				)
			ON
				DT661.C0 = DT659.C45
			)
		LEFT OUTER JOIN
			T14 DT658
		ON
			DT659.C40 < DT658.C181
		)
	INNER JOIN
		T54 DT657
	ON
		DT659.C49 = DT657.C655
	)
WHERE
	(
		DT658.C183 = DT657.C654
	)
	OR
	(
		DT660.C836 > DT657.C655
	)
ORDER BY
	DT659.C45
	, DT660.C833
	, DT659.C35
	, DT660.C834
	, DT660.C824
	, DT661.C0
	, DT660.C830
	, DT660.C828
	, DT660.C836
	, DT659.C36
	, DT660.C829
	, DT658.C181
	, DT659.C46
	, DT660.C831
	, DT657.C656
	, DT659.C39
	, DT659.C48
	, DT659.C51
	, DT660.C825
	, DT660.C837
	, DT658.C180
	, DT661.C3
	, DT661.C1
	, DT659.C34
	, DT659.C44
	, DT659.C50
	, DT659.C32
	, DT660.C832
	, DT659.C33
	, DT657.C657
	, DT658.C185
	, DT661.C2
	, DT659.C38
LIMIT 367;


SELECT
	DT663.C861
FROM
	(
		T71 DT663
	CROSS JOIN
		T24 DT662
	)
WHERE
	(
		(
			DT663.C860 > DT663.C861
		)
		AND
		(
			DT663.C865 = DT662.C280
		)
	)
	OR
	(
		DT663.C862 > DT662.C282
	)
ORDER BY
	DT663.C861
LIMIT 550;


SELECT
	DT665.C1094
	, DT664.C156
	, DT665.C1100
	, DT665.C1095
	, DT665.C1103
	, DT665.C1104
	, DT665.C1112
	, DT665.C1099
FROM
	(
		T11 DT664
	LEFT OUTER JOIN
		T91 DT665
	ON
		DT664.C153 = DT665.C1110
	)
WHERE
	(
		DT665.C1097 <> DT664.C154
	)
	OR
	(
		(
			DT664.C153 <> DT665.C1109
		)
		AND
		(
			(
				DT665.C1108 = DT665.C1106
			)
			OR
			(
				DT664.C153 = DT665.C1103
			)
		)
	)
ORDER BY
	DT665.C1094
	, DT664.C156
	, DT665.C1100
	, DT665.C1095
	, DT665.C1103
	, DT665.C1104
	, DT665.C1112
	, DT665.C1099
LIMIT 974;


SELECT
	DT669.C1037
	, DT667.C509
	, DT667.C504
	, DT668.C441
	, DT666.C272
	, DT667.C505
	, DT666.C275
	, DT667.C508
	, DT669.C1033
	, DT669.C1036
	, DT669.C1044
	, DT669.C1035
	, DT668.C443
	, DT666.C270
	, DT667.C511
	, DT666.C274
	, DT667.C510
	, DT666.C276
	, DT669.C1040
	, DT666.C278
	, DT669.C1046
	, DT666.C273
	, DT669.C1042
	, DT667.C506
	, DT667.C507
	, DT669.C1041
FROM
	(
		(
			T44 DT667
		CROSS JOIN
			(
				T85 DT669
			INNER JOIN
				T23 DT666
			ON
				DT669.C1036 <> DT666.C275
			)
		)
	INNER JOIN
		T38 DT668
	ON
		DT669.C1042 < DT668.C441
	)
WHERE
	(
		DT666.C270 <> DT669.C1039
	)
	OR
	(
		DT669.C1037 <> DT666.C275
	)
ORDER BY
	DT669.C1037
	, DT667.C509
	, DT667.C504
	, DT668.C441
	, DT666.C272
	, DT667.C505
	, DT666.C275
	, DT667.C508
	, DT669.C1033
	, DT669.C1036
	, DT669.C1044
	, DT669.C1035
	, DT668.C443
	, DT666.C270
	, DT667.C511
	, DT666.C274
	, DT667.C510
	, DT666.C276
	, DT669.C1040
	, DT666.C278
	, DT669.C1046
	, DT666.C273
	, DT669.C1042
	, DT667.C506
	, DT667.C507
	, DT669.C1041
LIMIT 256;


SELECT
	DT671.C70
	, DT670.C698
	, DT672.C213
	, DT670.C701
	, DT670.C704
	, DT670.C711
	, DT670.C706
	, DT670.C699
	, DT671.C73
	, DT672.C216
	, DT672.C212
	, DT670.C705
	, DT672.C210
	, DT672.C217
	, DT672.C211
	, DT670.C702
	, DT672.C218
	, DT670.C703
	, DT670.C707
	, DT672.C207
	, DT671.C68
	, DT671.C67
	, DT672.C208
	, DT671.C74
	, DT670.C709
	, DT672.C209
FROM
	(
		T5 DT671
	INNER JOIN
		(
			T58 DT670
		LEFT OUTER JOIN
			T17 DT672
		ON
			DT670.C703 = DT672.C213
		)
	ON
		DT671.C72 = DT672.C213
	)
WHERE
	(
		(
			(
				DT672.C210 <> DT672.C217
			)
			AND
			(
				DT671.C73 = DT670.C700
			)
		)
		OR
		(
			DT671.C73 <> DT672.C212
		)
	)
	OR
	(
		DT672.C215 < DT671.C68
	)
ORDER BY
	DT671.C70
	, DT670.C698
	, DT672.C213
	, DT670.C701
	, DT670.C704
	, DT670.C711
	, DT670.C706
	, DT670.C699
	, DT671.C73
	, DT672.C216
	, DT672.C212
	, DT670.C705
	, DT672.C210
	, DT672.C217
	, DT672.C211
	, DT670.C702
	, DT672.C218
	, DT670.C703
	, DT670.C707
	, DT672.C207
	, DT671.C68
	, DT671.C67
	, DT672.C208
	, DT671.C74
	, DT670.C709
	, DT672.C209
LIMIT 497;


SELECT
	DT676.C900
	, DT676.C905
	, DT674.C514
	, DT676.C904
	, DT676.C899
	, DT675.C936
	, DT673.C993
	, DT673.C991
	, DT674.C520
	, DT674.C518
	, DT674.C524
	, DT674.C525
	, DT676.C893
	, DT676.C891
	, DT676.C898
	, DT676.C892
	, DT676.C903
	, DT676.C894
	, DT675.C933
	, DT674.C526
	, DT675.C935
	, DT674.C517
	, DT674.C522
	, DT674.C513
	, DT676.C902
	, DT674.C515
	, DT676.C908
	, DT676.C901
	, DT674.C519
	, DT673.C990
	, DT676.C890
	, DT675.C932
	, DT675.C930
	, DT676.C909
	, DT674.C512
	, DT674.C516
	, DT676.C907
	, DT676.C897
	, DT674.C527
	, DT676.C896
	, DT675.C937
	, DT675.C931
FROM
	(
		T75 DT675
	INNER JOIN
		(
			T81 DT673
		LEFT OUTER JOIN
			(
				T45 DT674
			RIGHT OUTER JOIN
				T73 DT676
			ON
				DT674.C521 <> DT676.C894
			)
		ON
			DT673.C990 < DT674.C517
		)
	ON
		DT675.C936 > DT676.C894
	)
WHERE
	(
		DT674.C516 = DT676.C896
	)
	AND
	(
		(
			DT676.C890 < DT674.C527
		)
		AND
		(
			DT676.C907 < DT676.C891
		)
	)
ORDER BY
	DT676.C900
	, DT676.C905
	, DT674.C514
	, DT676.C904
	, DT676.C899
	, DT675.C936
	, DT673.C993
	, DT673.C991
	, DT674.C520
	, DT674.C518
	, DT674.C524
	, DT674.C525
	, DT676.C893
	, DT676.C891
	, DT676.C898
	, DT676.C892
	, DT676.C903
	, DT676.C894
	, DT675.C933
	, DT674.C526
	, DT675.C935
	, DT674.C517
	, DT674.C522
	, DT674.C513
	, DT676.C902
	, DT674.C515
	, DT676.C908
	, DT676.C901
	, DT674.C519
	, DT673.C990
	, DT676.C890
	, DT675.C932
	, DT675.C930
	, DT676.C909
	, DT674.C512
	, DT674.C516
	, DT676.C907
	, DT676.C897
	, DT674.C527
	, DT676.C896
	, DT675.C937
	, DT675.C931
LIMIT 530;


SELECT
	DT679.C3
	, DT678.C809
	, DT679.C2
	, DT677.C1078
	, DT678.C814
	, DT677.C1076
	, DT678.C817
	, DT679.C1
	, DT678.C811
	, DT678.C815
	, DT678.C818
	, DT678.C819
FROM
	(
		T0 DT679
	INNER JOIN
		(
			T67 DT678
		INNER JOIN
			T89 DT677
		ON
			DT678.C815 = DT677.C1077
		)
	ON
		DT679.C3 = DT678.C811
	)
WHERE
	(
		(
			DT678.C815 > DT678.C814
		)
		OR
		(
			DT677.C1077 <> DT677.C1077
		)
	)
	AND
	(
		(
			DT678.C817 > DT677.C1076
		)
		OR
		(
			DT678.C811 = DT677.C1077
		)
	)
ORDER BY
	DT679.C3
	, DT678.C809
	, DT679.C2
	, DT677.C1078
	, DT678.C814
	, DT677.C1076
	, DT678.C817
	, DT679.C1
	, DT678.C811
	, DT678.C815
	, DT678.C818
	, DT678.C819
LIMIT 567;


SELECT
	DT681.C239
	, DT681.C242
	, DT680.C140
FROM
	(
		T20 DT681
	INNER JOIN
		T10 DT680
	ON
		DT681.C241 = DT680.C140
	)
WHERE
	(
		DT680.C144 = DT681.C244
	)
	OR
	(
		DT681.C246 <> DT681.C238
	)
ORDER BY
	DT681.C239
	, DT681.C242
	, DT680.C140
LIMIT 637;


SELECT
	DT683.C566
	, DT684.C179
	, DT684.C169
	, DT684.C170
	, DT684.C178
	, DT682.C740
	, DT683.C558
	, DT684.C176
	, DT684.C175
	, DT683.C559
	, DT683.C552
	, DT682.C742
	, DT683.C562
	, DT684.C164
	, DT683.C560
	, DT684.C167
	, DT683.C553
	, DT684.C165
	, DT683.C557
	, DT683.C549
	, DT683.C551
	, DT683.C564
	, DT683.C561
	, DT683.C550
	, DT684.C177
FROM
	(
		(
			T47 DT683
		LEFT OUTER JOIN
			T62 DT682
		ON
			DT683.C565 = DT682.C740
		)
	LEFT OUTER JOIN
		T13 DT684
	ON
		DT683.C553 < DT684.C170
	)
WHERE
	(
		DT684.C169 < DT684.C171
	)
	AND
	(
		(
			DT684.C165 = DT682.C742
		)
		AND
		(
			DT683.C562 = DT683.C561
		)
	)
ORDER BY
	DT683.C566
	, DT684.C179
	, DT684.C169
	, DT684.C170
	, DT684.C178
	, DT682.C740
	, DT683.C558
	, DT684.C176
	, DT684.C175
	, DT683.C559
	, DT683.C552
	, DT682.C742
	, DT683.C562
	, DT684.C164
	, DT683.C560
	, DT684.C167
	, DT683.C553
	, DT684.C165
	, DT683.C557
	, DT683.C549
	, DT683.C551
	, DT683.C564
	, DT683.C561
	, DT683.C550
	, DT684.C177
LIMIT 918;


SELECT
	DT685.C679
	, DT687.C480
	, DT688.C20
	, DT687.C484
	, DT688.C23
	, DT688.C26
	, DT688.C21
	, DT686.C288
	, DT687.C475
	, DT685.C675
	, DT687.C481
	, DT687.C483
	, DT688.C31
	, DT687.C486
	, DT686.C292
	, DT686.C293
	, DT688.C22
	, DT685.C677
FROM
	(
		T42 DT687
	RIGHT OUTER JOIN
		(
			T25 DT686
		RIGHT OUTER JOIN
			(
				T56 DT685
			LEFT OUTER JOIN
				T2 DT688
			ON
				DT685.C679 = DT688.C27
			)
		ON
			DT686.C288 = DT688.C24
		)
	ON
		DT687.C486 = DT685.C673
	)
WHERE
	(
		DT685.C668 = DT685.C669
	)
	OR
	(
		DT687.C478 > DT688.C23
	)
ORDER BY
	DT685.C679
	, DT687.C480
	, DT688.C20
	, DT687.C484
	, DT688.C23
	, DT688.C26
	, DT688.C21
	, DT686.C288
	, DT687.C475
	, DT685.C675
	, DT687.C481
	, DT687.C483
	, DT688.C31
	, DT687.C486
	, DT686.C292
	, DT686.C293
	, DT688.C22
	, DT685.C677
LIMIT 729;


SELECT
	DT689.C547
	, DT690.C1193
	, DT690.C1194
	, DT689.C545
	, DT689.C538
	, DT689.C541
	, DT690.C1200
	, DT689.C533
	, DT689.C546
	, DT690.C1199
	, DT689.C528
	, DT689.C539
FROM
	(
		T46 DT689
	INNER JOIN
		T97 DT690
	ON
		DT689.C545 < DT690.C1198
	)
WHERE
	(
		DT689.C544 <> DT689.C544
	)
	AND
	(
		DT690.C1200 > DT690.C1190
	)
ORDER BY
	DT689.C547
	, DT690.C1193
	, DT690.C1194
	, DT689.C545
	, DT689.C538
	, DT689.C541
	, DT690.C1200
	, DT689.C533
	, DT689.C546
	, DT690.C1199
	, DT689.C528
	, DT689.C539
LIMIT 138;


SELECT
	DT692.C1170
	, DT692.C1172
	, DT691.C217
	, DT691.C211
	, DT691.C207
	, DT692.C1173
	, DT692.C1167
	, DT691.C218
	, DT691.C214
	, DT691.C215
	, DT692.C1169
	, DT691.C210
	, DT691.C212
	, DT692.C1175
	, DT691.C216
	, DT691.C213
	, DT691.C209
FROM
	(
		T95 DT692
	RIGHT OUTER JOIN
		T17 DT691
	ON
		DT692.C1169 > DT691.C215
	)
WHERE
	(
		DT692.C1172 = DT692.C1175
	)
	OR
	(
		(
			DT692.C1174 > DT691.C218
		)
		AND
		(
			DT692.C1173 = DT691.C209
		)
	)
ORDER BY
	DT692.C1170
	, DT692.C1172
	, DT691.C217
	, DT691.C211
	, DT691.C207
	, DT692.C1173
	, DT692.C1167
	, DT691.C218
	, DT691.C214
	, DT691.C215
	, DT692.C1169
	, DT691.C210
	, DT691.C212
	, DT692.C1175
	, DT691.C216
	, DT691.C213
	, DT691.C209
LIMIT 339;


SELECT
	DT695.C222
	, DT695.C229
	, DT693.C688
	, DT695.C228
	, DT694.C232
	, DT693.C689
	, DT693.C695
	, DT694.C231
FROM
	(
		T18 DT695
	CROSS JOIN
		(
			T19 DT694
		RIGHT OUTER JOIN
			T57 DT693
		ON
			DT694.C232 = DT693.C696
		)
	)
WHERE
	(
		DT693.C697 > DT693.C685
	)
	AND
	(
		DT695.C226 > DT694.C231
	)
ORDER BY
	DT695.C222
	, DT695.C229
	, DT693.C688
	, DT695.C228
	, DT694.C232
	, DT693.C689
	, DT693.C695
	, DT694.C231
LIMIT 643;


SELECT
	DT697.C489
	, DT696.C367
	, DT696.C366
	, DT697.C495
	, DT696.C380
	, DT696.C369
	, DT696.C382
FROM
	(
		T43 DT697
	INNER JOIN
		T32 DT696
	ON
		DT697.C495 > DT696.C371
	)
WHERE
	(
		DT697.C488 <> DT697.C501
	)
	AND
	(
		(
			(
				DT696.C371 <> DT696.C370
			)
			AND
			(
				DT696.C365 <> DT696.C368
			)
		)
		AND
		(
			DT696.C382 = DT696.C379
		)
	)
ORDER BY
	DT697.C489
	, DT696.C367
	, DT696.C366
	, DT697.C495
	, DT696.C380
	, DT696.C369
	, DT696.C382
LIMIT 793;


SELECT
	DT698.C265
	, DT699.C1070
	, DT699.C1068
	, DT699.C1065
	, DT699.C1064
	, DT698.C262
	, DT699.C1069
	, DT699.C1066
	, DT698.C268
	, DT699.C1067
FROM
	(
		T88 DT699
	INNER JOIN
		T22 DT698
	ON
		DT699.C1064 < DT698.C267
	)
WHERE
	(
		(
			DT699.C1074 < DT699.C1068
		)
		OR
		(
			DT699.C1074 <> DT698.C264
		)
	)
	OR
	(
		DT698.C260 = DT698.C265
	)
ORDER BY
	DT698.C265
	, DT699.C1070
	, DT699.C1068
	, DT699.C1065
	, DT699.C1064
	, DT698.C262
	, DT699.C1069
	, DT699.C1066
	, DT698.C268
	, DT699.C1067
LIMIT 704;


SELECT
	DT701.C1201
	, DT702.C185
	, DT700.C60
	, DT702.C184
	, DT700.C63
	, DT700.C55
	, DT702.C180
	, DT700.C59
	, DT700.C64
	, DT703.C232
	, DT701.C1202
	, DT700.C58
	, DT702.C183
	, DT700.C61
	, DT702.C182
	, DT701.C1203
	, DT700.C56
	, DT700.C62
	, DT700.C53
	, DT700.C54
	, DT700.C65
	, DT702.C181
	, DT703.C230
	, DT703.C231
FROM
	(
		T14 DT702
	CROSS JOIN
		(
			(
				T4 DT700
			LEFT OUTER JOIN
				T19 DT703
			ON
				DT700.C62 <> DT703.C230
			)
		RIGHT OUTER JOIN
			T98 DT701
		ON
			DT700.C61 <> DT701.C1203
		)
	)
WHERE
	(
		(
			(
				DT701.C1203 = DT703.C230
			)
			OR
			(
				DT702.C183 < DT700.C64
			)
		)
		OR
		(
			DT702.C185 <> DT702.C180
		)
	)
	OR
	(
		DT700.C60 = DT700.C59
	)
ORDER BY
	DT701.C1201
	, DT702.C185
	, DT700.C60
	, DT702.C184
	, DT700.C63
	, DT700.C55
	, DT702.C180
	, DT700.C59
	, DT700.C64
	, DT703.C232
	, DT701.C1202
	, DT700.C58
	, DT702.C183
	, DT700.C61
	, DT702.C182
	, DT701.C1203
	, DT700.C56
	, DT700.C62
	, DT700.C53
	, DT700.C54
	, DT700.C65
	, DT702.C181
	, DT703.C230
	, DT703.C231
LIMIT 201;


SELECT
	DT708.C326
	, DT705.C15
	, DT707.C75
	, DT708.C321
	, DT707.C78
	, DT705.C24
	, DT707.C81
	, DT705.C26
	, DT708.C319
	, DT705.C31
	, DT706.C656
	, DT708.C320
	, DT706.C654
	, DT704.C438
	, DT707.C84
	, DT704.C440
	, DT708.C322
	, DT707.C87
	, DT705.C28
	, DT707.C80
	, DT705.C23
FROM
	(
		(
			(
				T2 DT705
			INNER JOIN
				T37 DT704
			ON
				DT705.C16 = DT704.C439
			)
		LEFT OUTER JOIN
			T54 DT706
		ON
			DT705.C27 > DT706.C656
		)
	INNER JOIN
		(
			T27 DT708
		INNER JOIN
			T6 DT707
		ON
			DT708.C321 = DT707.C80
		)
	ON
		DT706.C655 = DT708.C321
	)
WHERE
	(
		DT705.C25 = DT705.C29
	)
	OR
	(
		(
			DT708.C326 = DT705.C24
		)
		AND
		(
			DT706.C654 = DT708.C324
		)
	)
ORDER BY
	DT708.C326
	, DT705.C15
	, DT707.C75
	, DT708.C321
	, DT707.C78
	, DT705.C24
	, DT707.C81
	, DT705.C26
	, DT708.C319
	, DT705.C31
	, DT706.C656
	, DT708.C320
	, DT706.C654
	, DT704.C438
	, DT707.C84
	, DT704.C440
	, DT708.C322
	, DT707.C87
	, DT705.C28
	, DT707.C80
	, DT705.C23
LIMIT 451;


SELECT
	DT710.C535
	, DT710.C546
	, DT710.C538
	, DT710.C530
	, DT710.C545
	, DT710.C543
	, DT710.C547
	, DT710.C537
	, DT709.C987
	, DT710.C528
	, DT710.C539
	, DT709.C988
	, DT710.C533
	, DT710.C531
	, DT710.C544
	, DT710.C532
	, DT709.C989
	, DT710.C536
	, DT710.C534
	, DT710.C529
	, DT709.C986
	, DT710.C542
	, DT710.C540
FROM
	(
		T80 DT709
	LEFT OUTER JOIN
		T46 DT710
	ON
		DT709.C987 = DT710.C541
	)
WHERE
	(
		DT710.C536 < DT710.C537
	)
	AND
	(
		(
			DT710.C546 = DT710.C538
		)
		OR
		(
			DT710.C538 < DT710.C537
		)
	)
ORDER BY
	DT710.C535
	, DT710.C546
	, DT710.C538
	, DT710.C530
	, DT710.C545
	, DT710.C543
	, DT710.C547
	, DT710.C537
	, DT709.C987
	, DT710.C528
	, DT710.C539
	, DT709.C988
	, DT710.C533
	, DT710.C531
	, DT710.C544
	, DT710.C532
	, DT709.C989
	, DT710.C536
	, DT710.C534
	, DT710.C529
	, DT709.C986
	, DT710.C542
	, DT710.C540
LIMIT 275;


SELECT
	DT711.C2
	, DT712.C0
	, DT711.C1
	, DT711.C0
	, DT712.C2
	, DT711.C3
	, DT712.C3
FROM
	(
		T0 DT711
	RIGHT OUTER JOIN
		T0 DT712
	ON
		DT711.C2 > DT712.C0
	)
WHERE
	(
		DT712.C1 <> DT712.C1
	)
	AND
	(
		DT711.C3 = DT712.C2
	)
ORDER BY
	DT711.C2
	, DT712.C0
	, DT711.C1
	, DT711.C0
	, DT712.C2
	, DT711.C3
	, DT712.C3
LIMIT 811;


SELECT
	DT713.C650
	, DT716.C637
	, DT713.C644
	, DT714.C390
	, DT716.C640
	, DT717.C574
	, DT717.C580
	, DT713.C645
	, DT713.C638
	, DT717.C568
	, DT716.C652
	, DT713.C639
	, DT714.C399
	, DT715.C1062
	, DT716.C646
	, DT713.C653
	, DT717.C571
	, DT716.C636
	, DT713.C640
	, DT714.C395
	, DT714.C385
FROM
	(
		T53 DT716
	INNER JOIN
		(
			(
				(
					T33 DT714
				CROSS JOIN
					T53 DT713
				)
			RIGHT OUTER JOIN
				T87 DT715
			ON
				DT714.C396 = DT715.C1062
			)
		LEFT OUTER JOIN
			T48 DT717
		ON
			DT713.C651 <> DT717.C579
		)
	ON
		DT716.C641 < DT714.C388
	)
WHERE
	(
		DT716.C651 <> DT716.C648
	)
	AND
	(
		(
			(
				DT716.C636 < DT715.C1056
			)
			AND
			(
				DT716.C638 <> DT713.C640
			)
		)
		OR
		(
			DT714.C397 <> DT717.C580
		)
	)
ORDER BY
	DT713.C650
	, DT716.C637
	, DT713.C644
	, DT714.C390
	, DT716.C640
	, DT717.C574
	, DT717.C580
	, DT713.C645
	, DT713.C638
	, DT717.C568
	, DT716.C652
	, DT713.C639
	, DT714.C399
	, DT715.C1062
	, DT716.C646
	, DT713.C653
	, DT717.C571
	, DT716.C636
	, DT713.C640
	, DT714.C395
	, DT714.C385
LIMIT 564;


SELECT
	DT718.C887
FROM
	(
		T72 DT718
	RIGHT OUTER JOIN
		T90 DT719
	ON
		DT718.C875 > DT719.C1083
	)
WHERE
	(
		(
			DT718.C886 > DT719.C1081
		)
		OR
		(
			DT719.C1087 = DT718.C876
		)
	)
	OR
	(
		(
			DT719.C1085 < DT719.C1079
		)
		AND
		(
			DT718.C884 <> DT718.C875
		)
	)
ORDER BY
	DT718.C887
LIMIT 581;


SELECT
	DT722.C1136
	, DT720.C628
	, DT720.C627
	, DT722.C1138
	, DT720.C635
	, DT721.C823
	, DT720.C634
	, DT720.C625
	, DT721.C822
	, DT720.C629
	, DT721.C821
	, DT722.C1141
	, DT722.C1142
FROM
	(
		T52 DT720
	LEFT OUTER JOIN
		(
			T93 DT722
		LEFT OUTER JOIN
			T68 DT721
		ON
			DT722.C1142 <> DT721.C823
		)
	ON
		DT720.C633 = DT722.C1140
	)
WHERE
	(
		DT720.C635 < DT722.C1142
	)
	OR
	(
		(
			DT720.C626 < DT722.C1140
		)
		OR
		(
			(
				DT720.C629 = DT722.C1136
			)
			OR
			(
				DT722.C1140 <> DT722.C1137
			)
		)
	)
ORDER BY
	DT722.C1136
	, DT720.C628
	, DT720.C627
	, DT722.C1138
	, DT720.C635
	, DT721.C823
	, DT720.C634
	, DT720.C625
	, DT721.C822
	, DT720.C629
	, DT721.C821
	, DT722.C1141
	, DT722.C1142
LIMIT 299;


SELECT
	DT723.C1087
	, DT724.C356
	, DT725.C388
	, DT723.C1083
	, DT725.C398
	, DT723.C1079
	, DT724.C349
	, DT724.C358
	, DT724.C362
	, DT725.C391
	, DT725.C387
	, DT724.C346
	, DT724.C353
	, DT724.C361
	, DT723.C1082
	, DT723.C1092
	, DT724.C350
	, DT724.C351
	, DT724.C360
	, DT723.C1081
	, DT725.C389
	, DT723.C1085
	, DT724.C354
	, DT725.C395
	, DT725.C399
	, DT725.C401
	, DT725.C383
	, DT724.C345
	, DT723.C1084
	, DT725.C394
	, DT723.C1086
	, DT725.C396
	, DT723.C1089
	, DT724.C355
FROM
	(
		T31 DT724
	RIGHT OUTER JOIN
		(
			T33 DT725
		INNER JOIN
			T90 DT723
		ON
			DT725.C396 = DT723.C1083
		)
	ON
		DT724.C354 = DT725.C390
	)
WHERE
	(
		(
			(
				DT723.C1090 = DT724.C353
			)
			OR
			(
				DT725.C393 > DT724.C347
			)
		)
		OR
		(
			DT724.C347 = DT723.C1092
		)
	)
	OR
	(
		DT725.C389 > DT725.C394
	)
ORDER BY
	DT723.C1087
	, DT724.C356
	, DT725.C388
	, DT723.C1083
	, DT725.C398
	, DT723.C1079
	, DT724.C349
	, DT724.C358
	, DT724.C362
	, DT725.C391
	, DT725.C387
	, DT724.C346
	, DT724.C353
	, DT724.C361
	, DT723.C1082
	, DT723.C1092
	, DT724.C350
	, DT724.C351
	, DT724.C360
	, DT723.C1081
	, DT725.C389
	, DT723.C1085
	, DT724.C354
	, DT725.C395
	, DT725.C399
	, DT725.C401
	, DT725.C383
	, DT724.C345
	, DT723.C1084
	, DT725.C394
	, DT723.C1086
	, DT725.C396
	, DT723.C1089
	, DT724.C355
LIMIT 184;


SELECT
	DT727.C1140
	, DT727.C1139
	, DT726.C447
FROM
	(
		T40 DT726
	INNER JOIN
		T93 DT727
	ON
		DT726.C450 = DT727.C1140
	)
WHERE
	(
		(
			DT726.C450 = DT727.C1137
		)
		AND
		(
			DT727.C1139 = DT727.C1136
		)
	)
	OR
	(
		DT726.C450 <> DT726.C450
	)
ORDER BY
	DT727.C1140
	, DT727.C1139
	, DT726.C447
LIMIT 903;


SELECT
	DT729.C913
	, DT728.C478
	, DT728.C479
	, DT728.C473
	, DT729.C914
	, DT728.C486
	, DT728.C482
	, DT728.C477
	, DT728.C484
	, DT729.C910
	, DT729.C927
	, DT728.C474
	, DT730.C821
	, DT729.C925
	, DT729.C911
	, DT729.C929
	, DT730.C823
	, DT729.C923
	, DT728.C480
	, DT729.C922
	, DT728.C483
	, DT729.C928
FROM
	(
		T42 DT728
	INNER JOIN
		(
			T68 DT730
		INNER JOIN
			T74 DT729
		ON
			DT730.C823 = DT729.C927
		)
	ON
		DT728.C476 = DT729.C926
	)
WHERE
	(
		DT728.C481 > DT728.C484
	)
	OR
	(
		(
			(
				DT729.C926 = DT729.C921
			)
			AND
			(
				DT729.C921 = DT729.C927
			)
		)
		OR
		(
			DT729.C925 = DT729.C922
		)
	)
ORDER BY
	DT729.C913
	, DT728.C478
	, DT728.C479
	, DT728.C473
	, DT729.C914
	, DT728.C486
	, DT728.C482
	, DT728.C477
	, DT728.C484
	, DT729.C910
	, DT729.C927
	, DT728.C474
	, DT730.C821
	, DT729.C925
	, DT729.C911
	, DT729.C929
	, DT730.C823
	, DT729.C923
	, DT728.C480
	, DT729.C922
	, DT728.C483
	, DT729.C928
LIMIT 202;


SELECT
	DT734.C1073
	, DT733.C680
	, DT733.C677
	, DT731.C162
	, DT732.C840
	, DT732.C852
	, DT732.C859
	, DT734.C1066
	, DT732.C847
	, DT731.C163
	, DT733.C675
	, DT734.C1070
	, DT731.C158
	, DT732.C846
	, DT733.C681
	, DT732.C857
	, DT733.C676
	, DT732.C853
	, DT734.C1065
	, DT734.C1064
	, DT732.C850
	, DT731.C159
	, DT733.C668
	, DT734.C1074
	, DT734.C1075
	, DT732.C858
	, DT732.C856
	, DT733.C670
	, DT734.C1071
	, DT733.C679
	, DT734.C1069
	, DT732.C842
	, DT734.C1067
	, DT733.C674
	, DT732.C851
	, DT733.C672
	, DT733.C671
	, DT733.C678
	, DT733.C673
	, DT732.C839
	, DT732.C855
	, DT732.C848
	, DT731.C157
	, DT732.C849
	, DT734.C1068
	, DT732.C844
	, DT734.C1072
	, DT731.C161
	, DT733.C669
	, DT732.C854
FROM
	(
		(
			T70 DT732
		INNER JOIN
			(
				T12 DT731
			INNER JOIN
				T56 DT733
			ON
				DT731.C157 < DT733.C681
			)
		ON
			DT732.C842 = DT731.C162
		)
	LEFT OUTER JOIN
		T88 DT734
	ON
		DT733.C668 = DT734.C1072
	)
WHERE
	(
		(
			DT732.C858 = DT733.C676
		)
		AND
		(
			DT734.C1075 = DT733.C673
		)
	)
	AND
	(
		DT734.C1065 <> DT733.C681
	)
ORDER BY
	DT734.C1073
	, DT733.C680
	, DT733.C677
	, DT731.C162
	, DT732.C840
	, DT732.C852
	, DT732.C859
	, DT734.C1066
	, DT732.C847
	, DT731.C163
	, DT733.C675
	, DT734.C1070
	, DT731.C158
	, DT732.C846
	, DT733.C681
	, DT732.C857
	, DT733.C676
	, DT732.C853
	, DT734.C1065
	, DT734.C1064
	, DT732.C850
	, DT731.C159
	, DT733.C668
	, DT734.C1074
	, DT734.C1075
	, DT732.C858
	, DT732.C856
	, DT733.C670
	, DT734.C1071
	, DT733.C679
	, DT734.C1069
	, DT732.C842
	, DT734.C1067
	, DT733.C674
	, DT732.C851
	, DT733.C672
	, DT733.C671
	, DT733.C678
	, DT733.C673
	, DT732.C839
	, DT732.C855
	, DT732.C848
	, DT731.C157
	, DT732.C849
	, DT734.C1068
	, DT732.C844
	, DT734.C1072
	, DT731.C161
	, DT733.C669
	, DT732.C854
LIMIT 811;


SELECT
	DT735.C477
	, DT735.C476
	, DT735.C474
	, DT735.C475
	, DT736.C282
	, DT735.C473
	, DT735.C478
FROM
	(
		T42 DT735
	INNER JOIN
		T24 DT736
	ON
		DT735.C477 = DT736.C282
	)
WHERE
	(
		(
			DT735.C485 <> DT735.C473
		)
		AND
		(
			DT735.C485 = DT736.C280
		)
	)
	OR
	(
		DT735.C480 <> DT736.C282
	)
ORDER BY
	DT735.C477
	, DT735.C476
	, DT735.C474
	, DT735.C475
	, DT736.C282
	, DT735.C473
	, DT735.C478
LIMIT 403;


SELECT
	DT740.C316
	, DT738.C486
	, DT739.C196
	, DT740.C306
	, DT737.C327
	, DT739.C189
	, DT738.C473
	, DT740.C318
	, DT739.C193
	, DT740.C315
	, DT739.C197
	, DT740.C310
	, DT740.C299
	, DT739.C195
	, DT739.C186
	, DT738.C480
	, DT740.C307
	, DT737.C323
	, DT738.C483
	, DT740.C302
	, DT737.C320
	, DT740.C297
	, DT740.C317
	, DT738.C482
	, DT740.C305
	, DT737.C326
	, DT737.C324
	, DT740.C304
	, DT738.C479
	, DT740.C298
	, DT739.C187
	, DT740.C303
	, DT738.C481
	, DT739.C192
	, DT738.C484
	, DT738.C477
	, DT740.C308
	, DT739.C190
	, DT740.C301
	, DT740.C311
	, DT740.C312
	, DT738.C476
	, DT739.C199
	, DT738.C474
	, DT740.C313
	, DT737.C321
	, DT740.C300
	, DT738.C485
FROM
	(
		T26 DT740
	INNER JOIN
		(
			(
				T15 DT739
			RIGHT OUTER JOIN
				T27 DT737
			ON
				DT739.C188 = DT737.C321
			)
		CROSS JOIN
			T42 DT738
		)
	ON
		DT740.C306 > DT738.C481
	)
WHERE
	(
		DT739.C194 = DT738.C485
	)
	OR
	(
		(
			(
				DT737.C325 = DT740.C314
			)
			OR
			(
				DT737.C325 = DT740.C315
			)
		)
		AND
		(
			DT740.C309 = DT739.C186
		)
	)
ORDER BY
	DT740.C316
	, DT738.C486
	, DT739.C196
	, DT740.C306
	, DT737.C327
	, DT739.C189
	, DT738.C473
	, DT740.C318
	, DT739.C193
	, DT740.C315
	, DT739.C197
	, DT740.C310
	, DT740.C299
	, DT739.C195
	, DT739.C186
	, DT738.C480
	, DT740.C307
	, DT737.C323
	, DT738.C483
	, DT740.C302
	, DT737.C320
	, DT740.C297
	, DT740.C317
	, DT738.C482
	, DT740.C305
	, DT737.C326
	, DT737.C324
	, DT740.C304
	, DT738.C479
	, DT740.C298
	, DT739.C187
	, DT740.C303
	, DT738.C481
	, DT739.C192
	, DT738.C484
	, DT738.C477
	, DT740.C308
	, DT739.C190
	, DT740.C301
	, DT740.C311
	, DT740.C312
	, DT738.C476
	, DT739.C199
	, DT738.C474
	, DT740.C313
	, DT737.C321
	, DT740.C300
	, DT738.C485
LIMIT 246;


SELECT
	DT743.C891
	, DT741.C451
	, DT743.C896
	, DT741.C470
	, DT742.C610
	, DT742.C608
	, DT741.C466
	, DT741.C463
	, DT745.C261
	, DT742.C623
	, DT744.C1170
	, DT745.C266
	, DT741.C461
	, DT741.C472
	, DT743.C890
	, DT743.C902
	, DT742.C619
	, DT744.C1174
	, DT742.C622
	, DT743.C900
	, DT744.C1167
	, DT742.C618
	, DT741.C459
	, DT745.C259
	, DT744.C1169
	, DT741.C453
	, DT742.C614
	, DT742.C612
	, DT741.C454
	, DT741.C458
	, DT743.C901
	, DT742.C621
	, DT741.C465
	, DT743.C892
	, DT743.C905
	, DT741.C469
	, DT741.C471
	, DT742.C620
	, DT741.C452
	, DT743.C909
	, DT741.C464
	, DT744.C1168
	, DT743.C897
	, DT745.C262
	, DT741.C460
	, DT742.C617
	, DT745.C260
	, DT743.C898
FROM
	(
		(
			(
				T95 DT744
			INNER JOIN
				T22 DT745
			ON
				DT744.C1172 = DT745.C269
			)
		LEFT OUTER JOIN
			(
				T73 DT743
			INNER JOIN
				T41 DT741
			ON
				DT743.C897 > DT741.C455
			)
		ON
			DT744.C1169 <> DT741.C471
		)
	INNER JOIN
		T51 DT742
	ON
		DT744.C1170 < DT742.C619
	)
WHERE
	(
		(
			DT742.C624 = DT743.C902
		)
		OR
		(
			DT741.C455 = DT744.C1173
		)
	)
	AND
	(
		DT743.C906 > DT743.C901
	)
ORDER BY
	DT743.C891
	, DT741.C451
	, DT743.C896
	, DT741.C470
	, DT742.C610
	, DT742.C608
	, DT741.C466
	, DT741.C463
	, DT745.C261
	, DT742.C623
	, DT744.C1170
	, DT745.C266
	, DT741.C461
	, DT741.C472
	, DT743.C890
	, DT743.C902
	, DT742.C619
	, DT744.C1174
	, DT742.C622
	, DT743.C900
	, DT744.C1167
	, DT742.C618
	, DT741.C459
	, DT745.C259
	, DT744.C1169
	, DT741.C453
	, DT742.C614
	, DT742.C612
	, DT741.C454
	, DT741.C458
	, DT743.C901
	, DT742.C621
	, DT741.C465
	, DT743.C892
	, DT743.C905
	, DT741.C469
	, DT741.C471
	, DT742.C620
	, DT741.C452
	, DT743.C909
	, DT741.C464
	, DT744.C1168
	, DT743.C897
	, DT745.C262
	, DT741.C460
	, DT742.C617
	, DT745.C260
	, DT743.C898
LIMIT 660;


SELECT
	DT746.C253
	, DT747.C271
	, DT746.C257
	, DT747.C277
	, DT747.C273
FROM
	(
		T21 DT746
	INNER JOIN
		T23 DT747
	ON
		DT746.C258 <> DT747.C278
	)
WHERE
	(
		(
			DT746.C254 = DT747.C278
		)
		AND
		(
			DT746.C249 > DT746.C258
		)
	)
	OR
	(
		(
			DT746.C252 = DT746.C249
		)
		OR
		(
			DT747.C273 = DT747.C273
		)
	)
ORDER BY
	DT746.C253
	, DT747.C271
	, DT746.C257
	, DT747.C277
	, DT747.C273
LIMIT 300;


SELECT
	DT748.C120
	, DT748.C117
	, DT748.C112
	, DT748.C110
	, DT749.C279
	, DT748.C118
	, DT748.C119
FROM
	(
		T8 DT748
	RIGHT OUTER JOIN
		T24 DT749
	ON
		DT748.C118 > DT749.C279
	)
WHERE
	(
		(
			DT748.C122 = DT749.C279
		)
		OR
		(
			DT748.C117 <> DT748.C125
		)
	)
	OR
	(
		DT748.C121 < DT749.C280
	)
ORDER BY
	DT748.C120
	, DT748.C117
	, DT748.C112
	, DT748.C110
	, DT749.C279
	, DT748.C118
	, DT748.C119
LIMIT 938;



SELECT
	DT102.C339
	, DT102.C340
	, DT100.C498
	, SUM( DT102.C339 )
	, SUM( DT102.C340 )
	, COUNT( DT100.C498 )
	,
	(
	SELECT
		MIN( DT107.C1215 )
	FROM
		(
		SELECT
			DT103.C884
			, MAX( DT103.C884 )
		FROM
			(
				T44 DT105
			INNER JOIN
				(
					T56 DT106
				LEFT OUTER JOIN
					(
						T40 DT104
					INNER JOIN
						T72 DT103
					ON
						DT104.C449 = DT103.C873
					)
				ON
					DT106.C676 > DT103.C877
				)
			ON
				DT105.C508 = DT106.C678
			)
		WHERE
			(
				DT105.C506 < DT105.C506
			)
			AND
			(
				DT103.C870 > DT103.C878
			)
		GROUP BY
			DT103.C874
			, DT103.C884
			, DT103.C872
		ORDER BY
			DT103.C884
			, MAX( DT103.C884 )
		LIMIT 380
		)  DT107 ( C1215, C1216 ) 
	
	)
	AS C1219

FROM
	(
		(
			T43 DT100
		INNER JOIN
			T33 DT101
		ON
			DT100.C498 = DT101.C401
		)
	INNER JOIN
		T29 DT102
	ON
		DT101.C385 = DT102.C338
	)
WHERE
	(
		(
			DT101.C390 = DT100.C500
		)
		OR
		(
			(
				DT102.C338 <> DT101.C388
			)
			AND
			(
				DT102.C336 < DT100.C494
			)
		)
	)
	OR
	(
		(
			DT101.C391 < DT101.C399
		)
		AND
		(
			DT102.C335 = DT100.C490
		)
	)
GROUP BY
	DT100.C498
	, DT102.C339
	, DT102.C340
ORDER BY
	DT102.C339
	, DT102.C340
	, DT100.C498
	, SUM( DT102.C339 )
	, SUM( DT102.C340 )
	, COUNT( DT100.C498 )
	, C1219
LIMIT 735;


SELECT
	DT113.C267
	, DT108.C16
	, MAX( DT108.C16 )
	, COUNT( DT113.C266 )
	, DT108.C21
FROM
	(
		(
			T22 DT113
		INNER JOIN
			(
			SELECT
				COUNT( DT110.C951 )
				, DT110.C961
				, COUNT( DT110.C960 )
				, DT110.C951
				, DT110.C960
			FROM
				(
					T28 DT109
				INNER JOIN
					T77 DT110
				ON
					DT109.C330 = DT110.C959
				)
			WHERE
				(
					DT109.C333 = DT110.C953
				)
				AND
				(
					DT110.C961 = DT110.C952
				)
			GROUP BY
				DT110.C951
				, DT110.C960
				, DT110.C961
				, DT110.C948
			ORDER BY
				COUNT( DT110.C951 )
				, DT110.C961
				, COUNT( DT110.C960 )
				, DT110.C951
				, DT110.C960
			LIMIT 169
			)  DT111 ( C1222, C1223, C1224, C1225, C1226 ) 
		ON
			DT113.C262 = DT111.C1223
		)
	INNER JOIN
		(
			T2 DT108
		INNER JOIN
			T54 DT112
		ON
			DT108.C27 <> DT112.C657
		)
	ON
		DT111.C1226 <> DT108.C23
	)
WHERE
	(
		(
			DT108.C19 = DT112.C655
		)
		AND
		(
			DT108.C21 = DT111.C1223
		)
	)
	OR
	(
		DT112.C654 = DT108.C17
	)
GROUP BY
	DT108.C21
	, DT108.C16
	, DT113.C267
	, DT113.C266
ORDER BY
	DT113.C267
	, DT108.C16
	, MAX( DT108.C16 )
	, COUNT( DT113.C266 )
	, DT108.C21
LIMIT 357;


SELECT
	DT114.C746
FROM
	(
		T63 DT114
	INNER JOIN
		(
			(
			SELECT
				COUNT( DT115.C727 )
				, MIN( DT115.C728 )
				, DT115.C729
				, DT115.C727
				, SUM( DT115.C729 )
			FROM
				(
					T61 DT115
				INNER JOIN
					T54 DT116
				ON
					DT115.C731 < DT116.C657
				)
			WHERE
				(
					DT116.C654 < DT116.C654
				)
				OR
				(
					DT115.C726 = DT116.C655
				)
			GROUP BY
				DT115.C729
				, DT115.C727
				, DT115.C728
			ORDER BY
				COUNT( DT115.C727 )
				, MIN( DT115.C728 )
				, DT115.C729
				, DT115.C727
				, SUM( DT115.C729 )
			LIMIT 210
			) AS DT117 ( C1232, C1233, C1234, C1235, C1236 ) 
		INNER JOIN
			(
			SELECT
				DT120.C372
				, MAX( DT120.C372 )
				, MAX( DT119.C169 )
				, DT120.C371
				, AVG( DT120.C371 )
			FROM
				(
					T13 DT119
				INNER JOIN
					(
						T32 DT120
					INNER JOIN
						T94 DT118
					ON
						DT120.C373 <> DT118.C1158
					)
				ON
					DT119.C177 <> DT118.C1157
				)
			WHERE
				(
					(
						DT118.C1154 = DT120.C379
					)
					OR
					(
						DT120.C374 = DT119.C175
					)
				)
				AND
				(
					(
						(
							DT118.C1164 > DT120.C364
						)
						OR
						(
							DT120.C369 = DT120.C377
						)
					)
					OR
					(
						DT118.C1163 = DT118.C1148
					)
				)
			GROUP BY
				DT119.C169
				, DT120.C372
				, DT120.C371
			ORDER BY
				DT120.C372
				, MAX( DT120.C372 )
				, MAX( DT119.C169 )
				, DT120.C371
				, AVG( DT120.C371 )
			LIMIT 602
			)  DT121 ( C1240, C1241, C1242, C1243, C1244 ) 
		ON
			DT117.C1234 = DT121.C1243
		)
	ON
		DT114.C755 <> DT121.C1244
	)
WHERE
	(
		(
			DT121.C1243 <> DT114.C746
		)
		OR
		(
			DT114.C749 < DT117.C1236
		)
	)
	OR
	(
		DT114.C759 > DT114.C754
	)
GROUP BY
	DT114.C746
	, DT114.C757
	, DT114.C763
ORDER BY
	DT114.C746
LIMIT 825;


SELECT
	DT122.C885
	, DT122.C880
FROM
	(
		T71 DT123
	INNER JOIN
		T72 DT122
	ON
		DT123.C860 = DT122.C881
	)
WHERE
	(
		(
			(
				(
					DT123.C863 = DT122.C869
				)
				OR
				(
					DT122.C875 = DT122.C870
				)
			)
			OR
			(
				DT122.C883 = DT123.C862
			)
		)
		AND
		(
			DT122.C867 = DT122.C879
		)
	)
	OR
	(
		DT122.C881 = DT122.C887
	)
GROUP BY
	DT122.C880
	, DT122.C879
	, DT122.C871
	, DT122.C885
ORDER BY
	DT122.C885
	, DT122.C880
LIMIT 804;


SELECT
	AVG( DT126.C1074 )
	, DT125.C123
	, MIN( DT125.C118 )
	, SUM( DT125.C119 )
	, DT126.C1074
	,
	(
	SELECT
		AVG( DT129.C1256 )
	FROM
		(
		SELECT
			AVG( DT128.C369 )
			, DT128.C369
		FROM
			(
				T32 DT128
			LEFT OUTER JOIN
				T52 DT127
			ON
				DT128.C368 <> DT127.C630
			)
		WHERE
			(
				(
					DT128.C380 <> DT128.C377
				)
				AND
				(
					DT128.C371 < DT128.C378
				)
			)
			AND
			(
				(
					DT127.C625 <> DT127.C631
				)
				OR
				(
					DT128.C381 = DT128.C382
				)
			)
		GROUP BY
			DT127.C626
			, DT128.C369
		ORDER BY
			AVG( DT128.C369 )
			, DT128.C369
		LIMIT 522
		) AS DT129 ( C1255, C1256 ) 
	
	)
	AS C1259

FROM
	(
		(
			T25 DT124
		INNER JOIN
			T8 DT125
		ON
			DT124.C295 = DT125.C117
		)
	INNER JOIN
		T88 DT126
	ON
		DT125.C116 = DT126.C1068
	)
WHERE
	(
		(
			DT126.C1064 = DT124.C295
		)
		OR
		(
			DT124.C296 = DT124.C294
		)
	)
	OR
	(
		(
			DT125.C111 > DT124.C291
		)
		AND
		(
			(
				DT124.C287 = DT124.C286
			)
			AND
			(
				DT124.C286 < DT126.C1074
			)
		)
	)
GROUP BY
	DT126.C1074
	, DT125.C118
	, DT125.C123
	, DT125.C119
ORDER BY
	AVG( DT126.C1074 )
	, DT125.C123
	, MIN( DT125.C118 )
	, SUM( DT125.C119 )
	, DT126.C1074
	, C1259
LIMIT 158;


SELECT
	DT131.C994
	, DT130.C439
	, DT130.C438
FROM
	(
		T37 DT130
	LEFT OUTER JOIN
		T81 DT131
	ON
		DT130.C439 = DT131.C990
	)
WHERE
	(
		DT131.C993 > DT131.C990
	)
	AND
	(
		DT131.C994 > DT130.C438
	)
GROUP BY
	DT130.C438
	, DT131.C994
	, DT130.C439
	, DT131.C993
ORDER BY
	DT131.C994
	, DT130.C439
	, DT130.C438
LIMIT 903;


SELECT
	DT133.C154
	, AVG( DT133.C154 )
	, MIN( DT132.C1162 )
	, MIN( DT132.C1160 )
	, DT135.C227
	, DT132.C1160
FROM
	(
		(
			T11 DT133
		INNER JOIN
			T18 DT135
		ON
			DT133.C153 = DT135.C221
		)
	INNER JOIN
		(
			T57 DT134
		INNER JOIN
			T94 DT132
		ON
			DT134.C696 <> DT132.C1156
		)
	ON
		DT135.C221 = DT132.C1152
	)
WHERE
	(
		(
			(
				DT134.C685 <> DT134.C685
			)
			OR
			(
				DT133.C153 <> DT132.C1150
			)
		)
		AND
		(
			DT135.C229 = DT135.C223
		)
	)
	AND
	(
		DT132.C1163 > DT132.C1149
	)
GROUP BY
	DT132.C1162
	, DT133.C154
	, DT135.C227
	, DT132.C1160
ORDER BY
	DT133.C154
	, AVG( DT133.C154 )
	, MIN( DT132.C1162 )
	, MIN( DT132.C1160 )
	, DT135.C227
	, DT132.C1160
LIMIT 216;


SELECT
	DT136.C301
	, DT136.C314
	, DT137.C732
	, DT137.C736
	, MAX( DT136.C301 )
	, MIN( DT137.C732 )
	, COUNT( DT136.C314 )
FROM
	(
		T61 DT137
	INNER JOIN
		T26 DT136
	ON
		DT137.C726 = DT136.C315
	)
WHERE
	(
		(
			(
				DT137.C726 = DT136.C302
			)
			OR
			(
				DT136.C309 = DT137.C739
			)
		)
		AND
		(
			DT136.C297 = DT137.C733
		)
	)
	OR
	(
		(
			DT137.C732 = DT136.C301
		)
		AND
		(
			DT137.C736 <> DT136.C318
		)
	)
GROUP BY
	DT137.C732
	, DT136.C301
	, DT137.C736
	, DT136.C314
ORDER BY
	DT136.C301
	, DT136.C314
	, DT137.C732
	, DT137.C736
	, MAX( DT136.C301 )
	, MIN( DT137.C732 )
	, COUNT( DT136.C314 )
LIMIT 762;


SELECT
	DT152.C1305
	, DT138.C230
	, MAX( DT152.C1305 )
FROM
	(
		(
			(
			SELECT
				DT144.C123
			FROM
				(
					(
						T46 DT145
					RIGHT OUTER JOIN
						T8 DT144
					ON
						DT145.C544 = DT144.C121
					)
				INNER JOIN
					(
						T97 DT142
					INNER JOIN
						T61 DT143
					ON
						DT142.C1197 < DT143.C732
					)
				ON
					DT145.C547 < DT142.C1197
				)
			WHERE
				(
					DT143.C725 <> DT142.C1195
				)
				OR
				(
					DT142.C1199 > DT145.C530
				)
			GROUP BY
				DT143.C735
				, DT144.C123
				, DT144.C114
			ORDER BY
				DT144.C123
			LIMIT 689
			)  DT146 ( C1273 ) 
		INNER JOIN
			(
			SELECT
				SUM( DT139.C446 )
			FROM
				(
					T5 DT140
				INNER JOIN
					T39 DT139
				ON
					DT140.C73 = DT139.C446
				)
			WHERE
				(
					(
						DT140.C73 = DT139.C445
					)
					AND
					(
						DT140.C72 > DT140.C69
					)
				)
				AND
				(
					DT140.C74 = DT140.C74
				)
			GROUP BY
				DT140.C74
				, DT139.C446
			ORDER BY
				SUM( DT139.C446 )
			LIMIT 355
			) AS DT141 ( C1269 ) 
		ON
			DT146.C1273 < DT141.C1269
		)
	INNER JOIN
		(
			(
			SELECT
				SUM( DT150.C1278 )
				, DT150.C1278
			FROM
				(
					(
					SELECT
						DT147.C766
						, DT147.C772
						, DT149.C1199
						, DT147.C775
						, DT147.C771
						, DT149.C1193
						, DT148.C156
						, DT149.C1194
						, DT149.C1192
						, DT147.C779
						, DT147.C776
						, DT147.C777
						, DT148.C153
						, DT149.C1196
						, DT147.C774
						, DT149.C1191
						, DT149.C1200
						, DT148.C155
						, DT148.C154
						, DT147.C782
						, DT147.C767
						, DT148.C152
						, DT149.C1197
						, DT147.C770
						, DT147.C764
						, DT147.C769
						, DT147.C780
						, DT147.C773
						, DT149.C1198
					FROM
						(
							(
								T97 DT149
							INNER JOIN
								T11 DT148
							ON
								DT149.C1200 = DT148.C153
							)
						INNER JOIN
							T64 DT147
						ON
							DT148.C152 = DT147.C770
						)
					WHERE
						(
							DT149.C1199 < DT147.C777
						)
						AND
						(
							(
								DT148.C152 = DT147.C772
							)
							OR
							(
								DT147.C772 <> DT149.C1200
							)
						)
					ORDER BY
						DT147.C766
						, DT147.C772
						, DT149.C1199
						, DT147.C775
						, DT147.C771
						, DT149.C1193
						, DT148.C156
						, DT149.C1194
						, DT149.C1192
						, DT147.C779
						, DT147.C776
						, DT147.C777
						, DT148.C153
						, DT149.C1196
						, DT147.C774
						, DT149.C1191
						, DT149.C1200
						, DT148.C155
						, DT148.C154
						, DT147.C782
						, DT147.C767
						, DT148.C152
						, DT149.C1197
						, DT147.C770
						, DT147.C764
						, DT147.C769
						, DT147.C780
						, DT147.C773
						, DT149.C1198
					LIMIT 220
					)  DT150 ( C1274, C1275, C1276, C1277, C1278, C1279, C1280, C1281, C1282, C1283, C1284, C1285, C1286, C1287, C1288, C1289, C1290, C1291, C1292, C1293, C1294, C1295, C1296, C1297, C1298, C1299, C1300, C1301, C1302 ) 
				INNER JOIN
					T59 DT151
				ON
					DT150.C1300 = DT151.C714
				)
			WHERE
				(
					DT150.C1287 <> DT150.C1281
				)
				OR
				(
					(
						(
							DT150.C1278 = DT150.C1300
						)
						OR
						(
							DT150.C1284 = DT151.C716
						)
					)
					OR
					(
						(
							DT150.C1287 < DT150.C1284
						)
						OR
						(
							DT150.C1302 = DT150.C1283
						)
					)
				)
			GROUP BY
				DT150.C1278
				, DT150.C1290
			ORDER BY
				SUM( DT150.C1278 )
				, DT150.C1278
			LIMIT 640
			)  DT152 ( C1305, C1306 ) 
		INNER JOIN
			T19 DT138
		ON
			DT152.C1305 < DT138.C231
		)
	ON
		DT141.C1269 < DT152.C1305
	)
WHERE
	(
		(
			DT146.C1273 = DT138.C231
		)
		AND
		(
			DT141.C1269 > DT152.C1306
		)
	)
	AND
	(
		(
			DT141.C1269 = DT138.C231
		)
		AND
		(
			(
				DT138.C232 < DT138.C230
			)
			AND
			(
				DT138.C231 = DT138.C230
			)
		)
	)
GROUP BY
	DT152.C1305
	, DT138.C231
	, DT138.C230
ORDER BY
	DT152.C1305
	, DT138.C230
	, MAX( DT152.C1305 )
LIMIT 768;


SELECT
	DT156.C434
	, DT155.C913
	, MAX( DT156.C434 )
	, DT154.C1050
	, MIN( DT155.C913 )
	, DT155.C922
FROM
	(
		(
			T68 DT153
		INNER JOIN
			(
				T86 DT154
			INNER JOIN
				(
				SELECT
					DT160.C907
					, MIN( DT160.C896 )
					, SUM( DT160.C907 )
					, DT158.C490
					, SUM( DT158.C490 )
				FROM
					(
						T0 DT159
					RIGHT OUTER JOIN
						(
							T43 DT158
						INNER JOIN
							(
								(
									T28 DT157
								INNER JOIN
									(
									SELECT
										DT161.C11
										, DT161.C6
									FROM
										(
											T35 DT162
										INNER JOIN
											T1 DT161
										ON
											DT162.C416 = DT161.C14
										)
									WHERE
										(
											DT161.C14 > DT162.C417
										)
										OR
										(
											(
												DT162.C416 < DT162.C414
											)
											OR
											(
												DT161.C6 < DT161.C5
											)
										)
									GROUP BY
										DT161.C6
										, DT162.C418
										, DT161.C8
										, DT161.C11
									ORDER BY
										DT161.C11
										, DT161.C6
									LIMIT 250
									)  DT163 ( C1311, C1312 ) 
								ON
									DT157.C329 = DT163.C1311
								)
							INNER JOIN
								T73 DT160
							ON
								DT157.C332 < DT160.C893
							)
						ON
							DT158.C492 = DT160.C906
						)
					ON
						DT159.C0 = DT160.C898
					)
				WHERE
					(
						DT159.C1 = DT158.C491
					)
					OR
					(
						DT160.C900 < DT160.C897
					)
				GROUP BY
					DT158.C490
					, DT160.C907
					, DT160.C896
				ORDER BY
					DT160.C907
					, MIN( DT160.C896 )
					, SUM( DT160.C907 )
					, DT158.C490
					, SUM( DT158.C490 )
				LIMIT 241
				)  DT164 ( C1316, C1317, C1318, C1319, C1320 ) 
			ON
				DT154.C1051 <> DT164.C1320
			)
		ON
			DT153.C821 < DT164.C1316
		)
	INNER JOIN
		(
			T74 DT155
		INNER JOIN
			T36 DT156
		ON
			DT155.C919 = DT156.C431
		)
	ON
		DT154.C1049 > DT155.C910
	)
WHERE
	(
		(
			(
				DT156.C437 = DT155.C915
			)
			AND
			(
				DT156.C436 <> DT156.C437
			)
		)
		OR
		(
			DT164.C1316 = DT156.C437
		)
	)
	OR
	(
		DT153.C823 = DT154.C1054
	)
GROUP BY
	DT154.C1050
	, DT156.C434
	, DT155.C922
	, DT155.C913
ORDER BY
	DT156.C434
	, DT155.C913
	, MAX( DT156.C434 )
	, DT154.C1050
	, MIN( DT155.C913 )
	, DT155.C922
LIMIT 882;


SELECT
	DT165.C246
	, COUNT( DT166.C35 )
	, DT166.C35
	, DT166.C42
	, DT166.C49
	,
	(
	SELECT
		MAX( DT174.C1334 )
	FROM
		(
		SELECT
			DT172.C938
			, DT168.C602
			, COUNT( DT171.C1331 )
		FROM
			(
				(
					T10 DT167
				INNER JOIN
					T17 DT173
				ON
					DT167.C143 = DT173.C217
				)
			INNER JOIN
				(
					(
					SELECT
						DT169.C984
						, MAX( DT169.C980 )
						, MIN( DT169.C983 )
						, DT170.C945
					FROM
						(
							T79 DT169
						RIGHT OUTER JOIN
							T76 DT170
						ON
							DT169.C982 < DT170.C943
						)
					WHERE
						(
							(
								DT170.C941 < DT169.C980
							)
							AND
							(
								DT169.C981 = DT170.C943
							)
						)
						OR
						(
							DT170.C944 > DT169.C983
						)
					GROUP BY
						DT170.C945
						, DT169.C983
						, DT169.C980
						, DT169.C984
					ORDER BY
						DT169.C984
						, MAX( DT169.C980 )
						, MIN( DT169.C983 )
						, DT170.C945
					LIMIT 786
					)  DT171 ( C1329, C1330, C1331, C1332 ) 
				INNER JOIN
					(
						T50 DT168
					INNER JOIN
						T76 DT172
					ON
						DT168.C607 < DT172.C945
					)
				ON
					DT171.C1330 <> DT172.C943
				)
			ON
				DT167.C139 > DT171.C1331
			)
		WHERE
			(
				DT173.C209 > DT167.C138
			)
			AND
			(
				(
					DT167.C140 > DT171.C1331
				)
				OR
				(
					DT167.C148 = DT173.C217
				)
			)
		GROUP BY
			DT173.C213
			, DT172.C938
			, DT171.C1331
			, DT168.C602
		ORDER BY
			DT172.C938
			, DT168.C602
			, COUNT( DT171.C1331 )
		LIMIT 272
		)  DT174 ( C1334, C1335, C1336 ) 
	
	)
	AS C1339

FROM
	(
		T20 DT165
	LEFT OUTER JOIN
		T3 DT166
	ON
		DT165.C245 = DT166.C39
	)
WHERE
	(
		DT166.C46 < DT165.C235
	)
	OR
	(
		DT166.C34 <> DT166.C46
	)
GROUP BY
	DT165.C246
	, DT166.C35
	, DT166.C42
	, DT166.C49
ORDER BY
	DT165.C246
	, COUNT( DT166.C35 )
	, DT166.C35
	, DT166.C42
	, DT166.C49
	, C1339
LIMIT 337;


SELECT
	DT189.C949
	, DT189.C952
FROM
	(
		(
		SELECT
			DT198.C601
			, COUNT( DT199.C490 )
			, SUM( DT198.C601 )
			, DT199.C501
			, MIN( DT199.C501 )
			, DT199.C500
		FROM
			(
				(
					T30 DT190
				INNER JOIN
					(
					SELECT
						AVG( DT196.C589 )
						, DT192.C938
						, MAX( DT192.C938 )
						, DT196.C589
					FROM
						(
							(
								T98 DT193
							LEFT OUTER JOIN
								T55 DT195
							ON
								DT193.C1202 <> DT195.C663
							)
						INNER JOIN
							(
								T39 DT194
							INNER JOIN
								(
									T76 DT192
								INNER JOIN
									T49 DT196
								ON
									DT192.C941 <> DT196.C597
								)
							ON
								DT194.C445 = DT192.C944
							)
						ON
							DT195.C661 = DT192.C940
						)
					WHERE
						(
							DT196.C597 = DT196.C598
						)
						AND
						(
							DT196.C596 <> DT196.C589
						)
					GROUP BY
						DT192.C938
						, DT196.C589
					ORDER BY
						AVG( DT196.C589 )
						, DT192.C938
						, MAX( DT192.C938 )
						, DT196.C589
					LIMIT 489
					) AS DT197 ( C1364, C1365, C1366, C1367 ) 
				ON
					DT190.C343 > DT197.C1366
				)
			INNER JOIN
				(
					T43 DT199
				INNER JOIN
					(
						T50 DT198
					INNER JOIN
						T0 DT191
					ON
						DT198.C601 <> DT191.C0
					)
				ON
					DT199.C497 = DT198.C600
				)
			ON
				DT190.C341 < DT198.C604
			)
		WHERE
			(
				(
					(
						DT198.C607 = DT190.C343
					)
					OR
					(
						DT199.C494 = DT199.C489
					)
				)
				OR
				(
					DT198.C604 = DT199.C489
				)
			)
			AND
			(
				DT198.C607 = DT197.C1364
			)
		GROUP BY
			DT199.C501
			, DT199.C500
			, DT198.C601
			, DT199.C490
		ORDER BY
			DT198.C601
			, COUNT( DT199.C490 )
			, SUM( DT198.C601 )
			, DT199.C501
			, MIN( DT199.C501 )
			, DT199.C500
		LIMIT 587
		) AS DT200 ( C1372, C1373, C1374, C1375, C1376, C1377 ) 
	INNER JOIN
		(
			T77 DT189
		RIGHT OUTER JOIN
			(
			SELECT
				DT186.C1197
				, DT186.C1200
				, COUNT( DT187.C108 )
				, MAX( DT186.C1197 )
				, DT187.C108
			FROM
				(
					T97 DT186
				INNER JOIN
					(
						(
						SELECT
							DT175.C333
						FROM
							(
								(
									(
										T39 DT180
									LEFT OUTER JOIN
										(
										SELECT
											AVG( DT176.C421 )
										FROM
											(
												T36 DT176
											INNER JOIN
												(
													T19 DT178
												INNER JOIN
													T40 DT177
												ON
													DT178.C232 = DT177.C448
												)
											ON
												DT176.C435 = DT177.C448
											)
										WHERE
											(
												(
													DT176.C426 = DT176.C435
												)
												AND
												(
													DT177.C448 < DT176.C431
												)
											)
											AND
											(
												(
													DT176.C422 <> DT178.C232
												)
												OR
												(
													(
														DT176.C427 = DT176.C435
													)
													OR
													(
														DT176.C419 > DT176.C436
													)
												)
											)
										GROUP BY
											DT176.C433
											, DT176.C431
											, DT176.C421
										ORDER BY
											AVG( DT176.C421 )
										LIMIT 809
										) AS DT179 ( C1343 ) 
									ON
										DT180.C444 > DT179.C1343
									)
								INNER JOIN
									T14 DT184
								ON
									DT179.C1343 = DT184.C182
								)
							INNER JOIN
								(
									T28 DT175
								INNER JOIN
									(
									SELECT
										DT182.C669
										, DT182.C672
										, COUNT( DT182.C672 )
										, COUNT( DT181.C624 )
										, DT181.C624
									FROM
										(
											T56 DT182
										INNER JOIN
											T51 DT181
										ON
											DT182.C673 = DT181.C612
										)
									WHERE
										(
											(
												DT181.C610 = DT181.C617
											)
											AND
											(
												DT181.C611 < DT181.C617
											)
										)
										AND
										(
											DT181.C618 = DT182.C679
										)
									GROUP BY
										DT181.C624
										, DT182.C672
										, DT182.C669
									ORDER BY
										DT182.C669
										, DT182.C672
										, COUNT( DT182.C672 )
										, COUNT( DT181.C624 )
										, DT181.C624
									LIMIT 537
									)  DT183 ( C1346, C1347, C1348, C1349, C1350 ) 
								ON
									DT175.C332 = DT183.C1346
								)
							ON
								DT179.C1343 = DT175.C329
							)
						WHERE
							(
								(
									DT180.C446 > DT183.C1347
								)
								AND
								(
									DT184.C185 = DT184.C182
								)
							)
							OR
							(
								(
									DT180.C445 <> DT183.C1347
								)
								AND
								(
									DT183.C1350 < DT180.C445
								)
							)
						GROUP BY
							DT175.C333
							, DT183.C1346
							, DT183.C1350
							, DT180.C445
						ORDER BY
							DT175.C333
						LIMIT 283
						)  DT185 ( C1354 ) 
					INNER JOIN
						T7 DT187
					ON
						DT185.C1354 = DT187.C95
					)
				ON
					DT186.C1193 = DT187.C97
				)
			WHERE
				(
					DT186.C1198 = DT187.C105
				)
				AND
				(
					(
						DT186.C1197 = DT187.C109
					)
					AND
					(
						(
							DT187.C104 > DT187.C92
						)
						AND
						(
							DT187.C106 <> DT186.C1199
						)
					)
				)
			GROUP BY
				DT187.C108
				, DT186.C1197
				, DT186.C1200
			ORDER BY
				DT186.C1197
				, DT186.C1200
				, COUNT( DT187.C108 )
				, MAX( DT186.C1197 )
				, DT187.C108
			LIMIT 833
			)  DT188 ( C1357, C1358, C1359, C1360, C1361 ) 
		ON
			DT189.C949 <> DT188.C1357
		)
	ON
		DT200.C1375 = DT189.C947
	)
WHERE
	(
		DT200.C1375 = DT189.C956
	)
	AND
	(
		DT189.C949 = DT200.C1372
	)
GROUP BY
	DT189.C961
	, DT189.C952
	, DT189.C949
ORDER BY
	DT189.C949
	, DT189.C952
LIMIT 418;


SELECT
	AVG( DT205.C1392 )
	, MAX( DT206.C934 )
FROM
	(
		(
			T75 DT206
		INNER JOIN
			(
			SELECT
				SUM( DT208.C324 )
				, DT208.C325
				, AVG( DT207.C979 )
				, DT207.C984
				, DT208.C324
			FROM
				(
					(
						T41 DT209
					INNER JOIN
						T79 DT207
					ON
						DT209.C464 < DT207.C981
					)
				INNER JOIN
					T27 DT208
				ON
					DT209.C466 > DT208.C327
				)
			WHERE
				(
					DT209.C465 = DT209.C458
				)
				OR
				(
					DT209.C461 < DT207.C983
				)
			GROUP BY
				DT208.C325
				, DT207.C979
				, DT207.C984
				, DT208.C324
			ORDER BY
				SUM( DT208.C324 )
				, DT208.C325
				, AVG( DT207.C979 )
				, DT207.C984
				, DT208.C324
			LIMIT 925
			) AS DT210 ( C1397, C1398, C1399, C1400, C1401 ) 
		ON
			DT206.C936 = DT210.C1398
		)
	INNER JOIN
		(
		SELECT
			DT203.C947
			, COUNT( DT202.C823 )
			, DT202.C823
			, COUNT( DT204.C806 )
			, COUNT( DT204.C801 )
			, AVG( DT203.C947 )
			, DT204.C806
			, DT204.C801
		FROM
			(
				(
					T77 DT203
				INNER JOIN
					(
						T9 DT201
					INNER JOIN
						T68 DT202
					ON
						DT201.C131 = DT202.C823
					)
				ON
					DT203.C964 > DT201.C127
				)
			INNER JOIN
				T66 DT204
			ON
				DT203.C953 = DT204.C799
			)
		WHERE
			(
				DT201.C129 = DT204.C803
			)
			AND
			(
				(
					DT201.C137 < DT204.C804
				)
				OR
				(
					(
						DT204.C806 > DT201.C132
					)
					AND
					(
						DT201.C134 <> DT201.C133
					)
				)
			)
		GROUP BY
			DT202.C823
			, DT203.C947
			, DT204.C806
			, DT204.C801
		ORDER BY
			DT203.C947
			, COUNT( DT202.C823 )
			, DT202.C823
			, COUNT( DT204.C806 )
			, COUNT( DT204.C801 )
			, AVG( DT203.C947 )
			, DT204.C806
			, DT204.C801
		LIMIT 832
		) AS DT205 ( C1385, C1386, C1387, C1388, C1389, C1390, C1391, C1392 ) 
	ON
		DT206.C934 > DT205.C1388
	)
WHERE
	(
		(
			DT210.C1397 = DT206.C935
		)
		OR
		(
			DT206.C936 < DT205.C1387
		)
	)
	OR
	(
		(
			DT210.C1400 <> DT210.C1398
		)
		OR
		(
			(
				DT210.C1399 = DT205.C1387
			)
			AND
			(
				DT210.C1400 = DT205.C1388
			)
		)
	)
GROUP BY
	DT210.C1397
	, DT206.C935
	, DT206.C934
	, DT205.C1392
ORDER BY
	AVG( DT205.C1392 )
	, MAX( DT206.C934 )
LIMIT 122;


SELECT
	DT215.C581
	, DT215.C577
FROM
	(
		T53 DT214
	INNER JOIN
		(
			T48 DT215
		INNER JOIN
			(
				(
					(
					SELECT
						DT211.C9
						, DT212.C975
						, DT211.C8
					FROM
						(
							T1 DT211
						INNER JOIN
							T78 DT212
						ON
							DT211.C5 = DT212.C968
						)
					WHERE
						(
							DT212.C967 > DT212.C978
						)
						OR
						(
							(
								DT212.C978 = DT212.C973
							)
							OR
							(
								DT212.C972 > DT212.C977
							)
						)
					GROUP BY
						DT212.C973
						, DT212.C975
						, DT211.C8
						, DT211.C9
					ORDER BY
						DT211.C9
						, DT212.C975
						, DT211.C8
					LIMIT 263
					) AS DT213 ( C1407, C1408, C1409 ) 
				INNER JOIN
					T76 DT220
				ON
					DT213.C1408 <> DT220.C944
				)
			RIGHT OUTER JOIN
				(
				SELECT
					DT216.C668
					, DT216.C671
					, COUNT( DT216.C668 )
				FROM
					(
						(
							T56 DT216
						INNER JOIN
							T38 DT217
						ON
							DT216.C678 > DT217.C443
						)
					INNER JOIN
						T59 DT218
					ON
						DT217.C442 > DT218.C714
					)
				WHERE
					(
						DT216.C678 > DT218.C716
					)
					AND
					(
						(
							DT216.C673 > DT216.C679
						)
						OR
						(
							(
								DT216.C679 = DT216.C676
							)
							AND
							(
								DT218.C714 = DT216.C673
							)
						)
					)
				GROUP BY
					DT216.C671
					, DT216.C668
				ORDER BY
					DT216.C668
					, DT216.C671
					, COUNT( DT216.C668 )
				LIMIT 314
				)  DT219 ( C1412, C1413, C1414 ) 
			ON
				DT213.C1409 > DT219.C1413
			)
		ON
			DT215.C582 = DT219.C1412
		)
	ON
		DT214.C647 = DT215.C574
	)
WHERE
	(
		DT215.C571 > DT214.C639
	)
	AND
	(
		(
			DT215.C585 = DT215.C577
		)
		OR
		(
			DT220.C945 = DT214.C636
		)
	)
GROUP BY
	DT215.C577
	, DT215.C581
	, DT214.C650
ORDER BY
	DT215.C581
	, DT215.C577
LIMIT 663;


SELECT
	DT222.C341
FROM
	(
		(
		SELECT
			COUNT( DT227.C1094 )
			, MIN( DT223.C813 )
			, COUNT( DT227.C1093 )
			, DT223.C813
			, DT227.C1093
		FROM
			(
				(
					(
						T67 DT223
					INNER JOIN
						T99 DT224
					ON
						DT223.C813 > DT224.C1204
					)
				INNER JOIN
					T0 DT225
				ON
					DT224.C1207 <> DT225.C1
				)
			INNER JOIN
				(
					T91 DT227
				INNER JOIN
					T92 DT226
				ON
					DT227.C1102 > DT226.C1131
				)
			ON
				DT225.C2 > DT227.C1107
			)
		WHERE
			(
				DT224.C1205 = DT226.C1128
			)
			OR
			(
				DT227.C1093 = DT223.C817
			)
		GROUP BY
			DT223.C813
			, DT227.C1093
			, DT227.C1094
		ORDER BY
			COUNT( DT227.C1094 )
			, MIN( DT223.C813 )
			, COUNT( DT227.C1093 )
			, DT223.C813
			, DT227.C1093
		LIMIT 605
		)  DT228 ( C1419, C1420, C1421, C1422, C1423 ) 
	INNER JOIN
		(
			T30 DT222
		INNER JOIN
			T2 DT221
		ON
			DT222.C342 = DT221.C28
		)
	ON
		DT228.C1423 > DT221.C24
	)
WHERE
	(
		(
			DT221.C30 < DT221.C16
		)
		OR
		(
			DT221.C21 = DT228.C1423
		)
	)
	AND
	(
		DT228.C1423 <> DT222.C343
	)
GROUP BY
	DT222.C341
	, DT221.C18
ORDER BY
	DT222.C341
LIMIT 404;


SELECT
	DT240.C845
	, DT240.C858
	, DT240.C841
	, MAX( DT240.C845 )
	, DT240.C844
FROM
	(
		(
			(
			SELECT
				DT229.C1124
				, AVG( DT230.C456 )
			FROM
				(
					(
						(
							T41 DT230
						INNER JOIN
							T83 DT232
						ON
							DT230.C465 > DT232.C1007
						)
					INNER JOIN
						T92 DT229
					ON
						DT230.C456 = DT229.C1125
					)
				INNER JOIN
					T11 DT231
				ON
					DT229.C1128 <> DT231.C153
				)
			WHERE
				(
					(
						DT230.C472 = DT230.C465
					)
					AND
					(
						DT229.C1122 > DT230.C456
					)
				)
				AND
				(
					(
						DT229.C1132 = DT230.C454
					)
					AND
					(
						DT229.C1121 = DT230.C459
					)
				)
			GROUP BY
				DT230.C456
				, DT229.C1119
				, DT229.C1124
			ORDER BY
				DT229.C1124
				, AVG( DT230.C456 )
			LIMIT 217
			)  DT233 ( C1427, C1428 ) 
		INNER JOIN
			T98 DT239
		ON
			DT233.C1427 <> DT239.C1202
		)
	INNER JOIN
		(
			(
				T70 DT240
			INNER JOIN
				T76 DT238
			ON
				DT240.C844 = DT238.C945
			)
		INNER JOIN
			(
			SELECT
				DT234.C1193
				, DT235.C657
			FROM
				(
					(
						T97 DT234
					LEFT OUTER JOIN
						T54 DT235
					ON
						DT234.C1192 = DT235.C657
					)
				INNER JOIN
					T99 DT236
				ON
					DT234.C1191 = DT236.C1205
				)
			WHERE
				(
					(
						DT234.C1196 > DT234.C1199
					)
					OR
					(
						DT235.C654 = DT234.C1190
					)
				)
				AND
				(
					(
						DT234.C1193 = DT236.C1204
					)
					AND
					(
						DT235.C657 <> DT234.C1198
					)
				)
			GROUP BY
				DT234.C1193
				, DT235.C655
				, DT235.C657
			ORDER BY
				DT234.C1193
				, DT235.C657
			LIMIT 196
			) AS DT237 ( C1430, C1431 ) 
		ON
			DT238.C946 = DT237.C1431
		)
	ON
		DT239.C1201 < DT240.C842
	)
WHERE
	(
		(
			(
				DT240.C845 > DT238.C941
			)
			AND
			(
				DT238.C946 > DT239.C1201
			)
		)
		OR
		(
			DT237.C1431 = DT238.C940
		)
	)
	AND
	(
		DT233.C1428 = DT238.C943
	)
GROUP BY
	DT240.C845
	, DT240.C841
	, DT240.C858
	, DT240.C844
ORDER BY
	DT240.C845
	, DT240.C858
	, DT240.C841
	, MAX( DT240.C845 )
	, DT240.C844
LIMIT 178;


SELECT
	MAX( DT244.C404 )
	, DT245.C438
	, DT244.C405
	,
	(
	SELECT
		DT254.C1456
	FROM
		(
		SELECT
			DT251.C143
			, DT253.C285
			, DT251.C139
			, DT251.C142
			, DT253.C291
			, DT253.C295
			, DT252.C221
			, DT253.C292
			, DT253.C286
			, DT252.C222
			, DT253.C294
		FROM
			(
				(
					T25 DT253
				INNER JOIN
					T10 DT251
				ON
					DT253.C287 = DT251.C139
				)
			INNER JOIN
				(
					T18 DT252
				INNER JOIN
					(
					SELECT
						MAX( DT248.C466 )
					FROM
						(
							(
								(
									T69 DT249
								INNER JOIN
									T21 DT247
								ON
									DT249.C833 = DT247.C253
								)
							INNER JOIN
								T4 DT246
							ON
								DT247.C255 = DT246.C53
							)
						INNER JOIN
							T41 DT248
						ON
							DT249.C828 <> DT248.C470
						)
					WHERE
						(
							DT248.C468 > DT247.C248
						)
						AND
						(
							DT248.C463 > DT248.C470
						)
					GROUP BY
						DT248.C466
						, DT247.C248
					ORDER BY
						MAX( DT248.C466 )
					LIMIT 304
					)  DT250 ( C1445 ) 
				ON
					DT252.C224 = DT250.C1445
				)
			ON
				DT251.C138 = DT252.C223
			)
		WHERE
			(
				DT253.C287 <> DT253.C288
			)
			OR
			(
				DT252.C222 = DT252.C228
			)
		ORDER BY
			DT251.C143
			, DT253.C285
			, DT251.C139
			, DT251.C142
			, DT253.C291
			, DT253.C295
			, DT252.C221
			, DT253.C292
			, DT253.C286
			, DT252.C222
			, DT253.C294
		LIMIT 404
		) AS DT254 ( C1446, C1447, C1448, C1449, C1450, C1451, C1452, C1453, C1454, C1455, C1456 ) 
	
	ORDER BY
		DT254.C1456
	LIMIT 1
	)
	AS C1458

FROM
	(
		(
			T37 DT245
		INNER JOIN
			(
			SELECT
				DT241.C1166
				, DT242.C696
				, SUM( DT242.C696 )
				, MAX( DT241.C1166 )
			FROM
				(
					T94 DT241
				INNER JOIN
					T57 DT242
				ON
					DT241.C1156 <> DT242.C689
				)
			WHERE
				(
					DT241.C1146 = DT241.C1149
				)
				AND
				(
					DT242.C688 < DT242.C687
				)
			GROUP BY
				DT241.C1166
				, DT242.C696
			ORDER BY
				DT241.C1166
				, DT242.C696
				, SUM( DT242.C696 )
				, MAX( DT241.C1166 )
			LIMIT 759
			) AS DT243 ( C1438, C1439, C1440, C1441 ) 
		ON
			DT245.C439 <> DT243.C1438
		)
	INNER JOIN
		T34 DT244
	ON
		DT243.C1440 < DT244.C406
	)
WHERE
	(
		DT245.C440 = DT244.C402
	)
	OR
	(
		DT244.C410 > DT244.C405
	)
GROUP BY
	DT245.C438
	, DT244.C404
	, DT244.C405
ORDER BY
	MAX( DT244.C404 )
	, DT245.C438
	, DT244.C405
	, C1458
LIMIT 321;


SELECT
	DT256.C108
	, SUM( DT256.C108 )
FROM
	(
		(
			(
				T7 DT256
			INNER JOIN
				(
				SELECT
					DT259.C1165
					,
					(
					SELECT
						COUNT( DT265.C1466 )
					FROM
						(
						SELECT
							SUM( DT264.C538 )
							, DT264.C539
							, DT263.C1173
							, DT260.C1202
							, MIN( DT264.C539 )
						FROM
							(
								(
									T38 DT262
								INNER JOIN
									(
										T98 DT260
									INNER JOIN
										(
											T46 DT264
										INNER JOIN
											T29 DT261
										ON
											DT264.C539 > DT261.C338
										)
									ON
										DT260.C1202 = DT264.C542
									)
								ON
									DT262.C443 <> DT261.C338
								)
							INNER JOIN
								T95 DT263
							ON
								DT264.C544 = DT263.C1173
							)
						WHERE
							(
								DT263.C1174 = DT263.C1173
							)
							OR
							(
								DT264.C546 = DT263.C1170