Table 52193734 "Legal Advice1"
{

    fields
    {
        field(1;"Request ID";Code[50])
        {
        }
        field(2;"Request Description";Text[250])
        {
        }
        field(3;"Employee Id";Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                  if Employee.Get("Employee Id") then begin
                    "Employee Name":=Employee."First Name" +' '+Employee."Middle Name" + ' '+Employee."Last Name";
                     "User Email":=Employee."E-Mail";

                   Dimension.Get('DEPARTMENT', Employee."Global Dimension 1 Code");

                   Department:=Dimension.Name;
                                    end;
            end;
        }
        field(4;"Employee Name";Text[50])
        {
        }
        field(5;Department;Text[100])
        {
        }
        field(6;"Request Date";DateTime)
        {
        }
        field(7;Status;Option)
        {
            OptionCaption = ' ,Open,Pending Approval,Procesing,Processed,Adviced';
            OptionMembers = " ",Open,"Pending Approval",Procesing,Processed,Adviced;
        }
        field(8;"Request Closure Date";Date)
        {
        }
        field(9;"Request Title";Text[50])
        {

            trigger OnValidate()
            begin
                 if LegalReqType.Get("Request Title") then
                 "Request Type":=LegalReqType."Request Type";
            end;
        }
        field(10;Advice;Text[250])
        {
        }
        field(11;"No. Series";Code[50])
        {
            TableRelation = "No. Series";
        }
        field(13;User;Code[50])
        {
        }
        field(14;"Legal Person ID";Code[50])
        {
        }
        field(15;"Legal Person Email";Text[80])
        {
        }
        field(16;"User Email";Text[80])
        {
        }
        field(17;Attachement;Option)
        {
            OptionCaption = 'No,Yes';
            OptionMembers = No,Yes;
        }
        field(18;"Language Code(Default)";Code[10])
        {
        }
        field(19;"Request Type";Text[30])
        {
        }
        field(20;Reason;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Request ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Status=Status::Open then begin

           if "Request ID" = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField("Legal Advice");
          NoSeriesMgt.InitSeries(SalesSetup."Legal Advice",xRec."Request ID",0D,"Request ID","No. Series");
          end;
        end;
    end;

    var
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        users: Record "User Setup";
        Dimension: Record "Dimension Value";
        LegalReqType: Record "Legal Request Type1";
}

