Page 52194014 "Training Request HR-Others"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Training Request-Others1";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestNo; "Request No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TrainingObjective; "Training Objective")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Objective';
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course Title';
                }
                field(From; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'From';
                    NotBlank = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                        frmcalendar.SetDate("Planned Start Date");
                        frmcalendar.RUNMODAL;
                        D := frmcalendar.GetDate;
                        CLEAR(frmcalendar);
                        IF D <> 0D THEN
                          "Planned Start Date" := D;
                         */

                    end;
                }
                field(NoOfDays; "No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingInsitution; "Training Insitution")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Venue; Venue)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(CountryCode; "Country Code")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(TuitionFee; "Tuition Fee")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCost; "Total Cost")
                {
                    ApplicationArea = Basic;
                }
                field(ExchangeRateCBKMeanRate; "Exchange Rate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exchange Rate (CBK Mean Rate)';
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PlannedEndDate; "Planned End Date")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                        frmcalendar.SetDate("Planned End Date");
                        frmcalendar.RUNMODAL;
                        D := frmcalendar.GetDate;
                        CLEAR(frmcalendar);
                        IF D <> 0D THEN
                          "Planned End Date" := D;
                        VALIDATE("Planned End Date");
                          */

                    end;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                }
                field(PerDiem; "Per Diem")
                {
                    ApplicationArea = Basic;
                }
                field(CBKWebsiteAddress; "CBK Website Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TotalCostLCY; "Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AirTicketTransport; "Air Ticket")
                {
                    ApplicationArea = Basic;
                    Caption = 'Air Ticket/Transport';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Enabled = false;
                Image = Print;
                Visible = false;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("Request No.", "Request No.");
                    Report.Run(69106, true, true, Rec);
                    Reset;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        D: Date;
}

