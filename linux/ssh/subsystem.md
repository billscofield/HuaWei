Subsystem

    Configures an external subsystem (e.g. file transfer daemon).  Arguments
    should be a subsystem name and a command (with optional arguments) to exe‐
    cute upon subsystem request.

    The command sftp-server implements the SFTP file transfer subsystem.

    Alternately the name internal-sftp implements an in-process SFTP server.
    This may simplify configurations using ChrootDirectory to force a differ‐
    ent filesystem root on clients.

    By default no subsystems are defined.

