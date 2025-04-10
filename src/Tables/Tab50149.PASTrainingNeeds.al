table 50149 "PAS Training Needs"
{
    Caption = 'PAS Training Needs';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "PAS No."; Code[20])
        {
            Caption = 'PAS No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Training Need"; Text[100])
        {
            Caption = 'Training Need';
        }
        field(4; "Supervisors Remarks"; Text[100])
        {
            Caption = 'Supervisors Remarks';
            trigger OnValidate()
            var
                PerfomanceContrHdr: Record "Perfomance Contract Header";
            begin
                if PerfomanceContrHdr.Get("PAS No.") then
                    if not PerfomanceContrHdr.IsSuperVisor() then begin
                        error('Only Supervisors can enter remarks');
                    end;
            end;
        }
    }
    keys
    {
        key(PK; "PAS No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        PASTrainingNeeds: Record "PAS Training Needs";
    begin
        PASTrainingNeeds.Reset();
        PASTrainingNeeds.SetRange("PAS No.", Rec."PAS No.");
        PASTrainingNeeds.SetFilter("Line No.", '<>%1', Rec."Line No.");
        if PASTrainingNeeds.FindFirst() then
            if PASTrainingNeeds.Count >= 2 then
                error('Only two training needs are allowed');
    end;
}
