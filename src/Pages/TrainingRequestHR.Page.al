Page 52193999 "Training Request HR"
{
    PageType = Card;
    SourceTable = "Training Request1";

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
                field(GrouporIndividual; "Group or Individual")
                {
                    ApplicationArea = Basic;
                }
                field(LocalorAbroad; "Local or Abroad")
                {
                    ApplicationArea = Basic;
                }
                field(SourceofFunding; "Source of Funding")
                {
                    ApplicationArea = Basic;
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
                field(PerDiemDays; "Per Diem Days")
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
                field(PerDiem; "Per Diem Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Per Diem';
                    Editable = false;
                }
                field(ReimbursibleImprest; "Reimbursible Imprest Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reimbursible Imprest';
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
                field(TravelDocumentsFees; "Travel Documents Fees Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Documents Fees';
                    Editable = false;
                }
                field(RequiresLPO; "Requires LPO")
                {
                    ApplicationArea = Basic;
                }
                field(TuitionFee; "Tuition Fee Flow")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tuition Fee';
                    Editable = false;
                }
                field(TotalCost; "Total Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TotalCostLCY; "Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CountryCode; "Country Code")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = Basic;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                }
                field(BudgetName; "Budget Name")
                {
                    ApplicationArea = Basic;
                }
                field(ExchangeRateCBKMeanRate; "Exchange Rate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exchange Rate (CBK Mean Rate)';
                }
                field(CBKWebsiteAddress; "CBK Website Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
            part(Control1000000004; "Training Participants")
            {
                SubPageLink = "Training Request" = field("Request No."),
                              "Period End Date" = field("Period End Date");
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
                    Visible = false;

                    trigger OnAction()
                    begin
                        ////if ApprovalMgt.SendTrainingApprovalRequest(Rec) then;
                    end;
                }
                action(NotifyFinance)
                {
                    ApplicationArea = Basic;
                    Caption = 'Notify Finance';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        if "Finance Notified" = true then
                            Error('Finance has already been notified');

                        UserSetup.Get(UserId);
                        UserSetup.TestField("E-Mail");
                        SenderAddress := UserSetup."E-Mail";
                        TParticipants.Reset;
                        TParticipants.SetRange("Training Request", "Request No.");

                        if TParticipants.Find('-') then
                            repeat
                                Employees := TParticipants."Employee Name" + ' ' + TParticipants."Employee Name" + ', \';
                            until TParticipants.Next = 0;

                        CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Reimbursible Imprest Flow", "Travel Documents Fees Flow");

                        CompInfo.Get;
                        Subject := StrSubstNo('Employee Training Plan Entry %1', "Request No.");
                        Body := StrSubstNo('This is to Notify you that the Tranining Request %1 with the following particulars needs your action, COURSE TITLE: %2 TUITION FEE: %3', "Request No.", "Course Title", "Tuition Fee Flow");
                        Body2 := StrSubstNo('REIMBURSIBLE IMPREST: %1 TRAVEL DOCUMENTS FEES: %2, AIRTICKET/TRANSPORT: %3, PER DIEM: %4', "Reimbursible Imprest Flow", "Travel Documents Fees Flow", "Air Ticket Flow", "Per Diem Flow");

                        // MESSAGE(Body);
                        SMTP.Create(CompInfo."Finance Support Email", Subject, Body + Body2, true);
                        Email.Send(SMTP);
                        Message('Finance has been notified');
                        "Finance Notified" := true;
                        Modify;
                    end;
                }
                action(NotifyProcurement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Notify Procurement';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin

                        if "Procurement Notified" = true then
                            Error('Procurement has already been notified');

                        UserSetup.Get(UserId);
                        UserSetup.TestField("E-Mail");
                        SenderAddress := UserSetup."E-Mail";
                        TParticipants.Reset;
                        TParticipants.SetRange("Training Request", "Request No.");
                        if TParticipants.Find('-') then
                            repeat
                                Employees := TParticipants."Employee Name" + ' ' + TParticipants."Employee Name" + ', \';
                            until TParticipants.Next = 0;
                        CompInfo.Get;
                        //"Requires Flight"="Requires Flight"::Yes
                        if ("Requires LPO" = "Requires LPO") and ("Requires Flight" = "requires flight"::Yes) then begin

                            CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Reimbursible Imprest Flow", "Travel Documents Fees Flow");

                            Body := StrSubstNo('This is to Notify you that Training Request %1 with the following particulars needs your action-preparing LPO for tuition fee and facilitating travel;', "Request No.");
                            Body2 := StrSubstNo('\COURSE TITLE: %1\INSTITUTION: %2\START DATE: %3 END DATE: %4\TUITION FEE: %5', "Course Title", "Training Insitution", "Planned Start Date", "Planned End Date", "Tuition Fee Flow");
                            Body3 := StrSubstNo('\DATE OF TRAVEL: %1 ' + ' DATE OF RETURN: %2\DESTINATION: %3\AIR TICKET: %4\TUITION FEE: %5.', "Date of Travel", "Return Date", Destination, "Air Ticket Flow");

                            SMTP.Create(CompInfo."Procurement Support E-mail", Subject, Body + Body2 + Body3, true);
                            Email.Send(SMTP);
                            Message('Procurement has been notified to facilitate procurement of transport and preparation of the LPO for the tuition fee');
                        end
                        else if ("Requires LPO" = "Requires LPO") and ("Requires Flight" = "requires flight"::No) then begin

                            CalcFields("Tuition Fee Flow", "Per Diem Flow", "Air Ticket Flow", "Reimbursible Imprest Flow", "Travel Documents Fees Flow");

                            Body := StrSubstNo('This is to Notify you that Training Request %1 with the following particulars needs your action-preparing LPO for tuition fee;', "Request No.");
                            Body2 := StrSubstNo('\COURSE TITLE: %1\INSTITUTION: %2\START DATE: %3 END DATE: %4\TUITION FEE: %5.',
                             "Course Title", "Training Insitution", "Planned Start Date", "Planned End Date", "Tuition Fee Flow");

                            SMTP.Create(CompInfo."Procurement Support E-mail", Subject, Body + Body2 + Body3, true);
                            Email.Send(SMTP);

                            Message('Procurement has been notified to facilitate preparation and sending of the LPO for the tuition fee');
                        end;
                        "Procurement Notified" := true;
                        Modify;
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

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("Request No.", "Request No.");
                    Report.Run(51511193, true, true, Rec);
                    Reset;
                end;
            }
            group(Documents)
            {
                Caption = 'Documents';
                action(ViewDocument)
                {
                    ApplicationArea = Basic;
                    Caption = 'View Document';
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
                action(Upload)
                {
                    ApplicationArea = Basic;
                    Caption = 'Upload';
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
                action(Download)
                {
                    ApplicationArea = Basic;
                    Caption = 'Download';
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

    trigger OnAfterGetRecord()
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
        UserSetup: Record "User Setup";
        SenderAddress: Text[80];
        Subject: Text[100];
        Body: Text[250];
        CompInfo: Record "Company Information";
        SMTP: Codeunit "Email Message";
        Email: Codeunit Email;
        Employees: Text[500];
        TParticipants: Record "Training Participants";
        Body2: Text[250];
        Body3: Text[250];
}

