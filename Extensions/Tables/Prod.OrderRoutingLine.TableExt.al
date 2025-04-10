TableExtension 52193686 tableextension52193686 extends "Prod. Order Routing Line" 
{

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TESTFIELD("Routing No.");
        IF Status = Status::Finished THEN
          ERROR(Text006,Status,TABLECAPTION);

        IF "Next Operation No." = '' THEN
          SetNextOperations(Rec);

        UpdateComponentsBin(0); // from trigger = insert
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #2..8
        */
    //end;


    //Unsupported feature: Code Modification on "MachineCtrTransferfields(PROCEDURE 1)".

    //procedure MachineCtrTransferfields();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WorkCenter.GET(MachineCenter."Work Center No.");
        WorkCenterTransferfields;

        #4..9
        "Minimum Process Time" := MachineCenter."Minimum Process Time";
        "Maximum Process Time" := MachineCenter."Maximum Process Time";
        "Concurrent Capacities" := MachineCenter."Concurrent Capacities";
        IF "Concurrent Capacities" = 0 THEN
          "Concurrent Capacities" := 1;
        "Send-Ahead Quantity" := MachineCenter."Send-Ahead Quantity";
        "Setup Time Unit of Meas. Code" := MachineCenter."Setup Time Unit of Meas. Code";
        "Wait Time Unit of Meas. Code" := MachineCenter."Wait Time Unit of Meas. Code";
        #18..21
        "Indirect Cost %" := MachineCenter."Indirect Cost %";
        "Overhead Rate" := MachineCenter."Overhead Rate";
        FillDefaultLocationAndBins;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..12
        #15..24
        */
    //end;
}

