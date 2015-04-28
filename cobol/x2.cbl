IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO.

DATA DIVISION.
   WORKING-STORAGE SECTION.
    01 i_bin PIC S9(8).
    01 result_bin PIC S9(8).
    01 para_k_bin PIC S9(8).
    01 para_n_bin PIC S9(8).
    01 temp_bin PIC S9(8).
    01 temp_ber_out1 PIC S9(8).
    01 temp_ber_out2 PIC S9(8)V9(8).
    01 temp_ber_in1 PIC S9(8).
    01 temp_ber_in2 PIC S9(8).
    01 temp_ber_in3 PIC S9(8)V9(8).
    01 m_ber PIC S9(8).
    01 k_ber PIC S9(8).
    01 n_ber PIC S9(8) VALUE 4.
    01 Bx_ber.
        05 B_ber PIC S9(8)V9(8) OCCURS 20 TIMES.


PROCEDURE DIVISION.
    MAIN.
        PERFORM BERNOULLI.
        ADD 1 To n_ber.
        DISPLAY B_ber(n_ber).
        STOP RUN.

    BERNOULLI.
        MOVE 1 TO B_ber(1).
        MOVE 1 TO m_ber.
        PERFORM BERNOULLI-OUTER UNTIL m_ber>n_ber.

    BERNOULLI-OUTER.
        ADD 1 TO m_ber GIVING temp_ber_out1.
        MOVE 0 TO B_ber(temp_ber_out1).
        MOVE 0 TO k_ber.
        SUBTRACT 1 FROM m_ber GIVING temp_ber_out2.
        PERFORM BERNOULLI-INNER UNTIL k_ber>temp_ber_out2.
        ADD 1 TO m_ber GIVING temp_ber_out2.
        DIVIDE B_ber(temp_ber_out1) by temp_ber_out2 GIVING B_ber(temp_ber_out1).
        ADD 1 TO m_ber.

    BERNOULLI-INNER.
        ADD 1 TO m_ber GIVING temp_ber_in1.
        ADD 1 TO k_ber GIVING temp_ber_in2.
        MOVE temp_ber_in1 TO para_n_bin.
        MOVE k_ber TO para_k_bin.
        PERFORM BINOM.
        MULTIPLY result_bin BY B_ber(temp_ber_in2) GIVING temp_ber_in3.
        SUBTRACT temp_ber_in3 FROM B_ber(temp_ber_in1) GIVING B_ber(temp_ber_in1).
        ADD 1 TO k_ber.

    BINOM.
        MOVE 0 TO i_bin.
        MOVE 1 TO result_bin.
        PERFORM BINOM-LOOP UNTIL i_bin>para_k_bin.

    BINOM-LOOP.
        MOVE 0 TO temp_bin.
        ADD para_n_bin TO temp_bin.
        SUBTRACT i_bin FROM temp_bin.
        ADD 1 TO temp_bin.
        MULTIPLY result_bin BY temp_bin GIVING temp_bin.
        DIVIDE temp_bin BY i_bin GIVING result_bin.
        ADD 1 TO i_bin.
