Page 52194368 "Employee Training Request"
{
    PageType = Card;
    SourceTable = "ESS Training Request1";

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
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestedByNo; "Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Requested By No';
                    Editable = false;
                }
                field(RequestedByName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Requested By Name';
                    Editable = false;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DirectorateName; "Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode; "Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DepartmentName; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TrainingNeedObjective; "Training Objective")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Need/Objective';
                    NotBlank = true;
                }
                field(SpecificCourseinMind; "Specific Course in Mind")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course Title';
                }
                field(LocalorAbroad; "Local or Abroad")
                {
                    ApplicationArea = Basic;
                }
                field(SourceofFunding; "Source of Funding")
                {
                    ApplicationArea = Basic;
                }
                field(PlannedStartDate; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(PlannedEndDate; "Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoOfDays; "No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field(DateofTravel; "Date of Travel")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate; "Return Date")
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
                field(TuitionFee; "Tuition Fee Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tuition Fee';
                    Editable = false;
                }
                field(PerDiem; "Per Diem Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Per Diem';
                    Editable = false;
                }
                field(RequiresFlight; "Requires Flight")
                {
                    ApplicationArea = Basic;
                }
                field(AirTicket; "Air Ticket Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Air Ticket';
                    Editable = false;
                }
                field(ReimbursibleImprest; "Reimbursible Imprest Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reimbursible Imprest';
                    Editable = false;
                }
                field(TravelDocumentsFees; "Travel Documents Fees Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Documents Fees';
                    Editable = false;
                }
                field(TotalCost; "Total Cost")
                {
                    ApplicationArea = Basic;
                }
                field(CountryCode; "Country Code")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                }
                field(ExchangeRateCBKMeanRate; "Exchange Rate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exchange Rate (CBK Mean Rate)';
                }
                field(TotalCostLCY; "Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofApprovals; "No. of Approvals")
                {
                    ApplicationArea = Basic;
                }
                field(Budget; Budget)
                {
                    ApplicationArea = Basic;
                }
                field(Actual; Actual)
                {
                    ApplicationArea = Basic;
                }
                field(Variance; Variance)
                {
                    ApplicationArea = Basic;
                }
                field(Attachment; Attachment)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000040; "Request Training Participants")
            {
                Caption = 'List the Expected Participants Below, Including Self if Attending.';
                SubPageLink = "Training Request" = field("Request No.");
            }
            label(Control1000000042)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Training)
            {
                Caption = 'Training';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        if ("Specific Course in Mind" = "specific course in mind"::Yes) and (Description = '') then
                            Error('Course Title cannot be blank with a specific course in mind, please enter the course title');
                        CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Reimbursible Imprest Flow", "Travel Documents Fees Flow");
                        if ("Specific Course in Mind" = "specific course in mind"::Yes) and ("Tuition Fee Flow" = 0) then
                            Error('Tuition Fee cannot be 0.00 with a specific course in mind, please enter an estimate amount or consult the officer in charge of training');
                        if ("Specific Course in Mind" = "specific course in mind"::Yes) and ("Requires Flight" = "requires flight"::No) and ("Air Ticket Flow" = 0) then
                            Error('Transport cost cannot be 0.00 with a specific course in mind, please enter an estimate amount or consult the officer in charge of training');
                        if ("Specific Course in Mind" = "specific course in mind"::Yes) and ("Requires Flight" = "requires flight"::Yes) and ("Air Ticket Flow" = 0) then
                            Error('Air Ticket Cost cannot be 0.00 with a specific course in mind, please enter an estimate amount or consult the officer in charge of training');
                        if ("Specific Course in Mind" = "specific course in mind"::Yes) and ("Local or Abroad" = "local or abroad"::Abroad) and ("Reimbursible Imprest Flow" = 0) then
                            Error('Reimbursible Imprest cannot be 0.00 for training Abroad with a specific course in mind, please enter an estimate amount or consult the officer in charge of training');

                        // //if ApprovalMgt.SendEmpTrainingApprovalRequest(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.CancelEmpTrainingApprovalRequest(Rec, true, false) then;
                    end;
                }
            }
        }
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Visible = false;

                trigger OnAction()
                begin
                    //RESET;
                    //SETFILTER("Request No.","Request No.");
                    //REPORT.RUN(69106,TRUE,TRUE,Rec);
                    //RESET;
                end;
            }
            group(Documents)
            {
                Caption = 'Documents';
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("Request No.", "Language Code(Default)") then
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("Request No.", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Request No.";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := Description;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Copyfrom)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("Request No.", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Request No.";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := Description;
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("Request No.", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Request No.";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := Description;
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Export)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("Request No.", "Language Code(Default)") then
                            InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("Request No.", "Language Code(Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Attachment := Attachment::No;
                            Modify;
                        end;
                    end;
                }
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

    trigger OnAfterGetCurrRecord()
    begin
        CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Travel Documents Fees Flow", "Reimbursible Imprest Flow");
        "Tuition Fee Flow" := "Tuition Fee Flow" + "Tuition Fee";
        "Per Diem Flow" := "Per Diem Flow" + "Per Diem";
        "Air Ticket Flow" := "Air Ticket Flow" + "Air Ticket";
        //"Travel Documents Fees Flow":="Travel Documents Fees Flow"+;
        "Reimbursible Imprest Flow" := "Reimbursible Imprest Flow" + "Reimbursible Interest";

        "Total Cost" := "Tuition Fee Flow" + "Per Diem Flow" + "Air Ticket Flow" + "Travel Documents Fees Flow" + "Reimbursible Imprest Flow";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Travel Documents Fees Flow", "Reimbursible Imprest Flow");
        "Tuition Fee Flow" := "Tuition Fee Flow" + "Tuition Fee";
        "Per Diem Flow" := "Per Diem Flow" + "Per Diem";
        "Air Ticket Flow" := "Air Ticket Flow" + "Air Ticket";
        //"Travel Documents Fees Flow":="Travel Documents Fees Flow"+;
        "Reimbursible Imprest Flow" := "Reimbursible Imprest Flow" + "Reimbursible Interest";

        "Total Cost" := "Tuition Fee Flow" + "Per Diem Flow" + "Air Ticket Flow" + "Travel Documents Fees Flow" + "Reimbursible Imprest Flow";
    end;

    trigger OnOpenPage()
    begin
        SetRange("User ID", UserId);

        CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Travel Documents Fees Flow", "Reimbursible Imprest Flow");

        "Tuition Fee Flow" := "Tuition Fee Flow" + "Tuition Fee";
        "Per Diem Flow" := "Per Diem Flow" + "Per Diem";
        "Air Ticket Flow" := "Air Ticket Flow" + "Air Ticket";
        //"Travel Documents Fees Flow":="Travel Documents Fees Flow"+;
        "Reimbursible Imprest Flow" := "Reimbursible Imprest Flow" + "Reimbursible Interest";

        "Total Cost" := "Tuition Fee Flow" + "Per Diem Flow" + "Air Ticket Flow" + "Travel Documents Fees Flow" + "Reimbursible Imprest Flow";
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        D: Date;
        Text01: label 'List members of staff to participate in this training';
}

