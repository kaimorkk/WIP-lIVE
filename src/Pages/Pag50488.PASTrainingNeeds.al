page 50488 "PAS Training Needs"
{
    Caption = 'PAS Training Needs';
    PageType = ListPart;
    SourceTable = "PAS Training Needs";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Training Need"; Rec."Training Need")
                {
                    ApplicationArea = All;
                    Editable = AppraiseeCanEdit;
                    ToolTip = 'Specifies the value of the Training Need field.', Comment = '%';
                }
                field("Supervisors Remarks"; Rec."Supervisors Remarks")
                {
                    ApplicationArea = All;
                    Editable = SupervisorCanEdit;
                    ToolTip = 'Specifies the value of the Supervisors Remarks field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        UpdateControls();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControls();
    end;

    trigger OnAfterGetRecord()
    begin
        UpdateControls();
    end;

    var
        SupervisorCanEdit: Boolean;
        AppraiseeCanEdit: Boolean;

    procedure UpdateControls()
    var
        PerfomanceContrHdr: Record "Perfomance Contract Header";

    begin
        if PerfomanceContrHdr.Get("PAS No.") then;
        SupervisorCanEdit := PerfomanceContrHdr.IsSuperVisor() and PerfomanceContrHdr."Document is At Supervision";
        AppraiseeCanEdit := (PerfomanceContrHdr."Created By" = UserId) and
        ((PerfomanceContrHdr."Document Stage" = PerfomanceContrHdr."Document Stage"::" ") or
        (PerfomanceContrHdr."Document Stage" = PerfomanceContrHdr."Document Stage"::"Returned To Employee"));
    end;

}
