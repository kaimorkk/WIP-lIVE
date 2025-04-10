Page 52193784 "File List"
{
    CardPageID = "File Card";
    Editable = true;
    PageType = List;
    SourceTable = "File Details1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(FileCode;"File Code")
                {
                    ApplicationArea = Basic;
                    NotBlank = false;
                }
                field(Volume;Volume)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(SFNo;"SF No.")
                {
                    ApplicationArea = Basic;
                }
                field(FileDescription;"File Description")
                {
                    ApplicationArea = Basic;
                }
                field(Contributer;Contributer)
                {
                    ApplicationArea = Basic;
                }
                field(ContributerName;"Contributer Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Available in Registry?';
                }
                field(FileHolder;FileHolder)
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Holder';
                }
                field(MaxSizeRecommended;"Max Size Recommended")
                {
                    ApplicationArea = Basic;
                }
                field(Measuretypeforsize;"Measure type for size")
                {
                    ApplicationArea = Basic;
                }
                field(FileStatus;"File Status")
                {
                    ApplicationArea = Basic;
                }
                field(FirstCategory;"First Category")
                {
                    ApplicationArea = Basic;
                }
                field(SecondCategory;"Second Category")
                {
                    ApplicationArea = Basic;
                }
                field(CurrentSize;"Current Size")
                {
                    ApplicationArea = Basic;
                }
                field(Measuretype;"Measure type")
                {
                    ApplicationArea = Basic;
                }
                field(FourthCategory;"Fourth Category")
                {
                    ApplicationArea = Basic;
                }
                field(Pensioner;Pensioner)
                {
                    ApplicationArea = Basic;
                }
                field(PensionerName;"Pensioner Name")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeID;"Employee ID")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(ThirdCategory;"Third Category")
                {
                    ApplicationArea = Basic;
                }
                field(RetentionPeriodYrs;"Retention Period(Yrs)")
                {
                    ApplicationArea = Basic;
                }
                field(DateClosed;"Date Closed")
                {
                    ApplicationArea = Basic;
                }
                field(DisposalAction;"Disposal Action")
                {
                    ApplicationArea = Basic;
                }
                field(DisposalDate;"Disposal Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        fileMovementRec.Reset;
        fileMovementRec.SetRange(fileMovementRec."File Code","File Code");
        fileMovementRec.SetRange(fileMovementRec.Volume,Volume);
        fileMovementRec.SetRange(fileMovementRec.Transfered,false);
        fileMovementRec.SetRange(fileMovementRec."Returned?",false);
        if fileMovementRec.Find('+') then begin
        FileHolder:=fileMovementRec."Officer Name";

        end else begin
        FileHolder:='REGISTRY';
        end;
    end;

    var
        FileHolder: Text[100];
        fileMovementRec: Record "File Movement Details1";
}

