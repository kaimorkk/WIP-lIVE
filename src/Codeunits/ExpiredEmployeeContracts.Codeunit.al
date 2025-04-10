Codeunit 52193470 "Expired Employee Contracts"
{

    trigger OnRun()
    begin
        CompInfo.Get();
        SenderAddress := CompInfo."Administrator Email";
        // Recipient := UserSetup."E-Mail";
        // FromUser := UserSetup."E-Mail";


        SenderName := COMPANYNAME;



        EmployeeContracts.Reset;
        if EmployeeContracts.Find('-') then begin
            if EmployeeContracts."Contract End Date" <= CalcDate('2W', Today) then
                repeat
                    CompInfo.Get;


                    CompInfo.Get();
                    SMTPMail.Create(CompInfo."HR Support Email", 'Temporary Employee Contract Expiry', 'This is to notify you that the contract for Staff No '
                    + EmployeeContracts."Employee No" + ', ' + EmployeeContracts."Employee Name" + ' expires in ' + Format(EmployeeContracts."Contract End Date" - Today) + ' days time', true);
                    //SMTPMail.AppendBody(Body);
                    Email.Send(SMTPMail);

                //     Mail.NewIncidentMail(CompInfo."HR Support Email",'Temporary Employee Contract Expiry','This is to notify you that the contract for Staff No '
                //     +EmployeeContracts."Employee No"+', '+EmployeeContracts."Employee Name"+' expires in '+FORMAT(EmployeeContracts."Contract End Date"-TODAY)+' days time');

                until EmployeeContracts.Next = 0;
        end;

        Employee.Reset;
        if Employee.Find('-') then begin
            repeat
                if Employee."Contract End Date" <= CalcDate('2W', Today) then begin

                    UserSetup.Reset;
                    UserSetup.SetRange(UserSetup."Employee No.", Employee."No.");
                    //if UserSetup.Find('-') then
                        //HOD := UserSetup.Picture;

                    UserSetup.Reset;
                    if UserSetup.Get(HOD) then begin
                        SMTPMail.Create(UserSetup."E-Mail", 'Employee Contract Expiry', 'This is to notify you that the contract for Staff No '
                        + Employee."No." + ', ' + Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name" + ' expires in ' + Format(Employee."Contract End Date" - Today) + ' days time', true);
                        Email.Send(SMTPMail);
                    end;
                end;
            until Employee.Next = 0;
        end;
    end;

    var
        EmployeeContracts: Record "Employee Contracts1";
        Mail: Codeunit Mail;
        Employee: Record Employee;
        CompInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        HOD: Code[20];
        SenderAddress: Text;
        SenderName: Text;
        SMTPMail: Codeunit "Email Message";
        Email: Codeunit Email;
}

