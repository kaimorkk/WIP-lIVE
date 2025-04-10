Page 52193929 "Visit to Utilities"
{
    PageType = Card;
    SourceTable = "Visit to Utilities1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(VisitNo; "Visit No")
                {
                    ApplicationArea = Basic;
                }
                field(UtilityNo; "Utility No")
                {
                    ApplicationArea = Basic;
                }
                field(UtilityName; "Utility Name")
                {
                    ApplicationArea = Basic;
                }
                field(VisitStartDate; "Visit Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(VisitEndDate; "Visit End Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoOfStaffVisiting; "No. Of Staff Visiting")
                {
                    ApplicationArea = Basic;
                }
                field(Attachment; Attachment)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Employees)
            {
                Caption = 'Employees';
                part(Control1000000014; "Visiting Employees")
                {
                    SubPageLink = "Visit No" = field("Visit No");
                }
            }
            group(Commissioners)
            {
                Caption = 'Commissioners';
                part(Control1000000016; "Visiting Commissioners")
                {
                    SubPageLink = "Visit No." = field("Visit No");
                }
            }
            group(Stakeholders)
            {
                Caption = 'Stakeholders';
                part(Control1000000017; "Visiting Stakeholders")
                {
                    SubPageLink = "Visit No" = field("Visit No");
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Approvals)
            {
                Caption = 'Approvals';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        ////if ApprovalMgt.SendVisitApprovalRequest(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';

                    trigger OnAction()
                    begin
                        ////if ApprovalMgt.CancelBoardMedClaimApprovalRequest(Rec, true, true) then;
                    end;
                }
            }
            group(Document)
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
                        if InteractTemplLanguage.Get("Visit No", "Language Code (Default)") then
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
                        if not InteractTemplLanguage.Get("Visit No", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Visit No";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := "Utility Name";
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
                        if not InteractTemplLanguage.Get("Visit No", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Visit No";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := "Utility Name";
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
                        if not InteractTemplLanguage.Get("Visit No", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Visit No";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := "Utility Name";
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
                        if InteractTemplLanguage.Get("Visit No", "Language Code (Default)") then
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
                        if InteractTemplLanguage.Get("Visit No", "Language Code (Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Attachment := Attachment::No;
                            Modify;
                        end;
                    end;
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}

