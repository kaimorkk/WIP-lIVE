Page 52193672 "Notification Card"
{
    PageType = Card;
    SourceTable = Notifications;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Subject; Subject)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(MessageType; "Message Type")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000002; "Notification Lines")
            {
                SubPageLink = No = field(Code);
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Links)
            {
            }
            systempart(Control1000000014; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(MailTemplates)
            {
                Caption = '&Mail Templates';
                Image = Template;
                group(ApprovalMailTemplate)
                {
                    Caption = 'Approval Mail Template';
                    Image = Template;
                    action(Import)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Import';
                        Ellipsis = true;
                        Image = Import;

                        trigger OnAction()
                        var
                            RBAutoMgt: Codeunit "File Management";
                        // BLOBRef: Codeunit "Temp Blob";
                        begin
                            // CalcFields(Template);
                            // if Template.Hasvalue then
                            //   AppTemplateExists := true;

                            // if RBAutoMgt.BLOBImport(BLOBRef,'*.HTM') = '' then
                            //   exit;

                            // Template := BLOBRef.Blob;

                            // if AppTemplateExists then
                            //   if not Confirm(Text002,false,FieldCaption(Template)) then
                            //     exit;
                            // CurrPage.SaveRecord;
                        end;
                    }
                    action(Export)
                    {
                        ApplicationArea = Basic;
                        Caption = 'E&xport';
                        Ellipsis = true;
                        Image = Export;

                        trigger OnAction()
                        var
                            RBAutoMgt: Codeunit "File Management";
                        // BLOBRef: Codeunit "Temp Blob";
                        begin
                            // CalcFields(Template);
                            // if Template.Hasvalue then begin
                            //   BLOBRef.Blob := Template;
                            //   RBAutoMgt.BLOBExport(BLOBRef,'*.HTM',true);
                            // end;
                        end;
                    }
                    action(Delete)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Delete';
                        Ellipsis = true;
                        Image = Delete;

                        trigger OnAction()
                        begin
                            CalcFields(Template);
                            if Template.Hasvalue then
                                if Confirm(Text003, false, FieldCaption(Template)) then begin
                                    Clear(Template);
                                    CurrPage.SaveRecord;
                                end;
                        end;
                    }
                }
            }
        }
        area(Promoted)
        {
        }
    }

    var
        AppTemplateExists: Boolean;
        Text002: label 'Do you want to replace the existing template %1 %2?';
        Text003: label 'Do you want to delete the template %1?';
        Text004: label 'Do you want to run the overdue check by the %1?';
}

