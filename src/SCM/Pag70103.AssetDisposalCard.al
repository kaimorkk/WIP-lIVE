

page 70103 "Asset Disposal Card"
{
    PageType = Card;
    SourceTable = "Asset Disposal";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Disposal No"; Rec."Disposal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disposal No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Item/Fixed Asset"; Rec."Item/Fixed Asset")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item/Fixed Asset field.';
                }
                field("Asset Code"; Rec."Asset Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Code field.';
                }
                field("Asset Name"; Rec."Asset Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Name field.';
                }
                field("Committee Code"; Rec."Committee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Code field.';
                }
                field("Committee Recommendations"; Rec."Committee Recommendations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Recommendations field.';
                }
                field("Valuation Amount"; Rec."Valuation Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Valuation Amount field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("<Action1000000024>")
            {
                Caption = 'Disposal Committee Minutes';
                Visible = true;
                action("<Action1000000025>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';
                    ToolTip = 'Executes the Open action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action("<Action1000000026>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;
                    ToolTip = 'Executes the Create action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Rec."Disposal No";
                            InteractTemplLanguage."Language Code" := Rec."Language Code (Default)";
                            InteractTemplLanguage.Description := Rec.Description;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Rec.Attachement := Rec.Attachement::Yes;
                        Rec.Modify;
                    end;
                }
                action("<Action1000000027>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;
                    ToolTip = 'Executes the Copy &from action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Rec."Disposal No";
                            InteractTemplLanguage."Language Code" := Rec."Language Code (Default)";
                            InteractTemplLanguage.Description := Rec.Description;
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Rec.Attachement := Rec.Attachement::Yes;
                        Rec.Modify;
                    end;
                }
                action("<Action1000000028>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;
                    ToolTip = 'Executes the Import action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Rec."Disposal No";
                            InteractTemplLanguage."Language Code" := Rec."Language Code (Default)";
                            InteractTemplLanguage.Description := Rec.Description;
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Rec.Attachement := Rec.Attachement::Yes;
                        Rec.Modify;
                    end;
                }
                action("<Action1000000029>")
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;
                    ToolTip = 'Executes the E&xport action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then
                            InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action("<Action1000000030>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;
                    ToolTip = 'Executes the Remove action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Rec.Attachement := Rec.Attachement::No;
                            Rec.Modify;
                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action("<Action1000000041>")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                var
                //ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    //IF ApprovalMgt.SendDisposalApprovalRequest(Rec) THEN;
                end;
            }
            action("<Action1000000042>")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                var
                //ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    //IF ApprovalMgt.CancelDisposalApprovalRequest(Rec,TRUE,TRUE) THEN;
                end;
            }
        }
    }
}

#pragma implicitwith restore

