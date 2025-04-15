namespace ALProjectLIWPA.ALProjectLIWPA;
using Microsoft.HumanResources.Employee;
using Microsoft.Foundation.NoSeries;
using System.Automation;
using Microsoft.Finance.Dimension;
using System.Security.User;

page 50032 "Imprest Memo"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Imprest Memo";
    Caption = 'Safari Imprest';
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
                Editable = DocEditable;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                group(WarrantDetails)
                {
                    showCaption = false;
                    visible = false;
                    field("Warrant Voucher Type"; Rec."Warrant Voucher Type")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Warrant Voucher Type field.';
                    }
                    field("Warrant No"; Rec."Warrant No")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Warrant No field.';
                    }
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the ObjText field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Objective);
                        Rec.Objective.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec.Objective);
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec.Objective.CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("Terms of Reference"; TORText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the TORText field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Terms of Reference");
                        Rec."Terms of Reference".CreateInstream(Instr);
                        TOR.Read(Instr);

                        if TORText <> Format(TOR) then begin
                            Clear(Rec."Terms of Reference");
                            Clear(TOR);
                            TOR.AddText(TORText);
                            Rec."Terms of Reference".CreateOutstream(OutStr);
                            TOR.Write(OutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("Imprest Naration"; Rec."Imprest Naration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Trip Narrations';
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Trip Narrations field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Requestor field.';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requestor Name field.';
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Date';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Travel Date field.';
                }
                field("No. of days"; Rec."No. of days")
                {
                    ApplicationArea = Basic;
                    //Numeric = true;
                    ToolTip = 'Specifies the value of the No. of days field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Total Subsistence Allowance"; Rec."Total Subsistence Allowance")
                {
                    Caption = 'Total Team Costs';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Subsistence Allowance field.';
                }
                field("Total Fuel Costs"; Rec."Total Fuel Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Fuel Costs field.';
                    Visible = false;
                }
                field("Total Maintenance Costs"; Rec."Total Maintenance Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Maintenance Costs field.';
                    Visible = false;
                }
                field("Total Casuals Cost"; Rec."Total Casuals Cost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Casuals Cost field.';
                }
                field("Total Other Costs"; Rec."Total Other Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Other Costs field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic, Suite;
                }

                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Strategic Plan"; Rec."Strategic Plan")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Reporting Year Code"; Rec."Reporting Year Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Expenditure Requisition Code"; Rec."Expenditure Requisition Code")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group(Recalling)
            {
                field("Reason to Reopen"; "Reason to Reopen")
                {
                    ApplicationArea = all;
                    Editable = Rec.Status = rec.Status::Released;
                }
            }
            group("Travel Details")
            {
                Visible = false;
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Out field.';
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journey Route field.';
                }
            }
            part(Control1000000020; "Safari Team")
            {
                Caption = 'Team';
                Editable = DocEditable;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Person);
                ApplicationArea = Basic;
            }
            // part("Fuel/Maintenance"; Fuel)
            // {
            //     Editable = not OpenApprovalEntriesExist;
            //     SubPageLink = "Imprest Memo No." = field("No."),
            //                   Type = const(Machine);
            //     ApplicationArea = Basic;
            //     Visible = false;
            // }
            // part(Control1000000021; "Execution Plan")
            // {
            //     Editable = not OpenApprovalEntriesExist;
            //     SubPageLink = "Imprest Memo No." = field("No.");
            //     Visible = false;
            //     ApplicationArea = Basic;
            // }
            // part(Control1000000022; Casuals)
            // {
            //     Editable = not OpenApprovalEntriesExist;
            //     SubPageLink = "Imprest Memo No." = field("No.");
            //     Visible = false;
            //     ApplicationArea = Basic;
            // }
            // part(Control1000000023; "Other Costs")
            // {
            //     Editable = not OpenApprovalEntriesExist;
            //     SubPageLink = "Imprest Memo No." = field("No.");
            //     ApplicationArea = Basic;
            // }
        }
        area(factboxes)
        {
            part("Attached Documents"; Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                // SubPageLink = "Table ID" = const(57008),
                //               "No." = field("No.");
                // SubPageLink = Document_No = field("No.");
            }
            systempart(Control1000000017; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000018; MyNotes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Imprest")
            {
                ApplicationArea = Basic;
                Enabled = true;
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                Visible = (not Rec."Imprest Created") and (Rec.Status = Rec.Status::Released);
                ToolTip = 'Executes the Create Imprest action.';
                trigger OnAction()
                var
                    Text004: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
                    Imprestheaders: Record Payments;
                    SafariMembers1, SafariMembers : Record "Project Members";
                    Memoheaders: Record "Imprest Memo";
                    CashMgt: Record "Cash Management Setup";
                    NoSeriesMgt: Codeunit NoSeriesManagement;
                    Noseries: Code[30];
                    Email2, Email1 : Text;
                    LineNO: Integer;
                    Imprestlines: Record "Imprest Lines";
                    EMp: Record Employee;
                    Othercost: Record "Other Costs";
                    Casual: Record Casuals;
                    Paymode: Record "Pay Mode";
                begin
                    //add pv from claims
                    //added on 27/04/2017
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
                    if Confirm(Text004, false, Rec."No.") then begin
                        Memoheaders.Reset;
                        Memoheaders.SetRange(Memoheaders."No.", Rec."No.");
                        if Memoheaders.Find('-') then begin
                            //set current key

                            SafariMembers.Reset;
                            SafariMembers.SetCurrentkey("No.");
                            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
                            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                            if SafariMembers.Find('-') then begin
                                repeat
                                    if (SafariMembers1."No." <> SafariMembers."No.") then begin
                                        //get the no. series
                                        CashMgt.Reset;
                                        if CashMgt.Find('-') then begin
                                            Noseries := CashMgt."Imprest Nos";
                                            Email2 := CashMgt."Imprest Email";
                                        end;
                                        //create header
                                        LineNo := 1000;
                                        Imprestheaders.Init;
                                        Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
                                        Imprestheaders.Date := Today;
                                        Imprestheaders."Posting Date" := Memoheaders.Date;
                                        Imprestheaders."Pay Mode" := Memoheaders."Pay Mode";
                                        // if Imprestheaders."Pay Mode" = '' then
                                        //     Imprestheaders."Pay Mode" := PayMode.GetDefaultPayMode();
                                        Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
                                        Imprestheaders."Account No." := SafariMembers."No.";
                                        Imprestheaders."Account Name" := SafariMembers.Name;
                                        Imprestheaders.Validate("Account No.");
                                        Imprestheaders."Payment Type" := Imprestheaders."payment type"::Imprest;
                                        Imprestheaders.Payee := SafariMembers.Name;
                                        Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                                        Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                                        Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                                        Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                                        Imprestheaders.Job := Memoheaders.Job;
                                        Imprestheaders.Status := Imprestheaders.Status::Open;//matara
                                        Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                                        Imprestheaders."Job Task No." := Memoheaders."Job  Task";
                                        Imprestheaders."Currency Code" := SafariMembers."Currency Code";
                                        Imprestheaders."Created By" := UserId;
                                        //Imprestheaders."Reference No.":="No.";
                                        Email1 := '';
                                        EMp.Reset;
                                        EMp.SetRange("No.", Imprestheaders."Account No.");
                                        Imprestheaders."Travel Date" := Memoheaders."Start Date";
                                        Imprestheaders."Payment Narration" := Memoheaders.Subject;
                                        Imprestheaders."Return Date" := Memoheaders."Return Date";
                                        Imprestheaders.Validate(Imprestheaders."Return Date");
                                        Imprestheaders."Document Type" := Imprestheaders."document type"::Imprest;
                                        Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                                        Imprestheaders."On behalf of" := SafariMembers.Name;
                                        Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
                                        Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");
                                        Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                                        //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
                                        Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                                        Imprestheaders."Dimension Set ID" := Memoheaders."Dimension Set ID";
                                        //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");
                                        Imprestheaders."Strategic Plan" := Memoheaders."Strategic Plan";
                                        Imprestheaders."Reporting Year Code" := Memoheaders."Reporting Year Code";
                                        Imprestheaders."Workplan Code" := Memoheaders."Workplan Code";
                                        Imprestheaders."Activity Code" := Memoheaders."Activity Code";
                                        Imprestheaders."Expenditure Requisition Code" := Memoheaders."Expenditure Requisition Code";

                                        Imprestheaders.Insert;
                                    end;

                                    //Start of Imprest lines
                                    Imprestlines.Init;
                                    Imprestlines."Line No" := LineNo;
                                    Imprestlines.No := Imprestheaders."No.";
                                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                    SafariMembers.CalcFields("G/L Account");
                                    Imprestlines."Account No." := SafariMembers."G/L Account";
                                    Imprestlines.Validate(Imprestlines."Account No.");
                                    Imprestlines.Purpose := SafariMembers."Work Type";
                                    Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                    Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                    Imprestlines."No. of Days" := SafariMembers."Time Period";
                                    Imprestlines.Amount := SafariMembers.Entitlement;
                                    Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                    Imprestlines.Insert;
                                    LineNo := LineNo + 10;
                                    if SafariMembers."Transport Costs" <> 0 then begin
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";
                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        SafariMembers.CalcFields("G/L Account");
                                        Imprestlines."Account No." := SafariMembers."G/L Account";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := 'Transport Allowance';
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := SafariMembers."Transport Costs";
                                        Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        ImprestLines."Dimension Set ID" := Memoheaders."Dimension Set ID";
                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;
                                    end;

                                    if SafariMembers."Project Lead" = true then begin
                                        ProjectTeam.Reset;
                                        ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Rec."No.");
                                        ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
                                        if ProjectTeam.Find('-') then
                                        //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                                        begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";
                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                SafariMembers.CalcFields("G/L Account");
                                                Imprestlines."Account No." := ProjectTeam."G/L Account";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                Imprestlines.Purpose := ProjectTeam."Work Type";
                                                Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                                Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                                Imprestlines."No. of Days" := SafariMembers."Time Period";
                                                Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                                                Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                                Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                                ImprestLines."Dimension Set ID" := Memoheaders."Dimension Set ID";
                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until ProjectTeam.Next = 0;
                                        end;


                                        Othercost.Reset;
                                        Othercost.SetRange(Othercost."Imprest Memo No.", Rec."No.");
                                        if Othercost.Find('-') then begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";

                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                // Othercost.CalcFields("No.");
                                                // Imprestlines."Account No." := Othercost."No.";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                // Imprestlines.Purpose := Othercost."Required For";
                                                Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                                Imprestlines."No. of Days" := SafariMembers."Time Period";
                                                // Imprestlines.Amount := Othercost."Line Amount";
                                                Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                                Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                                Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                                ImprestLines."Dimension Set ID" := Memoheaders."Dimension Set ID";
                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until Othercost.Next = 0;
                                        end;

                                        Casual.Reset;
                                        Casual.SetRange(Casual."Imprest Memo No.", Rec."No.");
                                        if Casual.Find('-') then begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";

                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                Imprestlines."Account No." := Casual."G/L Account";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                Imprestlines.Purpose := Casual.Activity;
                                                Imprestlines."Daily Rate" := Casual.Rate;
                                                Imprestlines."No. of Days" := Casual."No. of Days";
                                                Imprestlines.Amount := Casual.Amount;
                                                Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                                Imprestlines."Global Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                                Imprestlines."Global Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                                ImprestLines."Dimension Set ID" := Memoheaders."Dimension Set ID";
                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until Casual.Next = 0;
                                        end;
                                    end;

                                    Imprestheaders.Validate(Imprestheaders.Status);
                                    // //send email to participants
                                    // CashMgt.Get;
                                    // if CashMgt."Send Email Notification" = true then begin
                                    //     if Email1 <> '' then begin
                                    //         Body := 'Your imprest application no. ' + Imprestheaders."No." + ' has been created from memo no. ' + Rec."No." +
                                    //         ' Kindly logon to Microsoft Dynamics 365 Business Central to confirm and send it for approval.';

                                    //         //SMTP.Create('Judiciary', Email2,
                                    //         // Email1, 'Imprest ' + 'No: ' + Imprestheaders."No.",
                                    //         // 'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
                                    //         // 'Your imprest application no. ' + Imprestheaders."No." + 'of amount ' + Format(SafariMembers.Entitlement) + ''' has been created from memo no. ' + "No." +
                                    //         // ' and has been fowarded to finance for processing.<BR><BR>', true);

                                    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
                                    //         //SMTP.Send();

                                    //     end;
                                    // end;
                                    SafariMembers1 := SafariMembers;
                                until SafariMembers.Next = 0;
                            end;

                            Memoheaders."Imprest Created" := true;
                            Memoheaders."Date converted" := Today;
                            Memoheaders."Time converted" := Time;
                            Memoheaders."Converted By" := UserId;
                            Memoheaders.Posted := true;
                            Memoheaders.Modify;

                        end;
                        Message('Imprest (s) for the imprest memo No. %1 has been processed, Kindly send for approval', Rec."No.");
                    end else
                        Error('The payment for claim No. %1 has already been processed.', Memoheaders."No.");
                    //END;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Visible = Rec.Status = Rec.Status::Open;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";

                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    editTransport := false;
                    Rec.TestField(Status, Rec.Status::Open);//status must be open.
                    //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
                    Rec.TestField(Objective);
                    Rec.TestField(Subject);
                    Rec.TestField(Date);
                    Rec.TestField("Imprest Naration");
                    //TESTFIELD(Job);
                    //TESTFIELD("Job  Task");
                    Rec.TestField("Global Dimension 1 Code");
                    Rec.TestField("Global Dimension 2 Code");
                    //IF "Vote Amount"<"Total Subsistence Allowance" THEN
                    //ERROR('Budgeted Amount is less than the Amount requested');

                    //check if the requester is part of the team
                    Rec.CalcFields("Total Subsistence Allowance", "Total Fuel Costs", "Total Maintenance Costs", "Total Casuals Cost", "Total Other Costs");
                    TotalImprestAmount := Rec."Total Subsistence Allowance" + Rec."Total Fuel Costs" + Rec."Total Maintenance Costs" + Rec."Total Casuals Cost" + Rec."Total Other Costs";

                    VarVariant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = CanCancelApprovalRequest;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Enabled = Show;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = (Rec.Status = Rec.Status::Released) and (not Rec.Posted);
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    PaymentPost.PostImprestMemo(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Imprest Memo", true, true, Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    ApprovalsMgt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("ReOpen Document")
            {
                ApplicationArea = Basic;
                Caption = 'ReOpen Document';
                Image = ReleaseDoc;
                ShortCutKey = 'Ctrl+F9';
                ToolTip = 'Executes the Reopen Document action.';
                Promoted = true;
                PromotedCategory = Category4;
                visible = rec.Status = rec.Status::Released;
                trigger OnAction()
                var
                //ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    Rec.TestField("Reason to Reopen");
                    rec.TestField(Posted, false);
                    rec.TestField(Status, Status::Released);
                    if confirm('Do you want to reopen this document?') then begin
                        rec.status := rec.status::open;
                        rec.Modify();
                    end
                    // Releasememo.PerformManualRelease(Rec);
                end;
            }
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = Rec."No." <> '';
                Image = Dimensions;
                Promoted = true;
                ShortCutKey = 'Shift+Ctrl+D';
                PromotedCategory = Process;
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowEditDimension(CurrPage.Editable);
                    CurrPage.Update();
                end;
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.GetApprovalComment(Rec.RecordID);
                    end;
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        DMSManagement: Codeunit "Sharepoint Integration";
                        DocType: Enum SharepointDocumentType;
                    begin
                        DocType := DocType::Imprest;
                        DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'BMA', 57008, 'Imprest Memo');
                    end;
                }
                action("View Attached Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;


                    trigger OnAction()
                    var
                        attachLink: Record Attachments;
                    begin
                        attachLink.setRange(attachLink.Document_No, Rec."No.");
                        if attachLink.FindSet then
                            Page.Run(Page::Attachments, attachLink)
                        else
                            Error('No attached links found');

                    end;
                }

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
        Rec.CalcFields("Terms of Reference", Objective);
        Rec."Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);

        Rec.Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Imprest Memo";
    end;

    trigger OnOpenPage()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
        if Rec.Status <> Rec.Status::Open then
            // CurrPage.Editable := false;
            DocEditable := false else
            DocEditable := true;
    end;

    var
        OpenApprovalEntriesExist, CanCancelApprovalRequest : Boolean;
        PaymentPost: Codeunit "Payment- Post";
        Show: Boolean;
        TOR: BigText;
        Instr: InStream;
        DocEditable: Boolean;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        ProjectTeam: Record "Project Members";
        Text001: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        Text002: label 'The Imprest Memo must be fully approved before printing';
        Text003: label 'You do no have rights to post Imprest memo surrender. Please Seek Assistance from Accounts';
        usersetup: Record "User Setup";
        Releasememo: Codeunit "Imprest Memo";
        pteam: Record "Project Members";
        impmemo: Record "Imprest Memo";
        exeplan: Record "Execution Plan";
        editTransport: Boolean;
        safariteam: Page "Safari Team";
        TotalImprestAmount: Decimal;
        OpenApprovalEntriesExistForCurrUser: Boolean;
    // DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        CanCancelApprovalRequest := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
    end;
}


