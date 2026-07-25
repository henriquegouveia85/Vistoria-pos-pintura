-- Rodar no SQL Editor do Supabase (https://supabase.com/dashboard/project/syjpoygigqswodrmjoph)

CREATE TABLE IF NOT EXISTS vistoria_notes (
  id TEXT PRIMARY KEY,
  data JSONB NOT NULL DEFAULT '[]',
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE vistoria_notes DISABLE ROW LEVEL SECURITY;
GRANT ALL ON vistoria_notes TO anon;
GRANT ALL ON vistoria_notes TO authenticated;

-- Criar índice para busca por updated_at
CREATE INDEX IF NOT EXISTS idx_vistoria_notes_updated ON vistoria_notes(updated_at);
